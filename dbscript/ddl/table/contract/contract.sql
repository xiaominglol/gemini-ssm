DROP TABLE IF EXISTS t_crm_contract;
CREATE TABLE t_crm_contract (
       contract_code VARCHAR(50) NOT NULL comment '合同号(C-YYYYMMDD-0001)'
     , contract_name VARCHAR(200) NOT NULL comment '合同名称'
     , status TINYINT NOT NULL DEFAULT 1 comment '状态(1=审批中,3=已通过,9=无效)'
     , contract_type CHAR(1) comment '合同类型'
     , start_date DATE NOT NULL comment '合同开始日期(YYYY-MM-DD)'
     , end_date DATE comment '合同结束日期(YYYY-MM-DD)'
     , create_time DATETIME comment '创建时间(YYYY-MM-DD HH:MM:SS)'
     , create_name_id VARCHAR(50) comment '创建人ID'
     , create_name VARCHAR(50) comment '创建人名称'
     , PRIMARY KEY (contract_code)
)comment '合同表' ENGINE = innoDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;