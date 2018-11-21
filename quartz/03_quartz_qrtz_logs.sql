DROP TABLE IF EXISTS qrtz_logs;

CREATE TABLE qrtz_logs (
       id BIGINT NOT NULL AUTO_INCREMENT
     , schedule_name VARCHAR(120) NOT NULL
     , job_name VARCHAR(200) NOT NULL
     , job_group VARCHAR(200) NOT NULL
     , done_time DATETIME NOT NULL
     , info1 TEXT
     , info2 VARCHAR(2000)
     , errmsg TEXT
     , PRIMARY KEY (id)
)ENGINE = innoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE qrtz_logs MODIFY COLUMN done_time DATETIME NOT NULL
      COMMENT '执行时间';
ALTER TABLE qrtz_logs MODIFY COLUMN info1 TEXT
      COMMENT '信息1，一般用于存放本次执行的成功的数据信息';
ALTER TABLE qrtz_logs MODIFY COLUMN info2 VARCHAR(2000)
      COMMENT '信息2，一般用于存放本次执行的失败的数据信息';
ALTER TABLE qrtz_logs MODIFY COLUMN errmsg TEXT
      COMMENT '错误信息';

