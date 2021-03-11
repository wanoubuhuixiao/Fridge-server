create table user_info
(
    id       int auto_increment
        primary key,
    fridgeId int         not null comment '冰箱ID',
    role     varchar(32) not null comment '家庭角色，一般为父亲，母亲，孩子',
    name     varchar(32) not null,
    weight   float       not null comment '体重 单位为kg',
    bodyFat  float       not null comment '体脂 单位为%',
    password varchar(64) not null,
    email    varchar(64) null,
    constraint user_info_ibfk_1
        foreign key (fridgeId) references fridge_info (id)
);

create index fridgeId
    on user_info (fridgeId);

