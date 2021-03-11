create table seasoning
(
    id              int auto_increment
        primary key,
    fridgeId        int         not null comment '冰箱ID',
    weight          float       null comment '食材重量单位为g',
    seasoningStatus int         null comment '调料补充的情况 0:不需要补充。1:已提示补充 ',
    name            varchar(32) null comment '调料名称',
    constraint seasoning_ibfk_1
        foreign key (fridgeId) references fridge_info (id)
);

create index fridgeId
    on seasoning (fridgeId);

