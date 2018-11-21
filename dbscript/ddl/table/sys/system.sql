
-- 组织架构
drop table if exists t_sys_org;
create table t_sys_org (
  org_id               int not null auto_increment comment '架构ID(集团O,公司C,部门D)',
  parent_org_id        int comment '上级架构，如果为null，则为顶级架构',
  org_name             varchar(30) not null comment '架构名称',
  org_type             char(1) not null comment '架构类型(集团O,公司C,部门D)',
  sort                 tinyint(1) not null default 1 comment '排序',
  status               tinyint(1) not null default 1 comment '状态(0=无效,1=有效)',
  last_update_id       varchar(20) not null comment '上一次更新人user_account',
  last_update_name     varchar(20) not null comment '上一次更新人(冗余)',
  last_update_time     timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '上一次更新时间(YYYY-MM-DD HH:MM:SS)',
  PRIMARY KEY (org_id)
)COMMENT '组织架构' ENGINE = innoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 用户表
drop table if exists t_sys_user;
create table t_sys_user (
  id                   int not null auto_increment comment '自增主键',
  user_account         varchar(20) not null comment '用户账号（姓名拼音）',
  user_name            varchar(20) not null comment '用户名称',
  password             varchar(50) not null comment '密码(MD5加密)',
  user_picture         varchar(50) comment '用户头像',
  create_date          datetime not null default CURRENT_TIMESTAMP comment '创建时间(YYYY-MM-DD HH:MM:SS)',
  status               tinyint(1) not null default 1 comment '状态(0=无效,1=有效)',
  last_update_id       varchar(20) not null comment '上一次更新人user_account',
  last_update_name     varchar(20) not null comment '上一次更新人(冗余)',
  last_update_time     timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '上一次更新时间(YYYY-MM-DD HH:MM:SS)',
  primary key (user_account)
)COMMENT '用户表' ENGINE = innoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 角色表
drop table if exists t_sys_role;
create table t_sys_role (
  role_id              int not null auto_increment comment '角色ID',
  role_name            varchar(20) not null comment '角色名称',
  sort                 tinyint(1) not null default 1 comment '排序',
  status               tinyint(1) not null default 1 comment '状态(0=无效,1=有效)',
  last_update_id       varchar(20) not null comment '上一次更新人user_account',
  last_update_name     varchar(20) not null comment '上一次更新人(冗余)',
  last_update_time     timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '上一次更新时间(YYYY-MM-DD HH:MM:SS)',
  primary key (role_id)
)COMMENT '角色表' ENGINE = innoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 用户角色表
drop table if exists t_sys_user_role;
create table t_sys_user_role (
  user_account              varchar(20) not null comment '用户账号（姓名拼音）',
  role_id              int not null comment '角色ID'
)COMMENT '用户角色表' ENGINE = innoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 菜单表
drop table if exists t_sys_menu;
create table t_sys_menu (
  menu_id              int not null auto_increment comment '菜单ID',
  parent_menu_id       int comment '上级菜单，如果为null，则为顶级菜单',
  menu_name            varchar(20) not null comment '菜单名称',
  menu_type            char(1) not null comment '菜单类型（1=一级菜单，2=二级菜单，3=三级菜单，4=按钮）',
  menu_url             varchar(100) comment '菜单url',
  menu_icon            varchar(100) comment '菜单icon',
  permissions_flag     varchar(100) comment '权限标识',
  sort                 tinyint(1) not null default 1 comment '排序',
  status               tinyint(1) not null default 1 comment '状态(0=无效,1=有效)',
  last_update_id       varchar(20) not null comment '上一次更新人user_account',
  last_update_name     varchar(20) not null comment '上一次更新人(冗余)',
  last_update_time     timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '上一次更新时间(YYYY-MM-DD HH:MM:SS)',
  primary key (menu_id)
)COMMENT '菜单表' ENGINE = innoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 权限表
drop table if exists t_sys_permissions;
create table t_sys_permissions (
  menu_id              int not null comment '菜单ID',
  permissions_id       varchar(20) not null comment '权限ID（组织架构，用户，角色，用户组）',
  permissions_type     char(1) not null comment '权限类型（组织架构=O，用户=U，角色=R，用户组=G）'
)COMMENT '权限表' ENGINE = innoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
