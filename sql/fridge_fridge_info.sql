create table fridge_info
(
    id                   int auto_increment
        primary key,
    modelType            varchar(32) not null,
    freezerTemp          float       not null comment '冷冻室温度',
    refrigeratorTemp     float       not null comment '冷藏室温度',
    freezerHumidity      float       not null comment '冷冻室湿度',
    refrigeratorHumidity float       not null comment '冷藏室湿度'
);

INSERT INTO fridge.fridge_info (id, modelType, freezerTemp, refrigeratorTemp, freezerHumidity, refrigeratorHumidity) VALUES (1, '12', -10, 4, 0.5, 0.5);