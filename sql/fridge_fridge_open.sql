create table fridge_open
(
    id       int auto_increment
        primary key,
    fridgeId int  not null comment '冰箱ID',
    time     date not null comment '冰箱打开时间',
    constraint fridge_open_ibfk_1
        foreign key (fridgeId) references fridge_info (id)
);

create index fridgeId
    on fridge_open (fridgeId);

