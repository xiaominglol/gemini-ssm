package com.gemini.ssm.module.sys.job;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CronJob {

    public void execute(){
        System.out.println("我是CronJob,现在是"+new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒").format(new Date()));
    }
}
