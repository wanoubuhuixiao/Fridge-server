create table food_mall
(
    id             int         not null comment '食材ID与食材仓库中的ID对应'
        primary key,
    name           varchar(32) not null comment '食材名称',
    productionDate date        not null comment '若为商城中购买的食材生成日期就是商场中的食材生成日期，若为后来录入的就是录入的日期',
    shelfLife      int         not null comment '转换为天数后的保质期时间',
    weight         float       null comment '食材重量'
);

