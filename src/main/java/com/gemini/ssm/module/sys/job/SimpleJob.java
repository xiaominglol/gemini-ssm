package com.gemini.ssm.module.sys.job;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.util.Date;

/**
 * 简单定时器的使用
 * @author 小明
 * @date 2018-03-03
 */
public class SimpleJob extends QuartzJobBean {
    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        System.out.println("现在时间为："+new Date());
        //可以通过上下文获取到JobDataMap，这里面可以存放一些参数类型的数据
        JobDataMap dataMap=jobExecutionContext.getMergedJobDataMap();
        String wish=(String) dataMap.get("test");
        System.out.println(wish);
    }
}
