package com.gemini.ssm.shiro.realms;

import com.gemini.ssm.module.common.entity.CommonStatus;
import com.gemini.ssm.module.sys.entity.user.User;
import com.gemini.ssm.module.sys.service.user.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;


/**
 * 自定义shiro
 * @author 小明
 * @date 2017-12-11
 */
public class ShiroRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;

	/**
	 * 认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 1.把AuthenticationToken转换为UsernamePasswordToken
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		// 2.从UsernamePasswordToken获取userAccount
		String userAccount = upToken.getUsername();
		// 3.调用数据库方法,从数据库中查询userAccount的密码
		User user = userService.getUserById(userAccount);
		// 4.若用户不存在,则抛出UnknownAccountException异常
		if (user == null) {
			throw new UnknownAccountException("账号不存在.");
		}
		// 5.根据用户密码,决定是否抛出其他的AuthenticationException异常
		// if(!user.getPassword().equals(String.valueOf(upToken.getPassword()))){
		// throw new AuthenticationException("用户账号或者密码错误.");
		// }

		if (user.getStatus() == CommonStatus.STATUS_NULLITY) {
			throw new LockedAccountException("用户已锁定.");
		}

		// 盐值
		ByteSource salt = ByteSource.Util.bytes(userAccount);

		// 6.根据用户构建SimpleAuthenticationInfo
		SimpleAuthenticationInfo saInfo = new SimpleAuthenticationInfo(userAccount, user.getPassword(), salt, getName());
		return saInfo;
	}

	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 1. 从 PrincipalCollection 中来获取登录用户的信息
		Object userAccount = principals.getPrimaryPrincipal();

		// 2. 创建 SimpleAuthorizationInfo
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

		// 3.根据userAccount查询用户角色
		Set<String> roles = userService.getRoleById(userAccount.toString());
		info.setRoles(roles);

		// 4.根据userAccount查询用户权限
		Set<String> permissions = userService.getPermissionsById(userAccount.toString());
		info.setStringPermissions(permissions);

		return info;
	}

	public static void main(String[] args) {
		String algorithmName = "MD5";
		Object source = "123456";
		String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
		System.out.println(salt2);// 随机
		Object salt = ByteSource.Util.bytes("admin");
		int hashIterations = 1024;
		Object result = new SimpleHash(algorithmName, source, salt, hashIterations);
		System.out.println(result);// 038bdaf98f2037b31f1e75b5b4c9b26e
	}

}
