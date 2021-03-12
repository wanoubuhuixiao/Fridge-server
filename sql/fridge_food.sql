create table food
(
    id             int                      not null comment '食材ID与食材仓库中的ID对应'
        primary key,
    foodName       varchar(31) charset utf8 not null,
    productionDate date                     not null comment '若为商城中购买的食材生成日期就是商场中的食材生成日期，若为后来录入的就是录入的日期',
    shelfLife      int                      not null comment '转换为天数后的保质期时间',
    freezer        int                      not null comment '冷冻为1，冷藏为0',
    level          int                      null comment '层数',
    defrost        int                      not null comment '解冻为1，未解冻为0',
    fridgeId       int                      not null comment '冰箱ID',
    weight         float                    null comment '食材重量 单位为kg',
    constraint food_ibfk_1
        foreign key (fridgeId) references fridge_info (id)
);

create index fridgeId
    on food (fridgeId);

INSERT INTO fridge.food (id, foodName, productionDate, shelfLife, freezer, level, defrost, fridgeId, weight) VALUES (1, '鸡蛋', '2021-03-08 18:55:00', 300, 1, 1, 1, 1, 0.8);
INSERT INTO fridge.food (id, foodName, productionDate, shelfLife, freezer, level, defrost, fridgeId, weight) VALUES (2, '牛肉', '2021-02-26 00:00:00', 20, 1, 1, 0, 1, 2500);
INSERT INTO fridge.food (id, foodName, productionDate, shelfLife, freezer, level, defrost, fridgeId, weight) VALUES (3, '芒果', '2021-02-23 00:00:00', 4, 1, 1, 0, 1, 2500);
INSERT INTO fridge.food (id, foodName, productionDate, shelfLife, freezer, level, defrost, fridgeId, weight) VALUES (4, '葡萄', '2021-02-24 00:00:00', 5, 1, 1, 0, 1, 2500);
INSERT INTO fridge.food (id, foodName, productionDate, shelfLife, freezer, level, defrost, fridgeId, weight) VALUES (34, '呜呜呜', '2021-03-07 00:00:00', 23, 22, 1, 78, 1, 0);