-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: fridge
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food`
(
    `id`             int(11)                        NOT NULL COMMENT '食材ID与食材仓库中的ID对应',
    `foodName`       varchar(31) CHARACTER SET utf8 NOT NULL,
    `productionDate` datetime                       NOT NULL COMMENT '若为商城中购买的食材生成日期就是商场中的食材生成日期，若为后来录入的就是录入的日期',
    `shelfLife`      int(11)                        NOT NULL COMMENT '转换为天数后的保质期时间',
    `freezer`        int(11)                        NOT NULL COMMENT '冷冻为1，冷藏为0',
    `level`          int(11) DEFAULT NULL COMMENT '层数',
    `defrost`        int(11)                        NOT NULL COMMENT '解冻为1，未解冻为0',
    `fridgeId`       int(11)                        NOT NULL COMMENT '冰箱ID',
    `weight`         float   DEFAULT NULL COMMENT '食材重量 单位为kg',
    PRIMARY KEY (`id`),
    KEY `fridgeId` (`fridgeId`),
    CONSTRAINT `food_ibfk_1` FOREIGN KEY (`fridgeId`) REFERENCES `fridge_info` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food`
    DISABLE KEYS */;
INSERT INTO `food`
VALUES (1, '鸡蛋', '2021-03-08 18:55:00', 300, 1, 1, 1, 1, 0.8),
       (2, '牛肉', '2021-02-26 00:00:00', 20, 1, 1, 0, 1, 2500),
       (3, '芒果', '2021-02-23 00:00:00', 4, 1, 1, 0, 1, 2500),
       (4, '葡萄', '2021-02-24 00:00:00', 5, 1, 1, 0, 1, 2500),
       (34, '呜呜呜', '2021-03-07 00:00:00', 23, 22, 1, 78, 1, 0);
/*!40000 ALTER TABLE `food`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_mall`
--

DROP TABLE IF EXISTS `food_mall`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_mall`
(
    `id`             int(11)     NOT NULL COMMENT '食材ID与食材仓库中的ID对应',
    `name`           varchar(32) NOT NULL COMMENT '食材名称',
    `productionDate` date        NOT NULL COMMENT '若为商城中购买的食材生成日期就是商场中的食材生成日期，若为后来录入的就是录入的日期',
    `shelfLife`      int(11)     NOT NULL COMMENT '转换为天数后的保质期时间',
    `weight`         float DEFAULT NULL COMMENT '食材重量',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_mall`
--

LOCK TABLES `food_mall` WRITE;
/*!40000 ALTER TABLE `food_mall`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `food_mall`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_warehouse`
--

DROP TABLE IF EXISTS `food_warehouse`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_warehouse`
(
    `id`                    int(11)     NOT NULL AUTO_INCREMENT COMMENT '食材ID',
    `foodName`              varchar(32) NOT NULL,
    `freezerShelfLife`      int(11) DEFAULT NULL COMMENT '冷冻的保质期',
    `refrigeratorShelfLife` int(11) DEFAULT NULL COMMENT '冷藏的保质期',
    `whetherOpen`           int(11) DEFAULT NULL COMMENT '是否开封',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 570
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_warehouse`
--

LOCK TABLES `food_warehouse` WRITE;
/*!40000 ALTER TABLE `food_warehouse`
    DISABLE KEYS */;
INSERT INTO `food_warehouse`
VALUES (1, '鸡蛋', 300, 28, NULL),
       (2, '西红柿', 60, 10, NULL),
       (3, '豆腐', 10, 3, NULL),
       (4, '面粉', NULL, NULL, NULL),
       (5, '盐', NULL, NULL, NULL),
       (6, '水', NULL, NULL, NULL),
       (15, '茄子', 180, 5, NULL),
       (16, '土豆', NULL, NULL, NULL),
       (17, '火腿肠', NULL, NULL, NULL),
       (18, '葱花', 300, 7, NULL),
       (19, '香菜', 120, 7, NULL),
       (20, '大蒜', 300, 5, NULL),
       (21, '生抽', NULL, NULL, NULL),
       (22, '老抽', NULL, NULL, NULL),
       (23, '白糖', NULL, NULL, NULL),
       (24, '米饭', NULL, NULL, NULL),
       (25, '猪油', NULL, NULL, NULL),
       (26, '大米', NULL, NULL, NULL),
       (27, '香肠', NULL, NULL, NULL),
       (28, '咸肉', NULL, NULL, NULL),
       (29, '上海青', NULL, NULL, NULL),
       (30, '香菇', NULL, NULL, NULL),
       (31, '姜丝', NULL, NULL, NULL),
       (32, '蚝油', NULL, NULL, NULL),
       (33, '糖', NULL, NULL, NULL),
       (34, '鸡精', NULL, NULL, NULL),
       (35, '香油', NULL, NULL, NULL),
       (36, '海苔碎', NULL, NULL, NULL),
       (37, '蜂蜜', NULL, NULL, NULL),
       (38, '五香粉', NULL, NULL, NULL),
       (39, '金针菇', NULL, NULL, NULL),
       (40, '葱', NULL, NULL, NULL),
       (41, '蒜', NULL, NULL, NULL),
       (42, '姜', NULL, NULL, NULL),
       (43, '淀粉', NULL, NULL, NULL),
       (44, '鸭蛋', NULL, NULL, NULL),
       (45, '蒜头', NULL, NULL, NULL),
       (46, '鱼豆腐', NULL, NULL, NULL),
       (47, '食用油', NULL, NULL, NULL),
       (48, '小葱', NULL, NULL, NULL),
       (49, '醋', NULL, NULL, NULL),
       (50, '清水', NULL, NULL, NULL),
       (51, '冬笋', NULL, NULL, NULL),
       (52, '大葱', NULL, NULL, NULL),
       (53, '油', NULL, NULL, NULL),
       (54, '尖椒', NULL, NULL, NULL),
       (55, '皮蛋', NULL, NULL, NULL),
       (56, '酱油', NULL, NULL, NULL),
       (57, '石榴醋', NULL, NULL, NULL),
       (58, '蒜瓣', NULL, NULL, NULL),
       (59, '香葱', NULL, NULL, NULL),
       (60, '辣椒油', NULL, NULL, NULL),
       (61, '旺仔牛奶', NULL, NULL, NULL),
       (62, '白面', NULL, NULL, NULL),
       (63, '牛奶', NULL, NULL, NULL),
       (64, '酵母', NULL, NULL, NULL),
       (65, '黑芝麻', NULL, NULL, NULL),
       (66, '核桃仁', NULL, NULL, NULL),
       (67, '熟面粉', NULL, NULL, NULL),
       (68, '玉米淀粉', NULL, NULL, NULL),
       (69, '蛋黄', NULL, NULL, NULL),
       (70, '芝士片（妙可蓝）', NULL, NULL, NULL),
       (71, '带鱼', NULL, NULL, NULL),
       (72, '腐竹', NULL, NULL, NULL),
       (78, '豆干', NULL, NULL, NULL),
       (79, '肉沫', NULL, NULL, NULL),
       (80, '干香菇', NULL, NULL, NULL),
       (81, '风味豆豉/豆瓣酱', NULL, NULL, NULL),
       (82, '番茄酱/甜面酱', NULL, NULL, NULL),
       (83, '白胡椒粉', NULL, NULL, NULL),
       (84, '油豆腐', NULL, NULL, NULL),
       (85, '红糖', NULL, NULL, NULL),
       (86, '十三香', NULL, NULL, NULL),
       (87, '糯米', NULL, NULL, NULL),
       (88, '猪肉', NULL, NULL, NULL),
       (90, '花生油', NULL, NULL, NULL),
       (92, '韭菜', NULL, NULL, NULL),
       (93, '腊肠', NULL, NULL, NULL),
       (94, '千叶豆腐', NULL, NULL, NULL),
       (95, '青椒', NULL, NULL, NULL),
       (96, '山鸡酱', NULL, NULL, NULL),
       (97, '豆瓣酱', NULL, NULL, NULL),
       (98, '葱段', NULL, NULL, NULL),
       (99, '老豆腐', NULL, NULL, NULL),
       (100, '小米辣', NULL, NULL, NULL),
       (101, '葱姜', NULL, NULL, NULL),
       (102, '干豆腐', NULL, NULL, NULL),
       (103, '豆油', NULL, NULL, NULL),
       (104, '大料', NULL, NULL, NULL),
       (105, '牛肉', NULL, NULL, NULL),
       (106, '料酒', NULL, NULL, NULL),
       (107, '西芹', NULL, NULL, NULL),
       (108, '腊肉', NULL, NULL, NULL),
       (109, '香芹', NULL, NULL, NULL),
       (110, '耗油', NULL, NULL, NULL),
       (111, '辣椒仔', NULL, NULL, NULL),
       (112, '芹菜', NULL, NULL, NULL),
       (113, '牛油', NULL, NULL, NULL),
       (114, '盐、酱油、耗油、糖', NULL, NULL, NULL),
       (115, '娃娃菜', NULL, NULL, NULL),
       (116, '生姜', NULL, NULL, NULL),
       (117, '辣椒粉（提色用）', NULL, NULL, NULL),
       (118, '食盐', NULL, NULL, NULL),
       (119, '白醋', NULL, NULL, NULL),
       (120, '猪肉馅', NULL, NULL, NULL),
       (121, '白菜', NULL, NULL, NULL),
       (122, '洋葱', NULL, NULL, NULL),
       (123, '虾皮', NULL, NULL, NULL),
       (124, '饺子皮', NULL, NULL, NULL),
       (125, '孜然粉', NULL, NULL, NULL),
       (130, '野生菌', NULL, NULL, NULL),
       (132, '虾仁', NULL, NULL, NULL),
       (133, '姜末', NULL, NULL, NULL),
       (134, '味好美五香粉', NULL, NULL, NULL),
       (135, '味好美快炒鲜', NULL, NULL, NULL),
       (136, '中筋面粉', NULL, NULL, NULL),
       (137, '菠菜', NULL, NULL, NULL),
       (138, '圆白菜', NULL, NULL, NULL),
       (139, '粉丝', NULL, NULL, NULL),
       (140, '干辣椒', NULL, NULL, NULL),
       (141, '花椒', NULL, NULL, NULL),
       (142, '包菜', NULL, NULL, NULL),
       (143, '番茄酱', NULL, NULL, NULL),
       (144, '罗非鱼', NULL, NULL, NULL),
       (145, '白萝卜', NULL, NULL, NULL),
       (146, '苹果', NULL, NULL, NULL),
       (147, '梨', NULL, NULL, NULL),
       (148, '辣椒粉', NULL, NULL, NULL),
       (149, '糯米粉', NULL, NULL, NULL),
       (150, '白菜苔', NULL, NULL, NULL),
       (151, '辣椒', NULL, NULL, NULL),
       (152, '豆芽', NULL, NULL, NULL),
       (153, '凉拌酱汁', NULL, NULL, NULL),
       (154, '蒜末辣椒面熟芝麻', NULL, NULL, NULL),
       (155, '热油', NULL, NULL, NULL),
       (156, '陈醋', NULL, NULL, NULL),
       (157, '水浸金枪鱼', NULL, NULL, NULL),
       (158, '黑胡椒粉', NULL, NULL, NULL),
       (159, '熟鹰嘴豆', NULL, NULL, NULL),
       (160, '橄榄油葱花', NULL, NULL, NULL),
       (161, '西兰花', NULL, NULL, NULL),
       (162, '香料', NULL, NULL, NULL),
       (163, '姜水', NULL, NULL, NULL),
       (174, '蛋清', NULL, NULL, NULL),
       (176, '玉米面', NULL, NULL, NULL),
       (177, '木耳', NULL, NULL, NULL),
       (178, '菜花', NULL, NULL, NULL),
       (179, '花生米', NULL, NULL, NULL),
       (180, '藕', NULL, NULL, NULL),
       (181, '花椒油', NULL, NULL, NULL),
       (182, '扁芸豆', NULL, NULL, NULL),
       (183, '瘦肉片', NULL, NULL, NULL),
       (184, '面条', NULL, NULL, NULL),
       (185, '扁豆', NULL, NULL, NULL),
       (186, '肉末', NULL, NULL, NULL),
       (187, '黄豆酱', NULL, NULL, NULL),
       (188, '玉米', NULL, NULL, NULL),
       (189, '鸡腿肉', NULL, NULL, NULL),
       (190, '口蘑', NULL, NULL, NULL),
       (191, '黑椒汁', NULL, NULL, NULL),
       (192, '圣女果', NULL, NULL, NULL),
       (193, '黑胡椒', NULL, NULL, NULL),
       (194, '龙利鱼', NULL, NULL, NULL),
       (195, '金龙鱼藤椒油', NULL, NULL, NULL),
       (196, '液种部分', NULL, NULL, NULL),
       (197, '高筋面粉', NULL, NULL, NULL),
       (198, '全蛋液', NULL, NULL, NULL),
       (199, '糖粉', NULL, NULL, NULL),
       (200, '酵母粉', NULL, NULL, NULL),
       (201, '主面团部分', NULL, NULL, NULL),
       (202, '贝贝南瓜泥', NULL, NULL, NULL),
       (203, '奶粉', NULL, NULL, NULL),
       (204, '黄油', NULL, NULL, NULL),
       (205, '南瓜夹馅', NULL, NULL, NULL),
       (206, '罗勒碎', NULL, NULL, NULL),
       (207, '贝贝南瓜', NULL, NULL, NULL),
       (208, '小番茄', NULL, NULL, NULL),
       (209, '鸡', NULL, NULL, NULL),
       (210, '白胡椒', NULL, NULL, NULL),
       (211, '花胶', NULL, NULL, NULL),
       (212, '南瓜', NULL, NULL, NULL),
       (213, '红枣', NULL, NULL, NULL),
       (214, '咖喱块', NULL, NULL, NULL),
       (215, '椰浆', NULL, NULL, NULL),
       (216, '泡打粉', NULL, NULL, NULL),
       (217, '全麦面粉', NULL, NULL, NULL),
       (218, '开水', NULL, NULL, NULL),
       (219, '葡萄干红枣', NULL, NULL, NULL),
       (220, '玉米粒', NULL, NULL, NULL),
       (221, '三象水墨糯米粉', NULL, NULL, NULL),
       (222, '玉米油', NULL, NULL, NULL),
       (223, '白砂糖', NULL, NULL, NULL),
       (224, '通心粉', NULL, NULL, NULL),
       (225, '长茄子', NULL, NULL, NULL),
       (226, '鳕鱼', NULL, NULL, NULL),
       (227, '盐和黑胡椒', NULL, NULL, NULL),
       (228, '干罗勒', NULL, NULL, NULL),
       (229, '橄榄油和干酪丝', NULL, NULL, NULL),
       (230, '柠檬皮', NULL, NULL, NULL),
       (231, '大酱', NULL, NULL, NULL),
       (232, '蒜泥', NULL, NULL, NULL),
       (233, '葱末', NULL, NULL, NULL),
       (234, '黄瓜', NULL, NULL, NULL),
       (237, '蒜末', NULL, NULL, NULL),
       (238, '姜片蒜末', NULL, NULL, NULL),
       (239, '面筋', NULL, NULL, NULL),
       (240, '香醋', NULL, NULL, NULL),
       (241, '花椒油（没有就算了）', NULL, NULL, NULL),
       (242, '芝麻油', NULL, NULL, NULL),
       (243, '豌豆', NULL, NULL, NULL),
       (244, '料酒、耗油、酱油、盐、糖', NULL, NULL, NULL),
       (246, '肥牛', NULL, NULL, NULL),
       (247, '新鲜蚕豆带豆荚', NULL, NULL, NULL),
       (248, '蒜片', NULL, NULL, NULL),
       (249, '鸡粉', NULL, NULL, NULL),
       (250, '花豆', NULL, NULL, NULL),
       (251, '糖、鸡精', NULL, NULL, NULL),
       (252, '镇江香醋', NULL, NULL, NULL),
       (253, '红油', NULL, NULL, NULL),
       (254, '猪里脊', NULL, NULL, NULL),
       (255, '甜面酱', NULL, NULL, NULL),
       (256, '五花肉', NULL, NULL, NULL),
       (257, '鲜笋', NULL, NULL, NULL),
       (258, '香干', NULL, NULL, NULL),
       (259, '植物油', NULL, NULL, NULL),
       (260, '绿豆', NULL, NULL, NULL),
       (261, '草莓', NULL, NULL, NULL),
       (262, '绵白糖', NULL, NULL, NULL),
       (263, '红色食用色素', NULL, NULL, NULL),
       (264, '薄荷香精', NULL, NULL, NULL),
       (265, '细砂糖', NULL, NULL, NULL),
       (266, '炼乳（或细砂糖）', NULL, NULL, NULL),
       (267, '淡奶油', NULL, NULL, NULL),
       (268, '低筋面粉', NULL, NULL, NULL),
       (269, '海盐', NULL, NULL, NULL),
       (270, '食用干玫瑰花瓣', NULL, NULL, NULL),
       (271, '三文鱼骨', NULL, NULL, NULL),
       (272, '玫瑰盐', NULL, NULL, NULL),
       (273, '橄榄油', NULL, NULL, NULL),
       (274, '姜片', NULL, NULL, NULL),
       (275, '葡萄干、蔓越莓', NULL, NULL, NULL),
       (276, '伊拉克蜜枣', NULL, NULL, NULL),
       (277, '核桃、腰果、杏仁', NULL, NULL, NULL),
       (278, '枸杞', NULL, NULL, NULL),
       (279, '蜂蜜浸玫瑰', NULL, NULL, NULL),
       (281, '花生', NULL, NULL, NULL),
       (282, '核桃', NULL, NULL, NULL),
       (283, '杏仁', NULL, NULL, NULL),
       (284, '芝麻', NULL, NULL, NULL),
       (285, '葡萄干', NULL, NULL, NULL),
       (286, '糖桂花', NULL, NULL, NULL),
       (287, '无盐黄油', NULL, NULL, NULL),
       (288, '椰枣泥', NULL, NULL, NULL),
       (289, '红曲米粉', NULL, NULL, NULL),
       (290, '干桂花', NULL, NULL, NULL),
       (291, '长茄', NULL, NULL, NULL),
       (292, '剁椒', NULL, NULL, NULL),
       (293, '肉馅', NULL, NULL, NULL),
       (294, '郫县豆瓣酱', NULL, NULL, NULL),
       (295, '水淀粉', NULL, NULL, NULL),
       (296, '姜末、蒜末、葱花', NULL, NULL, NULL),
       (297, '鸡胸肉', NULL, NULL, NULL),
       (298, '鸡胸肉腌制佐料', NULL, NULL, NULL),
       (299, '盐巴', NULL, NULL, NULL),
       (300, '红薯淀粉', NULL, NULL, NULL),
       (301, '重庆黄花园酱油', NULL, NULL, NULL),
       (302, '熟菜籽油', NULL, NULL, NULL),
       (303, '配料', NULL, NULL, NULL),
       (304, '大葱节', NULL, NULL, NULL),
       (305, '生姜片', NULL, NULL, NULL),
       (306, '大蒜片', NULL, NULL, NULL),
       (307, '红花椒', NULL, NULL, NULL),
       (308, '莴笋', NULL, NULL, NULL),
       (309, '盐（腌莴笋）', NULL, NULL, NULL),
       (310, '糖醋碗汁', NULL, NULL, NULL),
       (311, '特级保宁醋', NULL, NULL, NULL),
       (313, '香酥花生米', NULL, NULL, NULL),
       (315, '菜籽油', NULL, NULL, NULL),
       (316, '香叶', NULL, NULL, NULL),
       (317, '八角', NULL, NULL, NULL),
       (318, '草果', NULL, NULL, NULL),
       (319, '桂皮', NULL, NULL, NULL),
       (320, '白芝麻', NULL, NULL, NULL),
       (321, '老姜', NULL, NULL, NULL),
       (322, '干花椒', NULL, NULL, NULL),
       (323, '泡椒', NULL, NULL, NULL),
       (324, '豆瓣', NULL, NULL, NULL),
       (325, '生姜（老姜）', NULL, NULL, NULL),
       (326, '水发木耳', NULL, NULL, NULL),
       (327, '生粉', NULL, NULL, NULL),
       (328, '四季豆', NULL, NULL, NULL),
       (330, '白玉菇', NULL, NULL, NULL),
       (331, '大虾', NULL, NULL, NULL),
       (332, '大白菜或娃娃菜', NULL, NULL, NULL),
       (333, '葱姜蒜', NULL, NULL, NULL),
       (334, '红萝卜', NULL, NULL, NULL),
       (335, '味极鲜', NULL, NULL, NULL),
       (336, '地瓜粉', NULL, NULL, NULL),
       (337, '香椿', NULL, NULL, NULL),
       (338, '干红椒', NULL, NULL, NULL),
       (339, '咸鸭蛋', NULL, NULL, NULL),
       (340, '巴沙鱼', NULL, NULL, NULL),
       (341, '鱼泡', NULL, NULL, NULL),
       (342, '鸡腿菇', NULL, NULL, NULL),
       (343, '平菇', NULL, NULL, NULL),
       (344, '辣椒酱', NULL, NULL, NULL),
       (345, '鱼家香豆豉鲮鱼罐头', NULL, NULL, NULL),
       (346, '肉松', NULL, NULL, NULL),
       (347, '花菜', NULL, NULL, NULL),
       (348, '芝麻海苔', NULL, NULL, NULL),
       (349, '苦瓜', NULL, NULL, NULL),
       (350, '瘦肉', NULL, NULL, NULL),
       (351, '排骨', NULL, NULL, NULL),
       (352, '荔浦芋头', NULL, NULL, NULL),
       (353, '广式香肠', NULL, NULL, NULL),
       (354, '青甜椒', NULL, NULL, NULL),
       (355, '红甜椒', NULL, NULL, NULL),
       (356, '安利皇后特级初榨橄榄油', NULL, NULL, NULL),
       (357, '前臀尖', NULL, NULL, NULL),
       (358, '冰糖', NULL, NULL, NULL),
       (359, '黄酒', NULL, NULL, NULL),
       (360, '小茴香', NULL, NULL, NULL),
       (361, '甘草', NULL, NULL, NULL),
       (362, '枣', NULL, NULL, NULL),
       (363, '山楂', NULL, NULL, NULL),
       (364, '草鱼', NULL, NULL, NULL),
       (366, '草蔻', NULL, NULL, NULL),
       (367, '香茅', NULL, NULL, NULL),
       (368, '麦芽糖', NULL, NULL, NULL),
       (369, '青鱼', NULL, NULL, NULL),
       (370, '金龙鱼阳光葵花仁油', NULL, NULL, NULL),
       (371, '姜汁', NULL, NULL, NULL),
       (372, '鸡蛋清', NULL, NULL, NULL),
       (373, '龙井茶', NULL, NULL, NULL),
       (374, '紫苏', NULL, NULL, NULL),
       (375, '盐，蒜，', NULL, NULL, NULL),
       (376, '花菜1', NULL, NULL, NULL),
       (377, '五花肉250', NULL, NULL, NULL),
       (378, '大蒜2', NULL, NULL, NULL),
       (379, '干辣椒2', NULL, NULL, NULL),
       (380, '白糖3', NULL, NULL, NULL),
       (381, '生抽2', NULL, NULL, NULL),
       (382, '蒜3', NULL, NULL, NULL),
       (383, '姜2', NULL, NULL, NULL),
       (384, '盐5', NULL, NULL, NULL),
       (385, '蒜苔', NULL, NULL, NULL),
       (386, '小米辣椒', NULL, NULL, NULL),
       (387, '干黄花菜', NULL, NULL, NULL),
       (388, '茶干', NULL, NULL, NULL),
       (389, '肉丝', NULL, NULL, NULL),
       (390, '苦菊', NULL, NULL, NULL),
       (391, '樱桃萝卜', NULL, NULL, NULL),
       (392, '柠檬', NULL, NULL, NULL),
       (393, '黑胡椒碎', NULL, NULL, NULL),
       (394, '青柠调味汁', NULL, NULL, NULL),
       (395, '鲜香菇', NULL, NULL, NULL),
       (396, '蔬菜', NULL, NULL, NULL),
       (397, '白蘑菇', NULL, NULL, NULL),
       (398, '新鲜桑叶', NULL, NULL, NULL),
       (399, '鸭掌', NULL, NULL, NULL),
       (400, '小杭菊', NULL, NULL, NULL),
       (401, '山药', NULL, NULL, NULL),
       (402, '红糖100', NULL, NULL, NULL),
       (403, '红枣150', NULL, NULL, NULL),
       (404, '马蹄粉', NULL, NULL, NULL),
       (405, '水250', NULL, NULL, NULL),
       (406, '肉桂粉（配过滤包）', NULL, NULL, NULL),
       (407, '茶/茶包', NULL, NULL, NULL),
       (408, '红糖粉', NULL, NULL, NULL),
       (409, '桃胶', NULL, NULL, NULL),
       (410, '干玫瑰花', NULL, NULL, NULL),
       (411, '贡梨', NULL, NULL, NULL),
       (412, '马蹄', NULL, NULL, NULL),
       (413, '薄荷', NULL, NULL, NULL),
       (414, '鸡骨草', NULL, NULL, NULL),
       (415, '陈皮', NULL, NULL, NULL),
       (416, '蜜枣', NULL, NULL, NULL),
       (417, '猴头菇', NULL, NULL, NULL),
       (418, '乌鸡', NULL, NULL, NULL),
       (422, '雪花梨', NULL, NULL, NULL),
       (423, '银耳', NULL, NULL, NULL),
       (426, '奶液部分', NULL, NULL, NULL),
       (427, '45℃温水', NULL, NULL, NULL),
       (428, '酸奶粉一包', NULL, NULL, NULL),
       (430, '45℃温牛奶', NULL, NULL, NULL),
       (431, '酸奶菌粉', NULL, NULL, NULL),
       (432, '姜泥', NULL, NULL, NULL),
       (433, '鲜虾', NULL, NULL, NULL),
       (434, '凉水', NULL, NULL, NULL),
       (435, '沸水', NULL, NULL, NULL),
       (436, '西米', NULL, NULL, NULL),
       (437, '地瓜／山药/紫薯', NULL, NULL, NULL),
       (438, '小麦淀粉', NULL, NULL, NULL),
       (439, '馅料', NULL, NULL, NULL),
       (440, '鲜香菇/鲜花菇', NULL, NULL, NULL),
       (441, '土鸡蛋', NULL, NULL, NULL),
       (442, '抹茶粉', NULL, NULL, NULL),
       (443, '提子干', NULL, NULL, NULL),
       (445, '低筋粉', NULL, NULL, NULL),
       (446, '藕粉', NULL, NULL, NULL),
       (447, '紫薯', NULL, NULL, NULL),
       (448, '酸奶', NULL, NULL, NULL),
       (449, '棉花糖', NULL, NULL, NULL),
       (451, '萝卜', NULL, NULL, NULL),
       (452, '葱(去腥的)', NULL, NULL, NULL),
       (453, '葱花(装饰)', NULL, NULL, NULL),
       (456, '鲫鱼', NULL, NULL, NULL),
       (457, '血糯米', NULL, NULL, NULL),
       (458, '莲子', NULL, NULL, NULL),
       (459, '老红糖', NULL, NULL, NULL),
       (462, '带骨鸡块', NULL, NULL, NULL),
       (463, '猷蠓', NULL, NULL, NULL),
       (464, '猪肚', NULL, NULL, NULL),
       (465, '黄油母鸡', NULL, NULL, NULL),
       (466, '米酒', NULL, NULL, NULL),
       (467, '内脂豆腐', NULL, NULL, NULL),
       (468, '小包菜', NULL, NULL, NULL),
       (469, '山药泥', NULL, NULL, NULL),
       (470, '小香葱', NULL, NULL, NULL),
       (471, '照烧酱', NULL, NULL, NULL),
       (472, '沙拉酱', NULL, NULL, NULL),
       (473, '海苔芝麻碎', NULL, NULL, NULL),
       (474, '日本豆腐', NULL, NULL, NULL),
       (475, '青占鱼', NULL, NULL, NULL),
       (476, '羽衣甘蓝', NULL, NULL, NULL),
       (477, 'MCT油或黄油', NULL, NULL, NULL),
       (479, '牛里脊肉', NULL, NULL, NULL),
       (480, '黑胡椒盐', NULL, NULL, NULL),
       (481, '生菜', NULL, NULL, NULL),
       (482, '鸡翅根', NULL, NULL, NULL),
       (483, '韩式辣酱', NULL, NULL, NULL),
       (484, '牛肉一定要牛里脊', NULL, NULL, NULL),
       (485, '大喜大原味烤肉酱', NULL, NULL, NULL),
       (486, '小苏打', NULL, NULL, NULL),
       (487, '鸡腿', NULL, NULL, NULL),
       (488, '马苏里拉芝士碎', NULL, NULL, NULL),
       (489, '西葫芦', NULL, NULL, NULL),
       (490, '藜麦', NULL, NULL, NULL),
       (491, '黑米', NULL, NULL, NULL),
       (492, '赤藓糖醇', NULL, NULL, NULL),
       (501, '培根', NULL, NULL, NULL),
       (502, '帕玛森芝士', NULL, NULL, NULL),
       (503, '意大利面', NULL, NULL, NULL),
       (504, '巧克力', NULL, NULL, NULL),
       (505, 'T55粉', NULL, NULL, NULL),
       (506, '可可粉', NULL, NULL, NULL),
       (507, '葵花籽油', NULL, NULL, NULL),
       (518, '番茄', NULL, NULL, NULL),
       (525, '高良姜', NULL, NULL, NULL),
       (526, '红辣椒', NULL, NULL, NULL),
       (527, '蘑菇', NULL, NULL, NULL),
       (528, '鸡汤', NULL, NULL, NULL),
       (529, '椰子粉', NULL, NULL, NULL),
       (530, '鱼露', NULL, NULL, NULL),
       (531, '香茅干', NULL, NULL, NULL),
       (532, '柠檬叶', NULL, NULL, NULL),
       (533, '鸡肉', NULL, NULL, NULL),
       (534, '青柠檬', NULL, NULL, NULL),
       (537, '温牛奶', NULL, NULL, NULL),
       (538, '白芝麻（装饰）', NULL, NULL, NULL),
       (539, '芝麻酱', NULL, NULL, NULL),
       (540, '牛腩', NULL, NULL, NULL),
       (541, '姜，葱，白胡椒粒，干辣椒', NULL, NULL, NULL),
       (542, '大蒜头，白芝麻，小米椒，辣椒粉，香菜', NULL, NULL, NULL),
       (544, '芒果', NULL, NULL, NULL),
       (547, '蛋挞皮', NULL, NULL, NULL),
       (548, '汤圆', NULL, NULL, NULL),
       (549, '豆皮', NULL, NULL, NULL),
       (550, '大喜大糖醋排骨酱', NULL, NULL, NULL),
       (551, '小米椒', NULL, NULL, NULL),
       (552, '带冰龙虾尾', NULL, NULL, NULL),
       (553, '小龙虾调料包', NULL, NULL, NULL),
       (554, '啤酒', NULL, NULL, NULL),
       (555, '盒装豆腐', NULL, NULL, NULL),
       (556, '笋片', NULL, NULL, NULL),
       (557, '菌菇', NULL, NULL, NULL),
       (558, '昂刺鱼', NULL, NULL, NULL),
       (559, '牛油果', NULL, NULL, NULL),
       (560, '海参', NULL, NULL, NULL),
       (561, '低脂芝士片', NULL, NULL, NULL),
       (562, '无糖希腊酸奶', NULL, NULL, NULL),
       (563, '巧克力蛋白粉', NULL, NULL, NULL),
       (564, '蓝莓', NULL, NULL, NULL),
       (565, '烤杏仁粒', NULL, NULL, NULL),
       (566, '虾', NULL, NULL, NULL),
       (567, '青豆', NULL, NULL, NULL),
       (568, '燕麦+奇亚籽', NULL, NULL, NULL),
       (569, '坚果', NULL, NULL, NULL);
/*!40000 ALTER TABLE `food_warehouse`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fridge_info`
--

DROP TABLE IF EXISTS `fridge_info`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fridge_info`
(
    `id`                   int(11)     NOT NULL AUTO_INCREMENT,
    `modelType`            varchar(32) NOT NULL,
    `freezerTemp`          float       NOT NULL COMMENT '冷冻室温度',
    `refrigeratorTemp`     float       NOT NULL COMMENT '冷藏室温度',
    `freezerHumidity`      float       NOT NULL COMMENT '冷冻室湿度',
    `refrigeratorHumidity` float       NOT NULL COMMENT '冷藏室湿度',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fridge_info`
--

LOCK TABLES `fridge_info` WRITE;
/*!40000 ALTER TABLE `fridge_info`
    DISABLE KEYS */;
INSERT INTO `fridge_info`
VALUES (1, '12', -10, 4, 0.5, 0.5);
/*!40000 ALTER TABLE `fridge_info`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fridge_open`
--

DROP TABLE IF EXISTS `fridge_open`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fridge_open`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `fridgeId` int(11) NOT NULL COMMENT '冰箱ID',
    `time`     date    NOT NULL COMMENT '冰箱打开时间',
    PRIMARY KEY (`id`),
    KEY `fridgeId` (`fridgeId`),
    CONSTRAINT `fridge_open_ibfk_1` FOREIGN KEY (`fridgeId`) REFERENCES `fridge_info` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fridge_open`
--

LOCK TABLES `fridge_open` WRITE;
/*!40000 ALTER TABLE `fridge_open`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `fridge_open`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu`
(
    `id`          int(11)     NOT NULL AUTO_INCREMENT,
    `name`        varchar(32) NOT NULL COMMENT '菜名称',
    `largeImg`    varchar(255) DEFAULT NULL COMMENT '大图链接',
    `smallImg`    varchar(255) DEFAULT NULL COMMENT '小图链接',
    `steps`       json         DEFAULT NULL COMMENT '步骤',
    `ingredients` json         DEFAULT NULL COMMENT '原料',
    `tag`         json         DEFAULT NULL COMMENT '标签，json数组的形式存',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 196
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu`
    DISABLE KEYS */;
INSERT INTO `menu`
VALUES (14, '外婆菜炒鸡蛋（测试用）',
        'http://static1.showapi.com/app2/img/caipu/20210219/f040e7d8-037e-4204-80a9-e01247a2a064.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210219/7f1da560-51e7-4d89-b5d7-2e27d5ed93aa.jpg', '[
    {
      \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210219/e1a56dc3-3d3d-4251-9743-7e2876b4fc02.jpg\",
      \"content\": \"两个鸡蛋蛋散热锅热油下鸡蛋炒散盛起来备用\",
      \"orderNum\": 1
    },
    {
      \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210219/c829b517-61d1-4092-b571-85e15285089d.jpg\",
      \"content\": \"大蒜拍碎小米辣切碎准备外婆菜\",
      \"orderNum\": 2
    },
    {
      \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210219/42441e15-0cec-4541-8ded-d81ae20f3313.jpg\",
      \"content\": \"锅内继续倒油油要比平时多一点哦外婆菜很吸油的。下大蒜和小米辣爆香\",
      \"orderNum\": 3
    },
    {
      \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210219/2643d699-4c11-418d-970c-b77decbbe3bd.jpg\",
      \"content\": \"倒入外婆菜炒香\",
      \"orderNum\": 4
    },
    {
      \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210219/12c35d8e-854e-4ad3-887c-7f3fb2c94038.jpg\",
      \"content\": \"倒入鸡蛋。翻炒均匀。尝一下咸淡。适当加一点生抽和盐。还有老抽。主要是看你买的外婆菜味道重不重\",
      \"orderNum\": 5
    },
    {
      \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210219/5601b543-86c6-418b-9e76-05dabf7c9a0a.jpg\",
      \"content\": \"快去准备米饭吧特别好吃的一道菜\",
      \"orderNum\": 6
    },
    {
      \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210219/f184dfc6-25b3-47bf-b22e-0ab6b8104f1f.jpg\",
      \"content\": \"真的三碗米饭不够吃网上买这样的半成品也很便宜。时不时炒个菜特别下饭\",
      \"orderNum\": 7
    }
  ]', '[
    {
      \"ylName\": \"鸡蛋\",
      \"ylUnit\": \"2个\"
    },
    {
      \"ylName\": \"外婆菜\",
      \"ylUnit\": \"1包\"
    },
    {
      \"ylName\": \"小米辣\",
      \"ylUnit\": \"1根\"
    },
    {
      \"ylName\": \"大蒜\",
      \"ylUnit\": \"4瓣\"
    }
  ]', '[]'),
       (26, '爽滑劲道的自制手擀鸡蛋面',
        'http://static1.showapi.com/app2/img/caipu/20210222/d7d1c073-cada-452e-9447-d9b2b762df07.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/123ea28f-58ee-4b79-b44a-f41a17921e27.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/9bd2e81e-49c9-4df1-9265-ea2419e543c0.jpg\",
           \"content\": \"面粉加盐加鸡蛋一起搅拌均匀，加入适量的清水搅拌成面絮。水要加的少一点，因为需要一个稍硬一点的面团。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/d66f5e40306a4c599f2bc4499aaa686d_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/583c75ea-484e-45c6-9888-2c18954d309e.jpg\",
           \"content\": \"揉成一个面团。此时面团硬，表面不光滑。但是不怕，松弛一会就会变得光滑。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/1075962a84524167bff52262fd4df164_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/94f251fd-ba7e-4068-9534-6b89ce564290.jpg\",
           \"content\": \"这是松弛半小时的面团。再次揉一下就会变得表面光滑了。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/6e977a2e0b4c4a3a84e67aadf32533ae_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/16e73127-45b1-4661-9cc0-cff44836412c.jpg\",
           \"content\": \"面团柔软了以后，用擀面杖擀成薄皮，切成均匀的面条即可。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/ae9ccf2c7c0447769f5e5bedf5d681f3_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/d7009ded-fbe4-4862-91e4-2c65aabd1e14.jpg\",
           \"content\": \"切好的面条抖开，撒上一层薄薄的面粉，放置在一边备用。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/683c764e07394478a90d17fe309d7f55_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/197cc119-2488-421f-9bda-2d1e0b861280.jpg\",
           \"content\": \"起锅烧水煮面，煮熟以后过一下冷水，再加入提前做好的鸡蛋酱，也可以加入喜欢的配菜，比如黄瓜丝，洋葱丝，豆芽菜，胡萝丝都可以。一份简单的过水面条就好了，可以准备开饭了！\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/da742a99df954b64aadad5d87e495500_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         1,
         6,
         9,
         101,
         71
       ]'),
       (28, '茄子烩饭', 'http://static1.showapi.com/app2/img/caipu/20210222/ccadf9b7-67d0-4673-afa5-c2e9d7b03aee.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/ae7ecb43-39a9-4a50-9433-e0966d882a33.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/ae31c2a6-d341-4cb7-8c16-a3b3fd050df3.jpg\",
           \"content\": \"准备所有食材。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/5f1a21f1-c8df-4a72-8be5-3f0f6773cc76.jpg\",
           \"content\": \"锅中放入猪油融化放入葱花大蒜爆香。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/a65013cd-8059-4dfb-adff-16b1cbe58034.jpg\",
           \"content\": \"放入茄子土豆火腿肠，煸炒出土豆有点颜色。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/61cae90e-369e-429b-86ba-5d2ac2bd7171.jpg\",
           \"content\": \"加入生抽，老抽，白糖，盐。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/70fb15cb-97e1-4412-9042-a761bc760a84.jpg\",
           \"content\": \"加入清水和菜持平，放入米饭。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/12819af6-5f20-44e0-8b1a-1f9f390a6752.jpg\",
           \"content\": \"小火慢炖，收汁，出锅前放入香菜。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/894f9edb-18bd-4468-bf0c-702b00b8016b.jpg\",
           \"content\": \"好不好吃的就对付吃吧\",
           \"orderNum\": 7
         }
       ]', '[
         {
           \"ylName\": \"茄子\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"土豆\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"火腿肠\",
           \"ylUnit\": \"半根\"
         },
         {
           \"ylName\": \"葱花\",
           \"ylUnit\": \"2克\"
         },
         {
           \"ylName\": \"香菜\",
           \"ylUnit\": \"2克\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"1瓣\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"半勺\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"半勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"半勺\"
         },
         {
           \"ylName\": \"米饭\",
           \"ylUnit\": \"1碗\"
         },
         {
           \"ylName\": \"猪油\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"2克\"
         }
       ]', '[
         1,
         6,
         102
       ]'),
       (29, '广式煲仔饭', 'http://static1.showapi.com/app2/img/caipu/20210222/212a3c9d-db4d-4c5c-afe3-cf0cad6b6497.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/6ea89435-6393-47e0-929a-86bd98d017b2.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/41deb687-334f-42e2-a492-66bbfaeee4dc.jpg\",
           \"content\": \"砂锅要买干烧砂锅。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/88f8f9cf-c6c3-40c4-8c12-618147e1d225.jpg\",
           \"content\": \"其他用料没有拍照片，省略。文字说明：1砂锅锅底抹油2米用水浸泡一小时左右，米粒用手捻碎就行。3将米倒入砂锅，淋入半汤匙食用油，咸肉片摆放在米饭上。4上海青和香菇分别焯水备用。5调料汁，蚝油生抽糖鸡精香油混合搅拌均匀。6开始大火蒸米饭，开锅后转至小火煨，煨至米饭半熟的时候围着锅沿放腊肉和焯过水的香菇，中间打一个荷包蛋。盖上盖子继续小火慢慢煨，煨5分钟后关火，再焖15分钟，期间不要开盖。7焖好后放入焯过水的上海青，淋上料汁。8注意事项：买锅的时候要干烧砂锅。青菜最后打开之前放进去。咸肉是我另加的，没有可以不放。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/1d1e55c3-209d-4a1a-b3cb-d7c28b114cef.jpg\",
           \"content\": \"看\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/598fb55f-951a-4ab4-a964-aa574c507b01.jpg\",
           \"content\": \"看\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"大米\",
           \"ylUnit\": \"1.5杯\"
         },
         {
           \"ylName\": \"香肠\",
           \"ylUnit\": \"2根\"
         },
         {
           \"ylName\": \"咸肉\",
           \"ylUnit\": \"4片\"
         },
         {
           \"ylName\": \"上海青\",
           \"ylUnit\": \"2棵\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"香菇\",
           \"ylUnit\": \"2朵\"
         },
         {
           \"ylName\": \"姜丝\",
           \"ylUnit\": \"一小撮\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"半汤匙\"
         },
         {
           \"ylName\": \"鸡精\",
           \"ylUnit\": \"半勺\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"1勺\"
         }
       ]', '[
         1,
         6,
         102,
         122
       ]'),
       (30, '西红柿鸡蛋煎饼', 'http://static1.showapi.com/app2/img/caipu/20210215/8169ae0b-1b45-4400-a0e7-69d16f268e54.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210215/1c781d3f-9fec-4a3c-bd26-fc283fbd61bd.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210215/8a33ac25-184e-429e-91b3-f61c787da03a.jpg\",
           \"content\": \"西红柿去皮切丁\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210215/b59b3203-f110-49af-938d-4c8bc95574be.jpg\",
           \"content\": \"加入切好的葱花鸡蛋面粉\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210215/0060275f-2f25-4bff-9aff-cd0d7c3fecd5.jpg\",
           \"content\": \"加入适量水，调成糊状\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210215/d2da75c5-d9bf-4a12-b940-dd7289f08388.jpg\",
           \"content\": \"平底不粘锅煎至两面金黄\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210215/0769a07d-7202-49b1-ae25-389efa3988ec.jpg\",
           \"content\": \"切成自己喜欢的形状\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"西红柿\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"葱花\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"五香粉\",
           \"ylUnit\": \"3勺\"
         }
       ]', '[
         1,
         6,
         73,
         103
       ]'),
       (31, '西红柿鸡蛋菌菇汤', 'http://static1.showapi.com/app2/img/caipu/20210208/afc0f999-b6f6-49b2-8ab9-860b7bc0c495.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210208/efe8b57f-5b62-49ed-acbc-cb4d32ea7341.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210208/0f7eef38-6d2c-4eac-9aae-a50c8aff304e.jpg\",
           \"content\": \"西红柿放入锅中煮至两分钟去皮，然后切成一厘米的小块，豆腐切成一厘米见方的小块，打三个鸡蛋搅拌均匀，金针菇与香菇放入锅中煮熟捞出备用。起锅烧油，放入蒜末、姜与小葱爆香。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210208/3f531d39-c336-4e29-b327-0d806bfd41d3.jpg\",
           \"content\": \"放入西红柿翻炒，炒制为酱状。放入适量清水，加入一勺生抽一勺蚝油，加入豆腐、金针菇、香菇，再加入一勺鸡精半勺糖四分之一勺盐调味，大火煮至沸腾。略微沸腾后搅拌均匀，勾入水淀粉，继续煮。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210208/5b0ccfd0-b7f3-42a3-975b-71b4418287d9.jpg\",
           \"content\": \"待水淀粉成型后再次勾入鸡蛋液，大火烧开，待鸡蛋花成型后关火，放入适量香油、葱花，即可出锅。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210208/1a499aae-8388-42db-9b14-76b328072cc0.jpg\",
           \"content\": \"酸酸甜甜很开胃哦。\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"西红柿\",
           \"ylUnit\": \"两个\"
         },
         {
           \"ylName\": \"豆腐\",
           \"ylUnit\": \"一块\"
         },
         {
           \"ylName\": \"金针菇\",
           \"ylUnit\": \"一把\"
         },
         {
           \"ylName\": \"香菇\",
           \"ylUnit\": \"6～8朵\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"三个\"
         },
         {
           \"ylName\": \"葱\",
           \"ylUnit\": \"两根\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"两瓣\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"两片\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"一勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"一勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"半勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1/4勺盐\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"40克\"
         }
       ]', '[
         24,
         70,
         71,
         99
       ]'),
       (32, '西红柿炒蛋', 'http://static1.showapi.com/app2/img/caipu/20201216/c3bd4003-3a05-448a-a116-14f0aeb6dc85.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201216/98c065b8-5838-478a-8b9c-046a07ec798d.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/fc03e44e-6136-4efc-9173-67c60d775a35.jpg\",
           \"content\": \"西红柿清洗干净，提前把东西准备好。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/612d0ae6-f045-4334-bec6-d265e8adc797.jpg\",
           \"content\": \"鸭蛋打入碗里打散，西红柿切小块。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/42837b77-208b-43f2-8107-499979fe2a92.jpg\",
           \"content\": \"锅中放油，油温10成热的时候把鸭蛋打散倒进去煎至两面金黄。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/937ecf19-c0bd-4d1e-be94-393eb1e58d22.jpg\",
           \"content\": \"再把煎好的鸡蛋切成小块舀出来放在碗里。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/a22b6968-0e7d-4dc4-b1fa-cea26cbff3da.jpg\",
           \"content\": \"重新放油，蒜末放进去爆香，再放入西红柿翻炒一下。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/0db5f03c-2a8c-4f48-af39-322d1820aec9.jpg\",
           \"content\": \"加少量的水焖两分钟。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/cb47f94f-d682-49ff-aa58-4df519a35141.jpg\",
           \"content\": \"再把鸡蛋倒进去。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/480f2221-c084-4dbc-b0b2-4f71222d1a4d.jpg\",
           \"content\": \"放一勺的糖，加一点盐和鸡精，放入葱花翻拌一下。\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/8770b4a5-7ff0-445b-9fa3-ad590302147a.jpg\",
           \"content\": \"翻炒均匀就可以出锅了，一道非常快速的家常菜。\",
           \"orderNum\": 9
         }
       ]', '[
         {
           \"ylName\": \"西红柿\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"鸭蛋\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"葱花\",
           \"ylUnit\": \"少量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"鸡精\",
           \"ylUnit\": \"少量\"
         },
         {
           \"ylName\": \"蒜头\",
           \"ylUnit\": \"1片\"
         }
       ]', '[
         2,
         4,
         23,
         70,
         171,
         173
       ]'),
       (33, '鱼豆腐香肠炒蛋', 'http://static1.showapi.com/app2/img/caipu/20201216/a0fe128a-133f-4e23-bdb1-b2c8cd8da7f7.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201216/eb9d7c19-25de-43cf-bf9b-13dea7e9fe9e.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/717b0e4c-3b8b-4a94-a315-fcfe678fc0f4.jpg\",
           \"content\": \"火腿肠、鱼豆腐切成块备用。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/c47b2031-3f6c-40b1-94ef-b58efe863e9b.jpg\",
           \"content\": \"油锅烧热，倒入蛋液翻炒成块，盛出备用。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/6418a7f5-727c-41d2-9a5f-bb66f7c85139.jpg\",
           \"content\": \"油锅烧热，倒入蒜片，煸炒出香味，加入火腿肠和鱼豆腐，中火煎至表面微焦。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/47cdd615-a33a-419b-a9d1-a617be1a9360.jpg\",
           \"content\": \"倒入鸡蛋、小葱、盐、生抽，翻炒均匀后，就可以美美地享用啦。\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"火腿肠\",
           \"ylUnit\": \"3根\"
         },
         {
           \"ylName\": \"鱼豆腐\",
           \"ylUnit\": \"200g\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"食用油\",
           \"ylUnit\": \"10g\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"15g\"
         },
         {
           \"ylName\": \"小葱\",
           \"ylUnit\": \"10g\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1小勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1大勺\"
         }
       ]', '[
         2,
         6,
         70,
         73,
         170
       ]'),
       (34, '绝妙炒蛋', 'http://static1.showapi.com/app2/img/caipu/20201005/54c6c5a0-8042-474f-a46b-de9feecc70aa.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201005/1428f7e3-bc9a-403b-92e4-1472a3870625.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201005/505dabb4-c5fa-4961-8849-5eb1c96541e8.jpg\",
           \"content\": \"先把鸡蛋打散。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201005/a4d62752-c047-4fe8-bd50-684a364bb3f0.jpg\",
           \"content\": \"然后把糖，淀粉，醋，生抽，老抽，清水。搅拌均匀。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201005/6ad0d171-4540-4a01-9bba-e6652ca0e5d6.jpg\",
           \"content\": \"起锅烧油锅中下入鸡蛋。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201005/38e7903f-c4d6-4a0e-a895-b842f3259752.jpg\",
           \"content\": \"炒至凝固。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201005/da0eb1ca-fe5d-41bb-9413-c13c47652b46.jpg\",
           \"content\": \"倒入调料汁儿，放入葱花。香气四溢，味道绝伦。超级简单，超级好吃。\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"5个\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"半勺\"
         },
         {
           \"ylName\": \"醋\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"清水\",
           \"ylUnit\": \"半碗\"
         }
       ]', '[
         2,
         4,
         6,
         70
       ]'),
       (35, '葱香冬笋丝炒蛋', 'http://static1.showapi.com/app2/img/caipu/20200919/3a83e52a-7dd0-4474-80c3-a548b5b20322.jpg',
        'http://static1.showapi.com/app2/img/caipu/20200919/29a0069b-a785-432a-91b2-6400425110d3.jpg', '[
         {
           \"imgUrl\": \"\",
           \"content\": \"冬笋买回来去壳，剥出笋肉，放清水中煮一下，差不多到5、6分熟，捞出\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"焯好的冬笋，切丝\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"大葱，切小颗粒\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"蛋打匀，放一点点盐拌匀\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"锅中放适量油，放一半葱花下去爆香一下\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"放笋丝，略加拌炒\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"放鸡蛋液，稍稍成型后，翻炒几下，加入剩下的葱花，再撒少许盐，炒匀即可\",
           \"orderNum\": 7
         }
       ]', '[
         {
           \"ylName\": \"新鲜冬笋\",
           \"ylUnit\": \"1斤\"
         },
         {
           \"ylName\": \"鸭蛋\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"大葱\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         6,
         70,
         171
       ]'),
       (36, '西红柿炒鸡蛋', 'http://static1.showapi.com/app2/img/caipu/20200826/a323c253-6f99-444d-a735-44a142e30839.jpg',
        'http://static1.showapi.com/app2/img/caipu/20200826/187e6509-e879-4566-9e49-5a636be4e4d0.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200826/38814ea0-f447-4d6c-90a6-d8203170a254.jpg\",
           \"content\": \"鸡蛋加盐打散，锅中加比较炒菜多些的油，中炒成小块，盛出备用\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200826/57178d8a-cd9a-461d-8d70-409ce5e119b3.jpg\",
           \"content\": \"西红柿去根、切块，锅内加油，加热油至出纹路后，中小火炒西红柿\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200826/325a69ab-7a90-4139-9fc1-9bd2c14b5d14.jpg\",
           \"content\": \"西红柿开始炒时，就可以加盐，这样更容易出汤汁\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200826/3d74132b-0bea-4993-957f-cf632acb3576.jpg\",
           \"content\": \"西红柿炒软后，加入鸡蛋翻炒均匀，收汁装盘\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"西红柿\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"4个\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"适量克\"
         }
       ]', '[
         2,
         4,
         6,
         70,
         171
       ]'),
       (37, '我家厨味之擂辣椒皮蛋（烤箱版）',
        'http://static1.showapi.com/app2/img/caipu/20210222/dc35c5f0-78f9-45c4-8e88-411f1d379e24.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/d2d19784-9ad4-4237-bb09-ec9156fa9ed2.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/ef85fe03-108d-4e5c-97a6-d23a732ed3dc.jpg\",
           \"content\": \"四个就一斤多重的大尖椒，肉厚、轻微辣味，洗干净后进烤箱，先不去籽，150度半小时，中间翻两次面，水分比起干煸或者火烤的会多一些，烤软且局部外皮焦黄后很容易去皮注意：要用烤盘，会有汁水\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/fe904308-ee36-4a36-9f42-7dc1ee682022.jpg\",
           \"content\": \"去皮去籽后的尖椒放入碗中加掰开的松花蛋\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/1d61f15f-5e64-4654-9a26-55aa4b8b61db.jpg\",
           \"content\": \"加拍碎的蒜米、酱油、石榴醋（可以根据自己的喜好用陈醋或米醋，腊八醋也很好、香油\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/a52451fc-fd2b-484c-befe-68da0188ead2.jpg\",
           \"content\": \"用捣蒜泥的石锤捣碎（家里没有专业擂食材的工具），就搞定啦\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"尖椒\",
           \"ylUnit\": \"四个\"
         },
         {
           \"ylName\": \"皮蛋\",
           \"ylUnit\": \"两个\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"三瓣\"
         },
         {
           \"ylName\": \"酱油\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"石榴醋\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"香菜\",
           \"ylUnit\": \"1根\"
         }
       ]', '[
         2,
         8,
         25,
         74
       ]'),
       (38, '凉拌皮蛋', 'http://static1.showapi.com/app2/img/caipu/20210222/ba50670f-c910-45e5-ad7f-00a400e50589.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/22d1a9fa-244d-4d6b-8d5c-d1f99e3e50a2.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/ac38c4e2-d2ab-474c-85f0-22d4953f3d4f.jpg\",
           \"content\": \"皮蛋去皮，每个竖切成4瓣，摆在盘子里。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c0dbe1c8-85e1-4132-85f7-b8a129c79079.jpg\",
           \"content\": \"葱和香菜洗净切碎，撒在皮蛋上。蒜切成沫备用。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/5bd7b22a-8388-4f2e-98a9-3f749a4a19b7.jpg\",
           \"content\": \"热锅下油，烧热后下蒜末，关火。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/35a48f1e-5ae7-48f4-9453-3557b9281aeb.jpg\",
           \"content\": \"加入炸好的辣椒油。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/0745dcf1-05b6-43b4-b917-6d9625b76843.jpg\",
           \"content\": \"加入酱油，醋，用勺子搅拌均匀。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/9c98df29-9b12-44d1-a075-7e097adf0f1c.jpg\",
           \"content\": \"将调好的汁均匀地撒在皮蛋上。\",
           \"orderNum\": 6
         }
       ]', '[
         {
           \"ylName\": \"皮蛋\",
           \"ylUnit\": \"7个\"
         },
         {
           \"ylName\": \"蒜瓣\",
           \"ylUnit\": \"4瓣\"
         },
         {
           \"ylName\": \"香葱\",
           \"ylUnit\": \"2颗\"
         },
         {
           \"ylName\": \"香菜\",
           \"ylUnit\": \"1根\"
         },
         {
           \"ylName\": \"辣椒油\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"醋\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"酱油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"2勺\"
         }
       ]', '[
         2,
         6,
         8,
         25,
         75
       ]'),
       (39, '旺仔牛奶蛋挞', 'http://static1.showapi.com/app2/img/caipu/20210222/44c3aabc-b2b2-4c75-ab65-83b536d0ac9c.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/453d2383-9ae8-4a27-8a23-bb4da4a2ceaa.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/17ebe4e5-b366-405e-8432-9f2f19bae5cb.jpg\",
           \"content\": \"1.把一罐旺仔牛奶，两个鸡蛋，三匙勺砂糖混合搅拌。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/b0288ebeddc44853b6d123d86e184366_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c85055b1-3b36-48ec-ae8f-85dc0339f439.jpg\",
           \"content\": \"2.用筛子过滤两次，得到细腻的蛋液。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/0b7bfb81766c430fb33b1b993abf257b_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c59330cd-e11d-4c75-8771-1bf6c647fb28.jpg\",
           \"content\": \"3.烤箱210度预热10分钟。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/66af38e880034e2bb77e71da24670f81_2000w_928h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/cab33e65-0b96-41cb-bd4b-ab975fc164fb.jpg\",
           \"content\": \"4.从冰箱里取出蛋挞皮，每个蛋挞皮倒8分满。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/2184b09c02bc447c92eeaf4ec6613006_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/e4ac165e-7aa4-4aa1-9519-c09bb4a89e06.jpg\",
           \"content\": \"5.预热后放进烤箱烤20分钟。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/8959eea463814557a6f5b9678dbed7ee_2000w_928h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/b217a639-0af2-4f78-9d25-89428c9d0a4f.jpg\",
           \"content\": \"6.十五分钟后的样子\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/3a85f67d89c14970a0cb236f5f59c6e8_2000w_928h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/773846ce-e07c-48b5-a17a-5a294eddd43c.jpg\",
           \"content\": \"7.二十分钟到了，大功告成。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/7cb8ce02ca584b42b03b14dbd4f01ff0_2000w_928h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"三匙勺（如果喜欢更甜自己适量添加）\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"旺仔牛奶\",
           \"ylUnit\": \"一罐(245ml)\"
         }
       ]', '[
         3,
         7,
         74
       ]'),
       (40, '松软牛奶发面糖饼', 'http://static1.showapi.com/app2/img/caipu/20210222/c1dd59ee-6f7f-43c9-87a0-f7388bc57cad.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/1bf630db-def3-4e7d-b058-973efe87ba54.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/55e95d77-402f-446b-a6da-b03c309733bd.jpg\",
           \"content\": \"大小一致的剂子\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/6a04ae07b1a74071adeb1ce4604125fc_2732w_4096h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/3be51577-09c4-409b-a9ae-e761069d0ff7.jpg\",
           \"content\": \"放糖馅\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/d5957507768a48cb92c4d32f9f5554bb_4096w_2732h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/69fdf404-4fd8-40ee-a971-27b8df8ed8bc.jpg\",
           \"content\": \"包进去\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/7342379de1db4d0b9afaf5214d9fcb11_4096w_2732h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/7b904ec0-d63e-4aec-b533-c6cdbf8588ba.jpg\",
           \"content\": \"包包子一样\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/85459bfbb6504103bd2caf466b689411_4096w_2732h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/1d2b7125-aecf-435b-a98b-919261d60917.jpg\",
           \"content\": \"捏好口\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/521ff8280cf1491e9c530a50f7e8c604_4096w_2732h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/8d48f48c-90a5-40d3-baad-282ff9f2d8ae.jpg\",
           \"content\": \"捏捏捏\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/c8b29de8215549f7ad0582288afe9674_2732w_4096h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c62a8543-91ea-4901-bf85-e5920af81d7f.jpg\",
           \"content\": \"滚滚滚\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/04c54364a89a475a82897f8626ffa346_2732w_4096h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/e4a7b689-a973-45ab-8048-1f760b280394.jpg\",
           \"content\": \"刷橄榄油\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/e5671380ed29476e8bf75dfd7c259b6c_2732w_4096h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/900dfded-7fba-4ba5-8e96-ee984db30b17.jpg\",
           \"content\": \"勤翻面啊！\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/104e199267cf4255838ec57ac276c82e_4096w_2732h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/18ab08df-3d3c-4f64-a667-2bd60c99af5e.jpg\",
           \"content\": \"切开慢慢的料哈哈\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/9006030a8e55430b91ec139f2ad3da2b_2732w_4096h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/097ec120-b902-436e-867a-f4c01d0c2d3b.jpg\",
           \"content\": \"火候很重要，勤翻面啊！\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/719bbabf4dde4455845efabffcb36a44_4096w_2732h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"白面\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"450克\"
         },
         {
           \"ylName\": \"酵母\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"黑芝麻\",
           \"ylUnit\": \"适量克\"
         },
         {
           \"ylName\": \"核桃仁\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"适量勺\"
         },
         {
           \"ylName\": \"熟面粉\",
           \"ylUnit\": \"少许克\"
         }
       ]', '[
         1,
         3,
         7,
         73,
         103,
         174
       ]'),
       (41, '芝士味烤牛奶', 'http://static1.showapi.com/app2/img/caipu/20210222/508187ee-be8c-4a7f-a9fb-285de7c3d6c8.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/87c7d0f8-be6b-4d7e-870c-f09d9a6b7968.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/ade32911-202d-4e05-a915-7163adcc47ff.jpg\",
           \"content\": \"牛奶，鸡蛋黄、白砂糖、奶酪片、玉米淀粉倒入奶锅中\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/15ecc60a926b47eea25ff1d9470fceb2_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/fc7733f2-5937-4893-bdd6-816096402cd0.jpg\",
           \"content\": \"锅放到电磁炉500瓦加热慢慢融化，要不停的搅拌牛奶\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/64c4c1f2448f4c169ce207071d60cf68_480w_384h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/9bf540cd-b2b9-4528-b162-49a6a560b680.jpg\",
           \"content\": \"慢慢的牛奶变浓厚，出现纹路关火\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/d20b034971674211934e4587bddd1c1a_3780w_3025h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/cd917ffc-0b65-4286-bb20-0e7834b7ee34.jpg\",
           \"content\": \"倒入容器放入冰箱冷冻1小时\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/e2f5d2ee994c4945a3f3a76cc1cc9b43_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/6a722078-cf13-43d9-9506-1a64d71dfd99.jpg\",
           \"content\": \"切小方块\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/eac3bd713b384b86bf627a3dad43e2ef_1242w_569h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/d87f9248-17ea-4ef0-a35e-d0c0b242b6dc.jpg\",
           \"content\": \"表面再刷一层蛋黄液\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/6908c6fe505b4945b0c0cf9ea11a9af9_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/1ab0cab7-2e71-435c-a247-84b1ad1c702d.jpg\",
           \"content\": \"放入提起预热好的烤箱顶部底部加热200度17分钟yi\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/abe3e4f015504ff2ad877e8193a94192_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/066b2786-e5f8-4456-b31d-9577f9fe1d9a.jpg\",
           \"content\": \"冷却后就可以吃了\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/b0467c5ff607424b85a7d141272268e1_3780w_3025h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"45克\"
         },
         {
           \"ylName\": \"玉米淀粉\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"蛋黄\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"芝士片（妙可蓝）\",
           \"ylUnit\": \"2片\"
         }
       ]', '[
         3,
         7,
         71,
         74,
         76
       ]'),
       (43, '红油香干肉末', 'http://static1.showapi.com/app2/img/caipu/20210222/4b876575-bf87-428a-baeb-1b602241d581.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/ca89df66-d0ac-4d40-af21-127b535191e5.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/d5bd621c-6aef-435d-bb95-bf36d21afc6e.jpg\",
           \"content\": \"1.1干切丁1.2蒜瓣切蓉1.3干菇温水泡发，切丁1.4切丁1.5切丁\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"起锅热油，下香干丁与香菇丁，煸香煸干，装盘备用。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/d701f081-1bfd-4618-b3f8-9b5fc916dd85.jpg\",
           \"content\": \"起锅热油，加入肉末，煸至变色出油\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/21f96e02-fc13-4cd5-884e-63abb07adfee.jpg\",
           \"content\": \"加入煸好的香干与香菇丁，一茶匙盐，半茶匙白糖，翻炒两分钟\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"烹入一瓶盖米酒，去腥增香\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"加入两汤匙生抽，半汤匙番茄酱，一汤匙风味豆豉，一茶匙白胡椒粉翻炒均匀\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/0513cc85-7d72-4317-8518-bde6a37ff0ef.jpg\",
           \"content\": \"转中火，盖上盖子焖两分钟，最后撒上葱花，翻炒均匀出锅。\",
           \"orderNum\": 7
         }
       ]', '[
         {
           \"ylName\": \"豆干\",
           \"ylUnit\": \"4块\"
         },
         {
           \"ylName\": \"肉沫\",
           \"ylUnit\": \"300g\"
         },
         {
           \"ylName\": \"干香菇\",
           \"ylUnit\": \"6朵\"
         },
         {
           \"ylName\": \"风味豆豉/豆瓣酱\",
           \"ylUnit\": \"一汤匙\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"两汤匙\"
         },
         {
           \"ylName\": \"番茄酱/甜面酱\",
           \"ylUnit\": \"半汤匙\"
         },
         {
           \"ylName\": \"白胡椒粉\",
           \"ylUnit\": \"一茶匙\"
         }
       ]', '[
         2,
         6,
         8,
         26,
         70,
         170
       ]'),
       (44, '家常蜜汁豆干', 'http://static1.showapi.com/app2/img/caipu/20210222/e89b0100-be32-4fc3-bcfa-5f18909cc133.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/1435d8f2-2b1a-451e-acb3-9501daef0171.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/5d12ddfb-badb-4d19-881b-de832682ceb9.jpg\",
           \"content\": \"不粘锅中放油和红糖\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/0479fba1-71c0-4ed1-92f4-44718e5ad37c.jpg\",
           \"content\": \"翻炒到起泡\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/1c88b284-4f8d-44f0-8e17-f0d5788206a1.jpg\",
           \"content\": \"放入蚝油、十三香\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/7a338f7a-f29d-4aaf-840b-600355015ee6.jpg\",
           \"content\": \"放入原汁酱油\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/86b845f3-4d1f-438e-bb86-1f7cc5d3bc4e.jpg\",
           \"content\": \"放入生抽\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/a41fd872-97ac-4743-ba00-c8235a8db7bd.jpg\",
           \"content\": \"翻炒后放入清水大火煮开\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/5fc42096-ad6d-45b3-82e0-7c92b5628f52.jpg\",
           \"content\": \"再小火炖至收汁\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/32426e47-de43-4697-b593-edb1ce2feded.jpg\",
           \"content\": \"油光松软甜而不腻的豆干完成！\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/1eef5e3c-46a6-4fd0-af03-cad28ef8c26f.jpg\",
           \"content\": \"简单又快捷的小零食，超爱吃。\",
           \"orderNum\": 9
         }
       ]', '[
         {
           \"ylName\": \"油豆腐\",
           \"ylUnit\": \"260克\"
         },
         {
           \"ylName\": \"红糖\",
           \"ylUnit\": \"4大勺\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"十三香\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"清水\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         23,
         70,
         69,
         71
       ]'),
       (46, '好吃到流泪的千叶豆腐', 'http://static1.showapi.com/app2/img/caipu/20210222/a0005b5a-0798-4e03-91ce-39d1790c55d8.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/a81453b9-7cb1-44f0-a589-fa4d265359d1.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/6581c70f-ba63-4e94-8c21-051103719b98.jpg\",
           \"content\": \"锅中倒油，油热后放入葱段、豆瓣酱、腊肠。豆瓣酱，放切成片的千页豆腐。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/965ea8d1a501441b8e295660d4e9f2fc_1008w_756h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/3d76e4bd-819b-46e1-94b8-678a98de78ad.jpg\",
           \"content\": \"千叶豆腐炒至断生后放入青椒，山鸡酱，生抽和蚝油。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/40070ccd5d444eac829d9333bc2875e0_1008w_756h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/204ef8a2-5b92-437d-a51d-f0e268fc0dfd.jpg\",
           \"content\": \"翻炒均匀，青椒熟后即可。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/914e135bc45f4bada46b4116675de16d_1008w_756h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"千叶豆腐\",
           \"ylUnit\": \"1块\"
         },
         {
           \"ylName\": \"青椒\",
           \"ylUnit\": \"1-2个\"
         },
         {
           \"ylName\": \"腊肠\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"山鸡酱\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"豆瓣酱\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"葱段\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         }
       ]', '[
         2,
         6,
         8,
         25,
         70
       ]'),
       (47, '干饭人无法抗拒的香煎豆腐',
        'http://static1.showapi.com/app2/img/caipu/20210221/47cad442-e15e-4ddb-bd35-83bbbf57f2ca.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/02b27780-3246-4c80-9953-efd327b3b474.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/cb6d825e-3a1f-4899-bd7a-d2aa75d90906.jpg\",
           \"content\": \"豆腐切厚片备用\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/0d98d7749d2d406caba2c6be266b2216_1350w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/7767e9f6-ce61-4f34-9120-37e4b8048605.jpg\",
           \"content\": \"大蒜切末，小米辣切碎，放入碗中，加入2勺酱油，1勺蚝油，半勺盐大概3g，1勺糖大概5g，半碗水搅拌均匀，调成料汁备用\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/be099179c7e643dd9e8e4c75413ad3c9_1350w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/a0074cf1-026c-478a-8726-c0069bcb43be.jpg\",
           \"content\": \"豆腐裹上鸡蛋液，粘上淀粉\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/3849de1baf6f498a830f7be51793f86f_1350w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/8eb4b6a0-4b21-4f83-8b57-6af72e205950.jpg\",
           \"content\": \"处理好的豆腐放入锅中煎至两面金黄，倒入提前调好的料汁\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/3fb89a341257438e84ec0bec4b12ca28_1350w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/e75a5192-6cbc-45f5-a2e1-6f2ac6553858.jpg\",
           \"content\": \"放入适量葱段，收汁出锅\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/2f3a7f86cbb54918bc00c10ef546ff46_1350w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/257a5ff1-d783-4ea7-85fa-5af551cf46b0.jpg\",
           \"content\": \"这样做的豆腐，两碗米饭都不够\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/bc60db7fcc244b249a24e58158863ac0_1350w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"老豆腐\",
           \"ylUnit\": \"1块\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"6瓣\"
         },
         {
           \"ylName\": \"小米辣\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"酱油\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"半碗\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"葱段\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         8,
         25,
         73
       ]'),
       (48, '干豆腐肉卷', 'http://static1.showapi.com/app2/img/caipu/20210221/702f3186-c672-47dd-8ef5-5e45c7b24f84.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/ad489261-0685-4e1e-a676-d25e0024e804.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/540ae4ea-ffda-4971-980a-bbb15ceb472f.jpg\",
           \"content\": \"所有食材放入绞肉机，打碎（家里给孩子吃放了些香菇，也可以根据自己口味，加入青椒，胡萝卜等）\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/617ce447fb254bc0b86ca110d9f822fd_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/7cdd2eb9-a531-41c2-ab97-67e2f444a132.jpg\",
           \"content\": \"把肉馅放在干豆腐上铺平\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/be8b4e5a7d3a4d94a87091adef07217b_1152w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/e31bba82-647b-428b-bbd1-126d5abb3350.jpg\",
           \"content\": \"算起来，上锅蒸熟，大约需要15分钟\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/384aa6b888544ebb828c361158d17a7e_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/be98e222-f796-4d58-bca2-267facbc1021.jpg\",
           \"content\": \"出锅了，可以散上辣椒油，蒜末，香葱\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/37aaae8e4e31436a847f730c3369e612_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"葱姜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"猪肉\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"干豆腐\",
           \"ylUnit\": \"2张\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1大勺\"
         },
         {
           \"ylName\": \"十三香\",
           \"ylUnit\": \"1小勺\"
         },
         {
           \"ylName\": \"鸡精\",
           \"ylUnit\": \"1小勺\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"2大勺\"
         }
       ]', '[
         2,
         6,
         72,
         170
       ]'),
       (49, '葱爆豆腐', 'http://static1.showapi.com/app2/img/caipu/20210221/09e7a92a-f88c-48bc-89bf-928b2a38f2bf.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/0a9f3cc7-83be-4aa9-acc6-2a843d8165b2.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/87606330-bd5d-4625-844d-4037a5297102.jpg\",
           \"content\": \"准备好需要的食材，豆腐切片，大葱切滚刀块\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/b630fd90a66041d19ebfcd1318178704_1000w_750h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/6ba51cdf-8380-4433-a09b-4bb17c915c6c.jpg\",
           \"content\": \"热锅凉油下入豆腐煎\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/38d306a778144110a0081eb30b175be8_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/5d5a193f-2f2a-4bbf-b5cd-c2ae87435052.jpg\",
           \"content\": \"煎至两面金黄盛出来\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/708092cdeef84983b921e97c89260583_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/a35889d9-e00e-40e8-8665-5249a4885b5a.jpg\",
           \"content\": \"锅里面留少许油，下入大料瓣，大葱煸炒出香味，调入生抽酱油，盐，白糖\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/fc426a4503fc4e09b90856fbbee45106_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/eaadf533-12c9-41e6-91aa-d299d851a80b.jpg\",
           \"content\": \"下入煎好的豆腐大火翻炒均匀\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/c048c4a3945e4eb7b09f683f37cd68f0_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/2e4b1ac7-d742-4a23-9b6f-f77535c53bea.jpg\",
           \"content\": \"即可出锅装盘\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/bc776a96d8d0441eb850134673746259_1000w_750h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"豆腐\",
           \"ylUnit\": \"300克\"
         },
         {
           \"ylName\": \"大葱\",
           \"ylUnit\": \"1根\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"1瓣\"
         },
         {
           \"ylName\": \"豆油\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"大料\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"2克\"
         }
       ]', '[
         2,
         6,
         70,
         73
       ]'),
       (50, '低脂健康西芹牛肉粥', 'http://static1.showapi.com/app2/img/caipu/20210222/f11bb1fb-8c18-4c5e-9629-00c4f7da17e0.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/855e83c6-1971-4fe9-817d-66cae43bbd4f.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/240b97cf-2a37-46bb-85e7-8e6ee7b1b10c.jpg\",
           \"content\": \"冰箱里拿出牛肉解冻准备好西芹和姜片\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/8d78e40b60df4fbb9713cc2c70dfd590_3429w_2572h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/4d2d3028-95f1-4ef5-9afd-8dac805a5749.jpg\",
           \"content\": \"淘米，电饭锅煮粥模式喜欢稀一点就多放点水，干一点就少放点水\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/130cc7e534b74946ac7468297e3c469c_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/2ac7a3ba-37c5-4dfe-a1fe-013024785d2a.jpg\",
           \"content\": \"煮粥的过程中先将西芹切成小粒\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/0229376aeba34cd29e9bbc8cf13d1817_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/b91c6bea-a254-4ac9-82c1-f9fe1f7d898e.jpg\",
           \"content\": \"牛肉切成丝，放入一勺盐、一勺生抽、一勺料酒、适量淀粉、一个鸡蛋，搅拌均匀，再放入姜丝，腌制20分钟以上。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/04f21ef5c35e4e11bc654cd04c1e9ff2_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/a9f1c709-4def-449b-b89c-d21ce672a2a0.jpg\",
           \"content\": \"当电饭锅还剩最后半小时左右就可以放入腌制的牛肉和西芹粒啦\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/f11a05ce20a9474380c381d62bb7bee1_2999w_3998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/f33e83e0-f633-4c6c-b453-4dfb60b8593a.jpg\",
           \"content\": \"搅拌均匀，让粥和西芹牛肉充分融合\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/4fde80b4b923435f9235e3fc101f6ae3_2999w_3998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/1959789d-12e0-4bb3-a5cc-12e28ec2231b.jpg\",
           \"content\": \"出锅前加入适量盐和黑胡椒粉调味暖胃健康又低脂的西芹牛肉粥就做好啦！还可以蒸点包子或者地瓜来搭配\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/2687a45115a142c0a2c2098468a2d138_2999w_2999h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"牛肉\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"1片\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"西芹\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         1,
         6,
         71,
         100,
         133,
         136,
         170
       ]'),
       (51, '家常菜：香芹豆干炒腊肉',
        'http://static1.showapi.com/app2/img/caipu/20210222/9aee7f06-1f3d-490a-8c5f-f5a498ad3e59.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/68d06452-f4e4-46de-ae0c-58608aa69ad0.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/cc499b26-fe28-4e6f-bd4b-0ba28010767d.jpg\",
           \"content\": \"先把腊肉切片…\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/922eb5c584354e7db2960aee962c829c_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/6e98b7b2-82e8-47d6-bc66-56ab9ab72322.jpg\",
           \"content\": \"把豆腐干也切成一条条…\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/10fdb4a3ebb14b0bb57fa3921c5d5177_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/570cd756-541f-4c99-a4d4-e593f75037cd.jpg\",
           \"content\": \"把香芹也切成一段段的…\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/66941e95a00a49f98941044c37e5f884_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/b19bf295-9c09-423e-973a-9d5864280484.jpg\",
           \"content\": \"烧热炒锅，爆香蒜头和辣椒，再先把香芹放进去炒香，炒至半熟…装起\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/34f521b8ad9345cd8f0a23509622e31b_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/4e8a003b-62fe-4c7e-9877-8c8e2c5e5368.jpg\",
           \"content\": \"再放腊肉在炒锅爆炒至熟透，放豆腐干落去翻炒一下，再放回香芹进去炒至熟透，大功告成！\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/1ab9e145790240598960decb79adaf70_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"腊肉\",
           \"ylUnit\": \"半条\"
         },
         {
           \"ylName\": \"豆干\",
           \"ylUnit\": \"5块\"
         },
         {
           \"ylName\": \"香芹\",
           \"ylUnit\": \"4根\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"耗油\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"蒜头\",
           \"ylUnit\": \"3粒\"
         },
         {
           \"ylName\": \"辣椒仔\",
           \"ylUnit\": \"1只\"
         }
       ]', '[
         2,
         4,
         6,
         8,
         25,
         70,
         170
       ]'),
       (52, '牛肉炒芹菜', 'http://static1.showapi.com/app2/img/caipu/20210222/b359c707-f574-4b38-95e7-8cb638f8ff74.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/c51a5ea0-9bd0-403a-91b2-d7acc3f282ee.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/4c4906d0-5a1a-4f17-81d5-af9f89a06f4b.jpg\",
           \"content\": \"准备\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/5bdd5f5aa21f4b2bbecba436d89d22f0_754w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/37dccedf-4526-4ca4-9df4-c3bd55d99786.jpg\",
           \"content\": \"牛油\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/393ed489341e491fb1f1d1e43cfc0f2c_754w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/976d1f11-b5f7-40c2-9678-f1969543df16.jpg\",
           \"content\": \"牛肉炒\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/a51e0f1c4a52433ca678fea26adff7a3_754w_754h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c4571a2d-8d67-4278-b937-1ee1eb02827d.jpg\",
           \"content\": \"加入芹菜炒一会加盐\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/fbcdec95c3014215b3ce80dd7314b1a7_754w_754h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/14b25948-2296-4410-9121-05dd2ab82f7c.jpg\",
           \"content\": \"出锅\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/f9075489196b4d11b3449ce546df15a9_972w_1296h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"牛肉\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"芹菜\",
           \"ylUnit\": \"1把\"
         },
         {
           \"ylName\": \"牛油\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1.5克\"
         }
       ]', '[
         2,
         4,
         6,
         70,
         170
       ]'),
       (53, '素炒西芹', 'http://static1.showapi.com/app2/img/caipu/20210222/56eae7d6-0825-4b60-8231-b79e5082c15f.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/790c427f-21d7-4e31-ab2c-3a5374d4e3a0.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/626b999d-85d1-42e2-9152-195ca6d2f7a2.jpg\",
           \"content\": \"西芹洗净去筋斜刀切块\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/1ebd9e80017f45c1972ffd9ef3906497_938w_681h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/9ccb752f-6a3b-46d3-9118-20a15b09f9b2.jpg\",
           \"content\": \"算切片\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/32fde0a4d74f4b8386c532b812f836a0_1000w_750h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/945ee7d2-780f-4b2d-90cd-9c54de0d400c.jpg\",
           \"content\": \"西芹焯水时间1分钟左右焯好后盛出备用\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/42eca5f76dd14e848d47fa3f93ffe08f_961w_730h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/b63a8dbd-e5b4-416e-b22a-95e6b8931b6e.jpg\",
           \"content\": \"锅中加油加入十三香、蒜炒香\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/b89951f6d970486ca071ff0ec5b36417_1000w_750h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/60814ac2-be9d-4281-86d1-470d677d0690.jpg\",
           \"content\": \"下入西芹加盐、酱油、耗油、糖翻炒\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/d313ef37e1db429f8b5bf25c7994eb89_1000w_750h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/09e25e4a-2e06-452e-babd-1a0359b81e90.jpg\",
           \"content\": \"翻炒均匀即可出锅\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/f1b8218ddfdd4720851d3be6c7996e1e_973w_730h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"西芹\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"3瓣\"
         },
         {
           \"ylName\": \"盐、酱油、耗油、糖\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         4,
         6,
         70,
         171
       ]'),
       (54, '比韩国泡菜更好吃的辣白菜，次日可吃（超简单，不用杀水）',
        'http://static1.showapi.com/app2/img/caipu/20210221/b72f32ca-7b47-4da7-979f-0ee06640eba9.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/fb3ad199-ea09-4fe6-a362-cf45b0441b33.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/8806d13b-9f41-4976-b11c-a8152a19e889.jpg\",
           \"content\": \"娃娃菜洗净，沥干水\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/b9e4190bf1854e54be21965f0d98a84c_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/8318de97-a44d-4ef5-b40a-899141fc5f3e.jpg\",
           \"content\": \"切成小片\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/c31d2124719948e69420b7564b847ae8_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/97463118-4ded-4713-a2a1-87982f868ab2.jpg\",
           \"content\": \"加入1-2大勺辣椒粉（辣椒粉辣的不辣的都行，主要为了提色好看）；四大勺白糖\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/5d132cdfcc8b4535b2d3bb9f0df33c6e_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/79e2c92f-9ab2-4eec-90fa-337c48569d04.jpg\",
           \"content\": \"加入4小勺食盐（调料罐的小勺子）加入8大勺白醋\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/cb11f68c8af8435790f5fc730a1c3886_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/a2431d6a-3d7a-4962-b71b-06efc2588df8.jpg\",
           \"content\": \"拌匀\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/ff197878a25d4735b31e7c4d09ac4bc1_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/b5ca4164-7e05-4f42-bb23-29d0be0c337c.jpg\",
           \"content\": \"放置两天就长这样啦（放置1天就入味可以吃了）\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/26450ece6adf40728ac4b9aa47cf0edc_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/b5c974e4-25b5-4585-bebf-b9d56b367ccd.jpg\",
           \"content\": \"一颗大白菜可以做2小盒口味：酸甜口，白糖和白醋的反应真的很赞，有辣味，辣味主要来自大蒜和生姜。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/26f39b08a3e945f88ab727f79ce4c2d7_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"娃娃菜\",
           \"ylUnit\": \"1颗\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"一头\"
         },
         {
           \"ylName\": \"生姜\",
           \"ylUnit\": \"5片\"
         },
         {
           \"ylName\": \"辣椒粉（提色用）\",
           \"ylUnit\": \"1-2大勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"4大勺\"
         },
         {
           \"ylName\": \"食盐\",
           \"ylUnit\": \"4小勺（大勺小勺后面有图示）\"
         },
         {
           \"ylName\": \"白醋\",
           \"ylUnit\": \"8大勺\"
         }
       ]', '[
         2,
         6,
         8,
         26,
         68,
         171
       ]'),
       (55, '水饺 | 白菜虾皮猪肉饺子 超鲜的馅料配方',
        'http://static1.showapi.com/app2/img/caipu/20210221/3319bb87-62c8-4c8c-b19b-5f1b3d5333ec.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/7c1e63a9-39b0-41c6-a20d-8a18da6e9c1b.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/0e5e7bd0-809f-4a03-8428-376f8af1e024.jpg\",
           \"content\": \"肉馅是超市现绞的，五花肉芹菜洋葱白菜，切小丁虾皮直接洗净沥干\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/50a1773819ee4e93994115e0afd272ab_1024w_768h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/165808e1-dbee-474f-b6a8-78f62eb7892f.jpg\",
           \"content\": \"放调味料：盐生抽老抽蚝油孜然粉\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/c7b1fac4dcc848e2a1ab30f4a1c670c7_1024w_768h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/15ce03e2-643a-4332-9628-2e880249496c.jpg\",
           \"content\": \"馅料和均匀\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/d1ca7696518940e898c7b8623b25222e_1350w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/5957c497-a2f6-4760-a0cd-a7c68b2e058d.jpg\",
           \"content\": \"开始包饺子啦\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/fbf4b03841254ecf9d84c9a4d53d59d4_1633w_1225h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/669a5814-de55-4254-a543-b4cc6715a760.jpg\",
           \"content\": \"\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/8de2a7d698674b59904e1cd401d62d85_1024w_768h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/ca806b85-3b95-484d-b3ee-fde77b940a59.jpg\",
           \"content\": \"煮饺子\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/db9eada27d6c45c885c5ae2626c6b9d3_1633w_1225h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/bf69d72e-d2d9-49d6-8487-dac6af596e68.jpg\",
           \"content\": \"汤也好啦，开动\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/b7d10c3365af4a0d84976a3c0c0b18c0_1024w_768h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"猪肉馅\",
           \"ylUnit\": \"400克\"
         },
         {
           \"ylName\": \"白菜\",
           \"ylUnit\": \"8片\"
         },
         {
           \"ylName\": \"芹菜\",
           \"ylUnit\": \"3根\"
         },
         {
           \"ylName\": \"洋葱\",
           \"ylUnit\": \"半个\"
         },
         {
           \"ylName\": \"虾皮\",
           \"ylUnit\": \"1大把\"
         },
         {
           \"ylName\": \"饺子皮\",
           \"ylUnit\": \"1斤\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"小半勺\"
         },
         {
           \"ylName\": \"孜然粉\",
           \"ylUnit\": \"半勺\"
         }
       ]', '[
         1,
         6,
         71,
         104,
         170,
         174
       ]'),
       (57, '翡翠白菜虾仁水饺', 'http://static1.showapi.com/app2/img/caipu/20210221/516f0124-7140-495f-99a4-64516d5cfab8.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/0c0223ea-1b71-4f9c-8af4-45ecc9b16af7.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/49959996-1201-4148-a022-e40659039f54.jpg\",
           \"content\": \"310克面粉、水、盐1克放面包机揉好，110克面粉、菠菜汁放面包机揉好，盖不锈钢盆醒发\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/b103bd6941b14ac3b17de1ce41d65407_800w_600h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/bbfb3b5d-be8f-4222-95a6-2359b71219ff.jpg\",
           \"content\": \"姜剁碎，白菜洗净剁碎，挤出多余水分，猪肉剁碎，虾仁去肠线切成小块\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/a1c32d29cecf4486ba9712b6de600da2_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/44b389ba-2f45-428a-970d-38e91c226a09.jpg\",
           \"content\": \"把肉馅和白菜馅混合均匀\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/a34c3ca338c6482b9f2b9cc44cf6aed2_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/8cc3dba0-f666-43fc-a698-5fefe74cf32d.jpg\",
           \"content\": \"加入切碎的虾仁混合均匀\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/3322f5abd6194eda953a2e57c3cadd3a_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/dc296ea2-de8f-4f75-89f2-d10be073702e.jpg\",
           \"content\": \"加入姜末、料酒、生抽、盐、味好美五香粉、快炒鲜\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/f2be679815c04b41877c3adceb20ccba_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/fe5b812c-f960-4dbf-b3f9-a859b557abae.jpg\",
           \"content\": \"胡姬花花生油烧热放凉后倒入饺子馅中，再加一点香油调味，然后按照一个方向搅拌均匀\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/80a137bd545f47f9aca0baa47a613360_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/a2ad1cce-a8b4-43a0-ba52-650b6a48f62e.jpg\",
           \"content\": \"醒发好的菠菜面团擀成薄片，白色面团搓成长条，用绿色面团包裹住白色面团\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/6b293f7cec744c8398c25e9485d234a3_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/a11f69c3-685a-45ab-a952-f10fa1bc8372.jpg\",
           \"content\": \"切成大小均匀的面剂，一个面剂9-10克\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/e72dac3f71c04a81b5a0fa7156080b13_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/e1f33d0e-427a-47a7-92ad-7d54ef16a4f7.jpg\",
           \"content\": \"面剂子撒上干粉，用手按扁，擀成四周薄中间厚的饺子皮\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/093124b6eae940a8bc4537f66351845e_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/ceb6fb2c-462b-4db1-81dd-da93084737cb.jpg\",
           \"content\": \"饺子皮中间放上馅\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/d30bf196bedd4215ad40d33341d3efef_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/5334ff78-1f5f-4f7a-b046-fba2f087fcbf.jpg\",
           \"content\": \"中间捏一下，然后左右手虎口同时一挤，一个漂亮的翡翠白菜虾仁大肚饺子就包好了\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/97c464f2e5e5419f9e6e275c0a68bdea_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/c84d1273-b1db-4a9b-a41b-2804c9659397.jpg\",
           \"content\": \"包好的大馅饺子\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/ed8aae2ecb68486eb361c9797cf1a535_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/e3b8ce02-a32d-4558-9a50-37807756b2e6.jpg\",
           \"content\": \"锅中加水，水开后煮饺子……煮好的饺子出锅装盘了，趁热赶紧吃饺子吧！\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"https://i2.chuimg.com/7fd611d0dc5140508c89982e4c5130c9_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"猪肉\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"白菜\",
           \"ylUnit\": \"600克\"
         },
         {
           \"ylName\": \"虾仁\",
           \"ylUnit\": \"220克\"
         },
         {
           \"ylName\": \"姜末\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"1小勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"4克（1克和面用，3克馅料用）\"
         },
         {
           \"ylName\": \"花生油\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"1小勺\"
         },
         {
           \"ylName\": \"味好美五香粉\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"味好美快炒鲜\",
           \"ylUnit\": \"1克\"
         },
         {
           \"ylName\": \"中筋面粉\",
           \"ylUnit\": \"420克\"
         },
         {
           \"ylName\": \"清水\",
           \"ylUnit\": \"220克\"
         },
         {
           \"ylName\": \"菠菜汁\",
           \"ylUnit\": \"65克\"
         }
       ]', '[
         1,
         6,
         20,
         71,
         104,
         170,
         171,
         174
       ]'),
       (58, '圆白菜粉丝', 'http://static1.showapi.com/app2/img/caipu/20210221/5c3f1520-be09-449c-8ba2-0ba01f39d9aa.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/41d500f6-4cc5-4ee0-8b31-72b87dc1a7c1.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/1d492087-bea7-43de-b83c-528e2d55e2b2.jpg\",
           \"content\": \"圆白菜洗净切长条。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/609aa6c96d644bf7b1ab6a1a068b2e13_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/d2fd3ff8-e52f-4617-9f08-2aa74c25da92.jpg\",
           \"content\": \"粉丝泡软备用。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/914b88f87e1f400ab1d064146d39e77b_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/bc1936a6-40ce-4c1f-b597-c5abb508450a.jpg\",
           \"content\": \"锅中放油，猪油，花椒，蒜片，辣椒，小火熬出香味。然后捡出配料，否则吃的时候和粉丝混在一起不好摘。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/1f5fd485cda84de7ae809adce308de6a_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/61be8896-1c92-49cd-bff9-61c10dff9a71.jpg\",
           \"content\": \"转大火，放入圆白菜翻炒。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/5826c6f9bf39454c9c9ce8f218a5f109_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/1bcb6127-967f-4424-9c98-d04da3b615b8.jpg\",
           \"content\": \"加入粉丝。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/ab352b3680d440a4863e8b391bc2010c_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/76b2de25-c710-4922-b18e-209e81ffbe16.jpg\",
           \"content\": \"放盐，生抽，翻炒。也可以根据自己喜好加少量醋或者耗油。因为粉丝吸水，所以炒的时候需要适量的加水。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/d6e1ae95b480472dad262407a80a81b8_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/f94397a1-68ca-4369-81de-e266f45de9b0.jpg\",
           \"content\": \"至圆白菜脆软，粉丝熟后起锅装盘。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/c4d706c0bf93409b84fb22822a14a07c_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"圆白菜\",
           \"ylUnit\": \"片\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"勺\"
         },
         {
           \"ylName\": \"粉丝\",
           \"ylUnit\": \"把\"
         },
         {
           \"ylName\": \"干辣椒\",
           \"ylUnit\": \"个\"
         },
         {
           \"ylName\": \"花椒\",
           \"ylUnit\": \"粒\"
         }
       ]', '[
         2,
         4,
         6,
         70,
         171
       ]'),
       (59, '西红柿洋白菜鱼片', 'http://static1.showapi.com/app2/img/caipu/20210220/e200efa3-f3fb-4133-a200-92e6a96818c9.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210220/c1a8a916-7f49-44af-b5ac-5e9ff4186315.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/980f5e07-fdad-4e6f-beeb-bedbf5cb1424.jpg\",
           \"content\": \"切\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/6c301e2b2b7a4329ae8e30839f9f18d3_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/04af609d-81c8-439f-bf8a-17a4682f01f7.jpg\",
           \"content\": \"来\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/974016b07a5a4fda822c7de7fb7e5cf4_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/a57bb0e1-f758-4b28-932e-1aab0bd3fc4a.jpg\",
           \"content\": \"软来\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/5bab37bbde0848ccb85b683474d4430a_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/41ae2caf-a14c-4315-8c98-6f78c0c1256b.jpg\",
           \"content\": \"放鱼\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/b53b6b25f7f24c32960236d0ccfcd8d0_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/449363bb-54ac-47b4-b717-fd6d1398ede2.jpg\",
           \"content\": \"嗯\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/b6fd64139ce6487ebeaff6396e898f3c_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/94f647ca-4067-402b-be9c-d0c60e12809f.jpg\",
           \"content\": \"包菜\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/0b797e519e4a46178c4fb0f1502e668c_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/c815ca15-1ae5-4044-8fe3-e8bca0cd8e91.jpg\",
           \"content\": \"霍愣\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/f912b88e69a343f1bced14dbf3085c12_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/37a07e84-348d-46de-9b74-6b60c8e6b74a.jpg\",
           \"content\": \"闷一会\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/399d4cdb0e8e42f599009caaf95da0e1_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/471f41c3-f0ca-434a-babf-5ebf3f58d7f1.jpg\",
           \"content\": \"差不多熟就出锅\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/cdf2851ca21349a8846fe29074a6d288_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"包菜\",
           \"ylUnit\": \"几片\"
         },
         {
           \"ylName\": \"西红柿\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"番茄酱\",
           \"ylUnit\": \"一丢丢\"
         },
         {
           \"ylName\": \"罗非鱼\",
           \"ylUnit\": \"1片\"
         }
       ]', '[
         2,
         6,
         9,
         71,
         20,
         134,
         170,
         175
       ]'),
       (60, '冬天里的辣白菜', 'http://static1.showapi.com/app2/img/caipu/20210220/31c6c9db-7a8b-4777-a4a7-bc8cf564ace7.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210220/fe8bd8f4-8a21-4fdf-a236-3ce01e3141e1.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/b1ec88fe-3cb7-44b0-a975-b97e97486d15.jpg\",
           \"content\": \"大白菜摘净干叶烂叶，流水冲净晾干\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/413365f2e241406d86ab54e906da1547_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/5041e392-bd6b-4421-8a61-2d383308cce3.jpg\",
           \"content\": \"对半切开\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/f00aa1ba079449f284d77a43afb854d3_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/c7b06f73-f07a-4ca3-8daf-e021437e2527.jpg\",
           \"content\": \"化一为四\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/5428c29816764c3098a3a5e056503807_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/46f9af8f-1726-484e-9f34-db9c710e6634.jpg\",
           \"content\": \"也可以掰开每一片白菜叶，切成小段，这样方便食用，大粒盐腌出水份\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/99e9c9ebc9124366ac08d9a9971030f1_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/01c25a67-5e3e-4da5-a8fa-1f9484bd3fbc.jpg\",
           \"content\": \"白萝卜切成小段，撒入大粒盐\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/8f50619ead75460ca65d3f0a8e643f7b_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/d9e3db0f-f68d-4a82-9e70-7c9d45442cfa.jpg\",
           \"content\": \"间断翻动一下，数小时以后就会软趴趴的出来好多水份\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/597ae48a01ce40189295df7052d9a9fa_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/ebd4662b-3db7-43fd-adce-5b0015e7ba69.jpg\",
           \"content\": \"清水淀粉搅拌均匀，小火加热成这样的糊状，好像变魔术一样\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/4352b2320aa94da2a2e3dbe7cb30e2eb_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/9ded6401-b5b9-4c85-8d73-41fa1549e934.jpg\",
           \"content\": \"加入辣椒粉\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/2372dc51cdde4ac3848896b125800f58_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/109938dd-f1ce-42d6-821d-ed0c95f7af8c.jpg\",
           \"content\": \"搅拌以后是不是有点好看\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/ddaca651ef4d4dd4a10ab4a88dabb53b_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/34578d4e-cecb-4b6c-99a2-64b111258f7c.jpg\",
           \"content\": \"苹果梨，洋葱，大蒜，生姜，尽量打碎\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/1921afc86b5b45b8807c152527435e36_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/dc2177e4-b1f2-4966-90e3-c0a6cfff88f7.jpg\",
           \"content\": \"放入淀粉糊中搅拌，加入白醋\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/4cc9c1c1951b45ee8d58fa91c67b5cf8_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/65b40a66-3036-45a0-97f6-8ccbe000d92c.jpg\",
           \"content\": \"韭菜摘净，控干水份切段\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/32598fa49e204f99ab3bcd302e4ad54e_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/fec3dba9-53b9-4771-9f16-5d560f4db219.jpg\",
           \"content\": \"搅拌，是不是有点像韭菜猪肉的饺子馅儿啊\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"https://i2.chuimg.com/729ad41a41cf419fab547594e2ffb41e_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/f9b25ecc-3651-45b9-9578-ea70a5ec5b5b.jpg\",
           \"content\": \"白菜挤干水份（这里说一下：有人会说太咸，那你可以用凉白开浸泡一下再挤干，尽量不要用生水）\",
           \"orderNum\": 14,
           \"old_imgUrl\": \"https://i2.chuimg.com/ad893ea3c3ff4db99d2d3d6c59075039_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/ba1355a7-1f11-491d-a2f1-f2cf1a56ea3f.jpg\",
           \"content\": \"萝卜同理挤干水份\",
           \"orderNum\": 15,
           \"old_imgUrl\": \"https://i2.chuimg.com/ee7e3b9d97af404cbde5d52c91249ebe_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/f3ea9167-15e9-4ba2-91f3-4ae48c84c6f4.jpg\",
           \"content\": \"找个大点的无油无水的容器搅拌一下就好啦，尝尝味道\",
           \"orderNum\": 16,
           \"old_imgUrl\": \"https://i2.chuimg.com/b5d4d0dc25ce4a998044dbc007ef06e4_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/cb4d9eda-a2aa-4bcf-9a77-5ec12d296825.jpg\",
           \"content\": \"大概发酵三天，再尝尝味道，调整一下酸甜就好了，味道很赞\",
           \"orderNum\": 17,
           \"old_imgUrl\": \"https://i2.chuimg.com/fc780be0ef1c4229ad6eddc092753399_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"白菜\",
           \"ylUnit\": \"2颗\"
         },
         {
           \"ylName\": \"白萝卜\",
           \"ylUnit\": \"1颗\"
         },
         {
           \"ylName\": \"苹果\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"梨\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"20瓣\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"15片\"
         },
         {
           \"ylName\": \"辣椒粉\",
           \"ylUnit\": \"20勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"50-60克\"
         },
         {
           \"ylName\": \"糯米粉\",
           \"ylUnit\": \"150克\"
         },
         {
           \"ylName\": \"韭菜\",
           \"ylUnit\": \"300克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"白醋\",
           \"ylUnit\": \"半瓶\"
         }
       ]', '[
         2,
         6,
         8,
         24,
         68,
         171
       ]'),
       (61, '清炒白菜苔', 'http://static1.showapi.com/app2/img/caipu/20210220/3ffe493a-b529-4956-8196-ede775fcf33e.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210220/c59f9f85-feb4-4d5b-a89f-94efea551c81.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/b6174dd3-7691-4e92-bc75-f29a48a51cac.jpg\",
           \"content\": \"白菜苔摘成小段，用清水洗净，沥干水份，大蒜切片备用(不喜欢可以不放)。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/354521cc55574f34be6668acd6844c1d_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/400f3361-ad8e-4969-9b9d-d3e2c0d814a2.jpg\",
           \"content\": \"先热锅在倒入适量的油，放入蒜片爆香。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/70b6e34838be4b258d5bd7a7d23f2bdd_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/e7f85d9f-22de-40f5-91a6-efb41e3a887d.jpg\",
           \"content\": \"在把白菜苔倒入锅内，要用大火，这样炒出来的青菜才好吃。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/947c74cd92624bc8b6da4e6f0ec47cb5_878w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/f82cf403-6fba-4be0-ad7d-dfbf6d1d69d3.jpg\",
           \"content\": \"等白菜苔变色后，加入少许盐调味，清炒白菜苔就做好了。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/33deba9df62c4f15abec30d8584bc2db_684w_787h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/5498f946-412e-476d-9d53-d5af8a730c35.jpg\",
           \"content\": \"简单美味的白菜苔就做好了。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/f769961714074019a28f7a28f89b9993_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"白菜苔\",
           \"ylUnit\": \"350克\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"2瓣\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         4,
         6,
         70,
         171
       ]'),
       (62, '凉拌韭菜豆芽粉丝', 'http://static1.showapi.com/app2/img/caipu/20210223/d1221d8c-fade-4331-9d58-ebf1aeae95af.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/6b06ed85-711b-4775-8121-1f29fb223538.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d92ad769-b63e-4bb0-879c-9167a7a2ff61.jpg\",
           \"content\": \"韭菜洗干净。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/4940a108cee44c39b1f92c7a347e32f1_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/419711ee-a339-4a98-877f-10c0cbb0c9a5.jpg\",
           \"content\": \"绿豆芽摘去根部。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/27429011314a46c6997fee069454e1fc_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d8a29e98-8e7a-417c-a5f5-788b0f09f85e.jpg\",
           \"content\": \"粉丝用清水泡软。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/f7b7cfbaa93c453aa877a198c5cda0c9_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5873c5cd-fcae-40cc-9028-49a72416d6cb.jpg\",
           \"content\": \"烧开水。分别把韭菜豆芽粉丝绰水，放凉备用。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/ccce5f03a207443697a95226ee246cd3_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/8df4eaa2-26a1-444f-83c7-6b4dc301ef26.jpg\",
           \"content\": \"调万能蘸酱：蒜末\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/e0ed574a8f12491b9f2ac75c2ce0eb70_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/758fec35-f950-4c4a-8dd9-27c633269e9c.jpg\",
           \"content\": \"辣椒面\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/b5564fb506f54c12aeabce4c12189d40_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/14f1bfef-e2d1-425a-b750-559da6c7a7d6.jpg\",
           \"content\": \"熟芝麻\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/9303205411da443d9a4ccbcf899f491a_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/1f4e2daa-102f-41ad-bc63-6221c4f20f26.jpg\",
           \"content\": \"滋入热油！\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/39063b7a494c4f2caf54d2c044c4bab3_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/00c9fb8e-e869-4ff4-828a-e0c593b0db32.jpg\",
           \"content\": \"1勺生抽1勺蚝油1勺陈醋，1小勺白糖。\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/f5981556785240c78b05b775c80b41a4_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/59a04dd9-0653-4656-8379-87d870e695ee.jpg\",
           \"content\": \"搅拌均匀。\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/0121f1522643419eab94682ecb5f053d_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5b1fc633-c318-4622-9b3c-6f3d9462bca7.jpg\",
           \"content\": \"韭菜切段。大伙们放在一起拌匀即可。\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/f11e11a671a14d98b75953a6e268864c_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/bc8cdf19-c409-47c7-9c68-b358ac701398.jpg\",
           \"content\": \"YUMMYyummy\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/7faafbdf811648028dc14bb9940fbf56_1080w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"韭菜\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"豆芽\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"粉丝\",
           \"ylUnit\": \"2把\"
         },
         {
           \"ylName\": \"凉拌酱汁\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"蒜末辣椒面熟芝麻\",
           \"ylUnit\": \"各半勺\"
         },
         {
           \"ylName\": \"热油\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"陈醋\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"5克\"
         }
       ]', '[
         2,
         6,
         71,
         75,
         171
       ]'),
       (63, '绿油油的韭菜炒鸡蛋', 'http://static1.showapi.com/app2/img/caipu/20210222/1442e93d-d628-4788-b558-6ba8393f61d0.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/a5f3e9af-24cf-49b8-9247-5b0c9261348c.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/8c2a34b5-1289-4bda-b163-1c0350f659b6.jpg\",
           \"content\": \"韭菜整理清洗干净，切成小段装盘待用\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/11bd6328fcee4be9863309ceeaf833c7_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/f0fc0477-fcfc-4273-80d7-bb403a3dacd5.jpg\",
           \"content\": \"三个鸡蛋打入碗中，充分搅拌，然后倒入热锅热油中翻炒，鸡蛋炒好后迅速盛出装盘\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/6e52a66692204b5e9578244f007a705b_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/89cf3262-8fda-489a-8a32-f819e278c36e.jpg\",
           \"content\": \"接着炒锅中放油翻炒韭菜\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/e7bf4e3e9d414208b92904c03e1d4778_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/e009a29b-71e8-4d4a-8915-05dce52544cb.jpg\",
           \"content\": \"韭菜5成熟，下鸡蛋一起翻炒，然后迅速出锅，无需加入任何佐料\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/4f8a1351835c4bc3b1422d119ff176a0_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"韭菜\",
           \"ylUnit\": \"300克左右\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"白胡椒粉\",
           \"ylUnit\": \"一丢丢\"
         }
       ]', '[
         2,
         4,
         6,
         70
       ]'),
       (64, '独家超好吃的金枪鱼馅低脂蛋饺（简单）',
        'http://static1.showapi.com/app2/img/caipu/20210223/34d7efa0-cac9-4228-b076-a3c322903906.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/dad8cf98-5058-4d0d-a45e-f026efe7462d.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/7ac4a343-20e2-46cd-a2e0-6f1665ccab0e.jpg\",
           \"content\": \"如图食材（煮熟的鹰嘴豆扒皮）\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/5b7a1e320efe4f3695ca70fc52bca9b0_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/2f436b55-e80e-4640-9c9a-416debd4ee65.jpg\",
           \"content\": \"鹰嘴豆勺子压泥，起粘稠作用，优质蛋白。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/2a970b7dc36c466f874b37d0c8490ede_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/70046cde-ac33-4ef5-8187-f75078bace30.jpg\",
           \"content\": \"1蛋液菠菜按喜好过滤撇沫2金枪鱼挤掉水分，勺压碎橄榄油煸炒洋葱或葱花（香）黑胡椒豆泥调味（宝宝吃可不加盐）\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/fbe139650fd54f69a05e7dc6c3fa46dd_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/0c9ee3c3-6fa5-4740-bb70-173bcda9516d.jpg\",
           \"content\": \"成品馅料能压实，可捏团\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/05815f64e6d241c897deb25e99cfc27a_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/b2e0c7be-5348-4ee8-9273-88dece430a21.jpg\",
           \"content\": \"新手可提前把馅分等份（摊蛋饺过程略，菜谱大把，按自己工具习惯）\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/23232a66b5a44200b39325ea2ef05b29_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/219738a2-edfc-4995-a88e-5ba63c0c6365.jpg\",
           \"content\": \"馅都是熟料，厚点皮多加馅，没过多调味，低脂低盐\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/2190cf8448a247edafb07718c30d4ae2_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/9e7066be-937c-4265-9c9c-8f9723963ee0.jpg\",
           \"content\": \"保存方法：摊开冷冻后收纳适合一周备餐，低卡高蛋白，煮面做汤蒸煮\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/92598fd7aff44b7fb7d855e0e26030e1_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"水浸金枪鱼\",
           \"ylUnit\": \"半罐\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少少许\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"3-4个\"
         },
         {
           \"ylName\": \"菠菜\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"黑胡椒粉\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"熟鹰嘴豆\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"橄榄油葱花\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         6,
         20,
         71,
         104,
         133,
         134,
         135,
         139,
         170,
         175
       ]'),
       (65, '蒜蓉菠菜', 'http://static1.showapi.com/app2/img/caipu/20210223/72cafd22-b45c-4da5-9eec-2912e1f08c3e.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/cf2077ee-d4cb-4945-a164-35b619df1680.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/a136fe1d-edd0-4e78-935e-4de4405752b5.jpg\",
           \"content\": \"菠菜切段备用\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/0f2b37c6ee2f4ff0959696598e5a8351_840w_1824h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/c3a48430-43c9-4a9a-ae3a-efa0f929ad43.jpg\",
           \"content\": \"烧一锅水，水开放菠菜焯水一分钟\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/4fea8e280c124d44987a70bd55b587b4_840w_1824h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d8642538-3794-4121-baa8-efd4af56b93c.jpg\",
           \"content\": \"蒜蓉约八瓣剁碎，蚝油一茶匙，盐2/1茶匙，油一汤匙，生抽一汤匙，调一个汁\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/a90303dc232142d2a0ffe58e488c08d1_1064w_2304h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/bf576cde-ad61-4ad2-b014-0633e451f063.jpg\",
           \"content\": \"把调好的汁浇到菠菜上就完成啦\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/2e95112151e24659ab05cf614a6384fc_1064w_2304h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"菠菜\",
           \"ylUnit\": \"把\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"八瓣\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"2/1查匙\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"一汤匙\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"一茶匙\"
         }
       ]', '[
         2,
         4,
         6,
         71,
         75,
         171
       ]'),
       (66, '红烧狮子头', 'http://static1.showapi.com/app2/img/caipu/20210223/cdd2994b-ec61-4891-b5d0-957f5fe5a273.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/033de5f0-d16f-4163-88ec-b6e8fa809264.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/80bd453f-c676-45a6-95cb-54dc89dfa63e.jpg\",
           \"content\": \"猪肉一块洗净(三肥七瘦的口感最好)剁成肉馅，也可以直接买现成的肉馅，不过个人喜欢自己剁的，干净卫生\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/311c7c03eabb465b825c7d5009a563ed_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d182bc10-234f-45d1-8ba3-d0f34f71d674.jpg\",
           \"content\": \"土豆一个，洗净去皮切成小粒(这个可以根据自己喜好来添加，可以加胡萝卜也可以加香菇或者木耳)\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/597f4513ba2742f8b815d456d108fa1c_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/cb06ee32-1c5a-4968-b28c-9c9a6efa9c66.jpg\",
           \"content\": \"生姜切小粒放水里泡着，一会儿用生姜水(只要姜水去肉腥味，不吃姜粒，以免肉圆里面嚼着口感辛辣)\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/c01200f9be4240f0ae311885d835c507_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/a27af8a5-5032-47e3-a494-9271e5ecd941.jpg\",
           \"content\": \"肉馅里面加入土豆粒，鸡蛋，淀粉，生姜水，生抽，一点点盐搅拌均匀即可\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/d1876561c99b49bebc97d28737cdf928_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/cec813d3-a799-4427-aeab-559e988572b0.jpg\",
           \"content\": \"搅拌均匀后静置一下，准备其他的配料\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/dd89dcaa591b4bc8877e3e0310dcbb29_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/7ed768fb-36e6-42c2-b4fc-701014c10d72.jpg\",
           \"content\": \"准备蒜粒，葱段，香料待用\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/c6c6d8afa94e49b9a604f2d1aeb40a93_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/da7f5534-607e-479a-baf1-a1a8e5924b93.jpg\",
           \"content\": \"准备一点西兰花盐水浸泡几分钟后，清水冲洗干净待用(一会儿吃完肉后解解腻）\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/3ad5944ab0914ac0a78b15dcecb74a80_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/c61a7560-0e33-49cb-aaf4-cfa60effe2ab.jpg\",
           \"content\": \"锅内下宽油，油熟后将肉馅捏成大小均匀的肉团，放油锅内炸香(肉馅刚刚下锅时不动它，等炸成型后再翻面继续炸至金黄)\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/600637567b5842e2895663d074b3deed_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/3782ba01-edef-4984-8a3e-4ef9f627f4ed.jpg\",
           \"content\": \"炸至金黄后捞出(忍不住偷吃了一个，这个时候的口感比较酥脆，比较香的那种，有点像吃炸酥肉的感觉)也可省略下面的步骤直接吃掉\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/2e69b311796b4e46b108acd8a77ff089_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/b19a8b73-227a-4e68-98dd-904e6e5f0059.jpg\",
           \"content\": \"锅内剩一点点油，放入蒜粒，葱段和香料小火炒香\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/5fb74ac0876b417fadf97a0b2150854a_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/9470e8d1-4ef3-4d62-a591-ba6c3ce547e3.jpg\",
           \"content\": \"加入生抽，老抽，蚝油，白糖，一点点醋一起小火炒香后加入开水熬一下汤\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/630c1a3b94ae49beb91e22e86ef06982_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/4f7fe3eb-b1ee-40ac-8e36-aa0d7dcc0e4e.jpg\",
           \"content\": \"加入炸好的狮子头下锅煮几分钟，让狮子头充分吸收浓郁汤汁，起锅前加一点点水淀粉收一下汁水\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/abe14fbf8b3a4fdc958ec0e226e5a1f7_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/454decb8-3533-4bd2-842c-5cbb6145a000.jpg\",
           \"content\": \"西兰花水煮一下放边上摆盘更加美观，另外一会儿吃完狮子头后解解油腻\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"https://i2.chuimg.com/b40ecd4bb169473b90ea3693235c4696_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/cb21b137-d72f-49ed-a617-66c907581328.jpg\",
           \"content\": \"来碗米饭，加点汤汁，妥妥的一碗米饭一个狮子头的节凑，超下饭\",
           \"orderNum\": 14,
           \"old_imgUrl\": \"https://i2.chuimg.com/8014716033584046b4f894117d5c1594_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/12503f7f-2318-412b-8727-ca36d2bb3e0f.jpg\",
           \"content\": \"外酥里嫩，口感不错，小朋友超喜欢\",
           \"orderNum\": 15,
           \"old_imgUrl\": \"https://i2.chuimg.com/8224759fbf3d4739b0a463acd64463f7_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"猪肉\",
           \"ylUnit\": \"一块\"
         },
         {
           \"ylName\": \"土豆\",
           \"ylUnit\": \"一个\"
         },
         {
           \"ylName\": \"西兰花\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"一个\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"一勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"一勺\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"一勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"一勺\"
         },
         {
           \"ylName\": \"香料\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"葱段\",
           \"ylUnit\": \"一根\"
         },
         {
           \"ylName\": \"姜水\",
           \"ylUnit\": \"一勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"一小勺\"
         },
         {
           \"ylName\": \"醋\",
           \"ylUnit\": \"一小勺\"
         }
       ]', '[
         2,
         4,
         6,
         67,
         70,
         71,
         170
       ]'),
       (68, '蔬菜鲜虾饼', 'http://static1.showapi.com/app2/img/caipu/20210223/f4e215dd-6c67-4a19-a3b0-f70348b86a99.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/921ada4d-884b-44ff-8b21-94105fe8eaa3.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/df26666b-65d0-4fd6-9dae-0e1764a11bc0.jpg\",
           \"content\": \"西兰花和胡萝卜焯水\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/a9092043789146ab8457d906800c2dfb_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/43d0fb14-778e-44e8-a6f4-74d5eef82d3e.jpg\",
           \"content\": \"虾仁淀粉胡萝卜和西兰花放拉蒜器拉成糊状\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/46006ef69eb646799ef87be78af5be38_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/91b927c0-eccf-43f1-a95f-3d376189e68c.jpg\",
           \"content\": \"最小火慢煎\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/5494d6a479ec40d2bc732fb47cfae303_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/eda816c3-1186-4e3c-8d39-a32a778f186f.jpg\",
           \"content\": \"味道不错\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/a3bd79250175450697dc9a56f93e6be2_1152w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"虾仁\",
           \"ylUnit\": \"10只\"
         },
         {
           \"ylName\": \"蛋清\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少量\"
         },
         {
           \"ylName\": \"食用油\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"西兰花\",
           \"ylUnit\": \"1朵\"
         },
         {
           \"ylName\": \"胡萝卜\",
           \"ylUnit\": \"1片\"
         }
       ]', '[
         2,
         6,
         9,
         20,
         71,
         73,
         103,
         175
       ]'),
       (69, '年后胖三斤解法 之 菜团子',
        'http://static1.showapi.com/app2/img/caipu/20210223/7cc068e2-e777-4b1f-a34e-5a6855b877d5.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/b07c175d-b051-46c5-8bb4-a359e89d2603.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/3e7618c7-98c2-4cdf-a4ad-230982cbc3b8.jpg\",
           \"content\": \"鸡蛋炒熟，其他蔬菜焯水断生切碎（我没有切的很碎，我喜欢能吃出颗粒感的，加入调味料搅拌一下\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/16d2ede74a4243f5b5c5b0b13a1fb878_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5cfd4108-b3d2-4aa4-b4a0-650597e18828.jpg\",
           \"content\": \"加入一勺面粉或棒子面搅拌一下，这样可以增加粘合力，蔬菜比较好报团儿\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/79fdbd314bb749218d9a986f5b0b6a31_864w_1152h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/1d63f677-6783-4d62-95d4-dbe60ed84a83.jpg\",
           \"content\": \"用手把蔬菜捏成团儿\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/04620d132e8d4925a12471aba9bdc371_1152w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/f2cdab99-b420-42b8-849a-c12941e09aa1.jpg\",
           \"content\": \"把菜团儿在棒子面里滚一下\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/95619693e3c3444a87f31175a0bdc096_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/7c6993c0-7e60-48fc-a04d-2c4e69dc94cb.jpg\",
           \"content\": \"捏实，再滚一圈儿，表皮儿的薄厚取决滚几圈棒子面\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/2ea33ce5992343479de85f87c63f8c51_1152w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/1db1529f-f9d2-4a93-a064-6d72940b660c.jpg\",
           \"content\": \"我们是为了多吃点儿菜，所以只滚了两圈儿，外皮儿会比较薄。开火上汽蒸10分钟即可。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/6aa7cee24a314185845a36caad24f3ce_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/6a620549-17d2-4589-9046-1e86878001ed.jpg\",
           \"content\": \"薄薄的外皮儿，满满的菜馅儿，沾上蒜汁儿，满足\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/fa91a4cdd6c1441587179b426d524cf7_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/0e0f9d1a-6a6b-4724-ad2c-8ff5bff28daa.jpg\",
           \"content\": \"配上凉拌藕片，虾皮紫菜萝卜汤，妥妥的减脂餐搞定\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/0788458abf2e4055a95f95464cec13f2_817w_817h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"玉米面\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"一大勺\"
         },
         {
           \"ylName\": \"胡萝卜\",
           \"ylUnit\": \"半根\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"木耳\",
           \"ylUnit\": \"5、6朵\"
         },
         {
           \"ylName\": \"西兰花\",
           \"ylUnit\": \"小半个\"
         },
         {
           \"ylName\": \"香菇\",
           \"ylUnit\": \"5、6朵\"
         },
         {
           \"ylName\": \"虾皮\",
           \"ylUnit\": \"一小把\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"耗油\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"五香粉\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"鸡精\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         70,
         71,
         72,
         133,
         134,
         171
       ]'),
       (71, '素什锦', 'http://static1.showapi.com/app2/img/caipu/20210223/139bae98-5be9-4241-bd1c-a92be309028a.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/cf3127bc-bfa2-4f78-bb8e-ee771b2b9bba.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/60c09d6c-b054-42fc-abe7-64228039bec0.jpg\",
           \"content\": \"花生米浸泡3个小时后上锅煮熟。木耳泡发后焯水，煮熟，捞出后冷水里过凉，控干水分。藕去皮切薄片，然后焯水，一定不要煮时间长了，断生即可，捞出过凉，控干水分。西兰花、跟菜花切小块，同上操作。芹菜切丁，也是一样的焯水断生。胡萝卜切薄片，然后上锅炒熟。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/6b560ff8f134461aab2f4ce57772df24_4096w_2731h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/8eed5256-0d3b-4a6a-92d9-5489e79ae46e.jpg\",
           \"content\": \"控干水分后，加入适量盐。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/73a0deff05ac458fb2242c858e1f54cd_4096w_3451h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/fbddb412-2013-4664-b777-f056a79eeb84.jpg\",
           \"content\": \"加入适量香油。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/8407b4a035b34fec8df8019323acea7e_4096w_2731h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/67121370-2ca4-4384-9540-e8c4a0f496a7.jpg\",
           \"content\": \"加适量花椒油。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/0111245a000b4366b784d5c976d4407d_4096w_2731h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/96574865-6862-423c-81a2-9dd78bc6e9fd.jpg\",
           \"content\": \"加入适量鸡精。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/6ab75f538c144c9291ad4938c6d40c5a_4096w_3062h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/2324e4b7-f4cf-4f4b-bfef-ab081021fce0.jpg\",
           \"content\": \"搅拌均匀，装盘即可食用。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/9159ad280f6b4cb9aa5cfb917adf0619_3974w_3456h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"木耳\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"菜花\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"西兰花\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"花生米\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"胡萝卜\",
           \"ylUnit\": \"半根\"
         },
         {
           \"ylName\": \"芹菜\",
           \"ylUnit\": \"1根\"
         },
         {
           \"ylName\": \"藕\",
           \"ylUnit\": \"半节\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"鸡精\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"花椒油\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         70,
         71,
         171
       ]'),
       (72, '扁豆焖面-爱如斯IZEROS',
        'http://static1.showapi.com/app2/img/caipu/20210223/6e0d5cfb-2f7d-4426-aa28-5ebe835b7561.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/2ffda332-75a0-4224-92a9-c0db7fc56013.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/77df7b8e-3b72-42e1-8854-ea9c849af964.jpg\",
           \"content\": \"芸豆清洗切断备用。猪肉洗净备用\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/cbf2366f-f6a8-4b9b-9670-3e1b9dd9eeae.jpg\",
           \"content\": \"使用搅拌钩，将30克油和葱蒜适量一起放入主锅,以【5分105度度L】启动。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d1713315-422f-4ff0-9d0c-4a08c05223ff.jpg\",
           \"content\": \"还剩3分钟加肉片，最后1分钟加入豆角炒制结束\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/6589c9c9-7cd4-4b17-ad70-82b8c4031a26.jpg\",
           \"content\": \"加入糖、盐、生抽、老抽和水,按一键加热键将水煮开。（或者可以设置【10分钟100度】将水煮开。）\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/198c82db-102a-4027-bfa2-0181e97044c0.jpg\",
           \"content\": \"铺上新鲜面条，以【12分/100度】按加热健启动烹煮,即可享用。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/2744339b-45e1-4298-853d-7f98fb62249b.jpg\",
           \"content\": \"拌匀即可享用。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d13498ec-aa3f-40a5-ad14-5e625cb7d191.jpg\",
           \"content\": \"实在是太好吃了\",
           \"orderNum\": 7
         }
       ]', '[
         {
           \"ylName\": \"扁芸豆\",
           \"ylUnit\": \"400克\"
         },
         {
           \"ylName\": \"瘦肉片\",
           \"ylUnit\": \"300克\"
         },
         {
           \"ylName\": \"面条\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"1000克\"
         },
         {
           \"ylName\": \"酱油\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         1,
         6,
         71,
         101,
         174,
         171,
         170
       ]'),
       (73, '家常肉末扁豆丝', 'http://static1.showapi.com/app2/img/caipu/20210223/785c55d4-13c4-4cc6-8c34-45dabc2982a2.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/b372bdbe-510c-4f72-b468-ff2decbb8e03.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/71b300bb-fc76-4f24-8d55-2559f1a6516d.jpg\",
           \"content\": \"将扁豆切成丝\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/be6ffb23-916d-4a0e-bc25-afe92aa0f48c.jpg\",
           \"content\": \"锅中倒油，油热后放入蒜末，炒香后加入肉末，炒至肉末发白\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/8184fabb-4603-457a-a248-3d121ecb09df.jpg\",
           \"content\": \"倒入扁豆丝，等扁豆丝炒软些加入盐，酱油，生抽，糖，黄豆酱，翻炒两三分钟即可出锅啦\",
           \"orderNum\": 3
         }
       ]', '[
         {
           \"ylName\": \"扁豆\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"肉末\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"酱油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"5瓣\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"瓣\"
         },
         {
           \"ylName\": \"黄豆酱\",
           \"ylUnit\": \"1勺\"
         }
       ]', '[
         2,
         4,
         6,
         70,
         170,
         171
       ]'),
       (74, '健康烧烤', 'http://static1.showapi.com/app2/img/caipu/20210223/84651f36-7d30-49d6-b364-4ce8c80f95b3.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/9856990a-a94b-4f1d-97c6-cba62a0e3136.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d4ad62df-eaf0-43dc-a532-68896461e22b.jpg\",
           \"content\": \"鸡腿肉去皮切块腌制：生抽1勺，黑椒汁1勺，蚝油1勺，玉米淀粉1勺，黑胡椒少许\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5ebc35f7-60a9-49c6-8553-b259af617a72.jpg\",
           \"content\": \"腌制半小时\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/1632560e-4756-4c58-a9c8-853eb3b92edd.jpg\",
           \"content\": \"青菜切块，西兰花口蘑焯一下\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d72898a8-bf51-466b-babf-dc21070cfbf9.jpg\",
           \"content\": \"鸡肉腌制好后，和玉米，西兰花，口蘑抓匀\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/b006ac8b-7f13-4040-a0f2-f6b79730836e.jpg\",
           \"content\": \"放入烤盆，摆上圣女果\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/ce03f487-6e26-4143-9635-a4a56f90cc35.jpg\",
           \"content\": \"180度中层上下火烤箱先五分钟预热，然后再烤35分钟\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/9b5f93b7-7214-4588-bdef-00b2899822aa.jpg\",
           \"content\": \"出锅，我比较喜欢孜然的味道，加了些孜然\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/ad01991d-1e20-4ba4-a05c-7bcd9d451d31.jpg\",
           \"content\": \"开吃\",
           \"orderNum\": 8
         }
       ]', '[
         {
           \"ylName\": \"孜然粉\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"西兰花\",
           \"ylUnit\": \"随意\"
         },
         {
           \"ylName\": \"玉米\",
           \"ylUnit\": \"半根\"
         },
         {
           \"ylName\": \"鸡腿肉\",
           \"ylUnit\": \"1只\"
         },
         {
           \"ylName\": \"口蘑\",
           \"ylUnit\": \"5个\"
         },
         {
           \"ylName\": \"黑椒汁\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"玉米淀粉\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"圣女果\",
           \"ylUnit\": \"10个\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         6,
         68,
         71,
         74,
         133,
         136,
         171,
         170
       ]'),
       (75, '藤椒番茄龙利鱼', 'http://static1.showapi.com/app2/img/caipu/20210223/23dc3e2e-1f84-40dc-a278-426f6c86e7b3.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/fd22c0bf-0e14-453c-b25e-b5503af404c0.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/49304ed2-4f93-4799-95ae-98621162fee2.jpg\",
           \"content\": \"倒入适量金龙鱼藤椒油\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5ac841ba-ad4b-47cf-9020-b62b50c15404.jpg\",
           \"content\": \"加入蒜头煎至金黄\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/06306e8a-f817-4288-8d16-501dc495d988.jpg\",
           \"content\": \"解冻好的龙利鱼用厨房纸拭去多余水分后放入锅中，煎至双面焦黄\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/cca2938f-c28d-4429-805d-0c647a6fdd6d.jpg\",
           \"content\": \"加入圣女果，当果皮起皱的时候用锅铲把圣女果压开，加少许热水，盖上锅盖，将番茄味充分熬出\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/1ff1f10e-2eb2-4e87-a82b-23b36ede8b23.jpg\",
           \"content\": \"出锅前加少许盐和黑胡椒调味即可\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"龙利鱼\",
           \"ylUnit\": \"1条\"
         },
         {
           \"ylName\": \"圣女果\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"蒜头\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"金龙鱼藤椒油\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         73,
         175,
         171
       ]'),
       (76, '低糖减脂｜咸味南瓜罗勒夹馅吐司',
        'http://static1.showapi.com/app2/img/caipu/20210223/7d0d6136-f18b-4a45-85d7-18717ed26a59.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/dea6f8ae-2109-483d-a006-1ef8dac03f8b.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/80973a0c-635e-4356-a227-845ca40748eb.jpg\",
           \"content\": \"外观\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/f4469dd146f94f7eb8e106a8fee3a9b2_2568w_1926h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/cf3ef31e-cd3c-49f4-897f-77bb25dcf809.jpg\",
           \"content\": \"切面，组织细腻\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/ad9d9988cda741c585d0a3f756707c25_3998w_2999h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/a8efee4c-5f3a-4472-bf8f-5828898f3115.jpg\",
           \"content\": \"所需所有材料以及设备\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/61ce8808e690480caaa9b45dc9a701fe_2966w_2224h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/3b20dbf6-d0d7-4d19-89e2-57b980f5ac44.jpg\",
           \"content\": \"提前制作液种：液种所有材料混合至无粉，冰箱冷藏4-6度发酵17-24小时，或室温25度发酵3小时\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/d41002b5a1de46b6906becbd0a6358fc_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/fc66c8be-9e69-4fa7-b480-83b157300f61.jpg\",
           \"content\": \"贝贝南瓜蒸熟碾碎，过筛一遍（不要偷懒，不然面包组织不好）\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/32fc13ae1cdb425d8dfa76fcd9cfcef8_3342w_2672h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/0de4ef65-0c4c-4eb5-88ca-9820ba7c5105.jpg\",
           \"content\": \"留70g南瓜泥揉进主面团，剩下的加入少许盐，牛奶和罗勒做馅料，搅拌均匀备用\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/2d03b2aa66f345d1a5627e683848644a_3750w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/29ffa7dc-953f-4494-b8ed-25379622b41a.jpg\",
           \"content\": \"混合液种主面团材料（盐和黄油除外）搅打至初步扩展\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/9595ea4cd6a441a6ac573675038e3f13_3750w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/30986389-48ca-4e4a-bba9-889c3aa6a43d.jpg\",
           \"content\": \"加入盐和黄油，揉至完全扩展\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/68680c7f9d054e27a17642ec317f0f69_3750w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/df0bcf91-c61b-4867-88d3-548c8cd6e0da.jpg\",
           \"content\": \"面团揉光滑放入发盒中进行延续发，温度28，湿度75，发30分钟左，发\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/15359029069c49b99501213ba4667add_3750w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/b2c6e4a5-1ee4-4bc5-a5ff-a40c8cfe5794.jpg\",
           \"content\": \"擀开排气，用自己喜欢的方式把面团折成方形，然后用保鲜膜盖好松弛20分钟\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/596f74b6105a49bd9aec182bf32d7a7c_3781w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/82a87f5c-404b-4f2c-9815-c5e8b443b7e1.jpg\",
           \"content\": \"松弛完毕，再次擀开成约20*40cm，下半部分抹上南瓜馅\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/cd8ea8c53aad49b4b65c686d517d937b_3750w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/606c7912-f997-470f-9c03-eef24644e3ca.jpg\",
           \"content\": \"上下对折，切成8份\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/aba40c0312d64df0bd7e0553089f457b_3750w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/9070f5bc-ef1d-4206-8094-26300536c8ec.jpg\",
           \"content\": \"每一条都扭起来，首尾相接\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"https://i2.chuimg.com/2be95b08e1984caa8b61517fda9fd6d9_3781w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/cc1cfbd8-8c75-4e00-9b87-289b3ccbc3de.jpg\",
           \"content\": \"竖起来排成一排，放入吐司盒中进行最终发酵，最终发酵温度33，湿度80，发酵的同时预热烤箱上下火200度\",
           \"orderNum\": 14,
           \"old_imgUrl\": \"https://i2.chuimg.com/dac66aa277c14c2ba1dd0365bc1a549c_3750w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/adcc945d-e551-488e-a5f2-5806b63ab23e.jpg\",
           \"content\": \"发酵至9分满，放入烤箱下层烘烤\",
           \"orderNum\": 15,
           \"old_imgUrl\": \"https://i2.chuimg.com/21d15e3f860f42d89f60f94cc1afa28c_3781w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/494222d7-e115-48cc-8ac9-87878c7be409.jpg\",
           \"content\": \"烤箱初始温度200，入炉后立刻调成175度，烤30分钟，中途盖锡纸防止上色过深\",
           \"orderNum\": 16,
           \"old_imgUrl\": \"https://i2.chuimg.com/9376acf859fa4d2ea59512f90f188a36_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/a11f38bc-d0f7-4463-8492-633faf4db856.jpg\",
           \"content\": \"新鲜出炉\",
           \"orderNum\": 17,
           \"old_imgUrl\": \"https://i2.chuimg.com/dd270ef26781496a922b929aec08fbb9_2003w_1602h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/32f79d49-aec7-42a7-810a-590866d6cc73.jpg\",
           \"content\": \"健康，低糖低脂的主食咸吐司\",
           \"orderNum\": 18,
           \"old_imgUrl\": \"https://i2.chuimg.com/9d965ea38804494590a19817a2b0383d_2305w_1730h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"液种部分\",
           \"ylUnit\": \"：\"
         },
         {
           \"ylName\": \"高筋面粉\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"全蛋液\",
           \"ylUnit\": \"35克\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"80克\"
         },
         {
           \"ylName\": \"糖粉\",
           \"ylUnit\": \"2克\"
         },
         {
           \"ylName\": \"酵母粉\",
           \"ylUnit\": \"1.2克\"
         },
         {
           \"ylName\": \"主面团部分\",
           \"ylUnit\": \"：\"
         },
         {
           \"ylName\": \"高筋面粉\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"酵母粉\",
           \"ylUnit\": \"2克\"
         },
         {
           \"ylName\": \"贝贝南瓜泥\",
           \"ylUnit\": \"70克\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"糖粉\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"奶粉\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"黄油\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"南瓜夹馅\",
           \"ylUnit\": \"：\"
         },
         {
           \"ylName\": \"贝贝南瓜泥\",
           \"ylUnit\": \"110克\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"2克\"
         },
         {
           \"ylName\": \"罗勒碎\",
           \"ylUnit\": \"1克\"
         }
       ]', '[
         3,
         6,
         74,
         174,
         133,
         134,
         137
       ]'),
       (77, '苹果烤鸡', 'http://static1.showapi.com/app2/img/caipu/20210223/7318bb1c-fad9-4b5d-839c-e0023cdaa8c4.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/1d45e88b-7225-4a7c-b8d3-43f76f681403.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/b0f6b952-4759-4d6c-997c-7fef583fe0c8.jpg\",
           \"content\": \"腌鸡汁：800Ml水盐1勺八角1勺花椒1勺香叶5片\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/3d39790c24f0400aa331fa3099640b42_1242w_1656h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/4430784b-0972-4c6c-a999-8153b35a1fd4.jpg\",
           \"content\": \"把鸡放腌鸡汁里面腌2小时\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/851298bc148d4499a3a72afdcf7a7913_1242w_1656h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/c5ebbb13-06a6-4cc9-acce-6b9310e8991f.jpg\",
           \"content\": \"调烧鸡酱汁2勺生抽1勺老抽2勺料酒2勺蚝油2勺蜂蜜1勺盐1勺五香粉1勺白胡椒1勺黑胡椒\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/7ae80f7583434f8383c9dcc714c59deb_1242w_1656h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/06a9de75-bd53-4e30-b4bc-1c0e34ffba2c.jpg\",
           \"content\": \"把酱汁涂抹在鸡上，用保鲜袋包好，放冰箱腌制一夜\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/9b6e605e96f245f8a3687daef82dab62_1242w_1656h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/9e91528e-e3d4-4895-8809-5f57186a5164.jpg\",
           \"content\": \"把苹果切块，塞到鸡肚子里，用牙签固定好\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/c69049411a85496fbe8856cf785c5a7d_1242w_1240h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/6ac5336f-6b61-414d-b73c-c98018581238.jpg\",
           \"content\": \"放蒸锅里，蒸七分钟\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/83cb6dcaf5b6415db357dfb844694878_1242w_1656h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/a19be01a-5b81-4eaa-8c3e-59c16619d413.jpg\",
           \"content\": \"用吹风机把鸡表皮水分吹干\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/815012e2b1904937988e6065b119c065_2048w_1536h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/841c8fa9-26eb-40a2-8688-eafe95b0b66e.jpg\",
           \"content\": \"黄油隔水加热融化，加入蜂蜜，比例1:1\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/8633818bc74e4135898511c0a5ae4af2_1242w_1656h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/ba583b6d-efa8-451c-b1b6-14b7aafcfdf9.jpg\",
           \"content\": \"刷上一层蜂蜜黄油的酱汁\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/23a73da166674285ad65526e236a10dc_2048w_1536h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/382f2582-e84d-4a17-85e4-0116de5d746b.jpg\",
           \"content\": \"把鸡腿部分和鸡翅尖用锡纸包好，防止烤焦，烤箱180度20分钟，中途刷一层黄油液\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/db4751fa152f4df68a4019de3a30ef8d_1656w_1242h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/ea0d7a32-280f-4423-9933-ad585d62c220.jpg\",
           \"content\": \"蔬菜可以放自己喜欢的，（我放了小番茄，玉米，南瓜，加入少许盐，黑胡椒，橄榄油腌制\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/64c4f87795be43f990a1dc0ad8c33ca0_1242w_1656h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/2f8bec45-d7e8-4662-a1ae-caf470c47868.jpg\",
           \"content\": \"20分钟后，加入腌制好的蔬菜，180的再考20分钟\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/8732d7d6298c4cc68f48b88cc7018541_2048w_1536h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/342be5d9-6081-4bcc-8ccb-2afb2cb1c59d.jpg\",
           \"content\": \"考好之后，蔬菜也很好吃\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"https://i2.chuimg.com/1eaea6e5115043d3b9d3118772f61e0f_2048w_1536h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"贝贝南瓜\",
           \"ylUnit\": \"半个\"
         },
         {
           \"ylName\": \"苹果\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"小番茄\",
           \"ylUnit\": \"6\"
         },
         {
           \"ylName\": \"玉米\",
           \"ylUnit\": \"半根\"
         },
         {
           \"ylName\": \"鸡\",
           \"ylUnit\": \"1只\"
         },
         {
           \"ylName\": \"黄油\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"蜂蜜\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"五香粉\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"白胡椒\",
           \"ylUnit\": \"1勺\"
         }
       ]', '[
         2,
         23,
         74,
         170,
         171,
         173
       ]'),
       (78, '超简易金汤花胶鸡', 'http://static1.showapi.com/app2/img/caipu/20210223/d7a73238-5796-4c7e-8654-57bbe214ad5f.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/777e3b65-6e2b-49ac-b794-170a07a773f7.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/4e9a018f-02a9-477b-8b8a-4297d09875ec.jpg\",
           \"content\": \"南瓜去芯切块，放入锅中蒸二十分钟直至软透。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/e488f9c5ac0f4283ae5fa1f2a675a493_1152w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/a355e92c-618d-4140-bb6c-bd0bd8c4ed2b.jpg\",
           \"content\": \"把蒸软的南瓜放入搅拌机/料理机，加入半碗凉开水，打碎。（大概五秒就OK了）\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/cc12e41cdac649dc909531ebf3da3675_1024w_768h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5fbf060f-2c27-4e38-b3bb-e14a679043b8.jpg\",
           \"content\": \"南瓜汤做出来的效果，喜欢南瓜味的就多放点，想鸡汤味更浓郁可以只放半碗。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/93aa820e5b174d009c1af52674dc8f21_1152w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/452fec25-f1a3-4b7e-842a-7cb115e6dfdf.jpg\",
           \"content\": \"半只鸡洗净，冷水下锅焯水，沸腾后捞出，用自来水冲走浮沫。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/10611d3e776d415ea3adbe4dfe5b3049_1024w_768h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/7932ba5e-c55f-4d89-bb41-4b7e1913d2d1.jpg\",
           \"content\": \"砂锅中加入五块姜片，五颗去核红枣，半只鸡以及适量开水，加入提前泡发的花胶，大火烧开后转小火炖煮15分钟。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/992d7b4531e94fa7ab3c20864a09e0f9_1024w_768h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/1e2447d6-f107-4f58-9513-1575d04cfd15.jpg\",
           \"content\": \"加入南瓜汤，均匀，烧开后小火炖煮20分钟（分钟，防止粘锅）。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/ff5bf504f3614b0fb1a2c7969b3b42e7_1152w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/aa9c445f-1366-4e2f-8998-8bed8bfb88f5.jpg\",
           \"content\": \"加适量盐即可食用。鸡汤本身的鲜美\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/5dc67c24aa0848429ff2bdbc8cc417ed_768w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"花胶\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"鸡\",
           \"ylUnit\": \"半只\"
         },
         {
           \"ylName\": \"南瓜\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"红枣\",
           \"ylUnit\": \"5颗\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"5片\"
         }
       ]', '[
         2,
         6,
         20,
         72,
         71,
         99,
         170,
         200
       ]'),
       (79, '咖喱味儿玉米饼干', 'http://static1.showapi.com/app2/img/caipu/20210222/69298d90-9bef-4541-864c-550304811c96.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/e4293bdd-7ab0-4f4a-9d8f-ae1d711db0fc.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/9b10a008-5d5e-4e8d-81aa-bb56c11f6069.jpg\",
           \"content\": \"用的百梦多原味，25克就是四分之一咖喱块放烤箱/锅里充分软化（不然咸味会不均匀）\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c7475247-555e-437e-bc30-c6211268f35d.jpg\",
           \"content\": \"加椰浆加鸡蛋加玉米粉搅拌均匀然后加泡打粉再次搅匀（大概图里的浓稠度粗粮类的零食就尽量别做太实，本来就干，烤完会更干，调的稍湿一点儿，再加上泡打粉进烤箱后会蓬松，口感会好一些）\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/b098bf5c-d5b4-4739-8f8b-7aea95c19266.jpg\",
           \"content\": \"用刮刀铲进裱花袋，挤成条状/任意喜欢的形状（这些黏黏的少油零食，用裱花袋会很好处理，就用不着洗手洗到炸毛了…）\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c5b52ae8-f7af-45e5-979b-092a0fccd895.jpg\",
           \"content\": \"烤箱190C烤箱，180C拧10-12分钟（烤箱下火，用的上火185下火165）\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/3aa7b06c-2fcf-47a6-abb7-cc6db71d8a5b.jpg\",
           \"content\": \"稍微晾凉就可以吃啦一定要晾凉，不然吃着就太像软玉米饼子了因为有鸡蛋所以口感是酥且蓬松的，避免了一边吃着粗粗的玉米面一边怀疑自己为啥要吃这东西的生无可恋情绪…\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/09dc0dc0-0625-4ddb-895a-af7135c6babb.jpg\",
           \"content\": \"留念：论厨房放根笔的重要性……不然我这个小机灵鬼也不至于掰块儿巧克力记方子了（…呵）\",
           \"orderNum\": 6
         }
       ]', '[
         {
           \"ylName\": \"玉米面\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"咖喱块\",
           \"ylUnit\": \"25克\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"45克\"
         },
         {
           \"ylName\": \"椰浆\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"泡打粉\",
           \"ylUnit\": \"1-2克\"
         }
       ]', '[
         3,
         6,
         23,
         74,
         174
       ]'),
       (80, '蛋卷机做玉米全麦脆饼', 'http://static1.showapi.com/app2/img/caipu/20210221/70baf804-fdb3-4d97-bd63-7f9e3b59ffaa.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/3aceeb3a-aa3b-444d-a712-2fa1bc5b30d7.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/55d029d6-9703-45cf-a5b9-def0c9c3fe83.jpg\",
           \"content\": \"玉米面加热水搅拌均匀后加入面粉和牛奶，调成糊糊状，和蛋卷华夫饼类的面糊的状态比较像我本来想做华夫饼，但是突然想试试蛋卷机做出来什么味道。室温发酵两小时至体积明显变大或者低温发酵1夜不发酵的我也试过，好像没啥区别。加入葡萄干，去子红枣搅拌均匀\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/36b54302-b470-4947-bf6e-4845f2e679b4.jpg\",
           \"content\": \"取适量在中央，像蛋卷一样加热\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/e259d21d-7f3e-435e-b86d-f17494f62888.jpg\",
           \"content\": \"加热至两边都有点焦黄\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/a0c9e911-3246-44e4-8627-d7fdcefe2850.jpg\",
           \"content\": \"最好现吃现做，软了就是普通玉米饼\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/248cbfd7-7e8c-4722-8842-f99c315110cf.jpg\",
           \"content\": \"刚出锅的时候脆脆的最好吃。加葡萄干红枣是不想加糖，如果只想吃脆饼子可以不加。玉米饼很有饱腹感，低卡健康又好吃。\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"玉米面\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"看状态\"
         },
         {
           \"ylName\": \"全麦面粉\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"根据喜好\"
         },
         {
           \"ylName\": \"开水\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"葡萄干红枣\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"酵母\",
           \"ylUnit\": \"2克\"
         }
       ]', '[
         1,
         7,
         9,
         103,
         133,
         134,
         136,
         171,
         174,
         202
       ]'),
       (81, '家庭版黄金玉米烙', 'http://static1.showapi.com/app2/img/caipu/20210221/a6a823d7-9305-430d-a75f-0a4498a9358d.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/36b63f3a-5881-4c21-85b1-f3e38cbf031b.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/c1f4a767-7cbd-4d83-b188-bd4db337e7ce.jpg\",
           \"content\": \"我用的是冰冻玉米粒，有罐装玉米粒更好，因为罐装玉米粒比较甜。玉米粒先解冻，保留一点水分。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/b0eb8c0b-3531-42a5-a040-fbb8ad42563b.jpg\",
           \"content\": \"放入玉米淀粉和糯米粉\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/e3f15a7b-1d2d-427b-adcf-6f08a09d327a.jpg\",
           \"content\": \"搅拌均匀，可以适当加一点点水，让玉米粒和粉更好融合\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/d75884d9-cf5d-47fa-b3f2-64f19497b53d.jpg\",
           \"content\": \"锅里倒入一些油，刚开始不用太多，一层即可。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/ee99d102-04bd-4146-ad24-e816437204e6.jpg\",
           \"content\": \"倒入玉米粒，用铲子把玉米粒摊平，然后再倒入油，尽量让油没过玉米。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/3e587471-2c49-4953-b9d1-9f7a91de879d.jpg\",
           \"content\": \"开小火慢慢炸，等玉米表面的粉炸至透明。不用翻面，以免散掉。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/08700cd2-7f2a-4e6b-be69-0ed975e52c47.jpg\",
           \"content\": \"炸好以后倒出多余的油，放一张厨房纸在砧板上，缓慢倒出玉米烙。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/162b58cc-475d-4d1a-80f5-27c1d153393f.jpg\",
           \"content\": \"上面撒上白糖。\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/f85d5a08-fc50-42d1-b6a9-152776db6a74.jpg\",
           \"content\": \"切块\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/f4275104-4948-478f-96bf-526c0560d0d2.jpg\",
           \"content\": \"反面是焦脆的。\",
           \"orderNum\": 10
         }
       ]', '[
         {
           \"ylName\": \"玉米粒\",
           \"ylUnit\": \"280克\"
         },
         {
           \"ylName\": \"玉米淀粉\",
           \"ylUnit\": \"28克\"
         },
         {
           \"ylName\": \"三象水墨糯米粉\",
           \"ylUnit\": \"28克\"
         },
         {
           \"ylName\": \"玉米油\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"白砂糖\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         3,
         4,
         7,
         67,
         171,
         174
       ]'),
       (82, '意大利南部美食－鳕鱼茄子通心粉',
        'http://static1.showapi.com/app2/img/caipu/20210223/c4b8a1bd-f621-4131-87a8-4ffa45120883.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/bae0f96f-8514-483d-9d54-858b557873fb.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/628ce1f1-1383-4d93-8449-28e72d69a6e8.jpg\",
           \"content\": \"茄子和鳕鱼切丁，小番茄切四瓣，蒜切末。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/8b1fdfa3-81da-4a02-a0c2-400e754ebb4f.jpg\",
           \"content\": \"茄丁放入盆中，撒盐煞出水分，冲洗干净。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/4fcd6e7a-7d53-4c7e-b58d-e5c58eacf108.jpg\",
           \"content\": \"锅中放少许油，下入茄子翻炒。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/14108fd2-5e14-4e87-96a6-ba97dddb4a99.jpg\",
           \"content\": \"炒熟后加入蒜末，继续翻炒。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5a09b73b-55ea-45e2-b9a8-4c4fef16ffb0.jpg\",
           \"content\": \"炒出蒜香气，加入小番茄继续翻炒。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/c78b4041-d3ca-42d4-a0f8-b3e06af7a7b7.jpg\",
           \"content\": \"加入鳕鱼丁、两勺水和干罗勒，放盐和黑胡椒调味。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/1b5654d1-94e8-4977-bc72-33572b6c848b.jpg\",
           \"content\": \"通心粉提前煮12分钟，倒在滤水盆里过凉水备用。将通心粉直接倒入锅中，翻炒均匀。撒上干酪丝，搅拌至奶酪融化即可。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/7c35af34-899b-4b2e-b271-4c281b49f231.jpg\",
           \"content\": \"装盘，淋上少许橄榄油和干酪丝，开吃！\",
           \"orderNum\": 8
         }
       ]', '[
         {
           \"ylName\": \"通心粉\",
           \"ylUnit\": \"350克\"
         },
         {
           \"ylName\": \"长茄子\",
           \"ylUnit\": \"3根\"
         },
         {
           \"ylName\": \"小番茄\",
           \"ylUnit\": \"10个\"
         },
         {
           \"ylName\": \"鳕鱼\",
           \"ylUnit\": \"300克\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"1瓣\"
         },
         {
           \"ylName\": \"盐和黑胡椒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"干罗勒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"橄榄油和干酪丝\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"柠檬皮\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         1,
         6,
         70,
         170,
         171,
         174,
         175
       ]'),
       (83, '蒜泥茄子', 'http://static1.showapi.com/app2/img/caipu/20210223/16abb562-fe69-46a0-a7ad-efa9015537eb.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/0ddff02c-c814-44a6-ab2e-62e13a0f3058.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/f32fa066-7fbb-463e-baf8-14fbed66ef3b.jpg\",
           \"content\": \"选购细长的嫩茄子有蒂的那头白色越多茄子就越嫩把水烧开洗净的茄子对半切开立刻放进蒸锅大火蒸10分钟\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/ff3e17a6-612c-41cf-af2b-25df04a19efa.jpg\",
           \"content\": \"取出戴手套趁热去皮如图把筷子插进底部即可轻松去茄子皮\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/09a63b70-bc7f-4e87-85c9-fa614289bb60.jpg\",
           \"content\": \"撕细条状底部可铺垫泡好的粉丝可以摆自己喜欢的形状富士山或者平铺\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/8092d008-a704-4452-bbe3-5b4170dcce68.jpg\",
           \"content\": \"蒜蓉用油小火炒香加生抽少许盐混合小心倒在茄子上撒葱花即可\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/8dbfa91d-edda-47a7-97e3-61bc3d9b11ed.jpg\",
           \"content\": \"拍完照再拌匀开吃\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"茄子\",
           \"ylUnit\": \"四个\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"一头\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"两勺\"
         },
         {
           \"ylName\": \"小葱\",
           \"ylUnit\": \"两根\"
         },
         {
           \"ylName\": \"粉丝\",
           \"ylUnit\": \"一把\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"5克\"
         }
       ]', '[
         2,
         4,
         6,
         72,
         171
       ]'),
       (84, '秒杀烧烤店的蒜蓉烤茄子',
        'http://static1.showapi.com/app2/img/caipu/20210222/3e7ed9a3-9dda-4c6e-a18e-a00cc57b9716.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/bec7b39e-28eb-4768-86bb-9c175f4c20b4.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c1a65a22-15d1-438e-a203-a1b3e6def8bb.jpg\",
           \"content\": \"茄子洗净擦干水分，平铺在铺好锡纸的烤盘上，给茄子刷上油，烤箱上下火180度烤30分钟\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/73b8b89c-bc83-42d0-add8-796116e605f7.jpg\",
           \"content\": \"等待期间准备酱汁：碗中放入一头蒜末，适量葱花，倒入热油爆出蒜香，再加入3勺酱油、2勺蚝油，搅拌均匀\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/f59aac18-0ae4-4c2e-af58-81acfc98c8b8.jpg\",
           \"content\": \"烤软的茄子用刀划开（注意别划破底下的皮哦）\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/fc8276eb-3fce-4700-bc82-f68dc88b886c.jpg\",
           \"content\": \"把调好的酱汁放入茄子内，撒上胡椒粉\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/384fa9d2-f058-4455-b766-6a202cbe3821.jpg\",
           \"content\": \"烤箱上下火180预热\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/eeba25a1-8cb6-407d-b0da-7f232411b952.jpg\",
           \"content\": \"继续放入烤箱烤10分钟\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/eedc3f4a-2193-4169-a2e2-acc7a3f0e475.jpg\",
           \"content\": \"超级香哦\",
           \"orderNum\": 7
         }
       ]', '[
         {
           \"ylName\": \"茄子\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"1头\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"葱花\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"酱油\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"白胡椒粉\",
           \"ylUnit\": \"1勺\"
         }
       ]', '[
         2,
         6,
         74,
         171
       ]'),
       (85, '된장가지볶음韩式大酱炒茄子日常家常菜',
        'http://static1.showapi.com/app2/img/caipu/20210222/ac788201-413e-4365-a1b2-d52b9f02a518.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/6fafb8fd-456e-4d0b-85b5-36c805927170.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/f423c890-bdc0-4582-85ab-5daf65416cc1.jpg\",
           \"content\": \"茄子滚刀切块\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/d82f963a-8d89-46f6-824b-d74f34900cc3.jpg\",
           \"content\": \"锅里放油下茄子炒至变软\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/fdbca656-acca-47d3-8536-33ce2b53fc15.jpg\",
           \"content\": \"放入大酱和酱油蒜泥加入2勺水小火炒\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/72c6a612-f831-4459-b41e-721f5de5730b.jpg\",
           \"content\": \"收汁即可出锅，撒点葱花完成\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"茄子\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"大酱\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"酱油\",
           \"ylUnit\": \"0.5勺\"
         },
         {
           \"ylName\": \"蒜泥\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"葱末\",
           \"ylUnit\": \"1勺\"
         }
       ]', '[
         2,
         6,
         8,
         70,
         171
       ]'),
       (86, '超好次的虾仁炒黄瓜（减脂低油版）',
        'http://static1.showapi.com/app2/img/caipu/20210222/d65d4005-3137-444a-86ff-2e0b2a788c7b.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/5f2e569a-56d5-4f1d-a9a9-cf68e30054c7.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/f57e5a93-2249-45f4-8b33-89559505ae58.jpg\",
           \"content\": \"使用的虾仁品牌；解冻后，需要用牙签去虾线。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/80b573cd-7026-4f61-86b9-aca1cae65232.jpg\",
           \"content\": \"一根黄瓜；可以去皮，切片。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/a4a05134-b905-4fe3-bdb5-7b57a3c54cb1.jpg\",
           \"content\": \"往锅内加入一筷子的油；可以再少点。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"中小火，姜蒜切切片，加入锅内。炒出香味即可。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c5809172-eb7b-4ef6-b25c-a8f2ff0caf7c.jpg\",
           \"content\": \"翻动虾仁，让虾仁两面都被煎过。这一步骤在几秒钟内完成，因为油少，时间久了容易糊。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"加水，水淹没到虾仁即可。煮开后，放入一勺蚝油、一勺生抽、一小勺盐。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/f3050ea0-68b5-48a1-bab6-f852263a576a.jpg\",
           \"content\": \"加入黄瓜，炒熟。看自己喜欢的软硬程度，决定出锅时间。出锅前撒点黑胡椒粉，翻炒入味。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/2edec24d-9654-4ed1-950d-20a6a6ebcd56.jpg\",
           \"content\": \"出锅，完成。我喜欢软一点的黄瓜，所以时间长点，锅内此时基本上没有多少汁水了。\",
           \"orderNum\": 8
         }
       ]', '[
         {
           \"ylName\": \"虾仁\",
           \"ylUnit\": \"80克\"
         },
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"1根\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"1筷子\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"1片\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"1瓣\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1小勺\"
         },
         {
           \"ylName\": \"黑胡椒粉\",
           \"ylUnit\": \"1小勺\"
         }
       ]', '[
         2,
         4,
         6,
         20,
         70,
         73,
         133,
         134,
         136,
         171,
         170,
         175,
         202
       ]'),
       (87, '开胃解腻的腐竹凉拌黄瓜黑木耳‼️巨好吃爽脆',
        'http://static1.showapi.com/app2/img/caipu/20210222/210d6e5b-fab8-42da-b1f6-a800b71814ae.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/9544e475-e1e9-4135-8665-06ce630d85a1.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/e2de77ea-049c-4fcf-b85a-e0dead4c4af3.jpg\",
           \"content\": \"清爽开胃\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/f387425c-19ee-43f6-bcde-59ce3d50486c.jpg\",
           \"content\": \"1调个凉拌汁：碗里放入一勺蒜末一勺葱花一勺芝麻一勺辣椒粉小米椒，浇入热油生抽三勺香醋两勺一勺糖少许盐一勺香油搅拌均匀\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/5a125a0e-45ae-44e4-a831-c52375a45705.jpg\",
           \"content\": \"2腐竹和木耳焯水捞出，黄瓜切小段，放香菜段，熟花生米，倒入凉拌汁拌匀即可！\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/e0b324bc-0b4d-45fc-b02d-c6611ba57f1b.jpg\",
           \"content\": \"好吃的停不下来安排起来\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"2根\"
         },
         {
           \"ylName\": \"木耳\",
           \"ylUnit\": \"10朵\"
         },
         {
           \"ylName\": \"腐竹\",
           \"ylUnit\": \"3根\"
         }
       ]', '[
         2,
         6,
         75,
         171
       ]'),
       (88, '凉拌黄瓜（夏日糖醋版）',
        'http://static1.showapi.com/app2/img/caipu/20210222/d165b6e3-42dc-47cc-9a2d-8cc244f8e705.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/fba27748-4c93-4cdb-85a1-87c1a9580447.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/9ee92451-e865-44cc-ad3f-c93e312e781d.jpg\",
           \"content\": \"黄瓜洗干净，不用削皮，用削皮刀削成一片一片薄薄的，洒上适量白糖，盖上保鲜膜放冰箱冷藏10分钟（糖适量，根据黄瓜大小放，一开始不要放太多后面不够甜可以再加）\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/a485d5a4-c1e0-4088-8477-efad7188566d.jpg\",
           \"content\": \"冰箱拿出来倒上适量白醋（酸甜度自己试哈！因为不同牌子的醋酸度不同）\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/0a6d1634-3f8f-4ffe-ac07-45123ab1e518.jpg\",
           \"content\": \"夏天冰镇真的超级解腻吃不够呀！下面的醋水比饮料好喝多了！\",
           \"orderNum\": 3
         }
       ]', '[
         {
           \"ylName\": \"白醋\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"白砂糖\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"1根\"
         }
       ]', '[
         2,
         4,
         7,
         24,
         75,
         133,
         134,
         171
       ]'),
       (89, '黄瓜炒肉片', 'http://static1.showapi.com/app2/img/caipu/20210222/f2893a70-933f-40a5-b5bf-addfa39b09f3.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/e6ca47d6-8b6f-4399-9b08-112708d08582.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c6380cc6-120a-4bba-b5fd-6dc38c9102ae.jpg\",
           \"content\": \"准备材料如图，黄瓜片事先加少许盐腌一下。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/72c904b5-9b79-4208-b7d6-59cef1e1f54f.jpg\",
           \"content\": \"油烧热开始煸肉片，加入少许生抽料酒。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/976a3b6e-2acf-43bd-85c5-3a6b6fa3f11f.jpg\",
           \"content\": \"倒入黄瓜片快速翻炒\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/9a21438f-bc9c-4201-8f3c-71ad1dc4e03c.jpg\",
           \"content\": \"肉片已经很鲜美了，也可以再加一点点鸡精增鲜。看！一盘美味儿的黄瓜炒肉片就出锅啦！简单不？\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"猪肉\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"1.5根\"
         },
         {
           \"ylName\": \"姜片蒜末\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"鸡精\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         4,
         6,
         70,
         170,
         171
       ]'),
       (90, '黄瓜拌面筋', 'http://static1.showapi.com/app2/img/caipu/20210222/500a8d5e-04db-4512-8c67-11ae16780b3f.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/eeb91648-0d52-4f93-b962-ad5f255c4e28.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/926540f0-bb95-43fe-96fe-4724beb6dfbd.jpg\",
           \"content\": \"拍黄瓜\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/2a077971-b5c0-4b0d-9349-81f42b032d38.jpg\",
           \"content\": \"黑木耳用水焯一下，面筋丁备用\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/03bbf0fe-d23a-45ca-b5d1-92a1bbdb19a7.jpg\",
           \"content\": \"所有的材料放容器里加调料\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/2ba554bd-49c6-43fe-9ffe-f3d040ce46aa.jpg\",
           \"content\": \"最好戴手套多搅拌，让每个食材都裹上调料\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/cff7a871-5607-4512-9c85-65c645c2b1ed.jpg\",
           \"content\": \"下酒菜也不错\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"面筋\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"1根\"
         },
         {
           \"ylName\": \"花生米\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"香醋\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1.5勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"花椒油（没有就算了）\",
           \"ylUnit\": \"3滴\"
         }
       ]', '[
         2,
         6,
         75,
         171
       ]'),
       (91, '黄瓜炒鸡蛋', 'http://static1.showapi.com/app2/img/caipu/20210222/af140a4b-ba98-424d-b7f4-6115849e44ce.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/2e2b7da0-0a16-471a-86f4-dbb287c0ebd8.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/98ed9225-49e5-4820-9af6-8f9585524f21.jpg\",
           \"content\": \"黄瓜削皮切块\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/1d9cc634-2f93-489d-b5af-ff4650c347e0.jpg\",
           \"content\": \"锅中放油炒一下\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/39fa24b6-63fd-4bc1-826f-546214e82e83.jpg\",
           \"content\": \"另起锅放油把搅好的蛋液倒入煎个蛋，用筷子搅碎\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/9d002ec4-207b-4443-a768-908a126818ae.jpg\",
           \"content\": \"把蛋倒入黄瓜锅中翻炒，加盐，糖\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/c09d7db2-eb4c-4fe9-8b89-7cf08f5540a6.jpg\",
           \"content\": \"加点水煮15分钟左右关火装盆\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"2根\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"10克\"
         }
       ]', '[
         2,
         4,
         6,
         70,
         171
       ]'),
       (93, '什锦豆炒肉', 'http://static1.showapi.com/app2/img/caipu/20210223/0ae4fa2d-b49b-4530-9fba-d4668501f32b.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/ad93e98e-1490-4650-b18f-19dc650d11a0.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/70306419-3174-4110-9c6a-8b6632097d1b.jpg\",
           \"content\": \"什锦豆焯水时间2分钟左右焯好后盛出备用\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/bd352384-f3ed-44a7-882f-81b90880b421.jpg\",
           \"content\": \"猪肉切片\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/9951a9ae-9373-4312-9a6a-335a3e34e463.jpg\",
           \"content\": \"锅中加油加入十三香炒香下入肉片加料酒翻炒\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d752a60d-7f8b-4dc7-b956-f028bbb6c9af.jpg\",
           \"content\": \"猪肉炒至变色下什锦豆翻炒加酱油、耗油、糖、盐调味加黑胡椒翻炒\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/98cf99e4-c6f9-443a-af36-cda6bde15a5b.jpg\",
           \"content\": \"翻炒均匀即可出锅\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"豌豆\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"玉米粒\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"胡萝卜\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"猪肉\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"料酒、耗油、酱油、盐、糖\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         6,
         71,
         70,
         170,
         171
       ]'),
       (94, '素炒什锦豆', 'http://static1.showapi.com/app2/img/caipu/20210223/2a281917-7e91-4988-a0d1-8fff4ed8b973.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/39e6efef-0e40-40d5-9166-7cc165724ca9.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/6b7bf849-1ade-49ea-8e21-bb99f0ddb267.jpg\",
           \"content\": \"什锦豆焯水时间2分钟左右焯好后盛出备用\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/2d1c18db-d4fa-4fe3-b155-b287e2a2cc50.jpg\",
           \"content\": \"锅中加油加入十三香炒香下入焯好的什锦豆\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/c97e6cd3-6dc2-4453-a606-b92ef93508b3.jpg\",
           \"content\": \"翻炒均匀加酱油、耗油、糖、盐调味加黑胡椒翻炒\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/8fe7e009-a465-465c-9373-e4aa7514615e.jpg\",
           \"content\": \"翻炒均匀即可出锅\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"豌豆\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"胡萝卜粒\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"玉米粒\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"料酒、耗油、酱油、盐、糖\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         4,
         6,
         70,
         71,
         171
       ]'),
       (95, '番茄豆牛汤', 'http://static1.showapi.com/app2/img/caipu/20210218/4a95f2b9-26f8-4525-80b7-72efe26af430.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210218/90c9c4a1-889d-4c3f-868e-19474562b2c3.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210218/d28cef80-8569-4079-b458-6e8928fe1d13.jpg\",
           \"content\": \"1.番茄撕皮切块2.土豆削皮切块，水泡后沥干3.下冷水，加生姜片，水翻滚后下肥牛焯一下4.准备小葱段，\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210218/4292b2bb-a9fd-4086-93a3-a634689d2917.jpg\",
           \"content\": \"1.锅内放油，油热后下土豆块，翻炒至两面金黄2.锅内放油，油热后番茄下锅，翻炒至有流汁后倒入少许盐，1勺番茄酱，少许白醋，少许鲜味生抽后再次翻炒，加入土豆，肥牛，倒入开水，开中火煮\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210218/bbb207af-90ef-483d-8721-bf99b082d044.jpg\",
           \"content\": \"1.冷水调淀粉倒入锅内，开小火慢炖。2.待汤粘稠后加入葱花，稍等片刻即可出锅\",
           \"orderNum\": 3
         }
       ]', '[
         {
           \"ylName\": \"西红柿\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"肥牛\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"葱\",
           \"ylUnit\": \"3根\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"3片\"
         },
         {
           \"ylName\": \"土豆\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"番茄酱\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"白醋\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         6,
         71,
         99,
         170,
         171
       ]'),
       (96, '葱油煎豆', 'http://static1.showapi.com/app2/img/caipu/20210214/c6446fbb-2ce4-4850-a807-d3e63bb68682.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210214/56bd4b19-f9bf-4a15-ab97-35bb93c837c4.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210214/d8deaa1d-8b00-484d-926b-848073eeb5db.jpg\",
           \"content\": \"剥好备用新鲜蚕豆带豆荚沥干水\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210214/1b1db3de-4b41-4198-9b87-46e67d855a7e.jpg\",
           \"content\": \"准备辅料\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210214/93e073b3-9999-400a-8a21-10b83c4325e2.jpg\",
           \"content\": \"炸葱油炸到葱微焦把葱捞出放入蒜片葱花爆香放入蚕豆翻炒\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210214/cbf97c29-761a-42d9-9428-b3a50ed2a67d.jpg\",
           \"content\": \"翻炒撒盐鸡粉少许水咕嘟一下自然收汁\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210214/d3103ebe-8baf-4cce-aa06-5931500d9d83.jpg\",
           \"content\": \"刚出锅菜上都是小泡很香很香\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210214/df591ba1-f518-4eec-8e94-9da425d76ecf.jpg\",
           \"content\": \"香的不得了\",
           \"orderNum\": 6
         }
       ]', '[
         {
           \"ylName\": \"新鲜蚕豆带豆荚\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"小葱\",
           \"ylUnit\": \"3根\"
         },
         {
           \"ylName\": \"蒜片\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"葱花\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"鸡粉\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         73,
         171
       ]'),
       (97, '回味豆', 'http://static1.showapi.com/app2/img/caipu/20210129/e2861ffa-137e-4265-b7e1-bf9ca689774e.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210129/5f7ce45b-e1d0-41ad-b2db-4e0af4fd107e.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/486bb904-3a1a-48ff-8679-f198bb348798.jpg\",
           \"content\": \"两种豆子洗干净备用；锅中放入食用油\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/eac44a8c-1af3-471f-981a-05e836b3c2c3.jpg\",
           \"content\": \"放入两种豆子，翻炒一分钟\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/706fb941-b96e-4190-b61f-a015f7ffc257.jpg\",
           \"content\": \"倒适量清水，放醋、生抽、红油，大火烧开后转小火煮30分钟。最后放盐糖，鸡精调味，翻炒均匀。红油，再点椒也，因为我不，所这两种我都没放。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/838bd144-106c-4050-b29e-52935a79280b.jpg\",
           \"content\": \"炒均匀后即可出锅。\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"花豆\",
           \"ylUnit\": \"150克\"
         },
         {
           \"ylName\": \"豌豆\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1克\"
         },
         {
           \"ylName\": \"糖、鸡精\",
           \"ylUnit\": \"各2克\"
         },
         {
           \"ylName\": \"镇江香醋\",
           \"ylUnit\": \"1汤勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1汤勺\"
         },
         {
           \"ylName\": \"食用油\",
           \"ylUnit\": \"1汤勺\"
         },
         {
           \"ylName\": \"红油\",
           \"ylUnit\": \"1汤勺\"
         },
         {
           \"ylName\": \"清水\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         70,
         171
       ]'),
       (98, '豆皮的神仙吃法‼️京酱肉丝这么做超好吃‼️',
        'http://static1.showapi.com/app2/img/caipu/20210128/4cec4b93-0462-42ca-a615-d499fb41eb48.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210128/989709e1-7de2-4102-8fc5-15e82fe6672f.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/4f22b2b3-ec45-42df-8624-879d6f544955.jpg\",
           \"content\": \"准备好所有的食材，猪肉切丝放入大碗中，加入料酒一勺，生抽一勺，醋一勺，淀粉一勺,搅拌均匀，腌制十五分钟\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/7e9e41d5-0143-4658-9655-380d491cb5a7.jpg\",
           \"content\": \"碗中加入甜面酱1勺，生抽1勺，蚝油1勺，勺，勺，清水适量，搅和均匀备用。起锅烧油，放入腌制好的肉丝翻炒至变色捞出，锅中加入调好的料汁，放肉翻炒均匀。最后大火收汁即可\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/ea2b2c66-0a2d-4e2f-acff-f655e0291430.jpg\",
           \"content\": \"豆皮煮熟卷上胡萝卜黄瓜大葱肉丝就可以开吃了！\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/cc689408-20f0-4397-8866-b398803dfd03.jpg\",
           \"content\": \"更多简单美味\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"猪里脊\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"大葱\",
           \"ylUnit\": \"1根\"
         },
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"胡萝卜\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"甜面酱\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         68,
         70,
         170,
         171
       ]'),
       (99, '家庭版三鲜豆皮', 'http://static1.showapi.com/app2/img/caipu/20210119/7c9c755a-5d98-47ea-b7d5-dc6fd509d331.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210119/dc72f35c-6ae3-45c9-8b77-3fa8e96973e7.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/6293d453-3ad7-4387-b85c-ae0f07725889.jpg\",
           \"content\": \"准备食材\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/711fe863-aafb-4e75-ac69-07000cadd67f.jpg\",
           \"content\": \"香菇、香干、五花肉、笋子、小葱切丁切碎\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/c20ed1cd-c4b6-4a8a-a008-ffccf11fc1b8.jpg\",
           \"content\": \"将浸泡好的糯米上锅蒸40分钟\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/c382fe61-dbdb-4269-8eee-75e1bba1014e.jpg\",
           \"content\": \"蒸糯米的时候炒肉臊子\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/bf6e46b7-4cd4-48d6-9bf5-465bc2ac9fe3.jpg\",
           \"content\": \"依次放入配料等翻炒，加水炖20分钟，最后加盐\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/cbac9339-8abb-4295-b1ee-873bd72fff47.jpg\",
           \"content\": \"用破壁机打好豆皮糊（绿豆、大米浸泡一夜）\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/16311784-81b2-4d75-8f58-79184993e884.jpg\",
           \"content\": \"鸡蛋打散备用\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/33f51709-ee73-4e41-9fb9-f6f2bfd98f28.jpg\",
           \"content\": \"聚嗨盘预热后放上适量豆皮糊推开\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/091e3307-5078-47fc-a75b-5e98a7ae1dac.jpg\",
           \"content\": \"加鸡蛋液煎至底部金黄，翻面。放上适量熟糯米饭\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/f3f0ffd8-b35a-4008-b0db-aeba9b9ab2e4.jpg\",
           \"content\": \"放上适量肉臊子，稍微压实\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/2d4c69eb-6974-452d-bd08-f672d696dda7.jpg\",
           \"content\": \"做成方形翻面\",
           \"orderNum\": 11
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/976e779f-df50-4116-9f61-9bf8d46a9775.jpg\",
           \"content\": \"撒葱花，切块即食\",
           \"orderNum\": 12
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210119/68a25b13-0568-45e2-bbc2-e21f16ef3d8e.jpg\",
           \"content\": \"美味的豆皮就做好了，想念这口家乡味道的你赶紧跟我一起做起来吧\",
           \"orderNum\": 13
         }
       ]', '[
         {
           \"ylName\": \"糯米\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"五花肉\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"香菇\",
           \"ylUnit\": \"5朵\"
         },
         {
           \"ylName\": \"鲜笋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"香干\",
           \"ylUnit\": \"2块\"
         },
         {
           \"ylName\": \"小葱\",
           \"ylUnit\": \"1根\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"豌豆\",
           \"ylUnit\": \"60克\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"植物油\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"绿豆\",
           \"ylUnit\": \"40克\"
         },
         {
           \"ylName\": \"大米\",
           \"ylUnit\": \"60克\"
         },
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"60克\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"300克\"
         }
       ]', '[
         2,
         6,
         20,
         72,
         70,
         73,
         170,
         171
       ]'),
       (100, '菊花茄子', 'http://static1.showapi.com/app2/img/caipu/20210223/9fd7044d-f4a0-4c18-ae3c-8b4ec2f520e3.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/86060cbc-0eb3-40e4-bd94-9e987ee232c3.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/ebca4fad-fc9d-493e-a4a8-7052313b949b.jpg\",
           \"content\": \"茄子改花刀\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/1337b3cf-049b-4f8f-9f21-bd86b5629ce3.jpg\",
           \"content\": \"准备鸡蛋打散备用\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/09f1ea2a-2e95-431a-ae2b-f0211944e062.jpg\",
           \"content\": \"茄子裹上蛋液，再裹好面粉\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/bd317a97-1159-4033-97fd-80b0630a8512.jpg\",
           \"content\": \"下油锅炸制金黄\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/40a45ce0-2b15-4e41-adcd-f466508b10f7.jpg\",
           \"content\": \"少许油加白糖融化\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/257608c9-cece-43da-aeb5-a1f70ae89f17.jpg\",
           \"content\": \"番茄酱炒一分钟\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/9aba90c6-5c4f-4eb1-ac94-a963f516881c.jpg\",
           \"content\": \"碗边摆上好看的花边，把番茄酱浇在上面，完成啦！\",
           \"orderNum\": 7
         }
       ]', '[
         {
           \"ylName\": \"茄子\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"番茄酱\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"草莓\",
           \"ylUnit\": \"6个\"
         },
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"1根\"
         }
       ]', '[
         2,
         7,
         67,
         70,
         171
       ]'),
       (101, '糯唧唧的“奶头”桔红糕',
        'http://static1.showapi.com/app2/img/caipu/20210223/eb582ac8-dce9-4057-ae7f-b1aa540087c1.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/4f91c946-3cec-492f-a298-3ed7d8cea636.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/33013ce1-0dbe-4720-9ed4-a12e3000cb3d.jpg\",
           \"content\": \"将糯米粉和水还有白砂糖混合均匀，混合后跟米浆差不多稠度。再取少许糯米粉加水加红色素搅拌均匀，然后两碗都盖上保鲜膜，放入蒸锅中沸腾后30分钟端出，将糯米团用保鲜膜裹上冷却。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/ac06558a-2eab-454d-b968-4a0ea7ccefcc.jpg\",
           \"content\": \"锅里炒一些糯米粉，炒到微黄即可。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/10dc7713-cc5a-4c44-a587-8059d4e63fc7.jpg\",
           \"content\": \"将冷却后的糯米团加入薄荷香精，浓淡自己调整，最后在案板上撒一些熟糯米粉放上糯米团，将白面团擀开，一侧放上搓成长条的红色糯米团，卷上，将整个糯米团搓长切块即可。\",
           \"orderNum\": 3
         }
       ]', '[
         {
           \"ylName\": \"糯米粉\",
           \"ylUnit\": \"400克\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"绵白糖\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"红色食用色素\",
           \"ylUnit\": \"4滴\"
         },
         {
           \"ylName\": \"薄荷香精\",
           \"ylUnit\": \"数滴（根据自己爱好）\"
         }
       ]', '[
         3,
         7,
         72,
         70
       ]'),
       (102, '可盐可甜的海盐玫瑰曲奇，新手自创超好上手，超好吃超酥脆～',
        'http://static1.showapi.com/app2/img/caipu/20210223/695e257d-37e5-4e42-ba88-70e34d4a9a02.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/379c56bd-4b2b-4baf-8d01-5e9cfe361b05.jpg', '[
         {
           \"imgUrl\": \"\",
           \"content\": \"准备好材料，黄油隔水软化至比较容易搅拌的状态，加入细砂糖和炼乳搅拌均匀\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"淡奶油中加入海盐搅拌均匀，然后将之前搅拌均匀的黄油分三次加入淡奶油中，每次都要充分搅拌均匀之后再加入下一次\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"过筛加入低筋面粉和玉米淀粉，用橡胶铲拌匀即可，无需过分搅拌，之后加入干玫瑰花瓣，这个没有定量，可以一边加一边混匀，感觉适量就可以\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/ddb40842-a29a-412e-830b-5c7a0f7a51c8.jpg\",
           \"content\": \"将混匀的面团装入裱花袋中，我用的是5齿裱花嘴，从内到外转圈挤出来，一圈到两圈即可\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/b31a52ad-2d5e-4231-8e2d-d82ab00d0456.jpg\",
           \"content\": \"烤箱上下160预热，然后开烤，20分钟左右，具体时间要根据自家烤箱具体情况调整，我家烤箱火比较大所以开始的时候在最上层铺了锡箔纸，第一次烤的时间稍短一点温度也低一些，烤到差不多熟了再把锡箔纸拿走，只开上管180上色，大概3-5分钟颜色就可以啦\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/290e1dc0-570f-416d-a6e7-9e6caa436794.jpg\",
           \"content\": \"新鲜出炉的海盐玫瑰曲奇整个家里都是玫瑰的香气啦另，放凉后会更酥脆哦\",
           \"orderNum\": 6
         }
       ]', '[
         {
           \"ylName\": \"黄油\",
           \"ylUnit\": \"120克\"
         },
         {
           \"ylName\": \"细砂糖\",
           \"ylUnit\": \"35克\"
         },
         {
           \"ylName\": \"炼乳（或细砂糖）\",
           \"ylUnit\": \"25克\"
         },
         {
           \"ylName\": \"淡奶油\",
           \"ylUnit\": \"90克\"
         },
         {
           \"ylName\": \"低筋面粉\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"玉米淀粉\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"海盐\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"食用干玫瑰花瓣\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         3,
         7,
         74,
         174
       ]'),
       (103, '零厨艺的煎三文魚骨', 'http://static1.showapi.com/app2/img/caipu/20210223/755ccb7f-5792-458a-b4ce-88d2b2602567.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/f0896479-8b27-49f7-ba0d-c14e259d9f4b.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/f6bcac58-5a15-4d8c-a6c9-713e6952b706.jpg\",
           \"content\": \"帝皇三文魚每一條都有自己的編號，魚腩部分刺身吃了，今天先處理魚骨，下次再做魚頭。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/3fb4a222-ba0c-4cf8-b9f7-ef1ae069b7cb.jpg\",
           \"content\": \"三文魚骨切段\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/05f5438f-31d9-46af-a7fb-7209ea3d6391.jpg\",
           \"content\": \"清洗一下，用廚房紙巾吸乾水分\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/74f406fb-0add-4a8b-99e2-2c13f07087fb.jpg\",
           \"content\": \"加入適量黑胡椒粒跟玫瑰鹽醃製幾分鐘\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/31979597-27cf-413a-8ca3-38038854a43d.jpg\",
           \"content\": \"熱鍋冷油\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"油熱後，平鋪好三文魚骨加入幾片姜煎。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"雙面煎香即可。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/470e469c-fc1e-4905-95e1-7a7c237ebecd.jpg\",
           \"content\": \"香脆可口\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/3ca474da-ecce-40e0-ab76-a9f1081d01b2.jpg\",
           \"content\": \"比肉還好吃\",
           \"orderNum\": 9
         }
       ]', '[
         {
           \"ylName\": \"三文鱼骨\",
           \"ylUnit\": \"一條\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"適量\"
         },
         {
           \"ylName\": \"玫瑰鹽\",
           \"ylUnit\": \"適量\"
         },
         {
           \"ylName\": \"橄欖油\",
           \"ylUnit\": \"適量\"
         },
         {
           \"ylName\": \"薑片\",
           \"ylUnit\": \"幾片\"
         }
       ]', '[
         2,
         6,
         68,
         73,
         175
       ]'),
       (104, '初秀八宝饭', 'http://static1.showapi.com/app2/img/caipu/20210223/acdab984-8018-4681-89b9-ef6277680e87.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/01066e05-7dd7-4bb1-88d7-144f6ef89659.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/42369320-a00e-4e3a-8e61-6b5d0dd77f2b.jpg\",
           \"content\": \"材料大合照（少了枸杞望谅）；糯米泡了一天（泡一晚就可）；伊拉克蜜枣撕碎。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/0b4c1b77-261d-4e57-9857-bce17737c12c.jpg\",
           \"content\": \"碗内抹油（应该抹猪油，我搞不到就用色拉油代替了）\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/20949b9a-b7f3-4b38-8c09-e5730bc82766.jpg\",
           \"content\": \"碗底摆第一层：红枣6枚（取大顺之意）、果干、坚果、红糖。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/f3f336a7-f6b7-4cec-bda2-e7ced24f4d9a.jpg\",
           \"content\": \"第二层撒糯米，；第三层撒坚果果干红糖。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/60585d06-e4f5-46db-9759-4ef0b252c300.jpg\",
           \"content\": \"第四层撒糯米；第五层撒干果果干红糖。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/691f0d29-2eab-4148-aedb-fb3b8b4fc765.jpg\",
           \"content\": \"第六层撒糯米；第七层摆了七颗红枣，将剩余的坚果果干红糖撒好，最上面一层多撒点儿红糖（哇，搞出个七层宝塔啊）\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/b517b141-edcd-496b-aca4-4cc14897eeda.jpg\",
           \"content\": \"倒入开水没过糯米，凉水下锅，水开后关中小火，蒸1个小时。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/83b8ebc0-7149-4431-add5-a0d2461d3fdd.jpg\",
           \"content\": \"做成功了，给自己\",
           \"orderNum\": 8
         }
       ]', '[
         {
           \"ylName\": \"糯米\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"葡萄干、蔓越莓\",
           \"ylUnit\": \"各20克\"
         },
         {
           \"ylName\": \"伊拉克蜜枣\",
           \"ylUnit\": \"4个\"
         },
         {
           \"ylName\": \"红枣\",
           \"ylUnit\": \"13颗\"
         },
         {
           \"ylName\": \"核桃、腰果、杏仁\",
           \"ylUnit\": \"各20克\"
         },
         {
           \"ylName\": \"红糖\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"枸杞\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"蜂蜜浸玫瑰\",
           \"ylUnit\": \"6片\"
         }
       ]', '[
         2,
         7,
         72
       ]'),
       (105, '【桥桥妈】摇元宵 自制滚元宵的窍门竟然是个球',
        'http://static1.showapi.com/app2/img/caipu/20210223/9743d2e6-7f71-48e7-8a0c-2b462a438804.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/75c4132c-4f60-41ee-a215-0936b6165b88.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/b9aea9f0-d829-472e-a697-9858bf782708.jpg\",
           \"content\": \"元宵馅的做法：所有果小火炒香，彻底放凉后，装入袋子，用擀面杖敲碎，倒入碗里，加白糖，糖桂花，蜂蜜和融化的无盐黄油；装入垫有保鲜膜的方形容器，冷冻15分钟，切成16等份，揉圆；冷冻4060分钟；\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5e00b0f0-ff1d-46ea-9bef-717468950864.jpg\",
           \"content\": \"摇做法:平底容器里加200g糯米粉，馅浸23秒，糯米粉，盆下垫球摇，摇15圈左右，摇，糯米粉，重复10次，直至达核桃大小；\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/7170e18d-03d9-4a69-9ca2-fe57f6ae5a40.jpg\",
           \"content\": \"煮元宵的做法:水开，用漏勺下元宵，加盖煮23分钟，元宵浮起来再煮4分钟，期间水沸腾后点冷水降温；\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/eb769379-17af-4ea5-9a40-971c0f4b51ce.jpg\",
           \"content\": \"元宵的吃法：碗里盛元宵，点上糖桂花。\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"（此配方可做大元宵16个）\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"糯米粉\",
           \"ylUnit\": \"400g(3杯)\"
         },
         {
           \"ylName\": \"花生\",
           \"ylUnit\": \"45g(¼杯)\"
         },
         {
           \"ylName\": \"核桃\",
           \"ylUnit\": \"30g(⅓杯)\"
         },
         {
           \"ylName\": \"杏仁\",
           \"ylUnit\": \"20g(3汤匙)\"
         },
         {
           \"ylName\": \"芝麻\",
           \"ylUnit\": \"20g(3汤匙)\"
         },
         {
           \"ylName\": \"葡萄干\",
           \"ylUnit\": \"20g(3汤匙)\"
         },
         {
           \"ylName\": \"糖桂花\",
           \"ylUnit\": \"30g(1½汤匙)\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"20g(1½汤匙)\"
         },
         {
           \"ylName\": \"蜂蜜\",
           \"ylUnit\": \"20g(1汤匙)\"
         },
         {
           \"ylName\": \"无盐黄油\",
           \"ylUnit\": \"40g(3汤匙)\"
         }
       ]', '[
         1,
         7,
         71,
         105,
         174
       ]'),
       (106, '无糖无油馅元宵/汤圆',
        'http://static1.showapi.com/app2/img/caipu/20210223/9861f80a-c70e-4755-aea5-13eb519c6a83.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/2e336790-703e-4929-a218-55fa9496c133.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/2e95bc32-8c6d-4772-b18e-2868f1e6aa09.jpg\",
           \"content\": \"先说元宵黑芝麻/椰枣泥馅\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/44fdb8d9-8369-4c26-8705-cbe463929f82.jpg\",
           \"content\": \"黑芝麻洗净、炒熟、打成粉。椰枣泥蒸热后会变软\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/33e86558-bdd9-483f-8bd5-b665b3ee2a0f.jpg\",
           \"content\": \"两者混合均匀（把黑芝麻粉放入椰枣泥里，边放边揉，感觉能捏成团了就可以）\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/cd34509e-a1a0-4512-990c-932f3bff0db7.jpg\",
           \"content\": \"搓成一个个小丸子\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5f0ae3b0-6714-4831-a8d1-cda4378d8214.jpg\",
           \"content\": \"把搓好的馅，放入装有糯米粉的大碗里，晃动让沾上糯米粉，然后拿出来放入漏勺里。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/1eb01033-e90e-4b30-8fe1-b0aba409c1a0.jpg\",
           \"content\": \"快速冲下水（如果有干净的喷壶，用喷壶来喷会更好）再放入糯米粉碗里滚动沾粉，重复这个步骤4-5次，感觉差不多了就可以（大小比搓好的馅料丸子大一倍）\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/bbc5a5e7-faca-47a4-a6a6-e022c796cca2.jpg\",
           \"content\": \"全部做好后就可以煮了，吃不完的冷冻保存。滾元宵的好处就是不用那么麻烦去包，皮薄馅大。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5eb1c390-7a4b-4908-aa7c-01dd22d7d2b9.jpg\",
           \"content\": \"下面说汤圆，包的。红枣泥/花生馅\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/c5fb9ca7-7124-4b35-92ea-ab935fc0efa3.jpg\",
           \"content\": \"红枣清洗干净\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/b014b8ff-d14c-40f3-944f-f7ca4b7cbed1.jpg\",
           \"content\": \"去核\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/635ef0eb-918a-495c-bbb5-ee23f0aded3f.jpg\",
           \"content\": \"加水煮\",
           \"orderNum\": 11
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/cb731e70-1eb9-408e-9eca-efa9b9794ad0.jpg\",
           \"content\": \"煮到枣软水份尽就可以了。\",
           \"orderNum\": 12
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/f4483c03-6993-4ca4-a1b2-6e32d263f8b3.jpg\",
           \"content\": \"用勺子压成泥，或者机器打成泥，破壁机/料理机都行。\",
           \"orderNum\": 13
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/eafbb497-30f0-48e0-bae9-938da413e9ab.jpg\",
           \"content\": \"花生洗净，控干水，烤箱150度烤熟，不需要去掉红衣直接打粉。\",
           \"orderNum\": 14
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/e1475f93-f994-44e0-a629-53db1941c04e.jpg\",
           \"content\": \"把打好的花生粉倒入红枣泥里，边倒边混合，混合到能抱团搓成丸子就行\",
           \"orderNum\": 15
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/6bf5b226-bd65-4f21-aeeb-2df2aeb6b42f.jpg\",
           \"content\": \"搓成一个个小丸子，搓好放冰箱冷藏一个小时，会更好包。\",
           \"orderNum\": 16
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/c3ad2b4c-17ec-4fd6-8bcf-ee2bb21a848a.jpg\",
           \"content\": \"馅做好，开始和面，少许红曲粉糯米粉。\",
           \"orderNum\": 17
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/6dd293b4-5549-4bc3-919f-60d35ae5b531.jpg\",
           \"content\": \"用45度左右的温水和成软点的面团，因为越放会越硬不好包，所以和的时候多揉揉，揉好后就可以包了。\",
           \"orderNum\": 18
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/09aa6218-06fd-4bc4-8362-70c85d04a8ec.jpg\",
           \"content\": \"包法视频\",
           \"orderNum\": 19
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/c09609b6-11c3-4ce6-986e-aa3ca4d250d3.jpg\",
           \"content\": \"都包好后，留出要煮的，剩下的冷冻保存。\",
           \"orderNum\": 20
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d9c85fed-83d8-4023-b3e1-64d7b7111ee6.jpg\",
           \"content\": \"自己做的就是好吃，不甜腻还健康，快来动手试试吧。\",
           \"orderNum\": 21
         }
       ]', '[
         {
           \"ylName\": \"黑芝麻\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"椰枣泥\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"花生\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"红枣\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"红曲米粉\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"糯米粉\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"干桂花\",
           \"ylUnit\": \"搭配用（可有可无）\"
         }
       ]', '[
         1,
         7,
         71,
         105,
         136,
         137,
         174
       ]'),
       (107, '川菜的精髓 - 鱼香茄子煲 软绵酥口不油腻',
        'http://static1.showapi.com/app2/img/caipu/20200924/8ff85876-d504-4581-a420-752048b15407.jpg',
        'http://static1.showapi.com/app2/img/caipu/20200924/eecaee60-692e-44be-bc5e-d51ea1be75f8.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/fa1f647a-949c-45ba-abdf-19eb94a298e2.jpg\",
           \"content\": \"长茄切成长条\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/0f6c2670-da59-49ec-9f75-552f2b2c20d3.jpg\",
           \"content\": \"肉馅中加入料酒，搅拌均匀备用\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/b5f648b3-4f80-4e82-8844-ccc739c0057f.jpg\",
           \"content\": \"用老抽、醋、生抽、白糖混合均匀制成鱼香酱汁\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/50d55ea1-f6cf-4ebc-8c4a-72a063dddad0.jpg\",
           \"content\": \"小红锅充分热透，倒入稍多食用油，下姜末煸香\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/fb7bdc06-ba4d-45ca-97c0-08f2a695983d.jpg\",
           \"content\": \"倒入肉馅，炒至焦黄\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/8fad402f-d1fb-43f3-a2c8-4113fe1a89bb.jpg\",
           \"content\": \"6.放剁椒、郫县豆瓣酱继续翻炒，直至炒出红油\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/9e7928cd-49d2-4f94-9558-6bf4f59b68f2.jpg\",
           \"content\": \"7.下茄条，炒匀\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/54e26986-5915-4756-8982-7eaee7cbf00f.jpg\",
           \"content\": \"8.等到茄子明显变软后，倒入准备好的鱼香汁\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/0e22e037-c983-4eeb-9d99-8ea510d4f0f2.jpg\",
           \"content\": \"9.小火继续翻炒，倒入准备好的水淀粉、蒜末，快速收汁\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200924/8b316825-4a87-42ae-8f4f-0ea4395bf7d5.jpg\",
           \"content\": \"10.撒少许葱花后即可出锅\",
           \"orderNum\": 10
         }
       ]', '[
         {
           \"ylName\": \"长茄\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"剁椒\",
           \"ylUnit\": \"1.5勺\"
         },
         {
           \"ylName\": \"肉馅\",
           \"ylUnit\": \"150g\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"1.5勺\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"1.5勺\"
         },
         {
           \"ylName\": \"醋\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1.5勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"郫县豆瓣酱\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"水淀粉\",
           \"ylUnit\": \"小半碗\"
         },
         {
           \"ylName\": \"姜末、蒜末、葱花\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         6,
         8,
         25,
         70,
         120,
         170,
         171
       ]'),
       (108, '川菜经典--绝味宫保鸡丁',
        'http://static1.showapi.com/app2/img/caipu/20200918/6d827ada-c9f5-4f2c-99a4-db647f06e0ba.jpg',
        'http://static1.showapi.com/app2/img/caipu/20200918/481eb053-b46c-4875-a096-63644a27de75.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/5e54c73a-efd9-49be-9c68-ce7c396df656.jpg\",
           \"content\": \"准备干辣椒15克，辣椒我买的是重庆石柱红5号干辣椒，味道又香又辣，红花椒1克，大蒜5克，生姜3克，大葱25克1厘米长的节。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/f9bab6e3-96f9-4d1d-a66c-00929fdf1539.jpg\",
           \"content\": \"香莴笋46克，放0.50克，出莴笋的水分。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/0437c04b-bd4f-407a-b4d5-883eb4c21fba.jpg\",
           \"content\": \"莴笋腌出水分之后冲洗，滤干水。传统的宫保鸡丁是不放其它配菜，就是鸡丁，姜葱蒜和花生米。更不得加莴笋，就怕加些乱七八糟的配菜，影响口感，但我实在喜欢在这道菜里放莴笋丁，于是折中，少放一点，莴笋码盐，把水腌出来。莴笋一定要选择嫩的部分，一根莴笋，选择尖的部分，一份宫保鸡丁，三分之一根就够了。老的莴笋头，颜色发黄，口感粗，影响菜的口感，不能放。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/ce3aa0d0-41f0-47af-beb9-b21b12aa4d1b.jpg\",
           \"content\": \"花生米35克，用烤箱烤脆。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/5ad47ec0-da40-4b49-b307-19c249cbc6b9.jpg\",
           \"content\": \"调碗汁特级保宁醋30克，白糖20克，盐巴1克，红薯淀粉3克，胡椒粉1克，充分搅拌。炒菜淋糖醋汁的时候，一定要搅匀再淋。醋一定要用保宁醋，颜色和味道才对版，我曾经用过六年陈的镇江香醋，颜色淡，味道完全不对。切记，一定要保宁醋！\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/56b4995a-c783-415c-ba36-e1c0152a6bcb.jpg\",
           \"content\": \"鸡胸脯肉切1.5厘米的丁。炒宫保鸡丁，最好用鸡腿肉，鸡腿肉的口感更好。鸡腿肉不需要腌制，鸡胸肉柴，必须要腌制，否则口感不好。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/7f034851-33d2-4da9-afaa-de027f01b16e.jpg\",
           \"content\": \"腌制鸡丁，放盐巴1克。腌肉，放盐巴，放了盐巴，有渗透压才能把水分逼进肉里。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/8d7d6ba8-11e2-4737-ae11-a026a7fb0a5b.jpg\",
           \"content\": \"调淀粉。红薯淀粉3克，加入20克，搅匀。\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/d45be5dc-f959-447d-ba14-66f48380dcaa.jpg\",
           \"content\": \"把水淀粉分三次打进鸡丁里，每加一次水，使劲揉鸡丁，揉到鸡丁的胶质出来，再加第二次，第三次。\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/00fb2471-fadb-4dba-ad52-3e79e484269b.jpg\",
           \"content\": \"揉到水分完全被鸡丁吃干。\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/0c3b63c5-ecfe-4f58-b85d-8067afa5a48b.jpg\",
           \"content\": \"放黄花园酱油5克，再揉进鸡丁。炒地道传统的川菜，我采用四川的酱油和醋，这样做出来才地道。\",
           \"orderNum\": 11
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/144be0ab-d407-4515-97d3-5987776cf5db.jpg\",
           \"content\": \"揉到看不见水流出来，揉起胶性。\",
           \"orderNum\": 12
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/bce95c05-2ff5-4405-a20a-eb47bbf24163.jpg\",
           \"content\": \"再放鸡蛋清10克。再揉。\",
           \"orderNum\": 13
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/d64ca3d6-5fd9-4294-8529-ae820eebd273.jpg\",
           \"content\": \"等蛋清揉去，最后放熟菜籽油15克。鸡丁腌制的顺序错，只有这样，水才逼里，被封住。如果是鸡腿，就放酱油5克，生粉3克，水20克，料酒5克，揉到鸡腿起胶。水克，水，水，滑油的时候，淀粉汁会掉下来，挂住。\",
           \"orderNum\": 14
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/86d79699-f129-44f7-a3b3-d0396ad48468.jpg\",
           \"content\": \"锅里放熟菜籽油700克。滑鸡丁，鸡丁和油的比例大约1:4，油越多，越省油。滑油，会用到小锅，小锅用到的油更少，容易淹没鸡丁。\",
           \"orderNum\": 15
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/7abff5af-dad6-4bee-bde0-2789ba581974.jpg\",
           \"content\": \"中火，油烧到四成热(150左右，把大葱放进去起小泡，就可以了。\",
           \"orderNum\": 16
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/317a966f-db16-4f53-9e4b-6143fd171dc2.jpg\",
           \"content\": \"把鸡丁倒下去，先不要动，等几秒钟，鸡丁稍微定型，再把鸡丁滑散开，定型即可。这不是炸哦，千万不要理解成炸鸡丁，只是在油中让鸡丁外层包裹的料汁凝固，锁住鸡丁内部的水分。这个时候火不用很大。\",
           \"orderNum\": 17
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/bf397fc4-cf81-405a-9838-d334475fd62a.jpg\",
           \"content\": \"鸡丁滑散，个个颗粒分明，嫩滑如斯，把鸡丁和油一起倒出，滤出油。\",
           \"orderNum\": 18
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/2c9658ce-98ee-4f75-b08e-829d3c9c9012.jpg\",
           \"content\": \"炒锅里放熟菜籽油30克，小火，先下一部分辣椒和花椒，炝炒出辣味，把这部分辣椒花椒铲出来。铲出来的作用是，免得上菜的时候，看见过多的辣椒和花椒粒，影响食用。\",
           \"orderNum\": 19
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/fe4be2d2-20e4-4299-b251-48a665c6ea34.jpg\",
           \"content\": \"再倒姜蒜片，一半的大葱节和剩余的辣椒和花椒。中小火。\",
           \"orderNum\": 20
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/9c3faba3-c508-40a0-ac77-99e39907e512.jpg\",
           \"content\": \"下莴笋丁和鸡丁翻炒。莴笋丁也可以最后和花生米一起下。下莴笋和鸡丁时，把火调大。\",
           \"orderNum\": 21
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/b9f60949-bc88-46da-9934-6eea8ae4188d.jpg\",
           \"content\": \"倒入糖醋汁，迅速炒匀，下另外一半葱。料汁下锅前，一定要再次搅拌均匀，保证糖都融化，淀粉没有沉底。这一步很重要，把糖醋汁炒干，汁水完全黏在每一粒鸡肉丁上面。这个时候，火要大。\",
           \"orderNum\": 22
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/c443ec26-3efa-45a9-95c9-3e044033a0a3.jpg\",
           \"content\": \"最后放花生米出锅，花生米下锅翻炒几下，裹上料汁，马上出锅，不可久炒，炒久了花生米要回软。大火收汁。\",
           \"orderNum\": 23
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/eb6c2eaf-3a78-4cf3-bdf5-82c27eec72e2.jpg\",
           \"content\": \"装盘。炒出来的宫保鸡丁是这个样子。\",
           \"orderNum\": 24
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/bef25329-af1c-47af-92b8-6ce1c6d7cfb6.jpg\",
           \"content\": \"糖醋汁收的好，成菜看起来干爽，不流汁儿。味道不摆了，重新寻找到记忆中的味道了。\",
           \"orderNum\": 25
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/db18a98b-09a3-4755-9634-21d367c05fcd.jpg\",
           \"content\": \"色泽好，味道又巴适，糊辣味，先酸后甜的荔枝味综合在一起，简直是绝味，现在想起来，糖醋莲花白就是这个味型。\",
           \"orderNum\": 26
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/b89508dd-7206-409c-bd2d-6d56170b145a.jpg\",
           \"content\": \"午餐，一盘宫保鸡丁，配一个鸡血粉丝汤，足够了。\",
           \"orderNum\": 27
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/e485e805-bac2-4ef1-affb-04152284a959.jpg\",
           \"content\": \"又开始拌饭了。\",
           \"orderNum\": 28
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/1e9455df-b025-41bb-9736-57e88f99bc51.jpg\",
           \"content\": \"炒的好的宫保鸡丁，吃完只有一点沾盘子底儿的料汁，这样的味道才香浓。一盘菜，又遭吃的干干净净哦！味道好不好，看盘子就晓得咯！\",
           \"orderNum\": 29
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/389b4258-0813-4fe9-a217-4859456cf2f5.jpg\",
           \"content\": \"容易出现的问题：最后收汁的时间不够，糖醋汁没有收干。如果觉着最后下的莴笋丁和大葱，吃到里面没有味道，就是时间没炒够。\",
           \"orderNum\": 30
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/6d7e04c3-12ab-4a91-b119-06f4eba04b5b.jpg\",
           \"content\": \"像这个样子，炒出来盘子里有很多料汁，就不对了。这个菜，糖醋比例是足够的，甚至是恰到好处，汤汁不收干，炒好的菜淡，寡，味道大打折扣。一定要把锅里的汁收干，每一粒食材都被酱料包裹，这样，香味和浓度才够。切记，切记！\",
           \"orderNum\": 31
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/607184c1-5f0f-47aa-8d2e-3aabc5db945d.jpg\",
           \"content\": \"补充一下，醋是这种保宁醋，不是陈醋，也不是香醋哦！\",
           \"orderNum\": 32
         }
       ]', '[
         {
           \"ylName\": \"鸡胸肉\",
           \"ylUnit\": \"173克\"
         },
         {
           \"ylName\": \"鸡胸肉腌制佐料：\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"盐巴\",
           \"ylUnit\": \"1克\"
         },
         {
           \"ylName\": \"红薯淀粉\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"重庆黄花园酱油\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"蛋清\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"熟菜籽油\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"配料\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"大葱节\",
           \"ylUnit\": \"25克\"
         },
         {
           \"ylName\": \"生姜片\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"大蒜片\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"干辣椒\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"红花椒\",
           \"ylUnit\": \"1克\"
         },
         {
           \"ylName\": \"莴笋\",
           \"ylUnit\": \"46克\"
         },
         {
           \"ylName\": \"盐（腌莴笋）\",
           \"ylUnit\": \"0.5克\"
         },
         {
           \"ylName\": \"糖醋碗汁\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"红薯淀粉\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"特级保宁醋\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1克\"
         },
         {
           \"ylName\": \"胡椒粉\",
           \"ylUnit\": \"1克\"
         },
         {
           \"ylName\": \"香酥花生米\",
           \"ylUnit\": \"35克\"
         }
       ]', '[
         2,
         21,
         68,
         70,
         120,
         170
       ]'),
       (110, '贰哥私房菜｜又是一道下饭神器 川菜传统鱼香肉丝',
        'http://static1.showapi.com/app2/img/caipu/20200827/da621d4c-f5e2-45c5-8b17-95cd61c8a66d.jpg',
        'http://static1.showapi.com/app2/img/caipu/20200827/26cf460f-4f0d-471a-a754-3c0cfa1613f2.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/aa040454-a21f-48f0-9bc1-040c362a730e.jpg\",
           \"content\": \"1.猪里肉脊切片后再顺着路纹切丝，\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/c92a3fe1-57d9-45a3-871f-d17ccf369daf.jpg\",
           \"content\": \"2.水发木耳和莴切笋丝。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/568ce5b1-1c85-47dd-98d3-89262217a151.jpg\",
           \"content\": \"3.泡椒剁碎大，蒜和生姜一起碎剁，小切葱成葱花。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/8df92072-966a-43da-b95a-e8217bdfac10.jpg\",
           \"content\": \"4.切好的猪丝肉里放制腌底料的盐生，抽，料酒，蛋清和椒胡粉，后然朝着一个方搅向拌，让肉丝充分吸收料调和水份后，生粉再，拌备匀用。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/eae785c5-7b35-44a9-b1fd-eb2a53d981fe.jpg\",
           \"content\": \"5.将醋糖碗芡里的所调有料混合做成醋糖汁；锅烧里水，水丝耳和莴笋丝，煮30秒捞起滤水份备用。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/838706ae-9f2b-4f24-bc08-2d85105001ed.jpg\",
           \"content\": \"6.将空锅放到灶烧上到轻微冒烟，后然淋一勺冷下去，续持加热时候转动炒锅，让分充润锅，后然将，再重淋新入80克食用。温加热到6成热（160）时，候入，下锅后用子筷将\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/a4991cf5-f134-4dc2-a9e5-cedad3f931a3.jpg\",
           \"content\": \"7.待丝肉变色后入下剁好的姜蓉蒜，豆瓣和泡椒炒至上色。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/2deb6ac9-8633-4bcb-a0c2-ca6b53bf389a.jpg\",
           \"content\": \"8.然后下入焯过水的木耳丝莴和笋丝，翻两炒下，然后将提前备准好的糖碗醋芡搅均拌匀\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/ef6490b9-ca3e-4351-b589-cde3c1d4dd2f.jpg\",
           \"content\": \"淋入内并翻均，匀撒入葱花，再淋一入小勺食油用，匀。\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200827/986c013c-6b04-42e8-bc3f-be82a6217446.jpg\",
           \"content\": \"下饭神器鱼香肉丝搞定，分分钟就着俩碗米饭下肚！PS：学会这个还可以衍生很多鱼香菜系：鱼香茄子、鱼香豆腐、鱼香各种…学会的朋友留言告诉我\",
           \"orderNum\": 10
         }
       ]', '[
         {
           \"ylName\": \"猪里脊\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"泡椒\",
           \"ylUnit\": \"60克\"
         },
         {
           \"ylName\": \"豆瓣\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"生姜（老姜）\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"食用油\",
           \"ylUnit\": \"80克\"
         },
         {
           \"ylName\": \"水‮木发‬耳\",
           \"ylUnit\": \"60克\"
         },
         {
           \"ylName\": \"莴笋\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"小葱\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"2克\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"生粉\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"蛋清\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"胡椒粉\",
           \"ylUnit\": \"1.5克\"
         },
         {
           \"ylName\": \"陈醋\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"15克\"
         }
       ]', '[
         2,
         6,
         8,
         26,
         70,
         120,
         170
       ]'),
       (111, '【正宗川菜】内江特色菜——滑肉', 'http://app2.showapi.com/img/caipu/20200727/9b9e72b0-4340-4552-ad8f-348758d58897.jpg',
        'http://app2.showapi.com/img/caipu/20200727/0aa3ef70-ec39-47d5-884c-e1b33f771dfd.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200727/814d8821-7f52-481c-bc63-54070d8aafb6.jpg\",
           \"content\": \"4根黄瓜切条，肉切小坨\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200727/875fbaee-771b-4ac7-9b51-e5a8ac51377a.jpg\",
           \"content\": \"拿一个大碗，打入一个鸡蛋，切好的猪肉，几粒花椒，姜粒\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200727/9d27a825-7a51-4425-8e3d-328925bae501.jpg\",
           \"content\": \"再加10勺红薯淀粉\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200727/4770d4b3-89ba-45df-9b9c-ffdfa83d231c.jpg\",
           \"content\": \"这是揉之前\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200727/d92f4d33-08ba-4eda-b522-16d12c25f770.jpg\",
           \"content\": \"这是揉之后，这一步揉好后醒10分钟继续揉几分钟\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200727/90af14cd-9a02-43db-af83-0aece4d0ac77.jpg\",
           \"content\": \"锅内放姜块，几粒花椒，加入白玉菇，水烧开后开小火，用手将揉好的肉面团掐入锅中此时不可心急，慢慢来，小心不要烫到自己了。放入后不可立即搅拌，应等几分钟后肉团在锅中成型了再搅拌，否则会破坏形状，同样，中大火也会破坏肉面团的形状。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200727/c8a527f2-434f-43b1-a638-a3f17ac11036.jpg\",
           \"content\": \"刚刚一直是小火，待肉面团煮熟后可开大火，倒入黄瓜和少量水，继续煮\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200727/3c36ce19-6df5-4626-9688-5bcf771d2eea.jpg\",
           \"content\": \"煮好咯，开吃！真的好好吃哦！！\",
           \"orderNum\": 8
         }
       ]', '[
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"一个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"红薯淀粉\",
           \"ylUnit\": \"10勺\"
         },
         {
           \"ylName\": \"花椒\",
           \"ylUnit\": \"10-20粒\"
         },
         {
           \"ylName\": \"猪肉\",
           \"ylUnit\": \"1斤\"
         },
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"4根\"
         },
         {
           \"ylName\": \"白玉菇\",
           \"ylUnit\": \"1两\"
         }
       ]', '[
         2,
         6,
         8,
         25,
         70,
         120,
         170,
         171
       ]'),
       (112, '白菜烧大虾，掌握一个要点就能做好的鲁菜经典',
        'http://app2.showapi.com/img/caipu/20200226/117d3ecd-db75-4f2e-9235-b1cdcecd5cca.jpg',
        'http://app2.showapi.com/img/caipu/20200226/b3795370-6664-43ce-8289-c7d010c20be2.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/94ddad2b-efd1-40e0-88e0-d2107240ef3a.jpg\",
           \"content\": \"虾头剪出，处理虾。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/0cee3e28-bb46-4e9e-b6b7-85301f479bde.jpg\",
           \"content\": \"虾背开刀，挑出虾线\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/48f99af4-9ac5-4a6b-9730-c2e8d450a2e6.jpg\",
           \"content\": \"准备些葱姜末\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/7391979d-ed14-4ebf-8aa2-5b1033ba5caa.jpg\",
           \"content\": \"白菜用手掰断即可\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/16f5e472-cc63-4638-a5bd-6da84d78b206.jpg\",
           \"content\": \"开始制作，锅里热油，下入虾头爆出虾油，这一步非常关键。慢火就可以。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/61263258-414e-4cb2-8481-e966dcdce595.jpg\",
           \"content\": \"虾油爆好后放入大虾，同样是慢火煸炒，让虾油香味更加浓郁。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/6450176e-c75d-434e-96d3-225225fb333b.jpg\",
           \"content\": \"炒到微焦，加入葱姜蒜末，把香气炒出来。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/0e0e3df2-7984-4a37-b897-1b6bf7507fd0.jpg\",
           \"content\": \"再炒多一会儿就可以加入白菜，慢火翻炒，不急着加水。\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/65a4d865-4888-4f92-aecb-4b900aa8300e.jpg\",
           \"content\": \"慢慢煸炒，要点就是不那么早加水。\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/c1a01aea-826c-40a0-add5-978cfe151fe2.jpg\",
           \"content\": \"炒到菜叶变软，加入姜丝和料酒进一步提香。\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/fb17d322-fde1-48c6-9774-7447f83246b1.jpg\",
           \"content\": \"再炒多一会儿再加水进去。不需要加很多的水。不然味道就散了。\",
           \"orderNum\": 11
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/2077b9ce-b66b-48b2-bbe2-82e6ddefd416.jpg\",
           \"content\": \"接下来还是耐心，中火慢炖。让白菜跟虾充分交融。互相成就。\",
           \"orderNum\": 12
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200226/214947c7-fe41-4956-8ee7-740ef552a9a3.jpg\",
           \"content\": \"感觉收水差不多的时候就可以出锅了，水不要收太干哦，也不能太多水，感觉差不多就行。根据自己的喜好加入香菜或是芹菜，也可以不加。\",
           \"orderNum\": 13
         }
       ]', '[
         {
           \"ylName\": \"大虾\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"大白菜或娃娃菜\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"芹菜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"葱姜蒜\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         20,
         70,
         69,
         121,
         171,
         170,
         175
       ]'),
       (113, '好吃到爆的鲁菜版炒菜花南方的朋友可以试试哦',
        'http://app2.showapi.com/img/caipu/20191010/4c387195-3d64-45a0-a6a6-2e744d3f6882.jpg',
        'http://app2.showapi.com/img/caipu/20191010/0d38c2b0-8bd8-4839-83c2-d345110f3d5b.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20191010/68e38333-3031-49c7-b52f-f3a402b9f1e9.jpg\",
           \"content\": \"肉和蒜都切片备用\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20191010/d44f2ce9-83b6-4231-81df-22a9465949a2.jpg\",
           \"content\": \"木耳提前泡好，红萝卜切成菱形片，连同菜花一起装盘备用\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20191010/6d4d07e9-3ff6-4b08-8257-10affc6cc8f8.jpg\",
           \"content\": \"地瓜粉加四五汤勺水调好备用\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20191010/39812f25-e77d-4355-87f2-9176f9570942.jpg\",
           \"content\": \"油热之后放蒜片爆香，加入肉片，翻炒均匀后放一勺糖，五六勺味极鲜，五六勺醋，翻炒均匀，大约是这么大的勺子然后加入菜花，木耳，红萝卜翻炒，炒熟后加适量盐，之前加入的味极鲜已经很多了，放一点点盐就可以了，没数的亲们可以尝一下咸淡，出锅前加入调好的地瓜粉收汁就可以啦\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20191010/162fb974-fbdc-4373-90b5-fca50e5da776.jpg\",
           \"content\": \"酸酸甜甜的鱼香口味哦\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"两三瓣\"
         },
         {
           \"ylName\": \"菜花\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"红萝卜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"木耳\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"猪肉\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"一大勺\"
         },
         {
           \"ylName\": \"醋\",
           \"ylUnit\": \"五六大勺\"
         },
         {
           \"ylName\": \"味极鲜\",
           \"ylUnit\": \"五六大勺\"
         },
         {
           \"ylName\": \"食盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"地瓜粉\",
           \"ylUnit\": \"半勺\"
         }
       ]', '[
         2,
         24,
         70,
         121,
         171
       ]'),
       (114, '鲁菜香椿豆腐', 'http://app2.showapi.com/img/caipuImg2/201611072351/1478533892436578_largeImg.jpg',
        'http://app2.showapi.com/img/caipuImg2/201611072351/1478533892743469_smallImg.jpg', '[
         {
           \"imgUrl\": \"\",
           \"content\": \"豆腐切小块，开锅过水，捞出，小凉一会。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipuImg2/201611072351/1478533892124601_2.jpg\",
           \"content\": \"豆腐放在盘里，放上切碎了的香椿，香油。即可，清淡，爽口。\",
           \"orderNum\": 2
         }
       ]', '[
         {
           \"ylName\": \"豆腐\",
           \"ylUnit\": \"一块\"
         },
         {
           \"ylName\": \"香椿\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         6,
         9,
         75,
         121
       ]'),
       (115, '鲁菜02《醋溜白菜》', 'http://app2.showapi.com/img/caipu/20190110/f7b6d6ce-b375-4cd1-a5c5-80150015e195.jpg',
        'http://app2.showapi.com/img/caipu/20190110/a539926f-a21c-4b17-8cd3-2f307f554076.jpg', '[
         {
           \"imgUrl\": \"\",
           \"content\": \"切白菜菜叶和菜帮分开，菜帮用刀轻拍几下，斜刀切片，菜叶手撕成块。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"炒白菜锅内放底油先放入菜帮，待水分挥发后，菜帮呈透明状。再放入菜叶炒至断生。盛出待用。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"炝锅锅中放适量油四成热分别下入干红椒，葱花姜片蒜片爆出香味。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"调味加入碗汁盐三克糖十克鸡精两克，酱油十克，醋30克。料酒5g.\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"勾芡勾入水淀粉30克，待汤汁收紧，加入白菜翻拌均匀，淋香油出锅。\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"白菜\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"干红椒\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"葱姜蒜\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"醋\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"鸡精\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"\"
         }
       ]', '[
         2,
         4,
         24,
         25,
         70,
         121,
         138,
         171
       ]'),
       (116, '上汤娃娃菜，入门粤菜，全网最鲜',
        'http://static1.showapi.com/app2/img/caipu/20210223/007ec09d-0113-429d-bb5f-72c36bae2d4d.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/3b84c82f-1abc-45db-a2f2-194e93484d1a.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/5e5129ed-3ac8-4d03-b34b-ec0012bbf68e.jpg\",
           \"content\": \"备料。咸鸭蛋、皮蛋各一个，以及火腿切块\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/81a4d6b7-282c-424a-b27d-46b2d4a3ce4c.jpg\",
           \"content\": \"洗菜。娃娃菜洗净\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/72f48a9e-4756-4ded-a915-0b049c103d8f.jpg\",
           \"content\": \"配菜。可以来点儿蘑菇\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/2bde0081-afb9-4d8a-9c0d-43cb8e8fc984.jpg\",
           \"content\": \"炒菜。冷锅冷油，姜蒜爆香，加入鸭蛋和火腿\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/325be9d2-3b07-4c3e-88e9-135049fded0e.jpg\",
           \"content\": \"添水。炒出香味儿后，加入水，水开后，加入娃娃菜\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/d69b0a3b-d47e-4a7c-b9da-51a49ada9d96.jpg\",
           \"content\": \"煮菜。加入鸡精、胡椒、盐。盖盖煮三分钟即可\",
           \"orderNum\": 6
         }
       ]', '[
         {
           \"ylName\": \"娃娃菜\",
           \"ylUnit\": \"1颗\"
         },
         {
           \"ylName\": \"咸鸭蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"皮蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"火腿肠\",
           \"ylUnit\": \"半根\"
         }
       ]', '[
         2,
         6,
         70,
         71,
         122,
         171
       ]'),
       (117, '【简单一顿】粤菜·杂锦番茄汤',
        'http://static1.showapi.com/app2/img/caipu/20201218/c789c343-776c-4ccc-a54d-0e9e96c26624.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201218/5bd25e23-d812-420b-b469-8b0e634d2b13.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/d80108e2-a753-4c90-a6ad-6fad29e4d1d1.jpg\",
           \"content\": \"巴沙鱼，解冻，切片，厚一点，不然容易碎。加入姜丝盐酱油胡椒粉鸡精油，抓一下，再加一勺薯粉！（无论什么肉，加了薯粉滚汤更滑）腌制一小时，出门买菜。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/b257c9ab-9931-411f-b2bf-2346f05b1a92.jpg\",
           \"content\": \"意外买回来鱼泡，洗干净，剁一下漏气。姜丝酱油盐油胡椒鸡精，抓一下腌制备用。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/911f349a-ac6a-4530-b519-17bca5af5a39.jpg\",
           \"content\": \"素菜准备\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/73deb136-18ec-4420-9d91-17ee235abc88.jpg\",
           \"content\": \"番茄剁碎\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/a75997aa-2615-40bd-b16f-42dd98b4e9a1.jpg\",
           \"content\": \"切菇\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/df380643-90b0-4c27-a3b2-6a526e0a68cc.jpg\",
           \"content\": \"辣椒酱是买潮汕米果送的，味道不错，你们也可以下自己喜欢的，老干妈也行。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/fb83c58d-5b93-49d6-8bb1-936c07e8a4ff.jpg\",
           \"content\": \"蒜蓉爆香，放进番茄，炒出汁。加入番茄酱辣椒酱和滚水。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/3c50a516-37fe-4d52-97a6-161b7981696e.jpg\",
           \"content\": \"煮沸了加入菇类，煮一会儿\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/6ab412ab-bb0c-4668-a9b5-826a94b0f378.jpg\",
           \"content\": \"加入鱼片，不要急着搅拌。\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/75e85f65-a6ed-4d67-8b1d-0a6988887dcf.jpg\",
           \"content\": \"沸腾后，加入鱼泡，尝尝味道，根据口味加点调料，轻轻拌一下盖锅。\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/5658b1d2-297a-4109-bf26-32dcea9b4d15.jpg\",
           \"content\": \"三分钟后，收汁得不错，撒上葱花和胡椒粉。\",
           \"orderNum\": 11
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/10fd33b9-9337-4b47-a364-5da36214595b.jpg\",
           \"content\": \"可口鲜嫩\",
           \"orderNum\": 12
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201218/37cc8837-e950-427f-b22b-f1adc122855f.jpg\",
           \"content\": \"爽口软糯\",
           \"orderNum\": 13
         }
       ]', '[
         {
           \"ylName\": \"巴沙鱼\",
           \"ylUnit\": \"375克\"
         },
         {
           \"ylName\": \"鱼泡\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"香菇\",
           \"ylUnit\": \"3只\"
         },
         {
           \"ylName\": \"鸡腿菇\",
           \"ylUnit\": \"1只\"
         },
         {
           \"ylName\": \"平菇\",
           \"ylUnit\": \"1把\"
         },
         {
           \"ylName\": \"西红柿\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"番茄酱\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"辣椒酱\",
           \"ylUnit\": \"1勺\"
         }
       ]', '[
         2,
         6,
         68,
         70,
         71,
         99,
         122,
         170,
         171,
         175,
         202,
         26
       ]'),
       (118, '经典粤菜材料豆豉鲮鱼的不同吃法——五彩鲮鱼球',
        'http://static1.showapi.com/app2/img/caipu/20201021/ffea9ba6-5b66-4e47-abc3-e5248e0fdb2c.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201021/3f37d3db-a540-4877-8d61-d88216c1eae1.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201021/f3605d0e-4b7d-4317-b51d-58a7ae3ba156.jpg\",
           \"content\": \"准备好如图的材料；\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201021/69579a35-a96a-417a-a331-650e6cc6c00c.jpg\",
           \"content\": \"胡萝卜和菜花切碎；\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201021/b8624816-ad1a-469e-8cf1-0b8578ce42a7.jpg\",
           \"content\": \"放进绞肉机把他们混合搅碎（别问为什么我要切碎后才放进绞肉机，问就是我想要绞肉机的寿命长一些哈哈哈）；\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201021/e80cfcf2-e852-4ec9-94f5-5196f848fa4e.jpg\",
           \"content\": \"锅内加入豆豉鲮鱼和菜料炒熟；\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201021/e6553928-0aed-4393-923d-0f3d44940906.jpg\",
           \"content\": \"米饭加入芝麻海苔；\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201021/652e37bd-658b-40b4-a1da-b2ce5fdc0adb.jpg\",
           \"content\": \"和豆豉鲮鱼馅料一起搅拌均匀；\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201021/f75bcc3e-b9e7-4016-8039-55dd0ce4465d.jpg\",
           \"content\": \"捏成几个小球，撒上一些肉松，大人小孩都很爱吃这款。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201021/60ad7e5c-8cef-41eb-87a0-6c3ae4a8db20.jpg\",
           \"content\": \"看上去是不是也觉得很美味咧\",
           \"orderNum\": 8
         }
       ]', '[
         {
           \"ylName\": \"鱼家香豆豉鲮鱼罐头\",
           \"ylUnit\": \"1罐\"
         },
         {
           \"ylName\": \"胡萝卜\",
           \"ylUnit\": \"半根\"
         },
         {
           \"ylName\": \"肉松\",
           \"ylUnit\": \"20g\"
         },
         {
           \"ylName\": \"花菜\",
           \"ylUnit\": \"1节\"
         },
         {
           \"ylName\": \"芝麻海苔\",
           \"ylUnit\": \"20g\"
         },
         {
           \"ylName\": \"米饭\",
           \"ylUnit\": \"1碗\"
         }
       ]', '[
         2,
         6,
         70,
         122,
         171,
         175
       ]'),
       (119, '《粤菜大师》客家酿三宝',
        'http://static1.showapi.com/app2/img/caipu/20201015/4f4101f3-a9bb-42c5-b88b-b1874c346df4.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201015/7a2af43a-9675-44a6-ab31-e29b0c4e980f.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/ff299bbf-f87c-4df6-b44d-029962ea67f1.jpg\",
           \"content\": \"将五花肉去皮、切丁\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/ae2d2aae-6dbc-4b13-875c-59502841baf9.jpg\",
           \"content\": \"将去皮的五花肉制成肉馅\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/bb6382fc-98e6-4ba4-be87-6a43815d2b28.jpg\",
           \"content\": \"加入调料制作肉馅\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/3f8d3877-8683-48a4-99f4-adb1341e9ae9.jpg\",
           \"content\": \"将豆腐、青椒、苦瓜开口，塞入肉馅\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/b72eec24-3440-41ba-a87f-4e841c9ea038.jpg\",
           \"content\": \"将有肉馅的一面放到锅中煎至金黄\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/3032227e-582d-4bca-9366-77c22f9a1532.jpg\",
           \"content\": \"香喷喷的酿三宝就出锅啦\",
           \"orderNum\": 6
         }
       ]', '[
         {
           \"ylName\": \"苦瓜\",
           \"ylUnit\": \"根\"
         },
         {
           \"ylName\": \"豆腐\",
           \"ylUnit\": \"块\"
         },
         {
           \"ylName\": \"青椒\",
           \"ylUnit\": \"只\"
         },
         {
           \"ylName\": \"五花肉\",
           \"ylUnit\": \"斤\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"勺\"
         },
         {
           \"ylName\": \"胡椒粉\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"勺\"
         },
         {
           \"ylName\": \"花生油\",
           \"ylUnit\": \"勺\"
         }
       ]', '[
         2,
         6,
         73,
         122,
         170
       ]'),
       (120, '【经典闽菜】荔枝肉', 'http://app2.showapi.com/img/caipu/20200809/e58535bc-1849-4bc2-a34f-933a1a5a0e19.jpg',
        'http://app2.showapi.com/img/caipu/20200809/c5e8694a-03a6-4c01-a231-03ac54e2dcd2.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/2706cd5c-621a-4e21-a9e8-3346f164bb6a.jpg\",
           \"content\": \"瘦肉切薄片，大小尽量一致，这样炸的时候火候比较好把握。加一勺生抽、一勺料酒、一点点蒜末、一勺淀粉，抓匀，腌制半小时左右就行。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/175fc12e-2e03-48ad-a243-3619ddcc0aad.jpg\",
           \"content\": \"土豆切块，注意和肉的大小相仿。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/b70f0943-8bd6-47f3-933c-15fd99a00a93.jpg\",
           \"content\": \"锅里放油加热，用中小火开始炸土豆和肉。注意尽量不要有水分，否则油锅一直砰砰砰。开始时食材表面冒很多气泡，等到气泡不多的时候也就是差不多炸好的时候了。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/bfad4b62-bf83-4114-997b-7ab037b8daa7.jpg\",
           \"content\": \"第一遍炸完捞出，让它晾一下，这时候可以炸一遍肉。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/cd0af902-f6a0-43eb-a592-966bfcc2b692.jpg\",
           \"content\": \"炸肉的时候注意不要一股脑倒进去，最好一片一片往里放，这样肉片不会叠在一起，用漏勺把它们搅均匀。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/79313ea3-2db0-4807-b388-b0a9648ad59a.jpg\",
           \"content\": \"土豆和肉片炸完一遍以后再复炸一下，这样肉比较酥，颜色又比较好看。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/708afac4-d9e0-475c-9604-4e30777fb05a.jpg\",
           \"content\": \"这时候准备勾芡的汁：2勺生抽、2勺醋、1勺料酒、1勺白糖、1勺盐、2勺淀粉，搅匀。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/264c9b49-9db5-49d8-a9aa-971e251f70d5.jpg\",
           \"content\": \"切蒜末。\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/b4fd8a09-7aff-4ab4-b4ae-5963df15a8d5.jpg\",
           \"content\": \"锅里留少量油，加蒜末炒香。倒入勾芡汁，搅一搅，至芡汁粘稠并均匀的冒泡泡。\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/30f2885c-4a83-4a6f-836a-f1c652cc3d49.jpg\",
           \"content\": \"倒入炸好的土豆和肉片，搅拌，食材上均匀的沾上芡汁。\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200809/ef91f85d-fb48-41ff-b704-beca756cc1f5.jpg\",
           \"content\": \"酸甜口的荔枝肉就做好啦！家里有小葱的话还可以切点葱花点缀。\",
           \"orderNum\": 11
         }
       ]', '[
         {
           \"ylName\": \"瘦肉\",
           \"ylUnit\": \"300克\"
         },
         {
           \"ylName\": \"土豆\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"4勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"5瓣\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"3勺\"
         }
       ]', '[
         2,
         24,
         67,
         123,
         170
       ]'),
       (121, '【闽菜荔枝肉番外版】蒜香糖醋排骨', 'http://app2.showapi.com/img/caipu/20200527/c35e03af-3900-4d82-85b2-9ab68f3239b6.jpg',
        'http://app2.showapi.com/img/caipu/20200527/3596a353-1228-471c-a151-855e22c57191.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/0f0b3be6-c266-4af1-85d7-9190f359d685.jpg\",
           \"content\": \"地瓜粉用保鲜袋装好，碾细。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/6faa8c5a-77a1-411c-884e-39c3530a12ae.jpg\",
           \"content\": \"排骨洗净，泡水15分钟去除血水。打一个蛋取蛋清部分，倒入排骨混合，再一起倒入地瓜粉。忽略图片，不要将蛋清先打入地瓜粉。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/2428692f-9368-41e9-ac86-57f0bcd3fae9.jpg\",
           \"content\": \"裹好地瓜粉的排骨们。挂粉有点失败，应该更多才好。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/6ef05a80-fa6a-4452-9def-089e33826719.jpg\",
           \"content\": \"油锅烧热，到微微冒泡。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/24e8b6c3-b4bd-456c-ba35-61d42078fc92.jpg\",
           \"content\": \"下入排骨转小火炸。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/1ba60af4-956e-43f9-95d1-a9b93a0d2957.jpg\",
           \"content\": \"这时候拿一口有盖子的小锅或者饭盒，调好酱汁。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/b8f485ca-6601-497c-b24e-98b320f5f1b0.jpg\",
           \"content\": \"捞出，沥干。放到一边。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/36265419-9e11-4b56-82d3-8d38b31b222b.jpg\",
           \"content\": \"放凉后再倒入复炸。\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/e3105855-e67b-4383-8632-471301c32537.jpg\",
           \"content\": \"将复炸后的排骨倒入。盖上盖子，充分晃动1分钟。\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200527/5eebbdb4-9802-443b-84e8-ab6adb136a71.jpg\",
           \"content\": \"出锅\",
           \"orderNum\": 10
         }
       ]', '[
         {
           \"ylName\": \"排骨\",
           \"ylUnit\": \"300克\"
         },
         {
           \"ylName\": \"花生油\",
           \"ylUnit\": \"很多\"
         },
         {
           \"ylName\": \"地瓜粉\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"0.5勺\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"半个\"
         },
         {
           \"ylName\": \"陈醋\",
           \"ylUnit\": \"1.5勺\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"1.5勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1.5勺\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"0.5勺\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"葱\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"香菜\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         2,
         24,
         67,
         123,
         170
       ]'),
       (122, '闽菜：腊肉芋头饭——安利皇后锅具', 'http://app2.showapi.com/img/caipu/20190705/ac1eacf3-a30b-4ed0-a758-60f12688ec36.jpg',
        'http://app2.showapi.com/img/caipu/20190705/4d60a358-facf-4761-903f-25a2a3573bf9.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190705/bae9770a-9ffd-43db-af65-5a16e8834872.jpg\",
           \"content\": \"所有食材备好，荔浦芋头切块，腊肉、广式香肠、胡萝卜、香菇切片备用。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190705/d5c4f0a9-eeed-46fc-a5af-91da0d67d98a.jpg\",
           \"content\": \"大米淘洗干净后，用纯净水浸泡30分钟-1小时，使用前沥干水分。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190705/86b10443-77be-421f-bc2e-e75fccebbef8.jpg\",
           \"content\": \"安利皇后2升钢锅预热后，安利皇后，放腊肉和香肠，中火煸炒直至腊肉和香肠出。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190705/58166b60-c30c-4c6f-b74e-0a4d48a7a3d4.jpg\",
           \"content\": \"放入胡萝卜、香菇、青甜椒、红甜椒、姜片和大蒜，翻炒均匀，最后加入芋头块、生抽、盐和白胡椒粉继续翻炒。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190705/6489487c-9f35-4c03-8358-5c22edc6ec86.jpg\",
           \"content\": \"将泡好的大米沥干水分放入2升钢锅中，将炒好的馅料放在大米上，加水盖上锅盖。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190705/3b294060-8b12-41eb-8eb5-3ddc998e61af.jpg\",
           \"content\": \"大火煮沸至产生蒸汽锁后，转小火焖煮25分钟即可\",
           \"orderNum\": 6
         }
       ]', '[
         {
           \"ylName\": \"大米\",
           \"ylUnit\": \"340g\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"360g\"
         },
         {
           \"ylName\": \"荔浦芋头\",
           \"ylUnit\": \"200g\"
         },
         {
           \"ylName\": \"腊肉\",
           \"ylUnit\": \"95g\"
         },
         {
           \"ylName\": \"广式香肠\",
           \"ylUnit\": \"75g\"
         },
         {
           \"ylName\": \"胡萝卜\",
           \"ylUnit\": \"40g\"
         },
         {
           \"ylName\": \"香菇\",
           \"ylUnit\": \"70g\"
         },
         {
           \"ylName\": \"青甜椒\",
           \"ylUnit\": \"20g\"
         },
         {
           \"ylName\": \"红甜椒\",
           \"ylUnit\": \"20g\"
         },
         {
           \"ylName\": \"姜片\",
           \"ylUnit\": \"20g\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"2瓣\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"30g\"
         },
         {
           \"ylName\": \"白胡椒粉\",
           \"ylUnit\": \"3g\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"4g\"
         },
         {
           \"ylName\": \"安利皇后特级初榨橄榄油\",
           \"ylUnit\": \"15g\"
         }
       ]', '[
         1,
         6,
         70,
         71,
         102,
         123,
         170,
         171
       ]'),
       (123, '闽菜醋肉炒青椒', 'http://app2.showapi.com/img/caipu/20190418/15a0c9a5-97f8-4ff5-9bf8-9ed5f07b4253.jpg',
        'http://app2.showapi.com/img/caipu/20190418/09d00fb8-88d8-42f4-997e-a94b0b7ff953.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190418/e0d236db-a1f5-4b4b-917a-26fc01c7c11f.jpg\",
           \"content\": \"洗切，关于青椒的切法呢，我还是喜欢这种大长条瘦肉切完后放入姜末、盐、揉捏一番，可以先放个十几分钟，让它们入味！\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190418/d6334bdf-efa9-45cf-97e7-51267150e1ec.jpg\",
           \"content\": \"临开火前，放去地瓜粉，用手再揉捏一番\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190418/526aa7db-d173-43ad-87de-c8f3c5cb86ce.jpg\",
           \"content\": \"揉捏要就是这样了\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190418/2a677031-0121-4da3-a614-29a1ad2555ed.jpg\",
           \"content\": \"放入花生油，小火，小炒，变金黄色后放入些许醋，如果你重口味的话，在准备环节拌的时候就可以放醋了！\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190418/50576d58-511e-4bdd-b50a-fef4012b8cb6.jpg\",
           \"content\": \"十分钟后可以先起锅，重点是火要小些，或者容易糊\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190418/a05cd55b-b698-4e4b-98de-debf1b2448f5.jpg\",
           \"content\": \"然后就是炒青椒了，忘记说了，刚炒肉的时候有很多油，可以倒出来炒青椒，既入味又不油腻\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20190418/d0561a77-54ff-49c0-82a2-227de9b274ea.jpg\",
           \"content\": \"青椒炒快熟后，把已经炒好的揉放进去一起炒两分钟，就可以起锅了！\",
           \"orderNum\": 7
         }
       ]', '[
         {
           \"ylName\": \"青椒\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少于克\"
         },
         {
           \"ylName\": \"瘦肉\",
           \"ylUnit\": \"300克\"
         },
         {
           \"ylName\": \"地瓜粉\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"3片\"
         }
       ]', '[
         2,
         6,
         70,
         123,
         170,
         171
       ]'),
       (124, '东坡肉', 'http://static1.showapi.com/app2/img/caipu/20201230/2348514b-1a14-4a66-85a8-aa54eee68d0b.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201230/9ba8153b-de47-4d02-9dbd-615f1783d478.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201230/b8570241-4271-4b39-82cb-e3c711d9b02a.jpg\",
           \"content\": \"1.将前臀尖梅花肉部分切成两大块。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201230/4209b053-33de-4932-929d-0daecb9a5c0a.jpg\",
           \"content\": \"2.准备调料。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201230/8acde377-2ecd-44d3-8274-f0069448424d.jpg\",
           \"content\": \"3.将肉冷水下锅煮开，撇去浮沫，小火再煮7分钟。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201230/e31467d4-ed24-43ad-b623-d01a9c11fbed.jpg\",
           \"content\": \"4.将锅中倒少许油肉皮用小火烙至金黄色。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201230/f1a1c570-600e-4848-a431-17a9277093ef.jpg\",
           \"content\": \"5.烙好的肉备用。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201230/09f7932e-5665-4b14-b42d-adae641a4b50.jpg\",
           \"content\": \"6.准备砂锅放入竹笪，调料码入肉。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201230/6a868df0-0fe2-45ac-b281-2633e9f8dbce.jpg\",
           \"content\": \"7.将锅中放入20克水30克冰糖，煸至褐色倒入够量开水，烧烤后倒入砂锅中，抹过肉即可。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201230/4274fae0-2a49-4510-9049-9d465c7329d1.jpg\",
           \"content\": \"8.将锅肉烧开，煮1.5时，加入5克盐，再煮1.5时，再开大收汁即可。\",
           \"orderNum\": 8
         }
       ]', '[
         {
           \"ylName\": \"前臀尖\",
           \"ylUnit\": \"800克\"
         },
         {
           \"ylName\": \"葱\",
           \"ylUnit\": \"4段\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"5片\"
         },
         {
           \"ylName\": \"冰糖\",
           \"ylUnit\": \"80克\"
         },
         {
           \"ylName\": \"黄酒\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"小茴香\",
           \"ylUnit\": \"1小把\"
         },
         {
           \"ylName\": \"甘草\",
           \"ylUnit\": \"5片\"
         },
         {
           \"ylName\": \"大料\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"桂皮\",
           \"ylUnit\": \"1块\"
         },
         {
           \"ylName\": \"花椒\",
           \"ylUnit\": \"20粒\"
         },
         {
           \"ylName\": \"枣\",
           \"ylUnit\": \"6颗\"
         },
         {
           \"ylName\": \"山楂\",
           \"ylUnit\": \"2个\"
         }
       ]', '[
         2,
         6,
         72,
         73,
         124,
         170
       ]'),
       (125, '五香熏鱼', 'http://static1.showapi.com/app2/img/caipu/20210223/07dd65a3-19ca-4ba9-9969-5f7f3cebcce2.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/4bc64d6e-8dd5-4f49-803a-97416d74f1d7.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/8cdbdfc9-b000-4b83-9639-67625f066a17.jpg\",
           \"content\": \"熏鱼用青鱼或者草鱼做出来比较好吃，偶尔用花鲢也没有问题，对鱼的要求并不是特别高，蟹姐今天用草鱼，买鱼的时候让店家把鱼杀好，加家清洗之后片下两片鱼肉，鱼骨可以另做它用，加上豆腐烧盘菜也非常好呢。鱼肉切成厚一厘米的鱼块。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/88b25242-b69f-4a3d-ac6f-a5f87efe82f8.jpg\",
           \"content\": \"鱼块放在大盆中，加姜片葱段、料酒、生抽和盐抓均匀腌几小时入味。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/a553e888-44ec-4c77-923c-b2c59f47b255.jpg\",
           \"content\": \"腌鱼的时候，我们可以把酱汁准备好，香料加入清水中先泡出香味，然后上火煮沸，煮几分钟。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/088601d9-80c2-4e42-92bc-7e7bac95b745.jpg\",
           \"content\": \"把香料捞出来，往锅中加入麦芽糖200克、冰糖120克、生抽60克、老抽20克、蚝油40克，大火煮沸，转小火煮半小时以上，把酱汁煮到有点稠度就可以关火了，开盖煮方便散水气。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/26a31e00-22bf-4a2b-9756-23106f1bf802.jpg\",
           \"content\": \"煮好的酱汁放凉备用，可以放冰箱冷藏备用。一时用不完，可以密封冷藏保存，吃的时候煮开再煮开放凉。一周之内使用没有问题。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/7f2ddc58-6f3b-41a3-9f00-d83210c82803.jpg\",
           \"content\": \"鱼块腌好之后，用厨房纸巾或者厨房专用毛巾吸掉鱼块表面水分，这一步不能省，否则下锅很容易爆锅。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/efe13272-9838-41e2-ade1-a36086eaefd5.jpg\",
           \"content\": \"坐锅倒油烧热，炸鱼块的油温要稍高些，可以先把筷子放油锅里试一下，筷子周围有大量汽泡出现，如果下一小块食物，油锅中反应比较剧烈，这种情况就可以下料了。做熏鱼的鱼块不拍粉不挂糊，一次不能炸太多，防止鱼块全都粘在一起。如果发现油锅中下入的鱼块不多，鱼块间有轻微粘边，不用理会，炸好后出锅用筷子动一动就分开了。鱼块下锅的时候用大火，变色定型后用中火，鱼块炸到颜色变深表面变干后出锅。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/812bb200-0e21-4ce4-b048-38910df1ba31.jpg\",
           \"content\": \"把之前备好且已经完全冷透的酱汁均匀浇在炸好的鱼块上面，香喷喷的鱼块就做好了。味道和口感都特别棒。\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/416e566c-1712-4787-afaf-d228771fcbdc.jpg\",
           \"content\": \"如果一次炸了很多鱼块，不必全都浇汁，单独保存鱼块更方便一些，吃的时候用平底锅把鱼块煎透，再浇上冷汁，跟新出锅的鱼块风味非常接近，在家宴客的时候上一盘，简单又方便。\",
           \"orderNum\": 9
         }
       ]', '[
         {
           \"ylName\": \"草鱼\",
           \"ylUnit\": \"3000克\"
         },
         {
           \"ylName\": \"葱姜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"香叶\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"八角\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"桂皮\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"花椒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"草蔻\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"香茅\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"麦芽糖\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"冰糖\",
           \"ylUnit\": \"120克\"
         },
         {
           \"ylName\": \"清水\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"60克\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"40克\"
         }
       ]', '[
         2,
         6,
         20,
         67,
         68,
         71,
         170,
         175
       ]'),
       (126, '苏式熏鱼', 'http://static1.showapi.com/app2/img/caipu/20210223/908a8190-2ebe-4bda-a9b1-51568de3acf2.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210223/4fac304a-86e1-456f-a4fc-e91d74043e1c.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/47d413b0-18e3-4406-83c0-cfe75bc5de8e.jpg\",
           \"content\": \"大青鱼一条，去掉鱼肠鱼腮\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/f27e2fc0-0a5e-425a-9393-af213f59b334.jpg\",
           \"content\": \"不用洗，头尾切掉，中间破开。头尾可以用来煲汤\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/49d45d87-3acd-403b-b080-819e7fae42f1.jpg\",
           \"content\": \"切成2厘米厚的鱼块\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/a66b9e09-6d45-4cd6-9d07-74f2480b9ac8.jpg\",
           \"content\": \"加入部分葱段、姜片、少许盐和料酒，腌制2小时，不能太久，不然就成腌鱼了\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/97a76842-f4db-48a9-89a1-e3b25d1f072b.jpg\",
           \"content\": \"腌鱼的空档做卤汁，葱段、姜片、老抽、生抽、蚝油、料酒、香醋调汁备用。八角香叶桂皮放入水中煮15分钟，捞出，将调好的酱汁和冰糖放入水中大火煮开，中小火继续熬煮收至一半的量，放入蜂蜜，煮开后过滤晾凉\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/0ffe9f66-1089-4449-a393-804bef03a88e.jpg\",
           \"content\": \"腌好的鱼洗净沥干水份\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/bb6a75d0-5366-4670-84af-683a5a9841bd.jpg\",
           \"content\": \"根据锅的大小，放入适量的鱼块分批炸至金黄色\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/3bc9cb76-2569-4029-854d-c62989eddac5.jpg\",
           \"content\": \"捞出浸泡在事先准备好的卤汁中，再炸第二批，第二批炸好，将卤汁中第一批的鱼捞起来，放入第二批出锅的鱼，依次做完\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/09008aee-0607-432e-b543-f0b1f2f8db64.jpg\",
           \"content\": \"成品\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/ec413ff1-023b-4bf2-b365-bc6e8fe84326.jpg\",
           \"content\": \"切下来的头尾（不腌）炸一下用来煲汤也是极好的\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210223/8cca10f2-773f-4292-8b46-88ce8d079f80.jpg\",
           \"content\": \"趁着热油和卤汁，又卤了一锅素鸡\",
           \"orderNum\": 11
         }
       ]', '[
         {
           \"ylName\": \"青鱼\",
           \"ylUnit\": \"5斤左右\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"一点点\"
         },
         {
           \"ylName\": \"葱段\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"姜片\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"1400克\"
         },
         {
           \"ylName\": \"八角\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"香叶\",
           \"ylUnit\": \"2片\"
         },
         {
           \"ylName\": \"桂皮\",
           \"ylUnit\": \"一小块\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"40克\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"香醋\",
           \"ylUnit\": \"30ml\"
         },
         {
           \"ylName\": \"冰糖\",
           \"ylUnit\": \"150克\"
         },
         {
           \"ylName\": \"蜂蜜\",
           \"ylUnit\": \"2勺\"
         }
       ]', '[
         2,
         6,
         20,
         67,
         68,
         124,
         170,
         175
       ]'),
       (127, '茶香与鲜的完美融合|龙井虾仁',
        'http://static1.showapi.com/app2/img/caipu/20201216/295bae35-97be-4204-b870-acd57579e973.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201216/d0598ad2-d34e-4353-89fa-050485cedf31.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/4e276c82-e5fc-4cb2-9eab-e76f1e054380.jpg\",
           \"content\": \"食材大集合\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/e9ff2f7d-6505-47ac-a7fa-87d1beab74bc.jpg\",
           \"content\": \"虾仁洗净，擦干水分。加料酒，姜汁，白胡椒粉，少许盐抓匀。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/62ee7595-141e-4fc6-ba50-a39e5efc123d.jpg\",
           \"content\": \"之后加入生粉继续抓匀。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/13845b85-6b7a-4d65-9914-9b3eb11b078a.jpg\",
           \"content\": \"然后放一大勺的金龙鱼阳光葵花仁油拌匀，这一勺油不但可以锁鲜锁水，增加香气，还能让炒制的时候不易粘锅\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/5f4f61fb-7762-4561-9cac-0c384c637535.jpg\",
           \"content\": \"虾仁腌制的时间，我们泡个龙井茶，3克茶叶大约用50克左右的热水，泡浓一些，好出味。泡好之后把茶汤篦出来，茶叶留一小撮备用。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/ec4374d4-8115-4dff-81a6-57f8ca0c40fc.jpg\",
           \"content\": \"上好浆的虾仁沥干，腌制时候汤水之类的弃用。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/8c9585f1-8011-4539-afdb-b8c66b60a085.jpg\",
           \"content\": \"锅中倒稍多一些的金龙鱼阳光葵花仁油，大约50ml。龙井虾仁需要快速滑散不粘连，并且需要油分锁住鲜嫩口感。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/813e657b-afa4-4d93-bb6c-07ca802e95ee.jpg\",
           \"content\": \"油温不用太高，用中火加热就可以了，油温热之后放虾仁快速滑散，虾仁开始变成可可爱爱的橘粉色\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/5e5172c2-9e16-465e-bd07-25d033c09daf.jpg\",
           \"content\": \"虾仁变色后转大火，烹入料酒，晃几下锅。\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/ab68553a-fff2-4b29-bc7b-47c73875be18.jpg\",
           \"content\": \"接着倒茶汤。\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/bde99779-a767-4614-b0ab-2a468bbcbaa6.jpg\",
           \"content\": \"加一撮泡好的茶叶一同翻炒。\",
           \"orderNum\": 11
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/377c1396-719e-4346-a4fe-14e4bcff486c.jpg\",
           \"content\": \"汤汁快要收干的时候加少许盐调味\",
           \"orderNum\": 12
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/23f41e46-371c-4124-a39e-c86463b2fdf2.jpg\",
           \"content\": \"出锅前加一点金龙鱼阳光葵花仁油，翻炒几下，让虾仁裹上清亮的色泽。\",
           \"orderNum\": 13
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/e3d91e09-c9a4-44c6-a833-3a7c2dc766e3.jpg\",
           \"content\": \"清爽又清淡的龙井虾仁就做好了\",
           \"orderNum\": 14
         }
       ]', '[
         {
           \"ylName\": \"金龙鱼阳光葵花仁油\",
           \"ylUnit\": \"一大勺+50ml\"
         },
         {
           \"ylName\": \"虾仁\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"1大勺\"
         },
         {
           \"ylName\": \"姜汁\",
           \"ylUnit\": \"1/2小勺\"
         },
         {
           \"ylName\": \"白胡椒\",
           \"ylUnit\": \"1/4小勺\"
         },
         {
           \"ylName\": \"鸡蛋清\",
           \"ylUnit\": \"半个\"
         },
         {
           \"ylName\": \"生粉\",
           \"ylUnit\": \"一大勺\"
         },
         {
           \"ylName\": \"龙井茶\",
           \"ylUnit\": \"3克\"
         }
       ]', '[
         2,
         6,
         9,
         20,
         70,
         125,
         170,
         175
       ]'),
       (128, '湘菜：水煮鱼', 'http://static1.showapi.com/app2/img/caipu/20210111/539bc14f-a4ac-40ea-96d0-4b27ebb5e006.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210111/2a9eac02-325e-4647-85e5-8878ea61cd3c.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210111/486df08f-77fa-4c77-a5a1-3f64a40a40d5.jpg\",
           \"content\": \"1，鱼肉剁块，放盐腌制五分钟（此处多放盐，后面汤里不再加盐，可以保证鱼肉的咸味跟汤差不多，如果后期加盐，汤咸了，鱼肉不入味）。2，锅内放油八分热，鱼肉下锅煎白稍微变黄。3，冷水下锅，从锅子边缘注水，不要到鱼肉上，不然会有鱼腥味。水淹没鱼肉，大火烧开，不用盖锅盖直到鱼汤发白，再煮两分钟收点汤汁。4，开始下作料，生姜大蒜辣椒煮一分钟，放紫苏跟鸡精调味提鲜。\",
           \"orderNum\": 1
         }
       ]', '[
         {
           \"ylName\": \"草鱼\",
           \"ylUnit\": \"一条\"
         },
         {
           \"ylName\": \"生姜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"紫苏\",
           \"ylUnit\": \"少量\"
         },
         {
           \"ylName\": \"盐，蒜，\",
           \"ylUnit\": \"\"
         }
       ]', '[
         2,
         6,
         20,
         71,
         126,
         175,
         170
       ]'),
       (129, '手撕包菜酸甜可口，简单的调料在家就能做出色香味俱全的湘菜',
        'http://static1.showapi.com/app2/img/caipu/20201231/d1f5c266-960c-4074-b231-2fc0a1a169e9.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201231/d5c1e37a-388a-44e1-becc-c3228ada487c.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/18186c7e-fd81-4616-85fb-f216a0bf1bdd.jpg\",
           \"content\": \"做好的手撕包菜咸甜适中，原汁原味，脆嫩爽口。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/28c23727-d9cb-4098-bec3-8283e50408ee.jpg\",
           \"content\": \"制作这道料理需要的食材和调味料有包菜300克，花椒15粒，如果喜欢吃辣椒可以准备一个干辣椒切段，生抽10克，醋5克，料酒5克，食用油15克，盐1克，糖5克，蒜片适量。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/f71825f5-b8a3-4e05-b68d-c74b83bddf5e.jpg\",
           \"content\": \"把除了花椒食用油之外的调味品都混合到一个容器中，搅拌均匀。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/1467a0af-70e6-4d68-b004-519de28701c0.jpg\",
           \"content\": \"把除了花椒食用油之外的调味品都混合到一个容器中，搅拌均匀。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/7a17966f-1e14-4fb7-8637-630fe79cae84.jpg\",
           \"content\": \"把食用油放入锅中，冷油的时候就把蒜片和花椒放入锅中，中小火慢慢加热，炒出香味，蒜瓣变微黄的时候就可以了。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/e1c6519b-41a9-4392-bab0-5a19b28023bb.jpg\",
           \"content\": \"把准备好的包菜撕成片状，大小根据自己的喜好来就可以。要想让包菜炒得软嫩好吃的重要的一个原因就是在撕包菜的时候一定不要把那个包菜中间的根茎放入，仅仅把叶子撕掉就可以了，剩下的根茎可以做汤的时候放进去，非常提鲜。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/2fdf47f0-b9a7-498b-b787-b7700856ce5c.jpg\",
           \"content\": \"来回翻炒大约3分钟。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/71feed5d-d482-4308-afeb-83bb841e7b19.jpg\",
           \"content\": \"把调配好的料汁从锅四周均匀倒入到锅中。\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/f8364538-88a6-4ccd-8b4a-f9379a582f72.jpg\",
           \"content\": \"翻炒变软，包菜熟了就可以了。\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201231/6553a951-7bfe-4c42-862c-3948d8b07019.jpg\",
           \"content\": \"酸甜可口的手撕包菜就做好了，来上一碗米饭，简单又下饭，喷香！\",
           \"orderNum\": 10
         }
       ]', '[
         {
           \"ylName\": \"包菜\",
           \"ylUnit\": \"300克\"
         },
         {
           \"ylName\": \"花椒\",
           \"ylUnit\": \"15粒\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"香醋\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"食盐\",
           \"ylUnit\": \"1克\"
         },
         {
           \"ylName\": \"食用油\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"蒜片\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         4,
         6,
         24,
         70,
         126,
         171
       ]'),
       (130, '干锅花菜（湘菜）', 'http://static1.showapi.com/app2/img/caipu/20201022/10701f53-99c1-46b9-82d6-10e4c1a9750a.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201022/c077b080-6f8a-403b-970e-0ef0207c9544.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201022/946b6500-79cc-416f-a3d7-65023d88b360.jpg\",
           \"content\": \"葱姜蒜爆锅\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201022/267ca96d-b534-4036-927e-d8bcdb067036.jpg\",
           \"content\": \"放肉炒熟\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201022/fbb5cf76-147d-45c3-b6de-db1d58759346.jpg\",
           \"content\": \"放花菜和胡萝卜\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201022/1cf01422-95ac-4e30-835b-c34bcc99af13.jpg\",
           \"content\": \"加入酱油等添加爆炒\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"花菜1\",
           \"ylUnit\": \"个\"
         },
         {
           \"ylName\": \"五花肉250\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"大蒜2\",
           \"ylUnit\": \"瓣\"
         },
         {
           \"ylName\": \"干辣椒2\",
           \"ylUnit\": \"个\"
         },
         {
           \"ylName\": \"白糖3\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"生抽2\",
           \"ylUnit\": \"勺\"
         },
         {
           \"ylName\": \"蒜3\",
           \"ylUnit\": \"瓣\"
         },
         {
           \"ylName\": \"姜2\",
           \"ylUnit\": \"片\"
         },
         {
           \"ylName\": \"盐5\",
           \"ylUnit\": \"克\"
         }
       ]', '[
         2,
         6,
         25,
         70,
         126,
         171,
         170
       ]'),
       (131, '湘菜-蒜苔腊肉 (经典湖南菜)',
        'http://static1.showapi.com/app2/img/caipu/20200918/d19dc057-0c65-4004-b953-975586fd5fad.jpg',
        'http://static1.showapi.com/app2/img/caipu/20200918/53bf1d19-bf4b-4b4b-b2dc-a564d4877d5a.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/5cb8e8a8-64b5-4ef5-b8c6-3fb5fe68972e.jpg\",
           \"content\": \"放水煮开，腊肉煮5到10分钟。捞出放入凉水备用(凉水冷却下，切的时候不烫手)\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/3df185c7-c663-4f67-8c1e-80b3d4a51c4f.jpg\",
           \"content\": \"水不用倒可以继续倒入蒜苔煮一下，时间充足电费燃气费多的可以重新倒水煮。。煮2到3分钟捞出倒入凉水冲洗下，降降温。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/a8ee0a94-b2e9-4996-afca-5a107aa1e0c5.jpg\",
           \"content\": \"腊肉切片备用，也可以切丁，形状尽量小一点\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/e9eb910c-e981-479a-a715-937899aef4a9.jpg\",
           \"content\": \"葱，小米椒，蒜切好备用\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/a9c261b4-a16f-478b-984b-46377e651173.jpg\",
           \"content\": \"锅内倒入猪油，可以多一点，油热后滋滋再倒入蒜末抄香\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/3dc432d8-d2ea-4494-800c-0236f04cb740.jpg\",
           \"content\": \"然后倒入辣椒炒到冲鼻子，\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/ed791af1-3d79-4942-a539-9294af3bc3ab.jpg\",
           \"content\": \"然后倒入蒜苔翻炒，大火翻炒5分钟左右，不要烧锅了。\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20200918/fe89bf55-96d6-42f9-9319-2c29c71b2947.jpg\",
           \"content\": \"倒入蒜苔炒，差不多也要炒5分钟。然倒入一勺生抽和一勺老抽。继续炒1分钟。\",
           \"orderNum\": 8
         }
       ]', '[
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"一勺\"
         },
         {
           \"ylName\": \"老抽\",
           \"ylUnit\": \"半勺\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"3瓣\"
         },
         {
           \"ylName\": \"蒜苔\",
           \"ylUnit\": \"一把\"
         },
         {
           \"ylName\": \"腊肉\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"小米辣椒\",
           \"ylUnit\": \"4到5根，吃辣多放\"
         }
       ]', '[
         2,
         6,
         8,
         25,
         71,
         70,
         126,
         170,
         171
       ]'),
       (132, '炒黄花菜——徽菜中的精品，也是徽州盖浇面的浇头。',
        'http://app2.showapi.com/img/caipu/20200601/01fe95a1-21f3-4633-a1c0-f88ed868a875.jpg',
        'http://app2.showapi.com/img/caipu/20200601/a7b202a6-b4c8-489a-bf58-1baa052a6039.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200601/83b75b1a-e219-48c1-be22-004af38c6cb7.jpg\",
           \"content\": \"肉丝用一丢丢盐，生抽，黄酒和淀粉抓拌。炒好后盛出。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200601/19b817d9-079a-432c-bf72-cc687051b818.jpg\",
           \"content\": \"下青椒炒\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200601/a775d24d-82e1-47d2-8ae0-6042429e978e.jpg\",
           \"content\": \"放入黄花菜，茶干，肉丝一起炒。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200601/bf41917b-49bc-4963-9a3f-aca3b9eba2fa.jpg\",
           \"content\": \"放盐，生抽和两滴老抽，加一点水炒熟后，勾芡。\",
           \"orderNum\": 4
         }
       ]', '[
         {
           \"ylName\": \"干黄花菜\",
           \"ylUnit\": \"一份\"
         },
         {
           \"ylName\": \"茶干\",
           \"ylUnit\": \"3片\"
         },
         {
           \"ylName\": \"肉丝\",
           \"ylUnit\": \"一丢丢也可以不放\"
         },
         {
           \"ylName\": \"青椒\",
           \"ylUnit\": \"2个\"
         }
       ]', '[
         2,
         6,
         70,
         127,
         171
       ]'),
       (133, '「1日3餐生酮餐谱」不耽误愉快吃肉的减肥餐谱',
        'http://static1.showapi.com/app2/img/caipu/20210228/1902d409-ca86-483d-8a93-cec8d443caed.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/50dc428e-0a06-4b88-883f-9d8140a9f0ae.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/13630c94-7328-4982-9b8f-f3cbe51fe498.jpg\",
           \"content\": \"#早餐#生酮饱腹实力派防弹咖啡奶昔，轻松扛饿5小时、双重蛋白、双重给力。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/7baf8325c472422793320539e7579e5d_666w_666h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/250010a1-1e81-4ce1-b6b9-84536a02a55f.jpg\",
           \"content\": \"#午餐#所需材料（蔬菜没有特定要求）\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/ade64a5177bc40359b0574b18ef56e01_714w_571h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/98d84dff-e475-4f5d-98b7-5e68f8ca037d.jpg\",
           \"content\": \"蔬菜洗净控干水分，把黄瓜、樱桃萝卜切成自己喜欢的样子\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/344382b1f9da4722900e0a5bc4ee7f1e_667w_533h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/ba79e5b0-ac0f-45b1-8211-6a97044fa9eb.jpg\",
           \"content\": \"成品图（把苦菊、黄瓜片、樱桃萝卜还有萝卜缨子一起放少许青柠调味汁，喜欢吃酸的再放两片柠檬，撒点胡椒碎即可，哈哈哈可以愉快吃肉的减肥午餐就这么轻松搞定）。煎鸡胸肉忘记拍图了，下次补上\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/ab4c8e20303f46e39a5d62746ad06c3a_745w_851h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/861b5fe5-f3b2-42e2-8a83-b9d1999a3d7e.jpg\",
           \"content\": \"#下茶#用300ml的45C以下温水或冷水冲泡，用，酸甜可口，的\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/95f87f37643b42e0b839a88e61f5338e_667w_533h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/be240823-273d-4975-90e2-e8164498afde.jpg\",
           \"content\": \"#晚餐#生酮能量棒防弹抹茶，享味浓香、饱腹代餐\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/3233f9ce198f4ba8920f7ecd1a3bee46_667w_533h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/0014b4eb-1bf0-4517-9d19-a528754a2c00.jpg\",
           \"content\": \"补一张3日断糖计划全家福\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/1682684452fc41fea50c3c289e9346c4_750w_600h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鸡胸肉\",
           \"ylUnit\": \"1块\"
         },
         {
           \"ylName\": \"苦菊\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"樱桃萝卜\",
           \"ylUnit\": \"4个\"
         },
         {
           \"ylName\": \"黄瓜\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"柠檬\",
           \"ylUnit\": \"2片\"
         },
         {
           \"ylName\": \"黑胡椒碎\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"青柠调味汁\",
           \"ylUnit\": \"适量（也可以放油醋汁，自己喜欢就好）\"
         }
       ]', '[
         1,
         170,
         171,
         202
       ]'),
       (134, '菌菇浓汤，低卡饱腹，鲜到不行',
        'http://static1.showapi.com/app2/img/caipu/20210226/d0ee4b43-dc89-4a43-b226-4a1aab5c0946.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210226/66a7c4a6-9909-4fe5-a8e5-1c6ecc953ad5.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/94ff5a52-cb35-4fb8-8bc5-1da69b3a00be.jpg\",
           \"content\": \"平菇撕成条，香菇切片\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/b1a58527da714d22a6397c806114e5ae_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/75e5ba20-a974-471f-9e8e-f996364fb4ae.jpg\",
           \"content\": \"锅中热油，爆香葱蒜\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/fb20a867e39d4064848af303500cf672_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/d81c0341-cb45-4957-8aef-b95b60e3111b.jpg\",
           \"content\": \"倒入香菇，加入1勺料酒炒出香味\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/62b0394806584747bd0619a6c344aa9b_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/beeb047a-79ba-4113-ae2e-2438e8ab3de7.jpg\",
           \"content\": \"加入平菇，炒至变色变软\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/2b182a2e19594cb6922c31789a505ffe_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/43f313dd-8254-438d-8775-20f64d1973d7.jpg\",
           \"content\": \"加水烧开，倒入1勺生抽，1茶匙盐。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/de2eb0dd593c49a6a7587a04357d9f0e_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/c5711090-6e5a-4b18-a554-f495690149ff.jpg\",
           \"content\": \"加入水淀粉煮5分钟，让汤汁稍微浓稠一点\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/49cfb282ae004bd0b57e1dbee96bbc62_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/3d229e87-d142-48f9-b83c-07cad60ebef0.jpg\",
           \"content\": \"将鸡蛋打散\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/ec4cc97c144e4f0f9c5168fda168f5dc_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/48821981-107d-4ffe-96b6-844194524578.jpg\",
           \"content\": \"锅中倒入鸡蛋煮至蛋花凝固\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/a4baa1f7c2ce4be7af7008049f787a71_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/ded92d31-e14d-45e2-9ee7-fcc02c819e63.jpg\",
           \"content\": \"出锅前撒点黑胡椒和葱花即可\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/0ef6cc099693455bbd634ec257cfb798_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/0390342e-658d-45b2-832e-cdf380dd07ec.jpg\",
           \"content\": \"味道鲜美，根本停不下来\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/9276fb2b06304ae6bf486cca5cac9ee1_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/d3a2a554-36bd-40e2-acce-b3536d3af427.jpg\",
           \"content\": \"热量低，饱腹感强，减脂人士放心喝\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/0fcee6bd514242df999b69b0ab8f18fb_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"平菇\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"鲜香菇\",
           \"ylUnit\": \"3朵\"
         },
         {
           \"ylName\": \"葱\",
           \"ylUnit\": \"2根\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1茶匙\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"3瓣\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         9,
         20,
         70,
         71,
         99,
         134,
         171,
         202
       ]'),
       (135, '㊙️低脂低卡孜然金针菇，减肥减脂必学食谱❗️',
        'http://static1.showapi.com/app2/img/caipu/20210226/4f95adba-28bc-4a14-ac3c-88ffe175b47c.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210226/88c37850-cd8a-430c-b4ec-96f613270286.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/3d7f3e66-b6c4-45ef-bf6c-e2344a625645.jpg\",
           \"content\": \"1金针菇去除根部洗净，少许油热放蒜翻炒爆香\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/ffa886ba0fe04475838c20b56e03472b_750w_993h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/9bd76e53-57a1-46a1-8035-9e8bb7dadbb4.jpg\",
           \"content\": \"2放金针菇翻炒至软，继续翻炒煸干水份，加1勺生抽、半勺老抽、1勺蚝油翻炒\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/6dbf06ceb3b140eda28428acff581872_750w_989h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/6c834cd4-c697-4d1a-b77c-1f5a8cf19536.jpg\",
           \"content\": \"3加1勺芝麻、1勺辣椒粉、1勺孜然粒翻炒均匀装盘开吃，太香了\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/3ebcdcba474d473fbb8d8bc16e892e71_599w_479h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"金针菇\",
           \"ylUnit\": \"1把\"
         },
         {
           \"ylName\": \"蒜瓣\",
           \"ylUnit\": \"4个\"
         }
       ]', '[
         2,
         6,
         20,
         70,
         133,
         134,
         171,
         202,
         136
       ]'),
       (136, '蒜蓉蒸巴沙鱼', 'http://static1.showapi.com/app2/img/caipu/20210225/976ac63e-764c-4242-944e-79e4e640b152.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210225/9e638ce6-8a7a-4113-bf28-4fcc8975b9ea.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/b5776892-c3de-41d5-86f0-4fe099cfd3b6.jpg\",
           \"content\": \"1：巴沙鱼切块，不要太小，小的话蒸了容易散了2：适量料酒和姜腌制10分钟3：倒掉料酒（不介意料酒的味也可以不必倒掉，加入适量蚝油、生抽、黑胡椒粉，均匀4：将大蒜和小米辣切碎，三分之二下锅炒香，炒香与剩余的三分之一混合（不要全部下锅炒，这样没有那么好吃，加入适量蚝油生抽\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/4d94c4ec3a9848e3ad192bcf01fdc3c6_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/9b267b9a-3726-4ef3-8f21-9e0de8529d48.jpg\",
           \"content\": \"蒜末切碎\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/43f7874395ca45f294c4602fbac0c357_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/2c96bac7-bacf-41c7-9a2d-ca3d15aaf501.jpg\",
           \"content\": \"将炒香的蒜和蚝油生抽混合搅拌\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/81ba2891fbd34f45a4f9f6a56d33b0dd_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/a1644d86-396c-4b5c-abc0-a196f5b5d47c.jpg\",
           \"content\": \"酱汁完成\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/5159bedc4f7e406582f394f3b2140c71_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/b0d32d3a-fc42-469f-9db0-a18d1addd83e.jpg\",
           \"content\": \"最后找个比较大的盘子，盘子太小会重叠容易不熟，将鱼平铺在盘子上，淋上酱汁，爱吃辣可以再加点辣椒一起蒸大火蒸15分钟就可以啦，最后撒上葱花即可！\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/912f4561a43b47628fb513d9ba6a40e0_3781w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/87d42c70-37fa-4bc2-81c5-226ffb8a0116.jpg\",
           \"content\": \"美味出锅！！！\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/0b6d3a7780cb4878b4acc1dfcdbdd6eb_3781w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/150c95d9-1ecf-4ad0-8dd3-63ed1b079608.jpg\",
           \"content\": \"做成便当又好吃又好看又低脂\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/bd4e344ed50640a6acb8480e58bdf4a2_3781w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"5瓣\"
         },
         {
           \"ylName\": \"葱花\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"巴沙鱼\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         20,
         70,
         72,
         133,
         134,
         170,
         175,
         202
       ]'),
       (137, '六款超好喝的减脂汤，春夏减肥必备刷脂汤~',
        'http://static1.showapi.com/app2/img/caipu/20210224/d24e49e0-dfeb-451d-b803-35961d94da7b.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210224/5087c8c2-7db3-4868-905f-7e1f135a440f.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/75a11363-125f-4c83-b133-a8a2dc7587ff.jpg\",
           \"content\": \"黄瓜蛋花汤一人食材：黄瓜1根，黑木耳一点，鸡蛋1个番茄1个黄瓜番茄，汤很鲜超好喝\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/2b5b34101c934901a2e94a0f75e69b32_629w_832h.png?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/1a8677b5-8ed9-43de-a5f9-8440b316ad92.jpg\",
           \"content\": \"掉秤萝卜汤一人食材：白萝卜1段，鸡蛋1个，枸杞1小把据说杨幂经常喝，明星同款掉秤汤安排起来\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/37678e9b773a4a35b83479999bb0e716_630w_828h.png?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/d24bfe52-3a13-4054-9c7a-600f62662471.jpg\",
           \"content\": \"豆皮菌菇汤一人食材：豆腐皮120克，木耳，金针菇，番茄1个汤里带点伪面，吃“面”喝汤很满足\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/f5976381e6ee498b8c9779eca8e8186c_634w_838h.png?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/b97a0ba6-a89b-41f9-92a6-259d61f88838.jpg\",
           \"content\": \"豆腐海带汤一人食材：海带结4个，豆腐150克，冬瓜1小块冬日减肥必须得有呀，放点虾米更鲜\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/4e6d76828f764629a39b340b3d0756e2_621w_838h.png?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"蔬菜\",
           \"ylUnit\": \"按食谱\"
         }
       ]', '[
         2,
         6,
         71,
         99,
         133,
         171,
         202
       ]'),
       (138, '减肥必备黑胡椒烤蘑菇',
        'http://static1.showapi.com/app2/img/caipu/20210224/2c4f5e84-c32c-46f4-b796-df971622fe6e.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210224/0e0313ba-a0c0-438c-97ed-bde5e683666f.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/a54869a7-7127-42d5-ace3-c3efad07c90a.jpg\",
           \"content\": \"香菇切好\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/68bc82e55c6043c0950bfd0a85b60bd5_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/44ae1c98-b83a-4bc2-8ec5-19d8dc53075c.jpg\",
           \"content\": \"白蘑菇切好\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/b4f5a1cc90cf44f98ab95a98961ff88a_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/e2144ea7-66d8-415b-b2f9-bd5e37f12e6a.jpg\",
           \"content\": \"混合撒入黑胡椒粉和盐\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/f396fa660232477d977edf3fc00091d3_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/bcdc3ffd-ae7a-4d88-b5bf-2ee980793492.jpg\",
           \"content\": \"倒入橄榄油\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/6a720a3fdb4c4a8592063602eb29e976_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/4fc6cdaf-060f-48f7-a795-8dbb3db8ee76.jpg\",
           \"content\": \"烤箱200度烤20分钟\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/5cea3933721a414fa050d6682a308024_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/feec3be1-4178-4eb7-b314-49c2c6824fb9.jpg\",
           \"content\": \"出锅啦底下全是蘑菇汤汁鲜美的不得了\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/75fe71d013904ff487c703f3a9c9c89c_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"少量\"
         },
         {
           \"ylName\": \"香菇\",
           \"ylUnit\": \"300g\"
         },
         {
           \"ylName\": \"白蘑菇\",
           \"ylUnit\": \"250g\"
         }
       ]', '[
         2,
         6,
         20,
         74,
         171,
         202
       ]'),
       (139, '食疗清肝明目祛湿汤', 'http://static1.showapi.com/app2/img/caipu/20210228/38a1deac-d262-493e-8a5f-d684e922545c.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/bbe25354-226f-4242-9d1d-e24d0d509908.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/6cffe02b-2ed1-48fa-b146-a452b764b59f.jpg\",
           \"content\": \"昨天买了两斤多新鲜桑叶，其实一斤煮起来不多，现在桑叶正当时特别嫩，平时可以蒸鸡，炒蒜蓉，凉拌，煮汤等，桑叶草本对肝目都好，记得小时候春季有花粉奶奶会眼睛干养红丝，她会泡桑叶敷眼睛。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/aa5c85335a114074b4fbba17c2264f4d_461w_300h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/6a882f18-f196-445a-9968-4fcc3a66c585.jpg\",
           \"content\": \"枸杞也是对肝目很好，还有菊花，杏仁都洗净沥干准备好。山药家里没有新鲜的就用了几片干货用。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/10a0912ec2444a9c86e66ce88601b745_1024w_768h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/7c7d3aa2-6292-49b6-a3ee-914c56f33d41.jpg\",
           \"content\": \"鸭洗净姜片烫一下开水，然后煲，其实煮这个更好功效高是鸡爪，鸡，鸭，昨天太晚上市场，鸭，也是能出高，先杏仁，山药再下菊花一起大概1个小时后成乳浊胶质后把枸杞和桑叶放进去煮继续煮十几分钟\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/5885fa7888a04c58908421ed6ac87d1a_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/a71e316b-9d23-4331-b681-9fe448b7d7ad.jpg\",
           \"content\": \"熄火撒点盐就可以了，这个汤在早上喝特别好，作为汕头人最爱早晨一碗菜汤，这是地方习惯爱好。早上在汕头的街头小巷好多泡粿面汤和菜汤的食店。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/d2b4a3839bf74ce1ab9884a02d6ddafc_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/679a5d50-b0ad-4bce-97e7-755a669ed928.jpg\",
           \"content\": \"这锅汤看着都感受到好喝有没有\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/1f028c50181e452eb5953c592132ef24_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/f797ef6a-071b-4733-8f06-9be7de3ee86b.jpg\",
           \"content\": \"今天早上我们这边下雨打雷，阴湿天气，刚好早餐每人一碗多这个清肝明目祛湿汤包子又是能量满满，营养丰富的一餐。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/a2f8e6cbd9184ab49a4309c00b1fcf0d_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"新鲜桑叶\",
           \"ylUnit\": \"半斤\"
         },
         {
           \"ylName\": \"鸭掌\",
           \"ylUnit\": \"10只\"
         },
         {
           \"ylName\": \"枸杞\",
           \"ylUnit\": \"1把\"
         },
         {
           \"ylName\": \"小杭菊\",
           \"ylUnit\": \"1把\"
         },
         {
           \"ylName\": \"山药\",
           \"ylUnit\": \"6片\"
         },
         {
           \"ylName\": \"杏仁\",
           \"ylUnit\": \"20克\"
         }
       ]', '[
         2,
         6,
         9,
         71,
         99,
         151,
         171,
         170,
         200
       ]'),
       (140, '美容养颜枣泥糕', 'http://static1.showapi.com/app2/img/caipu/20210228/0df7bd21-a728-41a9-9996-f7d8a2f380f1.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/7523b209-34da-4699-b461-47d4eb62c2af.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/af6f77b9-90e4-49c3-9f9f-ce2710f06b45.jpg\",
           \"content\": \"红枣上锅蒸20分钟，或者放少量水煮，煮至变软糯变色就可以了\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/07a6af3d307240bc96c80b376f112318_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/88163998-aae5-4ab2-8d1a-78bc7b61cd73.jpg\",
           \"content\": \"将煮好的红枣用擀面杖捣碎，这样比较容易出枣泥\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/620fbf4cc57e4e66bc7bb8545b1d42a3_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/98cd3471-4617-4c10-96fd-95d69f8ee8a1.jpg\",
           \"content\": \"用筛子使肉跟皮分离，这个过程比较耗时间\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/0e106be93fd1464b9b26260b32baaada_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/a8f4f669-c84d-4f24-a95b-635b3f28dd55.jpg\",
           \"content\": \"锅里放150g水，100g红糖，红糖\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/71de95f6e7314006b2792564d26da05f_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/72f751a5-f86c-4a8a-9e1c-d2cb95286c3e.jpg\",
           \"content\": \"马蹄粉分成两部分，均75g，分别入150g水，均，过滤，过滤均。因做时候忘记拍照，所以……\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/2b1ea353b1c048fabb394afc8b00aa9d_1280w_1024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/f887bbd8-5a60-40c2-a8af-be68cfce1cae.jpg\",
           \"content\": \"将一小部分马蹄浆倒入锅中，切记少加，不是全部都加，让浆看起来煮的半透明状，又不过分粘稠即可\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/8b37f85c891046b0bc2d13da45bdff35_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/7444c8e0-7892-4973-b276-6668d025a3c6.jpg\",
           \"content\": \"将红糖浆与加剩下的部分马蹄浆全部倒进大碗搅拌\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/ea69c28a1745458fadd625fed3443b14_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/0bcd2bb6-4307-4399-9e54-b38f46300e54.jpg\",
           \"content\": \"加入捣好的枣泥，搅拌均匀，有条件的可以过滤一下\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/84cfb986c1244661b093d59c4f73723e_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/d06cab48-fae8-4ade-b34e-d251ce64e1a3.jpg\",
           \"content\": \"上锅蒸熟，最后香甜可口的枣泥糕就做好啦，非常好吃，有弹性\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/42d31941e707429f8c18cd2278119f33_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"红糖100\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"红枣150\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"马蹄粉150\",
           \"ylUnit\": \"克\"
         },
         {
           \"ylName\": \"水250\",
           \"ylUnit\": \"克\"
         }
       ]', '[
         3,
         7,
         71,
         72,
         200
       ]'),
       (141, '通便瘦身养颜苹果肉桂茶',
        'http://static1.showapi.com/app2/img/caipu/20210228/117e6608-b7a7-4359-bda2-b614c6cf32fb.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/fa8cdbf3-9788-40fc-8770-f21c4c6c6dbd.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/694eceb2-6d04-47fd-a35a-f833d85f6968.jpg\",
           \"content\": \"苹果洗净切片，这里是2个苹果的量。如果想吃苹果，最好将苹果切成边长为1厘米左右的小方块。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/9f93f78802224059a9959e12a29d08dd_750w_750h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/6948e18f-2407-4d64-943b-4194b0384155.jpg\",
           \"content\": \"将苹果放入锅中翻炒。苹果如果直接煮水，酸味比较明显。将苹果炒制后会出现些许焦糖，减少酸味增加甜味，使口感更好。如果想要加糖，这一步可以将糖和苹果一起炒制，炒到微焦，成品甜味会更重一些。如果使用代糖，不建议炒制，因为代糖只是甜味剂。我个人认为不加糖，光靠苹果中的糖就足够甜了，入口可能酸一些，但是回味真的很甜。苹果中的果糖可以炒出焦糖，使苹果茶有淡淡的焦糖味。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/2b7ef144dcb24c30ac76a0014feb60d0_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/18b0f332-94b5-43a4-b6f7-801d69270111.jpg\",
           \"content\": \"炒到苹果稍软（边缘微微透明），并伴有浓烈的苹果香气以及淡淡的焦糖味，往锅中加水。如果不换锅，这次加水加足量。如果换锅，加一点点水，把锅底和锅边的焦糖涮一涮，然后倒入煮锅中。煮苹果茶的水量的多少取决于个人喜好的茶浓度。水至少要没过苹果，高于苹果34厘米也无所谓。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/a356885f88024fccbc8a6bd33dc4d97c_1000w_750h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/9a8cc047-7392-4517-8873-2ad5805348ac.jpg\",
           \"content\": \"和苹果真绝配，超爱。图中，用2个苹果加2勺。用，一切依据喜好就成。没有可换成棒，煮完棒甚至可当成饰。不喜欢喝中还有细小颗粒，用，避免影响口感。没有过滤最后苹果混浊一点，不影响味道。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/e357229598b64f749a9e172875c95402_664w_664h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/89f53e43-fdea-44d3-9e24-9d4fa9967398.jpg\",
           \"content\": \"我利用养生壶煮的苹果，选择花果茶10分钟。没有养生壶的厨友用普通锅大火煮开转小火10分钟。关于茶叶的加入：如果是比较耐煮的茶叶，例如乌龙茶、普洱茶等，并且茶并未制成茶包，可直接和苹果一起煮，茶味会浓一些。制成茶包的各种茶都建议泡而不是煮，煮的话会有非常明显的苦味。如果想吃苹果茶中的果肉，建议将茶放到过滤袋中煮，或者直接使用茶包。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/9c2e999a0c2a49458460ccf1e572388e_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/574104e0-c3e3-4e3f-90c0-81961c56601c.jpg\",
           \"content\": \"我用的是茶包，将煮好的苹果水倒入，泡个10分钟左右就可以喝啦。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/f62dadf646314a3a9708c2f9054ead31_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/6a9c57b6-8542-47f3-ba2b-5530b6915d5b.jpg\",
           \"content\": \"好好享受下午茶时光吧！\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/2855ae25bfad4b8fbc6d44a918aa96cc_726w_725h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"苹果\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"肉桂粉（配过滤包）\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"适量，可不加\"
         },
         {
           \"ylName\": \"茶/茶包\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         7,
         5,
         70,
         71,
         173,
         200
       ]'),
       (142, '养颜汤', 'http://static1.showapi.com/app2/img/caipu/20210228/73acaaa1-56c7-4978-9c7f-bfd053f4241b.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/82b200c9-cfb6-43b7-b3d8-1a1dcb46dec2.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/02561065-3092-4b9e-a2c7-c419ca1a3097.jpg\",
           \"content\": \"桃胶提前一个晚上泡发\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/8f633d2adf2143e68ca23aea9b1b8f2a_1052w_780h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/50fcb23a-db5f-451e-bc66-6fd3098eb13e.jpg\",
           \"content\": \"锅中放入清水煮沸后，加入红糖，桃胶，玫瑰花，枸杞，红枣继续烧开后转小火煮5分钟\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/15181e0448e84741afd45c523fdbebaf_780w_1052h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/60c7e071-7003-47a4-a579-18fb240c6cac.jpg\",
           \"content\": \"5分钟之后加入鸡蛋，继续烧开后再煮5分钟\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/0d559ce51616470e92547e619f35a5ea_780w_1052h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/c54a1b2d-afbe-4723-b898-3918ddabda84.jpg\",
           \"content\": \"5分钟后就可以装碗。装碗后挑出玫瑰花丢弃，尽量撇去蛋清的浮沫。由于红糖颜色比较深，蛋清的浮沫也难以尽数撇去，所以成品不太美观\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/a34c0f3561c642a1a2db72726d02d345_720w_576h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"红枣\",
           \"ylUnit\": \"3颗\"
         },
         {
           \"ylName\": \"枸杞\",
           \"ylUnit\": \"5粒\"
         },
         {
           \"ylName\": \"红糖粉\",
           \"ylUnit\": \"1汤勺\"
         },
         {
           \"ylName\": \"桃胶\",
           \"ylUnit\": \"6粒\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"干玫瑰花\",
           \"ylUnit\": \"8朵\"
         },
         {
           \"ylName\": \"清水\",
           \"ylUnit\": \"2饭碗\"
         }
       ]', '[
         2,
         7,
         71,
         99,
         200
       ]'),
       (143, '清火糖水——家常简单版',
        'http://static1.showapi.com/app2/img/caipu/20210228/3133d935-620e-4525-b030-b264b9c8e8ea.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/c81b3070-de6c-4d1d-bbf8-aa2992ec2546.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/b83e14c6-a82e-426d-9548-d8b7482c33fc.jpg\",
           \"content\": \"材料洗干净备用\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/191c65345b9944459e5a03d362500289_1008w_756h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/91bc1e5a-406c-4176-a1a7-1048d8e9272e.jpg\",
           \"content\": \"削皮切块备用\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/21b8c92e280b4f0facbb99f4e7e8b988_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/027b5fcb-f46c-4fd1-8423-0c692e60c17a.jpg\",
           \"content\": \"入养生壶中，煮25分钟煮5分钟\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/b320ba2f9e2c4ab5a6417a4c4cef3352_1008w_756h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/e5f2348a-1dfe-4ad3-ad38-05ed5c0f0211.jpg\",
           \"content\": \"煮好出锅\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/8f6cb6bb69174a8ab6da6d837f10a257_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/ea06b901-4db9-4693-b91e-b5240e1dab4e.jpg\",
           \"content\": \"清火糖水做好啦\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/5b5b27437d364935ab7ec16ab56705ef_1000w_750h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"贡梨\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"马蹄\",
           \"ylUnit\": \"10个\"
         },
         {
           \"ylName\": \"枸杞\",
           \"ylUnit\": \"15粒\"
         }
       ]', '[
         3,
         4,
         5,
         7,
         9,
         71,
         201,
         171,
         173
       ]'),
       (144, '清热解毒汤祛火汤醒脑汤薄荷瘦肉汤',
        'http://static1.showapi.com/app2/img/caipu/20210222/6c0df5e7-c3f8-4d9b-9033-e2e1ca890429.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210222/bb1806e5-5106-43dd-a7ec-89ceee1056ba.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/2c142103-791c-4a4c-ab82-fec7567d7309.jpg\",
           \"content\": \"准备好材料。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/f47e9182e3b64fcf8d84261c25e1c418_2881w_2305h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/4c6c5a46-f092-4b93-9416-47d28799ceb5.jpg\",
           \"content\": \"肉片先倒入开水中煮沸。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/b45ea2eaea0849c7a415e140d926c437_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/378cba25-affb-4a72-b5b8-24bdf53fb7a8.jpg\",
           \"content\": \"再加入薄荷叶煮沸。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/2e7b054ef14a48f39fb0f44545b85aa4_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210222/523599d8-eec7-4c3b-998e-8dc152bd4842.jpg\",
           \"content\": \"加盐和少量的油，即可饮用。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/5fb4d60490ca4a21b6d942c4eb059041_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"瘦肉\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"薄荷\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         9,
         71,
         99,
         170,
         171,
         201
       ]'),
       (145, '鸡骨草瘦肉汤‼️熬夜必备.静心养肝.清热祛湿‼️',
        'http://static1.showapi.com/app2/img/caipu/20210220/f0301271-f5db-43af-9e66-cb2005a0ba0a.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210220/cfb8df61-cf96-4855-90ed-7b0ffa9dbcb9.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/d62bd478-937a-4f6b-a2a5-c91364d33ceb.jpg\",
           \"content\": \"准备用料：鸡骨草.瘦肉.陈皮.蜜枣。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/b989e2a9cd07465bbfbdce4d59a9d88f_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/722c7dab-8329-41de-8595-d69524421d94.jpg\",
           \"content\": \"全部洗干净放入汤煲中，加入没过食材的清水。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/e606f197172b4f2eb015c5c33b81d15f_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/a22ae5b6-8922-41c0-bea1-da38972c8b14.jpg\",
           \"content\": \"大火烧开，转小火慢熬1个半小时。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/73914ba04b054597ac5fad634edc8192_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/d956b3a5-f2e6-44e9-b323-7b198d8ac2b6.jpg\",
           \"content\": \"加入适量盐调味即可。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/9a9808d9a97c4b55a2766d7873fbc735_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/6cc96727-6bf5-46e3-b5f8-d469d91de632.jpg\",
           \"content\": \"飘香美味，老少皆宜。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/4f1377393e6b4277ae8ed9c0ac1b09f2_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鸡骨草\",
           \"ylUnit\": \"2扎\"
         },
         {
           \"ylName\": \"瘦肉\",
           \"ylUnit\": \"1块\"
         },
         {
           \"ylName\": \"陈皮\",
           \"ylUnit\": \"1片\"
         },
         {
           \"ylName\": \"蜜枣\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1小勺\"
         }
       ]', '[
         2,
         6,
         9,
         71,
         99,
         170,
         171,
         201
       ]'),
       (146, '冬季寒咳，来一碗清热润肺梨汤',
        'http://static1.showapi.com/app2/img/caipu/20210129/bdd61d25-127f-41d1-87f7-f58527f348f7.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210129/f4597984-13cc-4e46-baf1-33543f9d744b.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/6b770b27-09b9-45a3-932d-e9b7bde162c1.jpg\",
           \"content\": \"先将银耳用冷水泡发\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/5b2d7fb2ad764758aa39276318fb684c_1280w_960h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/8c0f332d-1b4f-4819-8b12-7f1d33f41360.jpg\",
           \"content\": \"去银耳根蒂，也就是发黄的部分\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/1907262d7658436c899c3cba963e3523_1280w_960h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/cecac297-12ec-4416-8ebc-c445def4b97f.jpg\",
           \"content\": \"雪花梨削皮，留下梨皮，这是做梨汤的关键食材\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/be213069b8e44d76854645808effe351_1280w_960h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/092af27e-a93f-4c4d-afde-7006e3978b20.jpg\",
           \"content\": \"用1小勺盐抹一下梨，炖出的梨汤会更清甜好喝\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/4741cc88bb714aaea16ecc772bf81ebe_1280w_960h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/3826310d-8f41-4851-8c66-4e773f94cb9b.jpg\",
           \"content\": \"盐均匀地抹在梨身上，然后洗干净盐分\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/ab54dd211c584a1fbc7eaedae012d72a_1280w_960h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/7a26b165-e6c8-4991-910b-844b6c8e0bdc.jpg\",
           \"content\": \"小锅中加入切好和梨块，泡发的银耳，以及梨皮，倒入水没过食材\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/40350b61376f4e02a9ec2ed351135013_1280w_960h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/fb7e8ea6-14d4-4b7b-aa72-45a7f3ee6a50.jpg\",
           \"content\": \"加入调味的冰糖，甜度可以随个人喜好加减\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/edc80f67989a417395c4a14a9770081a_1280w_960h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/4eb4197c-813e-448e-be62-10f54bdbd651.jpg\",
           \"content\": \"把梨汤用小火熬煮半小时左右\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/6822943bd8694340b14259ff0a547755_1280w_960h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/371e496e-8fcd-43c8-a02a-006c5ec00c94.jpg\",
           \"content\": \"梨汤下去三分之一的时候，再加入枸杞，煮5分钟左右即可\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/e18dc83044ea44c99dce6d4c3da2c0d9_1280w_960h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"雪花梨\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"银耳\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"枸杞\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"冰糖\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"清水\",
           \"ylUnit\": \"800ml\"
         },
         {
           \"ylName\": \"食盐\",
           \"ylUnit\": \"2克\"
         }
       ]', '[
         2,
         7,
         9,
         71,
         99,
         173,
         201
       ]'),
       (147, '2分钟操作 | 焖烧杯做顺滑酸奶',
        'http://static1.showapi.com/app2/img/caipu/20210226/0f6573f1-d739-4cb6-aa72-a83bcb6dd780.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210226/6aaa4868-db8c-4f24-bc1e-c753bdd146e4.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/d356da69-c867-4634-a779-bb72aa1c1a8b.jpg\",
           \"content\": \"非常重要，把量杯和搅拌用的勺子都用开水烫一遍消毒把焖烧杯装一点开水摇一下，把水倒了赶紧把盖子盖好！（消毒和加温的功效，也很关键）\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/5d339e55acf0417292396cedddf6b2eb_2000w_2666h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/b96dab36-d8d1-4a8d-a422-4b9beccb097d.jpg\",
           \"content\": \"把温水和酸奶粉在消毒好的量杯里充分搅拌均匀（如果是牛奶就稍微加热一下，加上菌粉）这个动作一定要快准狠就是动作一定要快，但是充分搅拌均匀，不要让奶液降温了。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/1e87484fb9a94cb4bed419e611dbf4df_2732w_4096h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/187ec409-b80c-4537-97f7-031c72eb361b.jpg\",
           \"content\": \"倒入焖烧杯盖紧，大功告成切记中途不要移动&摇晃杯子&开盖检查\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/9642deee57f844f59c83e383222d2dc0_2000w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/ff404ad7-ce08-4024-a9a2-2ec9f7782cb2.jpg\",
           \"content\": \"8-10小时后，酸奶成形就可以喝了超级顺滑的\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/5387c3875c4447bfa3f9be03f2c95604_2732w_4096h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/aed51c7a-fffe-4bcb-a6f2-3446a99ce29e.jpg\",
           \"content\": \"可以放一些喜欢的水果坚果哦\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/007ac2c41a8c4d0a8593148e84e4836c_2000w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/f5ee82c9-68d8-4a89-83fd-baeffce9ab21.jpg\",
           \"content\": \"美味！\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/0ad95716afa447e2a930734dd611e942_2000w_2998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"焖烧杯\",
           \"ylUnit\": \"一个\"
         },
         {
           \"ylName\": \"量杯\",
           \"ylUnit\": \"500ml容量\"
         },
         {
           \"ylName\": \"奶液部分↓\",
           \"ylUnit\": \"——\"
         },
         {
           \"ylName\": \"45℃温水\",
           \"ylUnit\": \"400ml\"
         },
         {
           \"ylName\": \"酸奶粉一包\",
           \"ylUnit\": \"包含奶粉和菌粉的\"
         },
         {
           \"ylName\": \"或者↓\",
           \"ylUnit\": \"——\"
         },
         {
           \"ylName\": \"45℃温牛奶\",
           \"ylUnit\": \"400ml\"
         },
         {
           \"ylName\": \"酸奶菌粉\",
           \"ylUnit\": \"0.5克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"按喜好\"
         }
       ]', '[
         3,
         7,
         9,
         201
       ]'),
       (148, '大人小孩都爱吃的糯米锅巴',
        'http://static1.showapi.com/app2/img/caipu/20210226/6f7becf1-828c-405a-a3f9-417cbf01ec11.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210226/40e413cc-75e7-4001-b2ec-5cb02a6abd0c.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/7d02b9f7-24f4-4b56-8aee-07a0375081cd.jpg\",
           \"content\": \"糯米洗净后泡水至可以轻易碾碎的程度。需要几个小时的时间，如果你是上班族，可以冰箱冷藏浸泡。上班前泡好，下班之后做正好。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/81e870e08e6945699453d57b1b13aec9_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/4ad2b7b5-7e73-4572-8157-3f088de174a2.jpg\",
           \"content\": \"用擦丝器擦出姜泥。需要一块姜的样子，个人喜欢姜泥的味道，可以多放一点点。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/6078c0d65f82462ba20227ac1c1302a0_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/75c7fb56-fd55-4b21-88cb-b48b67cd6812.jpg\",
           \"content\": \"糯米沥干水分，加入所有配料用手抓匀。准备一个勺子，每次大概就一勺米，够铺匀一层炸锅巴的漏勺就行。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/e389dff1e9584157a4f3f87f6757161e_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/28116461-bee2-44a8-803e-4e0fb790a0ce.jpg\",
           \"content\": \"锅中烧热半锅油，油温在180度的样子。如何判断，就是生糯米铺好放入油锅可以像视频中马上有很多大泡泡出现。第一次铺之前，漏勺在油锅里蘸一下有防粘。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/9c1f89214b8940de9f0dac3065cfc5ab_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/eca40333-82b6-4d60-a391-0d6fcc2f9126.jpg\",
           \"content\": \"漏勺里的锅巴一面差不多之后，会自己脱离漏勺。然后给它翻面继续炸一会，漏勺可以继续去铺一层米再放入锅中。注意每次铺匀铺薄一层。锅巴两面金黄就可以出锅。煤气灶保持中偏小火就行。如此反复。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/42b41581d1f3415aa5241235b20403fb_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/91a80f27-1f25-46b9-a130-1adf17a1b4c8.jpg\",
           \"content\": \"按照我这个方子，可以做到26块的样子，时间大概半个多小时。要有耐心，我一次做了双份，做了50多块，一家人分着吃。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/e82f08a7db854caeb1b57cf3f61321b6_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/bb5a048b-357c-47fc-ad1a-50a3bdc8af2c.jpg\",
           \"content\": \"自己做着熟练，每次铺好一个下锅的时候，上一个已经可以出锅了。如图所示，希望大家都能做出好吃的锅巴。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/f92305314cdb41c5a63d9a759f6c1fd6_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/8cf91a25-4573-4094-900c-5fb12789da16.jpg\",
           \"content\": \"注意装锅巴的盘子没有水哦，晾凉了之后放入保鲜袋保存。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/c4b1839b723f4b2baeb5574f28c43787_750w_1000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"糯米\",
           \"ylUnit\": \"一斤\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"姜泥\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"35克\"
         }
       ]', '[
         6,
         23,
         67,
         106,
         210
       ]'),
       (149, '辅食丨虾片', 'http://static1.showapi.com/app2/img/caipu/20210301/a04514a9-e535-4cd7-afbe-fa64198f30f8.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/ebdfc86b-8064-4e4a-84ad-4317354d5dae.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/cbc903b4-6437-4809-b5bc-d40479442962.jpg\",
           \"content\": \"将食材称重，虾去虾线，虾头备用。120g的虾，大概是12只左右。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/d849f91fe91d4ecbaedfdbd8abc057b0_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/a155d3f9-6611-4b8b-b9f4-8b5ee96328a0.jpg\",
           \"content\": \"小火融化黄油。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/e8507067126b47b7b542ced2d31459c9_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/122c83bb-a91f-4b34-bf20-900290a17a91.jpg\",
           \"content\": \"待黄油完全融化，加入虾头，用铲子摁压出虾糕，炸至金黄。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/90e94ddae01849a09cca0739be5f0f97_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/8e31287c-3b89-4d09-9f76-c1c815df416f.jpg\",
           \"content\": \"用筛网过滤虾油备用。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/51d48d1bbf484853ac699e79358cc47a_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/ed897c8e-93d5-4613-87df-ff0a16093763.jpg\",
           \"content\": \"将淀粉、虾、28g清水、虾，一起用料理棒打成糊状。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/21367086921b47239d844455a5e011ab_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/d15941d1-04f5-4e32-a3fe-5a55272a8b9b.jpg\",
           \"content\": \"加入120ml沸水，继续搅打成图中的状态。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/f3c89cd9c71841ba86f1f8d94dd8d92c_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/4f44e5c5-ffb3-4fec-9665-d66e57447d7c.jpg\",
           \"content\": \"做了两个口味，一个原味直接就可以备用了，另一个加入了自制的芝麻海苔，我觉得原味更好吃一些。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/cdbdadabd5e445d3804119bc0ba7cc0b_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/93dad1ff-9637-408c-a6c4-778316912382.jpg\",
           \"content\": \"将芝麻海苔搅拌均匀。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/93bca47a22d84606954871d78d621bf8_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/64e1f1b0-0a27-4391-b39e-3ef0d75b4062.jpg\",
           \"content\": \"装入裱花袋内，嫌麻烦也可以直接用勺子盛到锅里。\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/9478bb8718a04e5dab38c360f2dae4c8_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/abeb6976-d265-48c5-bdaf-d1974cd0587a.jpg\",
           \"content\": \"小红锅预热，挤入虾泥，定时3分20秒3分50秒，可以多试几次，我觉得时间长点做出来的虾片会比较脆。\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/c631150aa13c4a5aaea8fe62e5980001_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/0d3dd1c1-d009-46f7-9569-ed7f16bd687d.jpg\",
           \"content\": \"出锅后晾凉，不要叠放，凉了之后就会变脆。\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/853215232cc34084b2a2c41d01fe9b3a_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/e0b76b25-13d7-4a6d-8ffa-de59075e0d79.jpg\",
           \"content\": \"彻底晾凉后，装入密封袋内。\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/fc33a33db74e4ffca0cb586de7e25525_2448w_2448h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鲜虾\",
           \"ylUnit\": \"120克\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"100g\"
         },
         {
           \"ylName\": \"凉水\",
           \"ylUnit\": \"28克\"
         },
         {
           \"ylName\": \"沸水\",
           \"ylUnit\": \"120ml\"
         },
         {
           \"ylName\": \"黄油\",
           \"ylUnit\": \"60克\"
         }
       ]', '[
         2,
         6,
         9,
         20,
         67,
         175,
         211
       ]'),
       (150, '水晶汤圆｜彩虹元宵｜水晶丸子｜适合宝宝和孕妇的汤圆',
        'http://static1.showapi.com/app2/img/caipu/20210301/fcd99934-033d-452c-be55-bca71db08a92.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/68597782-bb2e-4aac-b94a-16d5e7f852e5.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/adc93ae6-0c34-43ac-88b9-7a0026fbd091.jpg\",
           \"content\": \"地瓜山药紫薯洗净去皮配料表内大概是单色24个汤圆的量\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/0f34b882e43644578274a3bc1e296986_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/7f5d09b8-403f-4978-89e8-4aba43b05e30.jpg\",
           \"content\": \"切块，上锅蒸熟\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/4b7641bf3eab4b4a8c10a7a8c3b52849_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/ef4ef878-fad6-4542-b3c3-b83090f8f7ed.jpg\",
           \"content\": \"用水泡西米大概20分钟以上\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/5c3cc463530e47b386d3b8fe27fe119e_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/491af361-089b-4014-a846-b2b7c8940ce5.jpg\",
           \"content\": \"山药/地瓜/紫薯加入淀粉奶粉牛奶\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/6c199c40f9ac4687a8bc127542cd05f8_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/104c5fde-4552-413e-8776-1fcad7c1cb2c.jpg\",
           \"content\": \"如图\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/05b6afce56914efa83b1e01158f877e0_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/6d61d8d5-b637-4d32-b27b-51273728c4c5.jpg\",
           \"content\": \"用擀面杖碾碎成泥\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/306fe2e5cbe8495b9fd8e9e26929163f_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/6e5a2624-0dd5-421e-a534-f081ba18da36.jpg\",
           \"content\": \"混合均匀，成面团\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/4800dbb7690c4fea9cba6e112e83d526_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/b1dd73a9-d862-4c30-8644-83b58567e5be.jpg\",
           \"content\": \"三色团，纳豆，枣泥，山楂条……还可以豆沙等等你喜欢的馅料\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/cc04aaba86b344aba8d8c66052099ea8_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/a6e9a63e-c8f7-4c77-a511-2f3c93dbcde6.jpg\",
           \"content\": \"称重11g左右一个分好\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/86ca0b845e074a5ca8d809badb197915_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/d2d888cb-4aa2-4a40-8801-6df50bb28a61.jpg\",
           \"content\": \"摁平薄\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/41a6bd32f1ed4dbd87740960bcb2c62c_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/8c28fd27-f8e5-4ff3-897d-dc6abb889b5e.jpg\",
           \"content\": \"挤上馅料，团成团\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/de3502aed5ae4eb28c6d35a23a2cfc17_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/d9ebf234-fccb-4bb9-be48-e63bb3a32ec9.jpg\",
           \"content\": \"裹一层西米\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/0cd3df8329db4580be453950eef4b907_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/05ef13d5-3b8c-405e-a8ba-f7b437ebc29f.jpg\",
           \"content\": \"用手团成球\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"https://i2.chuimg.com/f2a4b2e6ea7146db8f88cc8ec884ba98_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/ce82963d-83f8-4d7a-b4ef-b5159e82f34c.jpg\",
           \"content\": \"很圆吧\",
           \"orderNum\": 14,
           \"old_imgUrl\": \"https://i2.chuimg.com/63c5a4c9e6924865a962f60d4c65ec4a_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/2330fce6-aa1e-4d80-a10c-1de34c806412.jpg\",
           \"content\": \"都做好了，准备蒸\",
           \"orderNum\": 15,
           \"old_imgUrl\": \"https://i2.chuimg.com/b825db5b91614eb9b82590cab9b5b48d_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/15ac613d-e2c9-40d6-baab-6675e28e9dc4.jpg\",
           \"content\": \"20分钟焖10分\",
           \"orderNum\": 16,
           \"old_imgUrl\": \"https://i2.chuimg.com/d16ed5acf83c49d2b56e94486d6f1788_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/94a2bfbb-d58e-4981-ad68-5ddd6a2d2529.jpg\",
           \"content\": \"馅料满满，又不会很甜的彩色水晶汤圆就好了\",
           \"orderNum\": 17,
           \"old_imgUrl\": \"https://i2.chuimg.com/595af055d04f4e7cba4894b350f116a0_3601w_2701h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/b6c91059-17ae-4907-84ec-5979a83823ab.jpg\",
           \"content\": \"元宵节快乐\",
           \"orderNum\": 18,
           \"old_imgUrl\": \"https://i2.chuimg.com/170a4f5315724d14bcdf8e3cbf4fb9dd_2385w_2385h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/5b460f0f-e292-41ac-bab2-81b44af08ed3.jpg\",
           \"content\": \"开吃吧\",
           \"orderNum\": 19,
           \"old_imgUrl\": \"https://i2.chuimg.com/4812b35dc2b34f69803bca37abfa8ced_2999w_3998h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"西米\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"地瓜／山药/紫薯\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"奶粉\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"小麦淀粉\",
           \"ylUnit\": \"60克\"
         },
         {
           \"ylName\": \"馅料\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         1,
         7,
         9,
         72,
         105,
         171,
         174,
         211,
         210,
         213
       ]'),
       (151, '宝宝辅食-香菇粉-7个月',
        'http://static1.showapi.com/app2/img/caipu/20210228/1ae266e1-d88d-4849-8da5-747e03a7bea9.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/7b3307f6-df3d-4048-9c6a-bd471c65b7d6.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/4950fde8-8e2c-406e-8a3d-78d43a5f7da9.jpg\",
           \"content\": \"鲜花菇去蒂\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/1c1fee0abe8e4a3d9a034c79922f7b31_2160w_2880h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/8a736ceb-4f64-40c0-b3df-f31ce6cdd41e.jpg\",
           \"content\": \"水加淀粉泡一会，然后每一只用水冲洗，尤其是背面褶皱里冲洗干净\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/d09d04dd64a74c7b8d89cdc93ea95088_2160w_2880h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/65520d72-3fe8-4e45-85c3-489afe3a05ab.jpg\",
           \"content\": \"切片，越薄越好，然后放在沥水篮里，阳光通风处3-5个小时\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/4b1ea9f8d66140d099f7f48b4f24c88e_2160w_2880h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/a194641a-6790-4e13-9c4a-7bc6b89c9694.jpg\",
           \"content\": \"烤盘铺硅油纸，摆放香菇片，这一步有点考验耐心，心中想着宝宝爱吃饭的样子，慢慢摆吧\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/0c473e8fa26d4e989afa01f2ced35ba8_2160w_2880h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/c456538b-47b9-403a-ad23-dca21ac24394.jpg\",
           \"content\": \"没有那么多烤盘，网盘、接油盘都利用起来吧，就是烤的时候多观察，受热不一样，勤调整盘子位置\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/c8e9762508514cfd857133839153c49a_2160w_2880h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/d68b82e5-3e4f-4d63-a756-8b435c1addcf.jpg\",
           \"content\": \"风功能上下管120度15分钟，80度1个小时，度、容量和香菇量。一定盯着，度，香菇过程中味道香了\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/f2ddfd0be13a4034a61c91bd9c8115aa_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/76ef0d7a-edb6-4d9d-88da-d98d924e2051.jpg\",
           \"content\": \"全干就可以了，尝着不能有苦味\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/9ea7d1b485a54c06a9600ae3cf7fa8a5_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/0e1efc80-36b1-425f-b01b-f388cbe70e51.jpg\",
           \"content\": \"料理机研磨成粉状过筛，剩下的小颗粒在打一次，最后剩的我扔了，再开烤箱感觉太麻烦\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/766cc63d27564c2585de2d5a36d3b7df_2880w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/14eca580-8fdb-4ceb-8070-7bba3e3b1f8e.jpg\",
           \"content\": \"装瓶，250g鲜香菇，成粉只有30g\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/46824ee78da348b88776ded20f095889_2880w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/dcbe784f-3343-41f5-bc9d-f236a9d90cf3.jpg\",
           \"content\": \"给宝宝米粉、粥、面条里都，自己炒菜、粥，营养健康又美味。\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/12c768d1655c4bad86053a00c959d7b2_2160w_2880h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鲜香菇/鲜花菇\",
           \"ylUnit\": \"250g\"
         }
       ]', '[
         9,
         74,
         171,
         211
       ]'),
       (152, '烤麻薯(宝宝儿童零食)快手零厨艺',
        'http://static1.showapi.com/app2/img/caipu/20210228/565832c7-e9a6-446c-a944-ba4d6c800381.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/4b13209b-914e-4272-bbd5-995a13c49a3e.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/9867b44e-47b8-4fd0-a833-29e702748bea.jpg\",
           \"content\": \"所用到的材料抹茶粉可以不放，牛奶推荐新疆产地，只要是新疆的不是我这款也行(只要不是伊利蒙牛就行，喝了新疆牛奶就知道以前喝的奶掺了多少水)这款提子干挺好吃的，我不吃提子干的人都觉得好吃，没有蔓越莓那么酸和甜。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/5ecebbfb6e764f9aa17f5bf2cafeec80_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/500e149f-8881-42c2-a5d9-3c36e8ea1a3d.jpg\",
           \"content\": \"糯米粉150g\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/be365ce99de94df0889a2d3f0bab8146_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/81e6c845-eba5-499a-8e47-51626ec77e80.jpg\",
           \"content\": \"加1个土鸡蛋，15g糖，微甜。糖10g。加110g牛奶，15g色拉油。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/31520ccb3c5e4363ae54abd3eaca4029_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/277b6051-aba7-4ecd-8ae4-53ff9797d3db.jpg\",
           \"content\": \"搅拌好，加入剪碎的5g提子干，喜欢吃的可以加10g。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/56fc924e3d2f499ab6d3e14090ce75e5_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/ba215466-486c-4ed5-af19-aa5da5432b2d.jpg\",
           \"content\": \"加入3g抹茶粉，不喜欢吃的可以不加。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/71d54476092444debb3d539fa07d9a26_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/1c53b2fc-5426-4632-a5bc-edc0ab6b8de5.jpg\",
           \"content\": \"装入裱花袋，很好挤出来。烤箱预热160度。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/7850ef8c929648c789016145e0be39aa_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/620d606d-e3d4-44a7-939d-50a46d5d4205.jpg\",
           \"content\": \"160度烤20分钟，这是烤好后的样子，蓬松起来，像手指饼干。趁热吃更香哦！\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/0705d3cf6506492d9884a55e2f28950e_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/ad543574-5f72-40d1-8367-17e737a69a34.jpg\",
           \"content\": \"中间糯糯的，像吃炸汤圆。非常好吃\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/a0b433cbac9142c5bc6eba21483fd53c_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"土鸡蛋\",
           \"ylUnit\": \"1只\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"110克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"15克\"
         },
         {
           \"ylName\": \"糯米粉\",
           \"ylUnit\": \"150克\"
         },
         {
           \"ylName\": \"抹茶粉(可不放，放了更香)\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"提子干，剪碎(可不放，放了更好吃)\",
           \"ylUnit\": \"5克\"
         }
       ]', '[
         3,
         7,
         74,
         210,
         211
       ]'),
       (153, '低油经典韭菜鸡蛋水饺——中老年人营养餐单',
        'http://static1.showapi.com/app2/img/caipu/20210301/e1be84c7-ab92-467c-b6bd-f4bdb7bcf6c3.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/1077d0fb-dca9-4256-b442-f6a4f21736a8.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/24012c66-cea9-451e-ad15-734c245915d3.jpg\",
           \"content\": \"和面自动略，我妈妈喜欢提前将面和成面团放在冰箱冷藏里（近两天内吃完的,随时可以用来做些面食，饺子呀，烙饼呀，醒的非常彻底，面筋形成的充分，口感赞鸡蛋五个，加3克盐，搅拌打均匀\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/fb100a11e35f487d81ef4c174a94dbe6_1936w_1547h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/bc407215-b949-4eb3-acbd-5cfef240cc69.jpg\",
           \"content\": \"锅中少许油，加入鸡蛋液炒碎\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/261f9bdcfc184aa09b6f32115be02370_1936w_2592h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/79c35691-576e-4be1-9815-08cbd2a8de6a.jpg\",
           \"content\": \"虾皮用水清洗一下，泡一下，锅中少许油，放入虾皮，炒，加入五香粉，如果没有，可以用十三香代替，炒\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/f8d29446a6ff432fb54f1b510e042014_1936w_2592h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/2994fc14-1851-4841-8b6f-8784c2a4a097.jpg\",
           \"content\": \"虾皮炒微干就好，和之前炒好的鸡蛋混合放好放一边晾凉\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/1d441ac0072a467f9848a8004d55665c_1936w_2592h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/804b36e3-4642-407f-8842-16c19ff6006a.jpg\",
           \"content\": \"韭菜洗净切碎，与晾凉的鸡蛋虾皮一起混合\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/a61bf431a85143c1bfa8dc9fbd8ab403_1936w_2592h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/f8999189-dd07-471a-92d0-ece86c1662b6.jpg\",
           \"content\": \"拌匀馅料\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/3e88c51aaec1497aacd4c04c619edc26_1936w_2592h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/7ed60117-d6ae-43d3-991b-de37dfeb789a.jpg\",
           \"content\": \"包好饺子\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/110477659f524919a8124f4927636ffd_1936w_2592h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/7087821d-8911-4fbc-bec4-2bec247f73d8.jpg\",
           \"content\": \"煮饺子，水开下饺子，水大开饺子浮上来，浇凉水平息，待再煮开再浇凉水，再大开，煮好了，可以捞上来吃了\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/33b44691c07e427c9129032d5b08d7f9_1936w_2592h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"5个\"
         },
         {
           \"ylName\": \"韭菜\",
           \"ylUnit\": \"500克\"
         },
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"油\",
           \"ylUnit\": \"少量\"
         },
         {
           \"ylName\": \"五香粉\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"虾皮\",
           \"ylUnit\": \"1把\"
         }
       ]', '[
         1,
         6,
         9,
         136,
         70,
         71,
         104,
         174,
         212
       ]'),
       (154, '番茄巴沙鱼（老人孩子都爱）',
        'http://static1.showapi.com/app2/img/caipu/20210301/82b0983a-91d0-4f65-95bb-40e3327d1f5e.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/297c132b-ff45-459c-a937-3eee82235144.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/078d8c6f-0237-4fdc-82e5-191385d6bfc4.jpg\",
           \"content\": \"巴沙鱼600克洗净晾干水分，适量料酒、盐、白胡椒粉、3片姜抓匀，适量玉米淀粉抓匀，腌制30分钟。油温8成热时放另外3片姜、3瓣蒜、葱白香，腌制巴沙鱼。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/c1e94b9710ef4a0db594eb5678c52692_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/094234f9-f046-4efc-9901-2378da903c16.jpg\",
           \"content\": \"3个番茄划十字刀开水中烫10秒去皮切块，锅中油烧热后加入番茄翻炒至番茄软烂。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/eead748149d244d8a1d1fe15575103b5_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/4680dcd4-fc50-42b1-b441-95ba598ed74d.jpg\",
           \"content\": \"加入半铲番茄酱调色调味。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/7fad2721bb034a44b83225cc854aded4_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/d8ffde48-1620-4284-bce9-91141733cbe7.jpg\",
           \"content\": \"加入金针菇翻炒至金针菇变软。（原来我的懒惰，金针菇拦腰切一刀更好）\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/be7fce453bee474992c4b356c08278f2_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/3fe75dbd-7f71-4c93-b98c-70dd63a56750.jpg\",
           \"content\": \"加入适量开水加盖大火煮3分钟，让番茄味更浓郁。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/9bc78b9824e147d88514cf46bc396a5c_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/a83f5251-a55d-40a1-af12-6fc8a1cf9b2b.jpg\",
           \"content\": \"加入炒好的巴沙鱼，加入适量盐和蚝油调味，加盖大火煮2分钟。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/ea6cf841b7184dc7b3b2434fd19b3d94_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/78b7b09c-be44-4715-b422-64feee03e5c9.jpg\",
           \"content\": \"盛出，撒上葱花，请享用！（这味绝对比那啥人小吃更赞）\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/6c921749250342189f9670a402223b27_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"巴沙鱼\",
           \"ylUnit\": \"600克\"
         },
         {
           \"ylName\": \"西红柿\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"金针菇\",
           \"ylUnit\": \"1把\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"6片\"
         },
         {
           \"ylName\": \"小葱\",
           \"ylUnit\": \"3根\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"3瓣\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"白胡椒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"玉米淀粉\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"番茄酱\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         20,
         23,
         68,
         70,
         71,
         171,
         170,
         175,
         212,
         210
       ]'),
       (155, '百吃不厌的芝麻薄脆，香甜酥脆，老人小孩都喜欢',
        'http://static1.showapi.com/app2/img/caipu/20210228/a007b062-9c07-4870-b4dc-dff12f7e21b1.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/9dd2f066-7f93-46c6-8ff2-145f2812ba02.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/1aed90dd-0487-40fb-8e62-1f127ca674ba.jpg\",
           \"content\": \"蛋清、植物油、细砂糖倒入大碗里，用蛋抽搅打至细砂糖完全融化，碗内的食材充分混合均匀，表面看不到明显的油花。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/6c76aeddbcf64ff7aeeffa0e59b92ac7_6000w_4000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/73b07a4f-8282-4801-8c26-cbdbaad7776b.jpg\",
           \"content\": \"筛入低筋粉，继续用蛋抽搅拌成没有颗粒的、细腻的面糊。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/4c777844c7ed40ab9c7cb38669fdd406_6000w_4000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/20c131b2-ca23-4758-8e19-62ed292a2991.jpg\",
           \"content\": \"白芝麻倒入碗中，稍微搅拌几圈，混合均匀即可。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/36b6acdc746348aaa77b411447e5060b_6000w_4000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/4be10ae4-7820-4c95-826a-f646bbce5fce.jpg\",
           \"content\": \"准备一个大号的裱花袋，把面糊全部倒入裱花袋里，收口处扎紧。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/32f211dbba1843cfa6d9b206457c292d_6000w_4000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/e35c0f4e-6d6f-48a8-96dd-b26eb653454b.jpg\",
           \"content\": \"裱花袋剪一个小口子，在铺了油布的烤盘里均匀地挤出直径约3厘米的小圆片，面糊会慢慢摊开，所以每一个小圆片之间都要保留一定的间距，以免粘连在一起。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/07bcfbf20223405aab1ede2cbd1f7d38_6000w_4000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/b42d84bf-3433-4056-b1f4-de01e22fe144.jpg\",
           \"content\": \"烤箱提前用180度充分预热，预热完成后将烤盘放入中层，关紧烤箱门。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/8bb1d7566a1b44cda978dc3e10e4b222_6000w_4000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/b2ab1ed6-aeb7-40ac-91ca-1ccf9c0f8003.jpg\",
           \"content\": \"设置上下火170度烘烤8-10分钟，圆片中间呈金黄色、边缘呈浅棕色即可。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/c79371aaa338432f9498cd221a690fea_6000w_4000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/fe9bc10c-d2cf-4494-ab7b-1f6e256ba90d.jpg\",
           \"content\": \"刚出炉的薄脆摸起来有点软软的，连同烤盘放在晾网上降温，彻底冷却后就会脆硬，一定要密封保存，以免受潮变软。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/faff1587efa94c6b89d896fe25d17762_6000w_4000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"蛋清\",
           \"ylUnit\": \"60克\"
         },
         {
           \"ylName\": \"细砂糖\",
           \"ylUnit\": \"40克\"
         },
         {
           \"ylName\": \"植物油\",
           \"ylUnit\": \"25克\"
         },
         {
           \"ylName\": \"低筋粉\",
           \"ylUnit\": \"40克\"
         },
         {
           \"ylName\": \"白芝麻\",
           \"ylUnit\": \"50克\"
         }
       ]', '[
         7,
         74,
         106,
         174,
         210
       ]'),
       (156, '紫薯藕粉杯', 'http://static1.showapi.com/app2/img/caipu/20210220/9eae980e-cf22-4e20-9a34-b05bb4bfaae5.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210220/843f70fc-4968-4b00-8d3b-68e542842025.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/6ad8ed75-76cb-4788-a74e-509816fb6ef0.jpg\",
           \"content\": \"两个紫薯上锅蒸熟捣碎，舀出其中一部分放入杯中铺平打个底\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/bb9263f4328545fca685646ddcd4b2ed_828w_662h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/dbc1ae9a-a665-4838-9c15-ac3ee31cdb2b.jpg\",
           \"content\": \"锅中加入200克的水烧至沸腾加入紫薯泥不断搅拌均匀，放入已经冲泡好的藕茶等待紫薯与藕粉完美融合成羹状，是不是很浓稠，非常漂亮的颜色有木有！！！\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/f34c5bf68fc54a35814cfcb8c7a31c79_828w_662h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/b80f4c5b-5e98-4419-9188-048cf0f06a17.jpg\",
           \"content\": \"把锅洗干净在倒入200克的牛奶烧沸，加入紫薯泥搅拌均匀即可，牛奶内含丰富的蛋白质且密度与水不同，所以无需添加其他佐料使其浓稠\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/ac661c28679a4d8d87c270ab22565018_828w_662h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/dbdef724-5bde-4c7d-91b3-b5409b0f8f1c.jpg\",
           \"content\": \"倒入喜欢喝的酸奶，口感会更加的好哦，可以稀释一下紫薯的甜度\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/6ea2ef414bea4d78a7f8be90fedce1c7_828w_1792h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210220/0c88fea6-cf10-47c3-a3f1-0be83639d24f.jpg\",
           \"content\": \"想要好吃又好看，装饰必不可少，放上三块棉花糖就完成了\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/1f25a7f0c679411b8b423c006d24aa17_828w_1792h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"藕粉\",
           \"ylUnit\": \"1包\"
         },
         {
           \"ylName\": \"紫薯\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"酸奶\",
           \"ylUnit\": \"1杯\"
         },
         {
           \"ylName\": \"棉花糖\",
           \"ylUnit\": \"3块\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"200克\"
         }
       ]', '[
         3,
         7,
         71,
         171,
         212,
         210
       ]'),
       (158, '小美排骨萝卜汤，产妇月子汤',
        'http://static1.showapi.com/app2/img/caipu/20210129/2c811de5-9ff8-49fb-8e77-4c2c746dda4b.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210129/4a6368cb-0c09-4f71-b3c9-fb973658d36d.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210129/e60e3f7a-e9f5-42d2-ab19-df364c834c9f.jpg\",
           \"content\": \"排骨焯水，放入主锅，老姜，葱结，水(没过排骨，60分钟，100度，反转，小勺。最后25分钟，可从主锅盖孔加萝卜块，这样不用停机。出锅，撒葱花装饰。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/0b23c7984fa1480eafddeb9f960ebf9e_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"萝卜\",
           \"ylUnit\": \"一段，根据自己喜好\"
         },
         {
           \"ylName\": \"排骨\",
           \"ylUnit\": \"400克\"
         },
         {
           \"ylName\": \"葱(去腥的)\",
           \"ylUnit\": \"打结的\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"3片\"
         },
         {
           \"ylName\": \"葱花(装饰)\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量(产妇清淡点)\"
         }
       ]', '[
         71,
         6,
         99,
         170,
         171,
         213
       ]'),
       (159, '孕产妇西红柿豆腐鲫鱼汤',
        'http://static1.showapi.com/app2/img/caipu/20201215/39d9cf78-d40c-4caa-8cdd-4629005143db.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201215/0dde434f-dc70-4351-ba88-654ce3530ce4.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201215/920a07a1-d9cb-49fc-a817-027a10b7789f.jpg\",
           \"content\": \"准备食材，鲫鱼每面划三刀（方便入味）\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/3263486fb6e142949085350b6ec4450f_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201215/1a236d39-bd66-4d6b-a013-2a08e16718bd.jpg\",
           \"content\": \"把西红柿、豆腐切块备用，香菜切段备用\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/b0a15a9fc95c4f6ea6ca720e7012d15c_1632w_1224h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"热锅凉油，顺着锅边转一圈，让锅底沾满油（防止鱼破皮）\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201215/1faf8968-288a-48ef-a053-e17fa2cef3fc.jpg\",
           \"content\": \"热锅凉油，把油顺着锅边转一圈，让锅底沾满油，放入鲫鱼，中火慢煎\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/dca217fa03814549a00d530b8abb5229_794w_724h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201215/60474a0c-e705-4770-bf5b-4297c27e22fb.jpg\",
           \"content\": \"煎至金黄，翻面继续煎，煎至金黄（鱼小划刀太深，鱼给煎断啦）\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/2254720416884beeb52a6033d56c54cc_1224w_1120h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201215/31370aab-d38b-45ff-8394-8ad8df4b8759.jpg\",
           \"content\": \"锅中加入开水，超过鱼（我为了喝汤，加水比较多）\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/371df9c1e275455a9b6781b03d73fd4c_1224w_1632h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201215/0da08eaa-6d12-4eb3-8ffa-f0e823e8e2ed.jpg\",
           \"content\": \"加入西红柿、豆腐，盖上锅盖，大火烧开，转中火炖20分钟\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/4df6e7a7602c4f939cf277d1c73dcc8b_1224w_1632h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201215/b37e00c3-f35b-4b05-9212-738a8e8eac55.jpg\",
           \"content\": \"最后调成大火加入盐\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/5d86f8d0125243bc9ac229f719a391d6_1224w_1632h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201215/a5035770-2208-4d3e-95ef-15b9e1da9c12.jpg\",
           \"content\": \"出过加入香菜（不喜欢可以不加，也可以换成香葱）\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/4fb4bb82aa9f4f6f918edaa3ea1013b1_1224w_1632h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201215/5f795cd1-02f8-459f-9e4b-f632ec7f54b4.jpg\",
           \"content\": \"一份好喝的鲫鱼汤做好啦\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/f5f58d56eb3c4815936b21b099ae27a3_1224w_1632h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鲫鱼\",
           \"ylUnit\": \"2小条\"
         },
         {
           \"ylName\": \"豆腐\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"西红柿\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"香菜\",
           \"ylUnit\": \"\"
         }
       ]', '[
         2,
         6,
         9,
         20,
         73,
         69,
         71,
         99,
         170,
         175,
         213
       ]'),
       (160, '❗️产后必吃❗️血糯米莲子花胶粥（孕产妇补血修复）',
        'http://static1.showapi.com/app2/img/caipu/20201015/95967c62-4493-48e7-8e4d-0ff70afdd4f2.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201015/7541bc0c-2007-447b-a29e-c4da41f29acb.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/6d388de3-b116-4bba-a018-60d950682dda.jpg\",
           \"content\": \"准备好所有食材，免得漏了谁哈哈\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/04a74264c1ea42bab61c6b0d6f578020_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/0705d534-9104-45f1-8ea7-396a3e5508e3.jpg\",
           \"content\": \"红枣去核防燥，然后除了红糖，其他食材用清水浸泡30分钟。（觉得你的花胶腥或者脏的可以参考这篇www.xiachufang.com/recipe/104055308/\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/e1879fb5644148b18a3d3e214a1d289e_3692w_2877h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/bfdff9dd-b8bf-45d3-81d6-9bfd8861d670.jpg\",
           \"content\": \"然后把所有食材洗干净放入锅中，隔水炖选择甜汤2-3小时即可。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/48cfd8d70d8044619190439d65d22e17_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201015/4ef034a9-7907-40cc-bd7a-7e486a0708ef.jpg\",
           \"content\": \"好啦就是这么简单又营养又好吃的补血养颜粥！关于红糖你们喜欢后面下或者炖时下都无所谓\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/b73fb2aacf71477c9c052ca5ac978c6d_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"血糯米\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"花胶\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"莲子\",
           \"ylUnit\": \"8颗\"
         },
         {
           \"ylName\": \"红枣\",
           \"ylUnit\": \"2颗\"
         },
         {
           \"ylName\": \"枸杞\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"老红糖\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         1,
         7,
         9,
         69,
         100,
         213,
         71
       ]'),
       (161, '产妇鲫鱼汤：鲜美又营养！',
        'http://static1.showapi.com/app2/img/caipu/20201004/37bb0249-5b8a-442f-899c-652cf6254491.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201004/4991b262-baed-47d5-8d28-dd4e2554d1d4.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201004/009d27e9-e6d2-429f-8c30-586995aab655.jpg\",
           \"content\": \"先将处理过的鱼洗净，横刀鱼背，撒些许盐，放十分钟。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/0ddad6667f9743e3a13f610e1b5a21cc_837w_570h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201004/2248b793-d055-46f7-a0bd-bae9e9c86176.jpg\",
           \"content\": \"倒入菜籽油烧热。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/f08fbff624a44c738259b4c6c93ba22b_834w_654h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201004/c0c15005-9e4a-4839-aa4b-9cdb7fc49c91.jpg\",
           \"content\": \"把鱼表面的水用吸水纸吸干，放入油锅里，一会放入生姜，两面炸制表皮金黄。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/5b1e8b3d9a61421b94f4c424117ffad8_834w_672h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201004/b924b8c4-05d1-4900-836e-0560dc4b20c5.jpg\",
           \"content\": \"加入剩下的葱白和生姜大火烧开，转中小火，熬10分钟。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/74dd61a910814a65838ee197ddca4db8_833w_711h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201004/f597448f-df0d-4c8a-b811-4685feff0712.jpg\",
           \"content\": \"最后加入适量盐和香葱段，两分钟就可以了\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/ee445139f71a4ec9ba75ea524c8ba398_832w_673h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201004/7d1b470a-e056-47c0-883f-0c4e62cb0b25.jpg\",
           \"content\": \"最后成品就可以出锅啦\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/c55f2e4892ca4c489e79e48dc597045c_839w_733h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鲫鱼\",
           \"ylUnit\": \"1条或2条\"
         },
         {
           \"ylName\": \"葱\",
           \"ylUnit\": \"2根\"
         },
         {
           \"ylName\": \"生姜\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"菜籽油\",
           \"ylUnit\": \"2勺\"
         }
       ]', '[
         2,
         6,
         20,
         73,
         71,
         99,
         170,
         175,
         213
       ]'),
       (162, '孕产妇月子鸡汤（超简单，四味料就可以做）',
        'http://app2.showapi.com/img/caipu/20200806/690fc1f3-dff3-4cda-a48a-0dcc0570ef63.jpg',
        'http://app2.showapi.com/img/caipu/20200806/a99217ab-4aca-40fb-9f0c-7a643500f3b1.jpg', '[
         {
           \"imgUrl\": \"\",
           \"content\": \"1.把鸡块洗净，管它带皮带骨还是带肥油，都往锅里放，简单粗暴。我是冷水开始给它煮，还放了五六片姜片一起煮的。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"\"
         },
         {
           \"imgUrl\": \"\",
           \"content\": \"2.水开了后，有些浮沫，可以去掉（我当时没去掉，而且我的鸡肉是冻过解冻的，好像也没啥血水，所以就没焯水了）。搅拌了几下，浮沫都下沉了，我就直接将这些开水和鸡肉全部倒炖锅，炖锅里又放了七八片姜片，还有约一汤勺料酒，去腥。喜欢多喝汤的，还可以多加点开水进去一起炖。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200806/0fcaaa44-ba3f-4955-b21e-1cce00ae512b.jpg\",
           \"content\": \"3.开动砂锅鸡鸭档，大概一小时十分，让他自己炖，要喝的时候，加盐，试味，口味重就多点盐，还可以加鸡精。我妹口味重，让我给她汤碗里又加了一点盐和鸡精，她很喜欢。哺乳期建议少吃鸡精，因为影响宝宝吸收锌）我口味淡，只有盐。而且也没很多，但我依然觉得很鲜很香。(o)\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"http://i2.chuimg.com/f5dd27c389da4a0186ed62a1fc44613c_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"带骨鸡块（整鸡剁出来的）\",
           \"ylUnit\": \"四分之一只\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"一汤勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"姜片\",
           \"ylUnit\": \"十片左右（多放没关系）\"
         }
       ]', '[
         2,
         6,
         20,
         69,
         71,
         99,
         170,
         213
       ]'),
       (163, '产妇月子莱~洋葱炒猷獴(青蟹)', 'http://app2.showapi.com/img/caipu/20200731/ca2c3902-c4b5-48b6-9cd6-422b44c14251.jpg',
        'http://app2.showapi.com/img/caipu/20200731/1f679ff2-1ba3-4a2e-982c-e5661e5f3299.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200731/eadfce35-8e3c-4a9f-a200-b13ae4d5bb17.jpg\",
           \"content\": \"猷獴洗净除去勰和胃，切块，姜切片，切段，切块，备用。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"http://i2.chuimg.com/fc4b66e837a645d5a7db943d7f4a42d0_1632w_920h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200731/20207958-fbb5-4b3d-93ce-ad589545ec57.jpg\",
           \"content\": \"油锅加热姜和洋葱爆香即加入猷獴翻炒，倒入调好的生抽黄酒和少许开水(约半碗，炒匀盖上锅盖三两分钟，开锅略翻炒放入葱段，收汁即可出锅。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"http://i2.chuimg.com/0bdb8391cfad4e23b905cf7a6f673c09_1632w_920h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"猷獴\",
           \"ylUnit\": \"2只(500)克\"
         },
         {
           \"ylName\": \"洋葱\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"生姜\",
           \"ylUnit\": \"3片\"
         },
         {
           \"ylName\": \"葱\",
           \"ylUnit\": \"3根\"
         }
       ]', '[
         2,
         6,
         70,
         175,
         171,
         213
       ]'),
       (164, '适合产妇的猪肚包鸡', 'http://app2.showapi.com/img/caipu/20200718/62381fa0-274a-487c-b43e-9f043787b932.jpg',
        'http://app2.showapi.com/img/caipu/20200718/bd4d0206-92c9-40a2-9bca-cc4e6fbe8bf7.jpg', '[
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/9686733c-017b-4a53-a106-d88b5ad2a796.jpg\",
           \"content\": \"第一步就是最难的一步——洗猪肚。猪肚是盒马买的，已经很干净了，但是还是有好多好多粘液，还有腥味。如果一个人为你做下水，那他对你一定是真爱！猪肚翻过来，放三小勺盐，若干白醋，用手抓洗。然后用水冲掉。沥干水加若干淀粉，用手抓洗，然后用水冲掉。之后把猪肚翻个面，按照上述步骤抓洗。之后翻面，继续重复这个过程。我一共洗了六遍，粘液稍微洗的差不多了。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"http://i2.chuimg.com/e687044e8912412a964874f9bbbcf54d_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/1d500977-05c4-4107-b6ff-a07b5befc72d.jpg\",
           \"content\": \"烧一锅开水，把猪肚放进去烫一下。注意这个时候朝外的那面应该是有粘液的那面，那一面有一些白色硬硬的东西，要把这些东西去掉。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"http://i2.chuimg.com/81ff736a5f1a4ca49fdee5a1f50020a6_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/8379191f-abe8-455a-8cb4-60f20c81c675.jpg\",
           \"content\": \"烫过之后用手抠就可以把白色硬硬的东西抠掉了，如照片所示。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"http://i2.chuimg.com/57cba1e55cc14252811df1e27fdc2d3b_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/117643ea-4e8a-4220-bb06-17ae22a5cdb2.jpg\",
           \"content\": \"接下来处理鸡，专门买的煲汤用的黄油母鸡，头和屁股砍掉，爪子和脖子都留着，爪子煲完巨好吃。然后把鸡斩小块。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"http://i2.chuimg.com/7cdbdee88e3a4e64ab9d2ab30ca43b5d_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/d5ec9124-76ab-43e1-a5fc-13de95ade194.jpg\",
           \"content\": \"把小半块姜切成片，然后准备把鸡块、姜片塞到猪肚里。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"http://i2.chuimg.com/ece24bc718214afea543767cab12a8e9_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/ca875bc5-51ee-44bf-b28e-231207b271f4.jpg\",
           \"content\": \"塞之前把有粘液的那面翻出来，均匀的撒上白胡椒粉。正宗的是用白胡椒粒碾碎，我没有，用的白胡椒粉也还行，最后还是挺好喝的。白胡椒粉一定多撒一点，不会很冲的。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"http://i2.chuimg.com/1e2b7e3989224d209475d8948969bdf7_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/7a126ba3-31be-4113-8c90-1b8fff45c54c.jpg\",
           \"content\": \"抹完白胡椒把这面翻回去，把鸡块塞到猪肚里，用牙签把口封好。这个猪肚很大，正好塞了一整只鸡。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"http://i2.chuimg.com/028b04029c2247a3b5a8ae56ffdb0aed_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/2e643206-1a66-4aee-8e86-efa5c4c5abbb.jpg\",
           \"content\": \"找个大锅，我用了珐琅锅，因为我的砂锅没那么大，用砂锅更好。一次性放足水，冷水下猪肚，加入米酒，大火水开后调小火，就是汤慢慢咕嘟，但是水分不会少那种。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"http://i2.chuimg.com/6e818c77b930493fb373e0c2831861f8_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/05d69a64-090e-4173-b86e-316c1baf7d73.jpg\",
           \"content\": \"煲两个小时，中途要去翻动猪肚，不然就会像图片上所示，会粘锅。两个小时后，鸡汤已经很浓很香了。\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"http://i2.chuimg.com/847a23dc529e4127918fac004f50d528_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/c4da5ae4-2af6-4c55-aa88-0ce8b955d8bf.jpg\",
           \"content\": \"把猪肚捞出来，用刀划开。可以看到鸡肉特别香且很嫩，鸡肉煮出了胶质。\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"http://i2.chuimg.com/f97270be1fce4fe1acbfa717b9fc2388_3781w_3026h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/570d2dac-a1b3-4243-9158-cb25ee652e75.jpg\",
           \"content\": \"鸡块弄出来放回锅里，猪肚切成菱形块同样放回锅里。\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"http://i2.chuimg.com/6de6c002a2824c06b35863cb2dabd4a2_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/87d4afc9-0c5f-449e-80ab-fddf4328baae.jpg\",
           \"content\": \"放入盐调味，放入红枣、枸杞，中小火咕嘟十分钟，就可以出锅啦。\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"http://i2.chuimg.com/b08203efb27f483990b14998874fcec4_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://app2.showapi.com/img/caipu/20200718/0836bfcb-5132-4db6-b477-136feb9c2a35.jpg\",
           \"content\": \"汤色浓郁，而且完全没有猪肚的腥味，很香。猪肚特别软糯，鸡肉也很软嫩，真是好吃到面条泪！\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"http://i2.chuimg.com/3a64ae3b0d5e45edb5887281c1bf9593_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"猪肚\",
           \"ylUnit\": \"1个（大）\"
         },
         {
           \"ylName\": \"黄油母鸡\",
           \"ylUnit\": \"1只\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"小半个\"
         },
         {
           \"ylName\": \"白胡椒\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"食盐\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"米酒\",
           \"ylUnit\": \"40克\"
         },
         {
           \"ylName\": \"白醋\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"红枣\",
           \"ylUnit\": \"4颗\"
         },
         {
           \"ylName\": \"枸杞\",
           \"ylUnit\": \"一小把\"
         }
       ]', '[
         2,
         6,
         71,
         170,
         213
       ]'),
       (165, '汤圆团子（日式基础团子）',
        'http://static1.showapi.com/app2/img/caipu/20210301/f8e99118-4c2c-4c74-b1ac-cbd3e95b3028.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/75b73d8d-1b49-436f-9357-500ccd14f1bd.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/3694cdcb-435e-49ce-82f4-36665748a59d.jpg\",
           \"content\": \"所有材料放入主锅，混合成团（30秒/速度3）\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/7024a2904a054345958c17100bd5ed4b_1616w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/2d46c1b3-98a3-42b2-939a-1b51ceb393ca.jpg\",
           \"content\": \"不同品牌的糯米粉的吸水性、内酯豆腐的含水量不同，所以只能给大家一个参考比例1:1，实际操作过程中，如果面团太湿或太干，适当添加糯米粉和豆腐微微调整就可以了\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/0692f70186094d2c92f5f13875fec1ab_1616w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/540c46ae-d5d2-4a39-a8f4-9b5f94394af2.jpg\",
           \"content\": \"取出面团，搓成圆球形丸子（食谱分量，我每个颜色可以搓大概18个）\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/4d6e8c38b90d482f84eefa27335e9236_1616w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/e2609546-6f37-41a5-b938-ab9817f38d58.jpg\",
           \"content\": \"烧一锅热水，水开后放入丸子，煮到丸子漂起，即可捞出\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/652488a568e74ed3b481735ea3aab34a_1616w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/fc24ba13-a79a-4c5d-834e-d9fd2a776870.jpg\",
           \"content\": \"放进冷水快速降温，冰水的话口感会更Q弹\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/c4964a5edacc4136b079406feb50e08d_1616w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/e83e976b-a51f-4cef-9e86-ea58fa4a35eb.jpg\",
           \"content\": \"取出滤掉水分，放入盘子里，或者用竹签串起来，配蜜豆、红糖水、黄豆粉，QQ弹弹好吃\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/a0bb1980e1a248cab8c833495695ce2c_1616w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/c5c6a1aa-7f06-4def-97a7-726e6f804d6c.jpg\",
           \"content\": \"豆腐的加入，让团子隔天都能保持Q弹软糯的状态，可以做成甜品便当带去野餐或者当成下午茶和同事朋友分享都很不错哦\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/5be7b2fbe67947ac982bf1634e37957a_1616w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"糯米粉\",
           \"ylUnit\": \"100克\"
         },
         {
           \"ylName\": \"内脂豆腐\",
           \"ylUnit\": \"90-100克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"抹茶粉\",
           \"ylUnit\": \"2克（原味可省略）\"
         }
       ]', '[
         3,
         7,
         71,
         105,
         174,
         230
       ]'),
       (166, '营养均衡、菜饭一锅端的“日式大阪烧”',
        'http://static1.showapi.com/app2/img/caipu/20210227/c69e9f12-bb85-4b1d-824e-78c32ca116f7.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210227/4c09502b-dc36-4f5e-8643-7e37b8223acd.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/d1e26ffa-b76e-411b-8587-2caf040fa04d.jpg\",
           \"content\": \"准备好所有食材（有小章鱼放点会更好吃）\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/537a281d564f43a78e02a1f3e208d6c4_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/7cb47e79-8ba0-41e1-b6b5-b9932658441e.jpg\",
           \"content\": \"称量面粉70克\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/990c1a8eaf75476b89cc100751e8ae2d_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/7c9ea402-e70d-4c84-8d03-896be475a15c.jpg\",
           \"content\": \"水70克\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/6217786ebc6d4e49b16a7a4aaa77607f_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/888a1b88-e0d3-4e7d-aae1-0bb7aa91f9c0.jpg\",
           \"content\": \"山药擦成泥\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/2f34ed57ee804f67a1794cd71ad3887b_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/ac07eb33-32b0-41c0-8202-d8b4a1ca7b3c.jpg\",
           \"content\": \"蒜泥\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/87e440a436f64f4b95a2addc6e52eb23_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/dfefa2d7-c4ad-400a-a24a-d244601dba31.jpg\",
           \"content\": \"姜泥\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/225988577648427fb70ececd2dd5b664_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/09f88264-cd8f-4ec2-bf85-89b8204bf8f5.jpg\",
           \"content\": \"制作步骤：1、先混合面粉和水\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/255a13190b4a4d26980f6ab018751a38_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/95e69d13-7db8-4311-b3f6-76aeb6b84c8b.jpg\",
           \"content\": \"成一个小面团\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/7ae0f0b8ce564f16a2265f4cc79042f1_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/531888de-8c8a-4142-80d6-c4b4ca7665d8.jpg\",
           \"content\": \"2、放入刚才擦好的山药泥\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/6a84b18a6e424217b82eb515c7457197_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/0d654052-4dd1-42e8-b243-432997736658.jpg\",
           \"content\": \"3、把所有菜品放入面糊里（切丝的洋白菜、切丁的洋葱、香葱、虾仁、两个鸡蛋）\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/25e3b6f4bc0b46afbb66e28a82a2b530_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/139d9b64-b00d-40dd-ac3c-171cd82f7f4b.jpg\",
           \"content\": \"4、搅匀后放入黑胡椒\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/787e09ba46a44649bed237abea0dbc24_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/76c252e0-354f-4afb-8f25-dfd4f0192ac3.jpg\",
           \"content\": \"海盐\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/2d4743acbe9a4630877c7f279ee4ec91_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/809a374f-bef2-49ea-bccd-f7461c289ac4.jpg\",
           \"content\": \"搅拌均匀\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"https://i2.chuimg.com/77b7ad3e58824316a54639f00728bd98_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/75ec1a80-b426-410c-a2ea-4e314d3ac3c5.jpg\",
           \"content\": \"5、锅内倒油，热了后倒入混合好的面糊\",
           \"orderNum\": 14,
           \"old_imgUrl\": \"https://i2.chuimg.com/5708a5b3936c40398c2249557f6243d2_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/505ae51a-3a0b-4208-96b4-8e603345086a.jpg\",
           \"content\": \"铺平\",
           \"orderNum\": 15,
           \"old_imgUrl\": \"https://i2.chuimg.com/a0dd7eab553540bfa6c04e93bdefb88d_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/43f93978-3d5b-429a-829a-b62b5cbe29e9.jpg\",
           \"content\": \"摆上香肠\",
           \"orderNum\": 16,
           \"old_imgUrl\": \"https://i2.chuimg.com/054690bd795b4c4d97b45aa6d2ed535e_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/5c52fe6c-6179-4812-90ad-0a0461740573.jpg\",
           \"content\": \"盖上盖子，大概4分钟左右\",
           \"orderNum\": 17,
           \"old_imgUrl\": \"https://i2.chuimg.com/0811c6dc64244dddb9d38805c027a93a_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/47c0724a-fe78-4de8-afbc-a448f32e1cde.jpg\",
           \"content\": \"四分钟以后，找一个大盘子翻面\",
           \"orderNum\": 18,
           \"old_imgUrl\": \"https://i2.chuimg.com/bd2e3a2cf7014a088395abb8fcd68029_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/602eee4c-4600-45bd-ab63-f6abe8ed2beb.jpg\",
           \"content\": \"翻好，再倒入锅内煎另一面\",
           \"orderNum\": 19,
           \"old_imgUrl\": \"https://i2.chuimg.com/71e0fc1676164a63a16c4057d6d4216c_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/0a971358-1712-4d82-94bc-a798097e247a.jpg\",
           \"content\": \"灵魂酱汁\",
           \"orderNum\": 20,
           \"old_imgUrl\": \"https://i2.chuimg.com/4c2e4b6512214ea187e794cd3903fee5_684w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/7e103b52-7f06-4466-8a13-5b71a7cd03ba.jpg\",
           \"content\": \"最后再翻过来，也就是肉面朝上，挤上照烧酱汁，和沙拉酱（我用的那种袋装的，剪了一个小口，用根竹签画上花纹即可\",
           \"orderNum\": 21,
           \"old_imgUrl\": \"https://i2.chuimg.com/b7c9253fd3bd4918b9cdc496ceac4da7_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/fb90c4ab-4b79-4365-a777-08e23bfd6e8c.jpg\",
           \"content\": \"家里没有木鱼花，撒了海苔芝麻碎\",
           \"orderNum\": 22,
           \"old_imgUrl\": \"https://i2.chuimg.com/92acf090c70f4c37bf7d1253d1701563_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/f3a31b45-e05a-4c16-a821-d971da0df2d7.jpg\",
           \"content\": \"特别有食欲，又是菜又是肉，还有山药，营养很全面了\",
           \"orderNum\": 23,
           \"old_imgUrl\": \"https://i2.chuimg.com/99433610e4f3433fbce59ab0b204aa08_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/d8b50784-2fe2-4c0b-8b4e-7aaea10ec5f2.jpg\",
           \"content\": \"配上一碗豆腐味增汤，妥妥的晚餐\",
           \"orderNum\": 24,
           \"old_imgUrl\": \"https://i2.chuimg.com/7aa92bbbf6ff44479da5d8eaa00bb1d1_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"小包菜\",
           \"ylUnit\": \"1/4个\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"70克\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"70克\"
         },
         {
           \"ylName\": \"山药泥\",
           \"ylUnit\": \"100克左右\"
         },
         {
           \"ylName\": \"小香葱\",
           \"ylUnit\": \"1根\"
         },
         {
           \"ylName\": \"海盐\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"蒜泥\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"姜泥\",
           \"ylUnit\": \"5克\"
         },
         {
           \"ylName\": \"照烧酱\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"沙拉酱\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"洋葱\",
           \"ylUnit\": \"半个\"
         },
         {
           \"ylName\": \"鲜虾\",
           \"ylUnit\": \"10只左右\"
         },
         {
           \"ylName\": \"海苔芝麻碎\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         73,
         174,
         175,
         230,
         171,
         170
       ]'),
       (167, '虾仁日本豆腐煲', 'http://static1.showapi.com/app2/img/caipu/20210227/ffa3d8e7-8807-40b8-8e8d-2ea7a1ff8d17.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210227/afcc9a01-7431-4f5f-8971-d6d4317a4d60.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/26ebd6c4-1bab-4e9c-989e-0a144efbeda6.jpg\",
           \"content\": \"将豆腐从中间切断，再切小块，大约成1厘米左右厚度。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/884a440431334e23ba2e076cf881f5b7_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/95eaf2b6-c77e-4aa4-8bea-16c3b37a1936.jpg\",
           \"content\": \"2．准备配料：葱花，姜丝，红辣椒圈。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/b321a18bd7db4fe2a67a7df031248207_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/e0eda224-5131-491c-8f94-9125eb1867aa.jpg\",
           \"content\": \"虾去壳，用牙签挑出虾线，清洗干净，在虾背上切一刀。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/9147c1a1fed34fd39347ea947e32cbda_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/18f046c6-9086-4fb2-90a9-93fe6384e4cc.jpg\",
           \"content\": \"豆腐放入盘中，摆虾仁，撒上姜丝、辣椒丝，锅中水开后，蒸4分钟。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/a964487b2f454ab19cec0b3f28489988_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/94e4e1f5-4747-4594-880f-7e1a0b2fd1e5.jpg\",
           \"content\": \"调酱汁，1勺生粉，1勺生抽，1勺蚝油，半碗清水拌均匀。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/8eedbf3e5cd94766830e39b7fe72d9c9_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/c0a0c439-e649-40cc-a86f-a60068c844ea.jpg\",
           \"content\": \"锅中倒少许油，倒入酱汁煮开。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/b29b37941bdd4634a22ab917e85b9319_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/163f6535-d19c-4f66-be7a-8c3c6aae5fdb.jpg\",
           \"content\": \"把酱汁淋入盘中，撒葱花就可以了。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/608558586cea4219be4da1af08f8c207_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"虾仁\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"日本豆腐\",
           \"ylUnit\": \"1条\"
         },
         {
           \"ylName\": \"葱\",
           \"ylUnit\": \"1根\"
         },
         {
           \"ylName\": \"蚝油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"2克\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"1块\"
         },
         {
           \"ylName\": \"生粉\",
           \"ylUnit\": \"1勺\"
         }
       ]', '[
         2,
         6,
         20,
         71,
         175,
         170,
         230
       ]'),
       (168, '【生酮】日式定食【控制碳水】',
        'http://static1.showapi.com/app2/img/caipu/20210227/77212891-1c6f-4254-9991-2229d244c9e8.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210227/673ce912-ea07-44c6-8d5a-0df5055ca873.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/ec62cfa0-e50a-48f7-be8d-2012eb0be9fc.jpg\",
           \"content\": \"理想燃料3天断糖\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/760bafeba2744c919e9c0ace31aa1b42_1755w_2340h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/e808f17b-08c4-481b-846b-892119ec8242.jpg\",
           \"content\": \"今天早餐选择了这两个。先早上6点吃了能量棒1杯温水。干活干得太忙了，11点想起我忘记喝防弹红茶。真耐饿\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/5eedf6cad3c84efeaf0a4d7ec44076d7_2160w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/59167421-fef6-4bf8-98cc-893a81b81849.jpg\",
           \"content\": \"生酮饮食第4天的我，开始馋了。想大口大口的吃米饭还是得忍忍准备做传说中的「花菜饭」\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/d4b85735df6745558ca22ae55a7fe5be_496w_496h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/4b90c97c-e9d8-4880-a81a-a76b9bacf17b.jpg\",
           \"content\": \"做法挺简单。准备100-200g的花菜。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/136202260d9a4b3b879cdc3a652faa88_2160w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/8e808733-07af-44f0-9f1c-2e14848ec68f.jpg\",
           \"content\": \"用料理机转30秒或用刀切碎。保鲜膜包好，微波炉加热2分钟左右即可。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/23150900add347649e8f91a5883b8db8_1366w_1093h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/08b89cd8-f15b-401a-b784-1bec53c1475f.jpg\",
           \"content\": \"生酮减肥放1小块黄油或1小勺MCT油普通减肥放\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/272fb141da0f44fc93a0226119bf58b5_1108w_886h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/35d35b95-1315-4f34-8bfd-93e0a7a67d6d.jpg\",
           \"content\": \"今天吃青占鱼。家里人这样吃，这道菜要用较多的味噌和糖（满满的碳水）我暂时是不吃了。（味噌青占鱼，食谱在我作品里有视频）\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/7d9345567fcf477d9a30726ca07bfc44_1125w_1121h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/a96f195a-2109-4077-a181-d72f5eece690.jpg\",
           \"content\": \"我的青占鱼，去头和内脏后洗干净擦干水分。撒点盐风干了一个晚上。要吃的时候明火烤5-6分钟就好了。日料定食里的“一夜干”这么简单。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/e7ffe180cefa46ab8bbe9f170486c076_2160w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/e71acea1-8213-4f74-8186-b4bc53982bf8.jpg\",
           \"content\": \"桌上有我的小兔子饭碗里面有白色可爱的（假）米饭开心死了完美的生酮日式定食啦还搭配了蔬菜清汤（日语叫）用昆布出汁（日式高汤）煮了萝卜片3种菌菇青菜。用少量生抽调味凉拌羽衣甘蓝（）焯水控水后切小段。加芝麻MCT油生抽满足感十足\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/c1a4b5bb353e427e95a6e8bcc6bb224c_2700w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"花菜\",
           \"ylUnit\": \"100-200g\"
         },
         {
           \"ylName\": \"青占鱼\",
           \"ylUnit\": \"1条\"
         },
         {
           \"ylName\": \"羽衣甘蓝\",
           \"ylUnit\": \"1把\"
         },
         {
           \"ylName\": \"MCT油或黄油\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"其他\",
           \"ylUnit\": \"请看下方步骤\"
         }
       ]', '[
         2,
         6,
         71,
         134,
         171,
         175,
         170,
         202,
         230
       ]'),
       (169, '家庭烤牛肉', 'http://static1.showapi.com/app2/img/caipu/20210301/cd830005-0d6e-43c4-9ce6-d516c4a70608.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/ea2faa38-54a5-4035-a4c3-2216729dce05.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/7bad4194-72d9-4934-be5f-76e53f7060ba.jpg\",
           \"content\": \"牛里脊横切厚片，撒黑胡椒盐，一点橄榄油，腌十分钟。我买的整条牛肉，你也可以选择直接切好的方便一点\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/b497a27bc42e4b3f8669af3a98d2ca18_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/4c32ff83-1ed5-4ceb-b658-79cf4f1772ac.jpg\",
           \"content\": \"铁锅或不粘锅烧热，放植物油或者黄油，一头蒜，烧到冒烟放肉，两边各煎30秒\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/ed1f21acd83845eb9d80e2d35ef441d5_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/524b1477-6aee-4ee3-a295-0e691b28d0d7.jpg\",
           \"content\": \"可以直接吃也可以包生菜我买的牛油果生菜很脆绿油油的\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/414a0d63f2f941b3b88f867e124f7110_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/ccd23e61-9381-4101-8cf6-ad3201fc1233.jpg\",
           \"content\": \"蘸点日式烧肉汁，夹点蒜片，千金不换！\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/794a363950b64842b141bb83d8724254_1080w_1920h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"牛里脊肉\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"黑胡椒盐\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"橄榄油\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"大蒜\",
           \"ylUnit\": \"1头\"
         },
         {
           \"ylName\": \"生菜\",
           \"ylUnit\": \"一颗\"
         }
       ]', '[
         2,
         6,
         74,
         170,
         231,
         68,
         73
       ]'),
       (170, '韩式炸鸡', 'http://static1.showapi.com/app2/img/caipu/20210226/6b64df50-b002-4b0d-9b76-b0d762fd96bd.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210226/266093fe-9682-4385-968f-0ce51992e42d.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/5d50cf04-3b9b-49df-a4f2-f079e6c9c823.jpg\",
           \"content\": \"将鸡翅根用清水浸泡10分钟。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/98f3b91c2f6a497c8380f0cb04274c64_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/decae50b-9ef8-43da-a6b9-5b1034d0cb34.jpg\",
           \"content\": \"将清水倒掉，放姜片，料酒，酱油，盐，黑胡椒，腌制30分钟，腌制。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/6511c8b1c4994acd86d27aad07dd6eef_684w_912h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/7d868b22-4f6e-4654-a7ee-2e7ce91921c1.jpg\",
           \"content\": \"加入鸡蛋，淀粉，用手抓匀。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/c4e1c9b74e1e442bb7ab65d74f06cc4b_817w_817h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/5f7aa1bc-3f1b-4fdf-a3ff-bfb6c9e12a29.jpg\",
           \"content\": \"将面粉放入保鲜袋内，鸡翅根放入袋子内，保证每个都均匀粘上面粉。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/d7b46e64d1314602b85ba0bf033a65f2_912w_684h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/e5169a60-33dd-4cf1-a7f9-6ce1f95dbc00.jpg\",
           \"content\": \"将鸡翅根放入空气炸锅，鸡翅上可喷少许油，炸出来更脆，更香。200，20分钟，中途记得翻面。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/7daf36dee8c749d2a826dfc19750448d_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/4b0f3243-23a9-45a2-aba3-3ec7229d9300.jpg\",
           \"content\": \"利用炸制过程调酱汁，搅拌均匀。鸡翅炸好后，将酱汁放入平底锅内加热，倒入鸡翅根，搅拌均匀，裹满酱汁。韩式炸鸡就做好了！\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/7b6262f74cee420b9457628558dfb8c9_1089w_1633h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"姜片\",
           \"ylUnit\": \"3片\"
         },
         {
           \"ylName\": \"酱油\",
           \"ylUnit\": \"2勺\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"个\"
         },
         {
           \"ylName\": \"鸡翅根\",
           \"ylUnit\": \"6个\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"1小勺\"
         },
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"韩式辣酱\",
           \"ylUnit\": \"25g\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"15g\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"5g\"
         },
         {
           \"ylName\": \"番茄酱\",
           \"ylUnit\": \"10g\"
         }
       ]', '[
         2,
         6,
         231,
         67,
         68,
         170
       ]'),
       (171, '韩国烤肉腌肉', 'http://static1.showapi.com/app2/img/caipu/20210226/f64afee0-efb6-46eb-99b7-56d1546bbb8e.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210226/8db5536b-933c-46a8-9c8f-6f08726c7a83.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/ebe3ba55-9c83-4528-9d5d-bb4a6fdc4b9e.jpg\",
           \"content\": \"就是这玩意，最灵魂的东西，商场或者网上都有卖的。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/c3ba5c5a82984c8ab8f4771ec120ce83_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/98a2894f-b467-435e-aea7-281d8814d920.jpg\",
           \"content\": \"小苏打牛肉要嫩它很关键。一般两斤以内的肉肉一小勺就可以了。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/5c3ae716c1b445268d02c4b7129a8af3_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/50842908-0e8a-42b6-aab6-3d98e56033c4.jpg\",
           \"content\": \"这是牛肉片的厚度，基本上就是参考烤肉店的大小和厚度。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/0981b40980574b9ab4d75fa6861b550a_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/64cf0a5c-f287-410b-a477-0ff58578d01b.jpg\",
           \"content\": \"这是湿料的做法1\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/e4854542e0044378a47f82e1799a1a81_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/b80a4d1e-95d5-4430-93aa-a00f0fec95a8.jpg\",
           \"content\": \"这是时间的做法2\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/a28a9fa7ae3843709116ea3bb3764aa4_1080w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"牛肉一定要牛里脊\",
           \"ylUnit\": \"500-1000克\"
         },
         {
           \"ylName\": \"大喜大原味烤肉酱\",
           \"ylUnit\": \"两斤以内用一包，两斤以上用两包。\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"2个只取蛋清\"
         },
         {
           \"ylName\": \"小苏打\",
           \"ylUnit\": \"咖啡勺一勺\"
         },
         {
           \"ylName\": \"食用油\",
           \"ylUnit\": \"50克\"
         }
       ]', '[
         2,
         6,
         68,
         74,
         170,
         231
       ]'),
       (172, '咸香酥脆❗️韩国超火的❗️芝士脆皮鸡',
        'http://static1.showapi.com/app2/img/caipu/20210226/0b66330b-f3ea-4605-b060-2c962c72e286.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210226/181a0d90-bf74-4c87-90ec-53f8b29efaa2.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/c9eee2de-83ae-4e40-a46c-934858d312d5.jpg\",
           \"content\": \"煎过的芝士碎脆金黄、鸡肉嫩滑入味、\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/6737b75167ef47ce92cfc0134fa11654_4096w_3072h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/66272fb4-3e83-4bd2-8fe9-57d4f98abd0d.jpg\",
           \"content\": \"准备好食材\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/195e5b09552c4806b4e5fb093a9a091c_4031w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/235ba744-4ece-4381-98a3-fac0bb188908.jpg\",
           \"content\": \"鸡腿去骨\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/656b66be67e941c49cfe04ba235605b4_4031w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/80cb5710-8df4-4a8e-89cc-b524dc2f735e.jpg\",
           \"content\": \"去骨的鸡腿加腌肉料，料酒1勺，生抽1勺，白胡椒适量，勺，抓匀腌制1小时以上\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/2d648edd169641b6b2b3dca78f104f29_4031w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/67870744-2eac-49cf-8da2-639a3421d605.jpg\",
           \"content\": \"东菱小食锅的煎盘预热后倒油，放入鸡腿煎，鸡皮面朝下\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/104f541ef6ff4677bf956358b78e2e0d_4031w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/9a4a6d42-bb89-4eb3-806b-35ec60eac717.jpg\",
           \"content\": \"煎到表面金黄后翻面煎另一面\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/ecb42be2bb82461c86723c08570fe344_4031w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/915bfd4b-564b-4ac7-8824-598578ef423b.jpg\",
           \"content\": \"两面煎熟后取出，剪成小块\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/d9fc495d3e084cd292fe5daf42edf5dd_4031w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/f20117d9-6d8c-4aa2-b6dc-6be6f7a9c49b.jpg\",
           \"content\": \"煎盘擦干油，铺满马苏里拉芝士\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/0185dd2a730049ab93d64290008f35d5_4030w_3022h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/ab9b7618-3eb0-4dac-ad09-77f2c70009a2.jpg\",
           \"content\": \"加热到芝士融化，底部芝士变脆，颜色金黄即可出锅，表面撒黑胡椒碎\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/8981aeb0fd114fd0b8439d38f81f2107_4031w_3023h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/2b8d7135-b424-407d-84d4-6634d9deb071.jpg\",
           \"content\": \"芝士加热注意观察底部，这是一台多功能空气炸锅，也可以用它的深煮锅做。煎盘底部有槽而且是不粘涂层，鸡腿放很少油就可以，加热很均匀，煎出的鸡腿金黄酥脆！\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/90f9c02da1ad409a96555b58595b6bee_4096w_3072h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鸡腿\",
           \"ylUnit\": \"4只\"
         },
         {
           \"ylName\": \"马苏里拉芝士碎\",
           \"ylUnit\": \"1碗\"
         },
         {
           \"ylName\": \"黑胡椒碎\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"?腌肉料\",
           \"ylUnit\": \"\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"淀粉\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"白胡椒粉\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"1小勺\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"姜片\",
           \"ylUnit\": \"2-3片\"
         }
       ]', '[
         2,
         6,
         23,
         68,
         73,
         170,
         231
       ]'),
       (173, '减脂期也能吃的韩式拌饭',
        'http://static1.showapi.com/app2/img/caipu/20210225/7a88edf7-8ff8-411a-a969-71f3e09bc9db.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210225/e8ab28b2-66ae-477d-ad49-b4640d1cb312.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/72bbef55-4ec9-4621-af43-c341351dd8fa.jpg\",
           \"content\": \"把米饭焖好铺在碗底，食材洗净胡萝卜切丝，西葫芦香菇切片，分别下水焯熟，菠菜先焯水后切，防止维生素流失。用油刷在不粘锅上刷一点点油，煎一个鸡蛋铺在码好的菜上。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/7fd7514f96994aaaa7ee3da0c87d806c_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/261b1aa8-cf73-4689-94e0-275d0535ad10.jpg\",
           \"content\": \"酱料是韩式拌饭的灵魂，秘诀就是加一点白醋和香油，用糖调味，我选择了零卡的赤藓糖醇。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/d4bcb693589e4ba39397eb136dc87fa6_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/336ca79b-4239-420e-93ff-d9fc693e3dbb.jpg\",
           \"content\": \"疯狂搅拌之后就是营养又美味的韩式拌饭了，干饭人再也不怕胖了\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/173ad0452c904c88b2243dfa68f2c088_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"香菇\",
           \"ylUnit\": \"30g\"
         },
         {
           \"ylName\": \"豆芽\",
           \"ylUnit\": \"50g\"
         },
         {
           \"ylName\": \"西葫芦\",
           \"ylUnit\": \"50g\"
         },
         {
           \"ylName\": \"菠菜\",
           \"ylUnit\": \"50g\"
         },
         {
           \"ylName\": \"胡萝卜\",
           \"ylUnit\": \"30g\"
         },
         {
           \"ylName\": \"藜麦\",
           \"ylUnit\": \"15g\"
         },
         {
           \"ylName\": \"黑米\",
           \"ylUnit\": \"15g\"
         },
         {
           \"ylName\": \"大米\",
           \"ylUnit\": \"20g\"
         },
         {
           \"ylName\": \"韩式辣酱\",
           \"ylUnit\": \"10g\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"2g\"
         },
         {
           \"ylName\": \"白醋\",
           \"ylUnit\": \"半勺\"
         },
         {
           \"ylName\": \"赤藓糖醇\",
           \"ylUnit\": \"2g\"
         }
       ]', '[
         1,
         6,
         8,
         26,
         71,
         102,
         134,
         171,
         202,
         231
       ]'),
       (174, '蛋黄培根意面', 'http://static1.showapi.com/app2/img/caipu/20210225/ade9cdd3-d5e0-43de-bfaa-5443a6b1f5c0.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210225/f45596fa-5afa-4863-b19d-7d407ee17483.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/bfa21f90-d2b3-40f6-9687-2041f50a2094.jpg\",
           \"content\": \"加适量盐，煮意大利面。盐可以多一点。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/f3e7a5236b7f43ad8b4e4c8c4e7f870c_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/7f9084ee-bcee-4b28-8f1b-01520dff08d7.jpg\",
           \"content\": \"分离两个蛋黄出来。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/1a4300abf8ed4711bff99c1dce8469e8_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/9ae40955-5648-4f2c-9d54-bac648bb5dea.jpg\",
           \"content\": \"擦入帕玛森芝士，我一般放的比较多。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/a225e8287f4741c8815e977ca42d882b_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/d5f445ef-cd1b-4ddb-90a6-c4e8a4e181e5.jpg\",
           \"content\": \"搅拌均匀即可。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/6c383b03bcb64363b9d984375cddaacb_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/da2508db-7bc5-4532-8407-50c8a9a7de70.jpg\",
           \"content\": \"4片培根，切小块。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/b49f71c0febb4340a8dcc489760631a4_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/cb2d10ef-2c09-49b4-a61c-de628aa1f6ff.jpg\",
           \"content\": \"放少许橄榄油，培根炒至焦黄。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/b77b5c568b2a4278900de75d22563287_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/07a5ffcf-62ce-4076-8e0e-b80cc8bd2b33.jpg\",
           \"content\": \"加入煮好的意大利面。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/8424a82af1d641f6b967cdb7efd461f0_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/25bb9ffd-90be-4d9b-b49d-9b77235a17d2.jpg\",
           \"content\": \"加3勺煮面水，煮一下。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/5d63cf8528a34418bcdb2951c1b593fe_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/7f27b906-57b3-4169-9082-d83994eb6586.jpg\",
           \"content\": \"关火，加入蛋黄芝士，快速搅拌均匀。\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/1641ca7aeed649f183ba499b2775e25d_3024w_4032h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/994663f2-ff99-438c-831b-226a9aa5ca7b.jpg\",
           \"content\": \"装盘，加入黑胡椒碎。\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/132977eb13294eca9638c39f58167216_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/69c89634-6703-40f5-8647-28ddcf5daeb5.jpg\",
           \"content\": \"再加入适量帕玛森芝士。\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/a412d75afdce419381a1816256c9b3ff_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/c6669c08-c883-46b4-aea0-0f911861f9d5.jpg\",
           \"content\": \"完成开吃。\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/4f451671934e4f6dba299f04d669bee9_3024w_3722h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"培根\",
           \"ylUnit\": \"4片\"
         },
         {
           \"ylName\": \"蛋黄\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"橄榄油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"帕玛森芝士\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"黑胡椒碎\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"意大利面\",
           \"ylUnit\": \"2份\"
         }
       ]', '[
         1,
         6,
         23,
         70,
         71,
         101,
         174,
         232
       ]'),
       (175, '酥皮脏脏包', 'http://static1.showapi.com/app2/img/caipu/20210224/a266abc4-a9ef-48f2-9cca-a555b4b44e69.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210224/f4210056-42b4-498d-93d9-781f5879b373.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/6b447685-7920-481d-be7e-306a24332f86.jpg\",
           \"content\": \"材料：王T55粉250g、法芙娜可可粉10g、安佳脱脂奶粉10g、细砂糖30g、盐4g、燕子酵母粉4g、鸡蛋40g、清水80g、盐20g折叠用：安佳片状120g辅助：宜家艾斯塔1.2升密封袋表：全蛋馅料:嘉利宝57.7%黑巧克力豆约10个/份甘纳许:淡奶50g、嘉利宝57.9%黑巧克力豆50g(能制作6份脏包)表装饰:法芙娜可可粉（两四折）：1.粉、可可粉、奶粉、细砂糖、盐，揉钩、安装在厨师机上，开3档低速，材料；2.酵母粉，开3档低速；3.鸡蛋、清水、软化好的，3档低速打成，转4-5中高速打至扩展阶段(此时开，开，能出较长的粗条，此时8成，揪一块，可以抻出较的薄膜，破洞呈小锯齿状)，好的温24为宜；4.取出整理，表光滑圆鼓、收口朝下，放在发酵盒里密封好，发酵盒放冰箱冷藏（5）发酵12小时；5.冷冻的片状装在密封袋里，室温放置一会儿变微软时，用擀杖一端慢慢敲打，变软时用走锤擀成厚度约3mm的长方形，用保鲜膜包好放进冰箱冷藏待用；\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/c709fde59eeb4c6085c1057c9574c546_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/2c60398a-5a21-48f2-9a6c-d7327d81af98.jpg\",
           \"content\": \"6.面团取出放在面板上，用擀面杖在面团中间按压十字形压痕，然后向四个45度角的方向各擀一下，擀成比黄油片三倍大的长方形（面团如果延展性较差，可静置盖好保鲜膜静置10min再操作；面团如果粘，擀面团时可在面板上撒少量面粉防粘，在折叠时一定要把面团上的面粉扫掉；7.将黄油片放在面片中间（裹入黄油的硬度要与面团的硬度基本相同，\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/b8243aa03509458dbb4d10e3400eb1eb_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/ef988bc9-fdba-4401-b843-d795e12f7fcb.jpg\",
           \"content\": \"上、下1/3上，接合处捏紧（如果此时变软了，可先放入冰箱冷藏降温再进行后面的操作）；\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/e12c63128fda4d0d80d6110c4aaa3819_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/9917e0bc-fba6-47a2-b68d-bbe5abcda928.jpg\",
           \"content\": \"8.用走锤或擀面杖（重一些的）擀成厚度约4mm的长方形面片（两面都擀）\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/b7ab75ed5ef34ea8a3f4833d29d0500a_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/9fb6dbb4-6a37-4c2f-af02-077f892ae6c8.jpg\",
           \"content\": \"，旋转90度，从右边1/8处，左边3/8处，处，\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/f576452eec32404b86c17c727f6ce9e8_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/79985532-2a59-4959-b35b-a8d76c482a85.jpg\",
           \"content\": \"然后从中间对折，完成一次四折，用保鲜膜包好，放进冰箱冷藏20-30min;\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/103b25b170254ab3887a45becbac2351_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/13fde087-c3e9-48da-a0b1-9bd1e52b3941.jpg\",
           \"content\": \"9.取出面团，顺面团叠压边的方向擀长（两面都擀），用走锤或擀面杖（重一些的）擀成厚度约4mm的长方形面片，\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/128251dfc5044c0994118833fbc50b17_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/720982de-9e12-4699-af8a-c5cc80090a03.jpg\",
           \"content\": \"旋转90度，从右边1/8处，左边3/8处，处，\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/e1bd61de517a471a965b81fbf4c50e58_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/c9e33de6-fd2b-4061-9347-706fa0e3dcb3.jpg\",
           \"content\": \"然后从中间对折，完成二次四折，用保鲜膜包好，放进冰箱冷藏20-30min;\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/fc4d5f4e15a94c2c92d2a3f0efec95ba_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/bd60e76a-2e1b-4847-bf56-1ca072c18d77.jpg\",
           \"content\": \"10.取出面团，顺面团叠压边的方向再次擀长（两面都擀，用走锤擀成厚度约3mm的长方形面片，用保鲜膜包好，放进冰箱冷藏20-30min；\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/1ad6dd5853ce43fda48fe88fabdcd6b6_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/e9900a9e-81a7-40f3-bfc1-659118e02e72.jpg\",
           \"content\": \"11.片旋转90度，切除两边，分切成15*8cm方形片（切时候，从向一次切，切整齐，来回切，破坏次）；12.将巧克力豆（两排）片，从往开始卷，收尾处片重合部分轻轻按压使其黏合一起（涂抹蛋液有利于黏合），黏合处朝烤，从团正方手轻轻按压至平整（卷太松，碰到片边缘，破坏次）；13.将烤进，度25度70%约60min左右，时度，25-28左右，避黄油融化(晃动烤，看到胖胖团duangduang抖动，从侧看次开始分离，度；14.剩余15min时，烤，火230；15.团羊毛刷轻轻刷一全蛋液，全部刷一遍后，按顺序刷第二遍；16.将烤进烤烤架(烤架凹朝，火200烤5min，火195烤10－15min（火200烤10min，火185烤15min），度，度95度即炉；17.烤，工作台使劲震一，将移到却架晾凉，装食品袋密封常(2天，时，食前解回，烤火18015min，烤烤，火160烤6－8min；18.制作甘纳许，柳宗理16cm片手锅，巧克力豆、淡奶油，火加，时，至融化成巧克力酱，或隔水加，将巧克力豆、淡奶油，蒸锅加水烧开后，蒸屉，盖锅盖，火蒸5min，刮刀，即成巧克力酱；19.硅胶刮刀将甘纳许涂抹，糖粉筛撒一粉，流巧克力搭配酥脆口，好好吃哦！\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/bfbd01aa95534ba082637f98d4930d0d_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"巧克力\",
           \"ylUnit\": \"80克\"
         },
         {
           \"ylName\": \"T55粉\",
           \"ylUnit\": \"250克\"
         },
         {
           \"ylName\": \"酵母\",
           \"ylUnit\": \"4克\"
         },
         {
           \"ylName\": \"水\",
           \"ylUnit\": \"80克\"
         },
         {
           \"ylName\": \"黄油\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"40克\"
         },
         {
           \"ylName\": \"细砂糖\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"4克\"
         },
         {
           \"ylName\": \"可可粉\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"奶粉\",
           \"ylUnit\": \"10克\"
         }
       ]', '[
         3,
         7,
         74,
         174,
         232
       ]'),
       (176, '家里五分钟轻松制作浪漫西餐',
        'http://static1.showapi.com/app2/img/caipu/20210221/a31a118b-5de9-47fa-8ded-0d841ae505de.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/cc6d45ee-a601-4f89-96c0-2d9dcbf98609.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/84d0cd7d-57a1-4c50-988c-e2047cf3dadc.jpg\",
           \"content\": \"隔夜冷藏拿出，解冻\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/4e7586f532de4e3fa42748b8424453fb_1824w_840h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/6015d184-df34-400f-bbf7-285aa4238c17.jpg\",
           \"content\": \"一层黑胡椒粉，一层孜然粉，再敷一层橄榄油，静置3小时以上\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/957e2c4788944e3e9d15446f39d9bbe0_1824w_840h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/1fb8be34-bce8-4d96-96ba-f68d49f753ab.jpg\",
           \"content\": \"倒入葵花籽油，大火油锅\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/5b2262ff9a5f4eb69b0daf2a1bed3125_1824w_840h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/3b4d939d-b218-43ee-8186-5d70e091db95.jpg\",
           \"content\": \"一面油炸60秒，翻面再60秒，出锅\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/43a93d113fd349dea11fe2e138edd467_1824w_840h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/bd2ef2e5-eef7-4ec2-b2c2-e2bcde8f16df.jpg\",
           \"content\": \"表面微焦，切下去鲜嫩多汁，你可以来点蔬菜水果的装饰，来点轻音乐，再倒一杯红葡萄酒，就是烛光晚餐，两人世界啦\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/9bbe3189c73245649617c23e633780b6_1824w_840h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"橄榄油\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"孜然粉\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"葵花籽油\",
           \"ylUnit\": \"4勺\"
         }
       ]', '[
         1,
         6,
         67,
         170,
         232
       ]'),
       (177, '东南亚风味蔬菜闷饭', 'http://static1.showapi.com/app2/img/caipu/20210226/917d0236-86f3-467e-9308-35df104786da.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210226/9cd1fe6f-6953-4ac5-8255-6e64e95d90d6.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/1611a6df-f305-492e-ab4a-684b0f3512c5.jpg\",
           \"content\": \"如图\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/c6cd69f3a6b5459281375f588cc357b2_720w_576h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210226/ee95f6c5-cbfd-4a91-948d-e006749ec061.jpg\",
           \"content\": \"如图\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/27bd02c99dbd49a2b6ddf24ba5255c1a_720w_576h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"香茅\",
           \"ylUnit\": \"根\"
         }
       ]', '[
         1,
         6,
         77,
         102,
         171,
         233
       ]'),
       (178, '泰式椰汁鸡汤', 'http://static1.showapi.com/app2/img/caipu/20210225/89c899e1-10e5-4205-a5cb-a61abc29bcc6.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210225/cbf92315-d062-4f63-a992-91dc0786ed23.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/80cce291-8fe7-4936-bd1d-38df2a32b1a1.jpg\",
           \"content\": \"提前45分钟熬好鸡汤待用，这里用了鸡腿和鸡胸去掉的骨头来熬汤，可以加一小块姜去腥味。熬汤的时候同时开始准备调料和切菜。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/a3caf2b04df4405bbf471bf1ac8c97dc_3024w_2417h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/29956cee-713f-4bfe-b2e0-ddf4b363fb19.jpg\",
           \"content\": \"用到的调料如图\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/482a20f46106477fa8fc9fae33449435_3024w_2417h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/a9ab07d8-84ac-4d12-80de-fcc80bdcd43a.jpg\",
           \"content\": \"鸡肉去皮切小块\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/a929a5fef0274d09bcfaf8f604cf6f36_3024w_2417h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/2ecce3fa-4bff-4f0c-acc8-4ee139ccb276.jpg\",
           \"content\": \"香茅切段，高良姜切片，柠檬叶撕开，青柠切块备用。由于这种辣椒比较辣，所以没有切开。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/78e4331798cc4e3ea3dca1d62a574680_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/88f173c1-f02b-40a3-8bec-68b86b20fffb.jpg\",
           \"content\": \"热锅下油，放入香茅、高良姜、蒜、辣椒和蘑菇，炒2分钟左右略微出味即可。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/7481f114427a41229fbcea249ef001c6_3024w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/e065801b-86fb-433a-8faf-c889beb817ed.jpg\",
           \"content\": \"把鸡汤倒入刚刚炒好的香料中，再加入椰浆、鱼露、辣椒粉、糖、柠檬叶、香茅干，小火慢煮10分钟左右。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/52db4835fb9e4e76a0114016c71047e5_3024w_2417h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/9e5bfe72-efb6-433f-9f71-33869672370a.jpg\",
           \"content\": \"加入鸡肉、洋葱，煮1-2分钟左右。加入柠檬汁，搅拌均匀后关火。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/463d2ed3b0b34de8a51689754ef6960e_3024w_2417h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210225/96052022-dad0-43c7-b10e-cde22c7c76ec.jpg\",
           \"content\": \"上锅前可以把柠檬叶夹起，防止柠檬叶浸泡太久有涩味。p.s碗里可以加入香菜点缀一下。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/b3472882ffd44120a3acfcfa831dc0a7_3780w_3022h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"香茅\",
           \"ylUnit\": \"4根\"
         },
         {
           \"ylName\": \"高良姜\",
           \"ylUnit\": \"1块\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"3瓣\"
         },
         {
           \"ylName\": \"红辣椒\",
           \"ylUnit\": \"3个\"
         },
         {
           \"ylName\": \"蘑菇\",
           \"ylUnit\": \"若干个\"
         },
         {
           \"ylName\": \"鸡汤\",
           \"ylUnit\": \"800毫升\"
         },
         {
           \"ylName\": \"椰浆\",
           \"ylUnit\": \"150克\"
         },
         {
           \"ylName\": \"椰子粉\",
           \"ylUnit\": \"10克\"
         },
         {
           \"ylName\": \"鱼露\",
           \"ylUnit\": \"3勺\"
         },
         {
           \"ylName\": \"辣椒粉\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"香茅干\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"柠檬叶\",
           \"ylUnit\": \"若干片\"
         },
         {
           \"ylName\": \"洋葱\",
           \"ylUnit\": \"1/6个\"
         },
         {
           \"ylName\": \"鸡肉\",
           \"ylUnit\": \"1个鸡腿和1块鸡胸\"
         },
         {
           \"ylName\": \"青柠檬\",
           \"ylUnit\": \"1个\"
         }
       ]', '[
         2,
         6,
         21,
         71,
         99,
         170,
         171,
         233
       ]'),
       (179, '拉花蛋卷', 'http://static1.showapi.com/app2/img/caipu/20210301/9711eb7d-7aea-43ce-ba94-80a1d1afac21.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/d92ca789-de05-42a8-a6a0-3e27ba4209dd.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/c775e781-cc4b-49f1-9e3f-798837fb37d0.jpg\",
           \"content\": \"碗中打鸡蛋，加入白糖，搅拌均匀，再依次加入牛奶和面粉，搅拌成粘稠的面糊\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/abe04fdb7ba94d099f259eee65cf067b_1835w_1468h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/9b040492-1e2c-4f60-a93d-9e4fae3688ec.jpg\",
           \"content\": \"碗里套保鲜袋倒入面糊，剪一个小口\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/dd479b9548c34552b5566b929e60554e_1835w_3264h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/00cec38b-9ffa-411c-8da5-fd129a9ae381.jpg\",
           \"content\": \"不粘锅加热，不加油，画圈挤在锅中，定型后翻面，烙几秒，就可以出锅了\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/0872bc1e036f47bc8c01783a5c838dfb_857w_640h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/55e5784f-19bc-4319-af45-9bb8179bd212.jpg\",
           \"content\": \"最后再趁热卷起来，就OK啦\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/48fbcc005e7342cf9941e297ed3cc68e_864w_628h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"白糖\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"150毫升\"
         },
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"80克\"
         }
       ]', '[
         3,
         1,
         7,
         73,
         136,
         240
       ]'),
       (180, '一袋奶两碗面  轻松搞定无油烤饼   凉了都好吃  附细节视频',
        'http://static1.showapi.com/app2/img/caipu/20210301/21ec1af4-4f29-41bf-8df0-59613f2a8547.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/bf1ee34c-0f73-4133-9e6a-068fb14b6a64.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/c7126207-1a38-4c89-80f4-5159fa1d51e1.jpg\",
           \"content\": \"酵母用温牛奶化开，加入剩下的所有材料揉成比较柔软的面团。静置10分钟。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/cc3f934f8f254851aa947935dfece378_480w_384h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/a65e7a80-400b-4ed4-9308-e409aff8b7fe.jpg\",
           \"content\": \"像搓衣服一样搓着揉面。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/7962ad8ebfdd45b7be3c1f3451df2d42_480w_384h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/84ec80eb-cda8-462e-a28d-990d3c87ed1d.jpg\",
           \"content\": \"整形成长条状，平均分成12份。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/c9adffc16df64167995d4a7a92ad7f1a_1821w_2056h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/af23317a-cf46-47a1-913c-12a28079320e.jpg\",
           \"content\": \"把每一个小面剂像图中那样多揉一会，揉光滑最后整形成饼状。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/ebacd532c1cb4499b0e08d4afcda8a0a_480w_384h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/8121c74c-c7e5-4ff7-af97-07a1be16c3a7.jpg\",
           \"content\": \"用毛刷蘸水抹一下，撒点白芝麻用擀面杖擀紧一些。在盖上保鲜膜静置20分钟左右。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/e75a485e776c42bbb52848e39c8b214d_480w_384h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/9b2bf198-cb96-41cd-8469-77e6e426ccb0.jpg\",
           \"content\": \"饼长胖了好多，放入预热好的电饼铛中小火烙4，5分钟左右。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/02c52402ed8b43b586c8fbd35f6c4ef1_480w_384h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/6265375c-6caa-445d-919c-423bdb890526.jpg\",
           \"content\": \"金黄色出炉，饼内组织细腻蓬松暄软，凉了都不硬。可以用刀把饼切开，夹肉夹菜，一切自己喜欢的都行非常棒。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/30f059fe88be4dfa8dcc71cc92f5abc4_4032w_3024h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"中筋面粉\",
           \"ylUnit\": \"400克\"
         },
         {
           \"ylName\": \"糖\",
           \"ylUnit\": \"20克\"
         },
         {
           \"ylName\": \"温牛奶\",
           \"ylUnit\": \"240克\"
         },
         {
           \"ylName\": \"酵母\",
           \"ylUnit\": \"4克\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"1克\"
         },
         {
           \"ylName\": \"泡打粉\",
           \"ylUnit\": \"2克\"
         },
         {
           \"ylName\": \"白芝麻（装饰）\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         1,
         7,
         23,
         74,
         103,
         136,
         174,
         240
       ]'),
       (181, '摇元宵，汤圆是包出来的，元宵是摇出来的',
        'http://static1.showapi.com/app2/img/caipu/20210301/85485042-27cc-4044-a923-f3e374edeb2f.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/7b7d7dfb-f842-4f8e-9124-68217c094012.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/523a23cc-a25b-43aa-84fd-ea3158446bba.jpg\",
           \"content\": \"50克白芝麻，先清洗一下。倒进锅里，开小火慢慢炒。直到看见颜色变得金黄了，香气也出来了，就关火，再翻动一会儿。这个时候芝麻内的油膜是很脆弱的，所以，要放凉了之后，再做处理。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/482be2152dbc4351bd61aeb1749e6fa7_3840w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/b538b130-264a-4fa7-b5bc-373531cc2fc3.jpg\",
           \"content\": \"200克，送进烤，上下火150烤20分钟，把热风功能也打开，如果，没有热风功能，中途就要拿出翻动一下。烤，不要着急拿出，烤10分钟，拿出。趁着还温热就可以给脱衣，烤，温热时候是最脱皮，顺带把个别坏分子给挑出。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/2f54d5185e3d4f448255c8ae168b6619_3840w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/e1f3177c-5c4a-4eee-b610-8b4ecf6b17a8.jpg\",
           \"content\": \"往料理机里先倒进去一半的花生，再加入100克细砂糖，先打成泥。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/7d54ae3e8f6e44f984fc763c91ee968e_3840w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/f421c057-611a-4771-a102-f2dcc5376d65.jpg\",
           \"content\": \"加入30克芝麻酱，炒香的芝麻也进去，再开机混合一下。最后，倒进去剩下的花生，简单的再打几下。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/f9cc79f1729145ff9bc9f6d62b4efe9b_3840w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/6d37d047-dcb3-43f5-b670-dcff742feb09.jpg\",
           \"content\": \"最后做成这样带有颗粒的样子\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/57d98f09b48c49b892f96c6876ab7832_3840w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/7d255fca-7708-4d12-917b-68b4b3b5fcb3.jpg\",
           \"content\": \"小火，起锅。进去80克猪油，先把猪油化开，也可以换成黄油或椰子油之类固态油。进去30克普通面粉，炒匀、炒顺滑了。也就2-3分钟那样吧，把火关掉，进去，搅拌均匀了，就可以啦。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/c4e571378270446bafce148feea79460_3840w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/cb189e33-9ef8-479d-81dc-8f738e760b67.jpg\",
           \"content\": \"稍微放凉一下，倒进密封袋里，排气、整理成差不多一个手指的厚度，放冰箱冷冻一个小时左右。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/f16a2a180b294420abf18749b760f21d_3840w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/4d0b4b4c-9115-43cf-99e8-d39a449ee8ca.jpg\",
           \"content\": \"从冰箱取出来，用刀把它分切开，我这里切成了56个。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/b0ee6783e2ab4a7eaa1ca2b5398af446_3840w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/040fa82a-379c-4ecb-b66c-73862ede1852.jpg\",
           \"content\": \"准备一大盆清水，和一个笊篱，1000克糯米粉，备用。再来一个大盆子，舀进去两勺糯米粉，都准备好了，就来把馅料整理一下，不用揉的很圆的，简单的把一些边边角角捏一下就行啦。放进盆子里，就开始摇吧，让馅料裹满了干粉，捞到笊篱里，泡一下水，再放回盆子里摇，如此反复操作7-8次，就是摇“元宵”了！\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/06419469c02b43e1a9e1d7c3972ff9a3_3840w_2160h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"糯米粉\",
           \"ylUnit\": \"1000克（实际使用500克）\"
         },
         {
           \"ylName\": \"芝麻\",
           \"ylUnit\": \"50克\"
         },
         {
           \"ylName\": \"花生\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"芝麻酱\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"猪油\",
           \"ylUnit\": \"80克\"
         }
       ]', '[
         1,
         7,
         70,
         71,
         105,
         174,
         240,
         151
       ]'),
       (182, '清汤牛肉——史上最简单易学的带蘸料牛肉汤',
        'http://static1.showapi.com/app2/img/caipu/20210228/e35831bf-635c-4c9d-911b-73cf437362ff.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210228/7be81545-98fc-4d70-9387-7bdad73c17be.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/4237c7bc-d817-4086-99d8-c8a03c1a45da.jpg\",
           \"content\": \"牛肉和萝卜一起冷水下锅，牛肉最好提前泡一小时去血水。加料酒煮开五分钟后洗干净。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/560d79da36a84915b6aaa68be6119cb0_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/2ec6ad9f-0171-4d98-9ad6-f1a924bff1bd.jpg\",
           \"content\": \"这个是煮牛肉的调料。我喜欢买个料包包起来。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/25535b1d4d7f47c886af4d2c3f86002f_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/b800ba27-d894-46bd-a740-b9045359ff8f.jpg\",
           \"content\": \"萝卜不要切块，直接整根煮，要不易化。高压锅40分钟。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/b67942d3cd364df991f9b3df36f97cdf_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/97be8be2-559b-491e-b9d3-e42f95bb9bce.jpg\",
           \"content\": \"煮的时候配蘸料：蒜末，小米椒，白芝麻和辣椒粉。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/ed77da5b08fb4af19a279cc5e4f02cf8_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/faf37de4-859c-4071-a645-8a77f6f2dc5c.jpg\",
           \"content\": \"热油浇上。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/03dab97a95b348f0abc947020705bf8b_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/fe3fba5e-ed9e-4a8d-918b-b2d184a94fa9.jpg\",
           \"content\": \"用勺子浇一下\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/ab6bbd2d420547be8185e89fed5e6374_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/24af47e6-ac9f-4bb2-ac66-06a05bf40c2c.jpg\",
           \"content\": \"接着一勺耗油，二勺生抽(用鲜味生抽，一勺醋。加入香菜。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/607145824afe4b9b970b1b89c38c14af_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/1bbe247e-ff9a-480a-86d0-c07f712a7f17.jpg\",
           \"content\": \"汤好了，不要焖。迅速放气。加入一小勺盐。这个盐不要多。捞出凉了，白萝卜对半切，放瓦罐里垫底。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/c06c17b5a4f34c51af4af32875c755ab_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/d4ef75ba-98ec-4588-842b-d952c277b7c6.jpg\",
           \"content\": \"牛肉凉了好切，断丝切。铺在萝卜上面\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/7788fa46f4124c7f876e394977610622_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/48a7e70e-7255-4833-8ad4-ec12d74ff39a.jpg\",
           \"content\": \"加入炖出的汤汁。\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/37213c3e74e24835b51b5f5382ba67e2_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/75f852aa-b70a-4641-9cdb-595159b54648.jpg\",
           \"content\": \"直接煲开后，放枸杞。\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/15db1df2ffa44230ad89c7175e3d7ef9_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210228/6b60157a-ce03-4a27-b1fe-7f02231d18c5.jpg\",
           \"content\": \"撒香菜。\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/660f2e4052084abdaee7092a39875541_756w_1008h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"牛腩\",
           \"ylUnit\": \"1000克\"
         },
         {
           \"ylName\": \"白萝卜\",
           \"ylUnit\": \"两根\"
         },
         {
           \"ylName\": \"姜，葱，白胡椒粒，干辣椒\",
           \"ylUnit\": \"适量粒\"
         },
         {
           \"ylName\": \"大蒜头，白芝麻，小米椒，辣椒粉，香菜\",
           \"ylUnit\": \"适量勺\"
         }
       ]', '[
         2,
         6,
         69,
         71,
         122,
         99,
         240,
         170,
         171
       ]'),
       (183, '2020年9月早饭合集',
        'http://static1.showapi.com/app2/img/caipu/20210227/8d5fd66b-c6f1-4342-866d-8c66645cd792.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210227/4087cfce-eac7-4a4b-a3f4-e741aa8a28de.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/b10322ee-c912-402b-8f5b-1af78282d00a.jpg\",
           \"content\": \"鸡蛋火腿炒饭\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/bdc756c5352a477ea0d004ca5e920196_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/acb87f06-6f26-4200-85cd-c57cbfe96c7b.jpg\",
           \"content\": \"金针菇番茄盖浇饭\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/fa82175170e242918f6e94b6679c814f_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/1206940b-6a5b-4147-8fe3-d66bc5699ab9.jpg\",
           \"content\": \"华夫饼\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/8ed9c0d6208d4f64bf08fed3c25e545d_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/360833dd-80a8-47aa-8425-44f892b26fce.jpg\",
           \"content\": \"牛肉鸡蛋汉堡\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/1d754e46b61743d4b75e3ce339cb8a11_1178w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/b1d524f0-ef62-4408-8d44-425ddd262f47.jpg\",
           \"content\": \"饺子\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/cef91c41755046c2994911f046222b4e_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/43f4a321-967e-48e2-b4f3-a37a78719290.jpg\",
           \"content\": \"牛肉鸡蛋汉堡\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/de84e1180b7d431fa6ca59edfc12e83e_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/12dbddea-17b9-4a01-b915-1fdfab86cf59.jpg\",
           \"content\": \"肉包\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/af3f30853dfe495083ba1cffee254959_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/b8982643-a2c8-47bc-9801-c37a41d40dbf.jpg\",
           \"content\": \"牛肉鸡蛋炒饭\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/ff9f72e5f1014968bd4206f14dee7993_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/6f66e5d7-971a-4d53-b357-199a05e3a52d.jpg\",
           \"content\": \"汉堡这个月概率出现的有点高\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/67f97da085204b2e97d94b35497698b4_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/1343baa1-4ef4-40a1-9446-4613cc7e7c05.jpg\",
           \"content\": \"肉夹馍\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/bf1c02108cf945dc876afa7f4b7c81d4_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/65028892-8115-40c5-8358-ffdf6a35e286.jpg\",
           \"content\": \"小笼包\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/657155b52c41450cb1dda869f6a601ea_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/ce576db1-60e4-40dc-a23f-c6631803e23d.jpg\",
           \"content\": \"山姆出品\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/96b81fba711741cbacfad134794f1ec1_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/ef7b9269-a0a6-443d-b86e-302197e8a304.jpg\",
           \"content\": \"豚骨拉面味道很赞\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"https://i2.chuimg.com/520eb4a6474d4331b09eb5e2d1f41d91_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/7e1d1c9a-f3ed-4c80-be38-cdd896cf956b.jpg\",
           \"content\": \"香肠牛肉饭\",
           \"orderNum\": 14,
           \"old_imgUrl\": \"https://i2.chuimg.com/4ac3a96363934a0a9f18417a5e8503b4_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/f5d171c2-4212-4e61-b94d-02e48d32024b.jpg\",
           \"content\": \"枕头馄饨\",
           \"orderNum\": 15,
           \"old_imgUrl\": \"https://i2.chuimg.com/b106003b002d44ae83ed0ae8e642ad4d_1080w_1620h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/028e7e16-ec7c-4cc7-ae6f-7c8917f8cf0c.jpg\",
           \"content\": \"大王饺子\",
           \"orderNum\": 16,
           \"old_imgUrl\": \"https://i2.chuimg.com/56d26a849f4643edb267483fdd4606c7_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/2c979e68-88f5-4fb7-88fe-d00f4d61be84.jpg\",
           \"content\": \"鸡肉饭\",
           \"orderNum\": 17,
           \"old_imgUrl\": \"https://i2.chuimg.com/5a3221a7e025455fa1fb847b55284671_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/5ddcd099-6d5a-47cc-ab50-f574f95b9bc2.jpg\",
           \"content\": \"青菜鸡蛋炒饭\",
           \"orderNum\": 18,
           \"old_imgUrl\": \"https://i2.chuimg.com/5e5774b8817140bb8582ef49e9ccc37b_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/da3e5516-f26c-4372-9ab6-23113bd63a2a.jpg\",
           \"content\": \"刀切馒头\",
           \"orderNum\": 19,
           \"old_imgUrl\": \"https://i2.chuimg.com/11173892e835407e9d32cb6abd22a10e_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/71815a49-2d5c-4c7a-a506-bd663f7f10de.jpg\",
           \"content\": \"葱油饼\",
           \"orderNum\": 20,
           \"old_imgUrl\": \"https://i2.chuimg.com/06d6488797374e8b9fa7ab9f79e317e5_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/317605f2-fd69-408e-95dc-739e74f82255.jpg\",
           \"content\": \"羊肉鸡蛋炒饭\",
           \"orderNum\": 21,
           \"old_imgUrl\": \"https://i2.chuimg.com/17eeb93c3fc34fb1a89cbef0302cb6f7_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/7819812a-ce27-4583-ac77-592811552479.jpg\",
           \"content\": \"肉包\",
           \"orderNum\": 22,
           \"old_imgUrl\": \"https://i2.chuimg.com/063a8fc8c07e4752b150fafe8a542206_1080w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/eed6c092-9432-4635-9916-88b22a5b0fe0.jpg\",
           \"content\": \"丸子饭\",
           \"orderNum\": 23,
           \"old_imgUrl\": \"https://i2.chuimg.com/dc5c5391dd9342f5b97f87ea76bb231d_1080w_1440h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/8c0da9dc-4803-4227-b0db-90465b1d5203.jpg\",
           \"content\": \"如图\",
           \"orderNum\": 24,
           \"old_imgUrl\": \"https://i2.chuimg.com/fa1e532fba99443ea45eb014d5cffeb5_1440w_1078h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/02782380-772d-4578-bb80-a91792037dd3.jpg\",
           \"content\": \"牛肉青菜炒饭\",
           \"orderNum\": 25,
           \"old_imgUrl\": \"https://i2.chuimg.com/637b400da9d14d37a32ac51e880e4deb_1120w_1080h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"新鲜食材\",
           \"ylUnit\": \"若干\"
         }
       ]', '[
         240
       ]'),
       (184, '久违的甜甜圈', 'http://static1.showapi.com/app2/img/caipu/20210301/75d32b10-1951-4cc3-bf5b-3f10ca77deb2.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/da89b8da-4783-486b-af77-789529cd864b.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/b977de46-836b-42f4-bd79-7577f78cc9fa.jpg\",
           \"content\": \"面粉，融化的黄油(可用色拉油代替)，鸡蛋，糖，酵母，用牛奶，所有材料搅拌均匀和成一个软软的面团，静置，温暖处发酵(我都是把面盆放温水里)至2倍大，取出，面粉，因为面团软易沾手，分成小面块，压扁，用瓶盖刻一个圆\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/ac89d6c5dee44133928dc09b275175ad_2016w_936h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/fa945c02-e0b4-40ef-bed1-f40fa5a8b83d.jpg\",
           \"content\": \"甜甜圈的面胚就做好了\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/b44c721be93a40a49f57d1232fb99589_1135w_758h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/7de3f960-657a-47a0-97ae-cfb7deebc16b.jpg\",
           \"content\": \"用筷子在面块中心戳一个洞，放入热油锅里炸，边用筷子迅速在油锅里打转，让其均匀受热\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/17b6bf53be874b04ae2e718477ed07f2_1334w_729h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/20316bda-320f-412b-b027-db415cf66fa0.jpg\",
           \"content\": \"出锅，控油，先淋一层蜂蜜，然后撒糖粉(我用白糖代替，再撒点椰蓉开吃!\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/1fe5c3a01c3d400ebc5d9ea0a5e312c8_1632w_758h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"面粉\",
           \"ylUnit\": \"200克\"
         },
         {
           \"ylName\": \"酵母\",
           \"ylUnit\": \"3克\"
         },
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"细砂糖\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"黄油\",
           \"ylUnit\": \"30克\"
         },
         {
           \"ylName\": \"牛奶\",
           \"ylUnit\": \"80克\"
         }
       ]', '[
         3,
         7,
         67,
         174,
         241
       ]'),
       (185, '爆浆酥皮汤圆', 'http://static1.showapi.com/app2/img/caipu/20210301/d3c6fc27-c243-486b-a289-3794ed8c44c4.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/77189dc8-48a3-4e60-8942-78206a578395.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/7d757932-1d53-4e82-a262-664cc3e11b9a.jpg\",
           \"content\": \"将蛋挞皮提前拿出来解冻，之后将汤圆放到蛋挞皮中\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/65502a89889e479ab152c1d3aea7a43d_828w_378h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/0101b76f-8edf-4be8-8ea6-0a6b2668a86c.jpg\",
           \"content\": \"将蛋挞皮把汤圆包裹起来，弹成圆球。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/35d31dc618e54183abd09404ffb36a8d_466w_372h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/bef714d7-032f-44fd-acb6-318b99fecdac.jpg\",
           \"content\": \"如上图所示弹成圆球\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/b04c0cf0e89e48b79c5256ed83c62b35_828w_325h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/671c7317-f3a0-4a47-b307-38a429fd56f6.jpg\",
           \"content\": \"用牙签在上面扎几个洞，一定要扎，不然后期烤的时候会露馅。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/ba6b27aa64f94c11a1bc9b6697db555b_828w_324h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/1d2bfca7-8b7a-4c22-bb6f-f86a5537308f.jpg\",
           \"content\": \"涂抹蛋黄液\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/3a8821991d1c4a2385ef71777eb17f11_828w_343h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/dfe8b47d-0639-44f8-813d-5c551abb9db8.jpg\",
           \"content\": \"撒上黑芝麻，没有可以不撒，一样好吃\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/2d232d8443f149e8b9271c5d62ddc6ad_828w_327h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/491a31d7-8338-4392-98bb-c38f4e82c991.jpg\",
           \"content\": \"放入烤中，180度，烤20分钟就可以啦，烤，建议家随时注意酥皮的状态，外皮上色基本就可以了。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/7a5e84a9432e4b8492a43d75b880cfe7_408w_326h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/7ca755fe-11d7-4973-8621-02015bb1b9af.jpg\",
           \"content\": \"好吃的爆浆酥皮汤圆就做好啦，是不是超级简单，赶紧来试一下吧，期待你们交作业哦\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/886b8f44c9fe440ca1428200daa24491_828w_341h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"蛋黄\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"蛋挞皮\",
           \"ylUnit\": \"6个\"
         },
         {
           \"ylName\": \"汤圆\",
           \"ylUnit\": \"6个\"
         },
         {
           \"ylName\": \"芝麻\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         3,
         7,
         74,
         174,
         241
       ]'),
       (186, '糖醋金针菇·快手菜·夜宵·配酒绝对行！',
        'http://static1.showapi.com/app2/img/caipu/20210301/73189a70-5829-47a5-82fe-33c7868605fa.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/15c86f30-6376-45a2-9caf-32f2785c2152.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/74f60298-39ca-4d74-8638-8cd6fde35650.jpg\",
           \"content\": \"金针菇去根洗净，分成小等份。\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/a0f4efe4572a47aca407e29428c30fba_1255w_942h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/7ffcafb7-7420-45f2-8a55-b7f081cc13d5.jpg\",
           \"content\": \"豆腐皮分割换成小长方形。\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/13888068e78f4bd98026af8d27d70482_1255w_942h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/ff7b27f3-3afe-470c-82cc-9bea236a4b6b.jpg\",
           \"content\": \"用豆腐皮将金针菇卷起，牙签固定住。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/522b51dc97d54c0e89f7bfbae77c646d_1255w_942h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/a6381fb0-b6b0-437c-a07b-1af4699c6383.jpg\",
           \"content\": \"碗中倒入大喜大糖醋排骨酱，以及半碗清水和生粉，搅拌均匀备用；以往做糖醋酱汁，总要准备好几种调味料，现在有了这款大喜大糖醋排骨酱，再也不用自己调配了，味道刚刚好，家人都说好吃。\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/1f7c4a19ce044a82ad2d86fa57e2dc45_1255w_942h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/0d246d57-b42d-4907-a1cd-a099a90a02b1.jpg\",
           \"content\": \"锅内倒油，放入金针菇豆腐卷，煎2分钟定型，可以用筷子翻翻面。\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/36cf444401024ef8bb3b614f22209d1d_1255w_942h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/67e6066e-e0f7-46ac-83a2-b46df5d462fd.jpg\",
           \"content\": \"之前调好的酱汁搅和一下倒入，焖煮2分钟，汤汁变浓，撒上葱花即可出锅\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/c86bde355ec44a7cb62cdc2d44daa1f2_1255w_942h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/70683fb2-aab4-4171-8d05-c2c6a1ea85f9.jpg\",
           \"content\": \"完成了！一袋大喜大酱搞定了一道完美的夜宵\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/f49664e5fec44a2c8d46654b06921555_1255w_942h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/76406fcf-b369-405d-96ac-bda1366750e6.jpg\",
           \"content\": \"几块钱成本，做法简单，营养也均衡，酱汁还能拌饭，那简直就是比肉还好吃的素菜！\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/782ec121c86a477ebbcaad27ced2770f_1255w_941h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"金针菇\",
           \"ylUnit\": \"1把\"
         },
         {
           \"ylName\": \"小葱\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"豆皮\",
           \"ylUnit\": \"1张\"
         },
         {
           \"ylName\": \"大喜大糖醋排骨酱\",
           \"ylUnit\": \"半包\"
         }
       ]', '[
         2,
         24,
         73,
         171,
         242
       ]'),
       (187, '「空气炸锅」烤茄子', 'http://static1.showapi.com/app2/img/caipu/20210301/e3a33b69-28b9-44da-b92a-db429a136a54.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210301/fe863df3-bdf0-495e-8363-e95a125b4ea3.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/836050d4-a282-4a28-8ba8-6a8f3c67cb90.jpg\",
           \"content\": \"空气炸锅铺好锡纸，茄子洗净，放入空气炸锅\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/590d5616c6ba46a69487124fe24ef26a_1224w_1632h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/6429e2e1-579e-47df-938e-3fdb9965b7f1.jpg\",
           \"content\": \"180烤制20分钟\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/b41979bf592d4007afffbdf34b709e63_1632w_1224h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/f309adf5-2f94-4fe3-933e-c223168775a7.jpg\",
           \"content\": \"用筷子划拉开茄子\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/e27769f70ca74dbb8a17bed591bcb57d_1632w_1224h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/d7fed1b4-e9bc-4ec8-8526-423923ad63ab.jpg\",
           \"content\": \"准备料汁：生抽、蒜末、小葱、孜然粉、香油、小米椒，混合一起\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/4618eb576b2d43e69788b84da5376f1b_1632w_1224h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210301/1083bd0b-94a7-47c2-8a47-a2e400d9aff1.jpg\",
           \"content\": \"淋到茄子上，1803分钟\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/93b815d6996c4622b9b2870afa17404d_1632w_1224h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"茄子\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"孜然粉\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"小米椒\",
           \"ylUnit\": \"2个\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"3瓣\"
         },
         {
           \"ylName\": \"小葱\",
           \"ylUnit\": \"2根\"
         },
         {
           \"ylName\": \"香油\",
           \"ylUnit\": \"0.5勺\"
         }
       ]', '[
         2,
         6,
         8,
         25,
         74,
         171,
         242
       ]'),
       (188, '停不下来的龙虾尾', 'http://static1.showapi.com/app2/img/caipu/20210227/6d1800ac-ce22-4036-982f-f3ae2402c199.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210227/8110a08e-b465-471e-9fc1-5e47c8ac1784.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/0ee90820-c2ad-4331-9118-7a1686b3f4ac.jpg\",
           \"content\": \"带冰龙虾尾用水冲洗解冻\",
           \"orderNum\": 1,
           \"old_imgUrl\": \"https://i2.chuimg.com/4a9732249ba64c8eb66b724780fb0194_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/c9b0b94c-37c2-4ffd-be5a-db815c901063.jpg\",
           \"content\": \"解冻后开始去除虾线\",
           \"orderNum\": 2,
           \"old_imgUrl\": \"https://i2.chuimg.com/4ced2b7cd60e422d95162dca2ad9043c_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/94f319fd-11f2-492a-a142-0d925c29325d.jpg\",
           \"content\": \"水中加料酒、姜片，焯水1分钟（热油炸一下也可以）焯水。\",
           \"orderNum\": 3,
           \"old_imgUrl\": \"https://i2.chuimg.com/3707c644d812478ebdf0619bcc1f362a_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/d4c0c17b-472f-4188-b618-fa6a65fa6124.jpg\",
           \"content\": \"蒜蓉\",
           \"orderNum\": 4,
           \"old_imgUrl\": \"https://i2.chuimg.com/1fda11fd5f234c6e957f8c40291d72ea_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/f66b5a86-43f6-4b89-9b4f-2c28a87fb973.jpg\",
           \"content\": \"买的袋装小龙虾调料\",
           \"orderNum\": 5,
           \"old_imgUrl\": \"https://i2.chuimg.com/0a784519019047e39edc8fe6c34dfb7d_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/a1747ae6-c46e-4b49-833d-ad1f8bfc094e.jpg\",
           \"content\": \"少放点油，把蒜蓉、麻椒炒出香味。\",
           \"orderNum\": 6,
           \"old_imgUrl\": \"https://i2.chuimg.com/9ec30eb635004f20b00aa821b562e97b_1080w_864h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/dd6769a7-e1c9-49d9-8085-31f659b94af8.jpg\",
           \"content\": \"放入焯过水的龙虾尾，翻炒一分钟左右。\",
           \"orderNum\": 7,
           \"old_imgUrl\": \"https://i2.chuimg.com/10a28cac2ec44c57acda5d8ddb1ef2ab_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/f9633094-9116-43b8-9081-d2f8b867ad96.jpg\",
           \"content\": \"加入半袋小龙虾调料，翻炒均匀。\",
           \"orderNum\": 8,
           \"old_imgUrl\": \"https://i2.chuimg.com/90690d2d71174daca7482ee7ed5ff223_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/1601af26-206a-43eb-98ea-bb3fc63425eb.jpg\",
           \"content\": \"啤酒来了，倒入半瓶啤酒，\",
           \"orderNum\": 9,
           \"old_imgUrl\": \"https://i2.chuimg.com/206a4a507e124bd49ef286f53e15667c_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/ff7bc4eb-7feb-49d3-93c3-ab6bdedf62cb.jpg\",
           \"content\": \"啤酒没过龙虾尾就行。我一般倒半瓶左右。口重的可以放一点点盐，基本是不用额外放盐的。\",
           \"orderNum\": 10,
           \"old_imgUrl\": \"https://i2.chuimg.com/722f3c9845474c5db0ae7098467695ce_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/27bd441a-3ef3-481e-9ffd-cfe306a115f8.jpg\",
           \"content\": \"中火炖到汤汁变少，就好啦！\",
           \"orderNum\": 11,
           \"old_imgUrl\": \"https://i2.chuimg.com/85dba41377784e429608a850c44e5ab4_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/585179f3-abd6-464f-8f2d-e7cb20a635f9.jpg\",
           \"content\": \"四个字麻辣鲜香。\",
           \"orderNum\": 12,
           \"old_imgUrl\": \"https://i2.chuimg.com/372dbcaf717a49a1a83825b546513c4d_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210227/8540afb0-188a-4b51-a267-09003646c694.jpg\",
           \"content\": \"烤串、龙虾尾、啤酒是不是绝配，口水流出来了\",
           \"orderNum\": 13,
           \"old_imgUrl\": \"https://i2.chuimg.com/456cd613526c465ca855ecec784820a6_920w_2000h.jpg?imageView2/2/w/300/interlace/1/q/90\"
         }
       ]', '[
         {
           \"ylName\": \"带冰龙虾尾\",
           \"ylUnit\": \"1500克\"
         },
         {
           \"ylName\": \"姜片\",
           \"ylUnit\": \"2片\"
         },
         {
           \"ylName\": \"干辣椒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"小龙虾调料包\",
           \"ylUnit\": \"半袋\"
         },
         {
           \"ylName\": \"蒜\",
           \"ylUnit\": \"1头\"
         },
         {
           \"ylName\": \"啤酒\",
           \"ylUnit\": \"半瓶\"
         }
       ]', '[
         2,
         6,
         8,
         22,
         71,
         70,
         170,
         175,
         242
       ]'),
       (189, '家常菜～高钙营养又美味肉沫蘑菇豆腐汤',
        'http://static1.showapi.com/app2/img/caipu/20210224/a4ba673f-6e84-4fd0-974c-87c7ecd4fb8d.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210224/8b8fc056-81b7-4d51-84d0-739c08d99b57.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/40570bf5-2926-41e6-93ac-02780e5de633.jpg\",
           \"content\": \"将买来的肉沫，放入小半勺盐，一勺料酒，半勺生抽，白胡椒粉，小葱切碎拌匀，放一旁备用\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/5d445ee6-caa0-44dc-abcb-465d6a491b7e.jpg\",
           \"content\": \"蘑菇加入半勺盐泡一下，然后清洗干净，切成片备用\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/54e62b83-74ff-4c29-b25d-8f3770320236.jpg\",
           \"content\": \"将一大块豆腐切成小块\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/44976e36-1441-43ce-8777-51027a158012.jpg\",
           \"content\": \"如图\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210224/a835f630-73be-4266-a8e8-0b43624abb79.jpg\",
           \"content\": \"锅里倒入食用油烧热，先加入生姜，接着加入拌好的肉沫炒出香味，然后放蘑菇继续翻炒，翻炒片刻，加入适量清水，最后把切好的豆腐放入锅中，加盐，加半勺生抽，盖上锅盖煮10分钟就可以出锅了！\",
           \"orderNum\": 5
         }
       ]', '[
         {
           \"ylName\": \"豆腐\",
           \"ylUnit\": \"1块\"
         },
         {
           \"ylName\": \"肉沫\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"蘑菇\",
           \"ylUnit\": \"8个\"
         },
         {
           \"ylName\": \"盐\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"生抽\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"白胡椒粉\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"葱\",
           \"ylUnit\": \"2根\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"2片\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"1勺\"
         },
         {
           \"ylName\": \"食用油\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         70,
         71,
         4,
         138,
         171,
         99
       ]'),
       (190, '减脂高钙高蛋白?鲜掉眉毛的娃娃菜豆腐汤～',
        'http://static1.showapi.com/app2/img/caipu/20201216/54fca3c0-c940-489a-bd25-6ef73eac60ee.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201216/7a951425-3709-46a7-ae74-938c90562468.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/5d180a33-7e20-43c1-bd6d-000ab664776a.jpg\",
           \"content\": \"1娃娃菜洗净切成条，金针菇洗净撕开，豆腐切块备用。2热锅抹少许油，加入姜片、蒜末、小米辣爆香3倒入三碗水，加入豆腐，4烧开后加入蚝油、白胡椒粉、盐巴、味精调味5倒入金针菇和娃娃菜，焖煮三分钟即可！\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201216/515ffaff-6439-4c70-a043-11ed3f048066.jpg\",
           \"content\": \"喷香扑鼻！真的是鲜掉眉毛喽做法很简单，做为家常菜也是分分钟上桌，好喝又营养，快来试试看吧！\",
           \"orderNum\": 2
         }
       ]', '[
         {
           \"ylName\": \"娃娃菜\",
           \"ylUnit\": \"1颗\"
         },
         {
           \"ylName\": \"豆腐\",
           \"ylUnit\": \"1块\"
         },
         {
           \"ylName\": \"金针菇\",
           \"ylUnit\": \"1把\"
         }
       ]', '[
         2,
         6,
         9,
         20,
         71,
         77,
         138,
         139,
         133,
         134,
         202,
         171,
         99
       ]'),
       (191, '丝瓜高钙菜汤?高钙菜，市场上的蔬菜新宠，有很好的食疗养生效果?',
        'http://static1.showapi.com/app2/img/caipu/20201027/6a7d4f19-5a68-40fb-841b-826ebd85db69.jpg',
        'http://static1.showapi.com/app2/img/caipu/20201027/c289c428-36e3-49ae-b1a8-37f99cbc32ca.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201027/979681f5-c041-4212-932d-c7bcee49fcac.jpg\",
           \"content\": \"做法：1、丝瓜去皮切块。高钙菜和裙带菜洗净泡发好。红萝卜去皮切片。草菇切两半。姜切片。\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201027/8d900452-d473-454c-b913-c9e04ceceddc.jpg\",
           \"content\": \"2、热锅下油爆香姜，将所有食材炒香，再倒入适量热开水，煮10分钟左右，下入松茸鲜蔬粉即成。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20201027/2d53204d-6288-438e-89de-6abf56668739.jpg\",
           \"content\": \"温馨提示:尽量少吃油、盐、糖。\",
           \"orderNum\": 3
         }
       ]', '[
         {
           \"ylName\": \"丝瓜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"高钙菜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"裙带菜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"红萝卜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"草菇\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"姜\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"植物油，松茸鲜蔬粉。\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         2,
         6,
         70,
         71,
         99,
         138
       ]'),
       (192, '鲜得掉眉的笋片豆腐菌菇昂刺鱼汤高蛋白低脂营养一百分',
        'http://static1.showapi.com/app2/img/caipu/20210221/12622682-88bf-4906-a1cd-9067fe96bd65.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210221/7c65d6da-7f14-4fa6-a68b-217cb207c48d.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/0983f38c-1151-481d-8906-0eeea895d092.jpg\",
           \"content\": \"笋片切好备用\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/298c1b96-ef16-455f-a86d-c7d341692711.jpg\",
           \"content\": \"昂刺鱼修理干净后码在切配盘里，倒一些料酒（铺满底的量）和些许生抽，铺一些姜片。这个步骤是为了去腥。静置大概二十几分钟。（也可更久，天气热的话，要铺保鲜膜放冰箱冷藏）\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/172ad081-10d9-4d5e-a59d-e9da5348b69d.jpg\",
           \"content\": \"汤锅放水，直接放入笋片，开火。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/54b0db75-e7b4-4a0e-babd-c77ed88d5889.jpg\",
           \"content\": \"准备好的昂刺鱼，撒生粉（玉米淀粉）使鱼身包裹上粉浆\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/27e6fe83-599d-4e92-a75d-2a36ecb97573.jpg\",
           \"content\": \"炒锅内放油，降沾好粉浆的鱼依次放入锅内使鱼身表面定型（这样在汤里不易散乱）。你也可以少许油，双面煎一煎。其实稍微过油，不像油炸那样不健康，因为时间短，马上就捞出放汤锅里了。（这个成品菜，没加其他任何油，所以这点油可以的）\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/00ee2204-8475-4c55-b1a2-232cf819e973.jpg\",
           \"content\": \"这时笋片汤已经烧开了，过油后的昂刺鱼码入汤锅内\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/36c2ea83-61a1-4cbc-b27b-22db2db1ea26.jpg\",
           \"content\": \"再放入切好的豆腐块，这时将最初浸泡昂刺鱼的料酒和生抽一同倒入\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/6d80bf52-8cad-4f95-9702-120e1acd4df1.jpg\",
           \"content\": \"开大火煮开后，转中小火，盖盖子煮半小时。汤的颜色会越煮越奶白色（外面卖的奶白色汤，大多用大骨酱包短时间调出来的，经常食用对人体有害的。。\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/64f676d4-3d2e-45e3-b549-76626936466b.jpg\",
           \"content\": \"煮半小时后，尝一尝汤头，加盐调味，若感觉还有腥味，可再加些料酒。若加料酒，就再继续煮几分钟，若没再加了，这时就可加入菌菇了，我用的是海鲜菇。加了菌菇后再把汤煮开。不用放味精，鲜得掉眉的鲜味来自食物本身:鱼，菇，豆腐）\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/55ba5715-e030-48d4-982e-f370c56e3d18.jpg\",
           \"content\": \"装盘撒葱花\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210221/4776fb65-26e1-451b-a9f2-0cc18e4dde65.jpg\",
           \"content\": \"真的很鲜!非常爱纯天然食物做出的，步骤简单，大比例保留食物本身营养的菜肴!我家小朋友，我都是直接鱼汤给他拌饭，里面再掺合一些鱼肉。他都是没挑剔直接吃了。他嘴巴很叼的，不好吃就不吃）\",
           \"orderNum\": 11
         }
       ]', '[
         {
           \"ylName\": \"老姜\",
           \"ylUnit\": \"若干片\"
         },
         {
           \"ylName\": \"料酒\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"盒装豆腐\",
           \"ylUnit\": \"350克\"
         },
         {
           \"ylName\": \"笋片\",
           \"ylUnit\": \"若干\"
         },
         {
           \"ylName\": \"菌菇\",
           \"ylUnit\": \"适量\"
         },
         {
           \"ylName\": \"昂刺鱼\",
           \"ylUnit\": \"4条\"
         }
       ]', '[
         2,
         6,
         20,
         73,
         71,
         99,
         170,
         175,
         171,
         202,
         139,
         133
       ]'),
       (193, '低脂低碳高蛋白菠菜牛油果海鲜鸡蛋饼',
        'http://static1.showapi.com/app2/img/caipu/20210210/7fb22394-2df7-40be-adc1-9a65d471ab1f.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210210/0d0e7e8c-4f3b-47c1-b1ab-5392bebd44ed.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210210/1a15af3b-b2c0-450f-8bb5-ebb5e2b787ba.jpg\",
           \"content\": \"准备工作：菠菜洗干净切碎海参切小块（我的是熟的海参没有海参用虾仁火腿甚至不加也可以）牛油果切小块鸡蛋打散\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210210/16dfaf2e-4251-4b25-8fa1-9b4dd09ae87f.jpg\",
           \"content\": \"不粘平底锅刷一层薄薄的油，倒入菠菜中火炒几十秒到半熟\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210210/1d952239-9a0f-49dd-9085-b7bc9351a11a.jpg\",
           \"content\": \"加入海参再炒十几秒\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210210/96bf5a33-ee09-471c-ad77-11d1f4b3d89e.jpg\",
           \"content\": \"调最小火！倒入鸡蛋液，转动平底锅让蛋液均匀铺满\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210210/be208d19-6f9e-4bfc-a2a6-3db2da9ae99d.jpg\",
           \"content\": \"加入牛油果丁把芝士片掰碎铺在最上面，最后撒点黑胡椒\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210210/cdec0145-c87c-4a13-8958-366ab751c09b.jpg\",
           \"content\": \"盖上锅盖最小火焖熟（差不多一分钟左右）期间可以轻轻转动锅子使其加热均匀，蛋液熟透凝固就可以啦\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210210/a094195d-3a36-493f-8303-8d37d45e999b.jpg\",
           \"content\": \"吃之前可以加一点喜欢的酱料，我用的这个超级搭\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210210/ea9b6692-d2f2-4561-b168-1e1880607150.jpg\",
           \"content\": \"绝了！开吃\",
           \"orderNum\": 8
         }
       ]', '[
         {
           \"ylName\": \"鸡蛋\",
           \"ylUnit\": \"1个\"
         },
         {
           \"ylName\": \"牛油果\",
           \"ylUnit\": \"半个\"
         },
         {
           \"ylName\": \"菠菜\",
           \"ylUnit\": \"一小把\"
         },
         {
           \"ylName\": \"海参\",
           \"ylUnit\": \"1只\"
         },
         {
           \"ylName\": \"低脂芝士片\",
           \"ylUnit\": \"1片\"
         },
         {
           \"ylName\": \"黑胡椒\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         1,
         7,
         70,
         77,
         103,
         133,
         139,
         202,
         240
       ]'),
       (194, '巧克力蛋白酸奶冻，减脂人士的健康零食，低卡低脂低糖高蛋白还补钙',
        'http://static1.showapi.com/app2/img/caipu/20210204/4af61aae-c893-4d66-bcdb-0886b3adf512.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210204/17debb9e-d530-4dad-95eb-a20734d5fd98.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210204/07d11f1b-f883-430f-b0ed-0747c8578919.jpg\",
           \"content\": \"如图准备2杯希腊酸奶，75克/3克1杯蓝莓\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210204/98f76465-e1b1-4e10-8cdb-eb4199095431.jpg\",
           \"content\": \"将酸奶、蛋白粉和2/3杯的蓝莓倒入大碗中。\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210204/c60fc641-b9d1-42cd-9ab7-bb8c8ade12bd.jpg\",
           \"content\": \"用刮刀搅匀。\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210204/8c3d7f15-50e4-47fd-9d9b-86868d0568e3.jpg\",
           \"content\": \"烘焙纸置入烤盘上，用刮刀把混合好的酸奶平铺在烘焙纸上，撒上剩下的蓝莓和适量的烤杏仁粒。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210204/cdf7d908-fe92-4727-b944-120c329d730b.jpg\",
           \"content\": \"用保鲜膜封上烤盘，注意尽量让保鲜膜拉紧不要接触到酸奶。放入冰箱冻两小时以上\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210204/74a1975e-d5ac-4131-9ec9-d747fcf93609.jpg\",
           \"content\": \"取出冻好的酸奶冻，用手分掰成大块。\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210204/37866e12-fbc7-4131-b674-25dd10fccaa6.jpg\",
           \"content\": \"放入保鲜袋中入冻箱保存。\",
           \"orderNum\": 7
         }
       ]', '[
         {
           \"ylName\": \"无糖希腊酸奶\",
           \"ylUnit\": \"2杯\"
         },
         {
           \"ylName\": \"巧克力蛋白粉\",
           \"ylUnit\": \"75克/3勺\"
         },
         {
           \"ylName\": \"蓝莓\",
           \"ylUnit\": \"1杯\"
         },
         {
           \"ylName\": \"烤杏仁粒\",
           \"ylUnit\": \"适量\"
         }
       ]', '[
         3,
         7,
         74,
         76,
         106,
         133,
         134,
         137,
         139,
         138,
         202
       ]'),
       (195, '健康低卡——晚餐打卡&高蛋白低脂肪',
        'http://static1.showapi.com/app2/img/caipu/20210128/9d2d60a3-b53b-4100-90f3-2402149025af.jpg',
        'http://static1.showapi.com/app2/img/caipu/20210128/dd91330e-e21b-474d-b5ab-52f63c14eb04.jpg', '[
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/355cb1da-960f-48cd-9fc1-4b97891aa912.jpg\",
           \"content\": \"煎鸡胸肉炒虾仁青豆燕麦粥蒸南瓜坚果柠檬水\",
           \"orderNum\": 1
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/155fdc77-0cec-46d1-8fe4-b19c03638706.jpg\",
           \"content\": \"煎鸡胸肉\",
           \"orderNum\": 2
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/215738ed-d134-4bab-9155-33f71c7472c4.jpg\",
           \"content\": \"先把鸡胸肉用擀面杖侧着敲打平，放盐和黑胡椒腌制一段时间，可以隔夜；\",
           \"orderNum\": 3
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/1374a771-7d56-49aa-a032-3b813779bccb.jpg\",
           \"content\": \"我是隔夜腌制好直接煎。不粘锅少许油，用刷子刷匀，小火煎5分钟左右，翻面再煎5分钟；盛出静置一会，切条即可。\",
           \"orderNum\": 4
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/372b6c16-8575-41c0-af7d-a5345ddf715e.jpg\",
           \"content\": \"鸡肉很有韧性，不干不柴，很好吃。\",
           \"orderNum\": 5
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/efba806b-4662-4e4c-96c8-bc30d6a38d4e.jpg\",
           \"content\": \"虾仁炒青豆\",
           \"orderNum\": 6
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/7ae860c6-5317-4f77-829c-8b22042e9b09.jpg\",
           \"content\": \"胡萝卜切丁，玉米粒，青豆粒备好，虾去除虾线拨壳切碎，撒一点黑胡椒备用，\",
           \"orderNum\": 7
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/9e02a310-6515-4ba3-80e4-5ac900924fa6.jpg\",
           \"content\": \"锅中放少许油，爆香姜蒜\",
           \"orderNum\": 8
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/0421a76f-8b43-463a-809d-ffe5c532e2f7.jpg\",
           \"content\": \"放入虾和胡萝卜\",
           \"orderNum\": 9
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/f4801b01-3dda-4337-bc9b-aec2323977a1.jpg\",
           \"content\": \"炒香后放玉米粒和青豆，加盐，黑胡椒，蚝油调味。\",
           \"orderNum\": 10
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/496e0261-3f25-45d6-b3fa-0711f7210a0e.jpg\",
           \"content\": \"燕麦粥一小把燕麦燕麦麸皮，加适量水煮熟，撒少许奇亚籽。\",
           \"orderNum\": 11
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/c7ed2e5b-8a8d-469d-85ee-c141d0a1f1f3.jpg\",
           \"content\": \"简单快手，营养充足。\",
           \"orderNum\": 12
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/223e6a07-8053-4ede-8465-c60d5c9b7c47.jpg\",
           \"content\": \"南瓜是早饭蒸好剩下的；切一片柠檬的淡淡的柠檬水\",
           \"orderNum\": 13
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/b31addd4-c8f4-44a4-85cf-5867949c1df4.jpg\",
           \"content\": \"坚果随意，不要太多。\",
           \"orderNum\": 14
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/90e598d2-e16c-4e85-8ca1-f37603ff95f0.jpg\",
           \"content\": \"热量大致在500打卡，不超标，营养满满，做法简单。\",
           \"orderNum\": 15
         },
         {
           \"imgUrl\": \"http://static1.showapi.com/app2/img/caipu/20210128/81f37525-a433-4d40-b737-798970fe4b6e.jpg\",
           \"content\": \"小花记录自己的低卡饮食，写了公众号：【公众号：厨小花，上百道细致的菜谱等你来！小花低卡饮食群，喜欢可以去找我哦！VX：CXHXH2018，有问必答，让我们一起健康吃饭！\",
           \"orderNum\": 16
         }
       ]', '[
         {
           \"ylName\": \"鸡胸肉\",
           \"ylUnit\": \"半块\"
         },
         {
           \"ylName\": \"虾\",
           \"ylUnit\": \"3只\"
         },
         {
           \"ylName\": \"青豆\",
           \"ylUnit\": \"少许\"
         },
         {
           \"ylName\": \"胡萝卜\",
           \"ylUnit\": \"半根\"
         },
         {
           \"ylName\": \"南瓜\",
           \"ylUnit\": \"2块\"
         },
         {
           \"ylName\": \"燕麦+奇亚籽\",
           \"ylUnit\": \"一小把\"
         },
         {
           \"ylName\": \"坚果\",
           \"ylUnit\": \"少许\"
         }
       ]', '[
         1,
         6,
         70,
         73,
         133,
         134,
         139,
         202,
         170,
         175,
         171,
         151
       ]');
/*!40000 ALTER TABLE `menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_food`
--

DROP TABLE IF EXISTS `menu_food`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_food`
(
    `menu_id` int(11) NOT NULL COMMENT '对应菜谱id',
    `food_id` int(11) NOT NULL COMMENT '对应食材id',
    PRIMARY KEY (`menu_id`, `food_id`),
    KEY `menu_food_food_warehouse_id_fk` (`food_id`),
    CONSTRAINT `menu_food___fk1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `menu_food___fk2` FOREIGN KEY (`food_id`) REFERENCES `food_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1 COMMENT ='菜谱和食材的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_food`
--

LOCK TABLES `menu_food` WRITE;
/*!40000 ALTER TABLE `menu_food`
    DISABLE KEYS */;
INSERT INTO `menu_food`
VALUES (26, 1),
       (29, 1),
       (30, 1),
       (31, 1),
       (33, 1),
       (34, 1),
       (36, 1),
       (39, 1),
       (46, 1),
       (47, 1),
       (48, 1),
       (50, 1),
       (58, 1),
       (63, 1),
       (64, 1),
       (66, 1),
       (69, 1),
       (79, 1),
       (91, 1),
       (99, 1),
       (111, 1),
       (121, 1),
       (134, 1),
       (142, 1),
       (153, 1),
       (166, 1),
       (170, 1),
       (171, 1),
       (173, 1),
       (175, 1),
       (179, 1),
       (184, 1),
       (193, 1),
       (30, 2),
       (31, 2),
       (32, 2),
       (36, 2),
       (59, 2),
       (95, 2),
       (117, 2),
       (154, 2),
       (159, 2),
       (31, 3),
       (49, 3),
       (114, 3),
       (119, 3),
       (159, 3),
       (189, 3),
       (26, 4),
       (30, 4),
       (69, 4),
       (99, 4),
       (153, 4),
       (166, 4),
       (170, 4),
       (179, 4),
       (181, 4),
       (184, 4),
       (26, 5),
       (28, 5),
       (30, 5),
       (31, 5),
       (32, 5),
       (33, 5),
       (35, 5),
       (36, 5),
       (47, 5),
       (48, 5),
       (49, 5),
       (50, 5),
       (51, 5),
       (52, 5),
       (55, 5),
       (57, 5),
       (58, 5),
       (60, 5),
       (61, 5),
       (63, 5),
       (64, 5),
       (65, 5),
       (68, 5),
       (69, 5),
       (71, 5),
       (72, 5),
       (73, 5),
       (75, 5),
       (76, 5),
       (77, 5),
       (83, 5),
       (86, 5),
       (89, 5),
       (91, 5),
       (95, 5),
       (96, 5),
       (97, 5),
       (99, 5),
       (108, 5),
       (110, 5),
       (111, 5),
       (115, 5),
       (119, 5),
       (120, 5),
       (122, 5),
       (123, 5),
       (124, 5),
       (125, 5),
       (126, 5),
       (134, 5),
       (138, 5),
       (144, 5),
       (145, 5),
       (148, 5),
       (153, 5),
       (154, 5),
       (158, 5),
       (159, 5),
       (162, 5),
       (167, 5),
       (170, 5),
       (172, 5),
       (174, 5),
       (175, 5),
       (180, 5),
       (189, 5),
       (26, 6),
       (47, 6),
       (72, 6),
       (99, 6),
       (101, 6),
       (108, 6),
       (122, 6),
       (126, 6),
       (156, 6),
       (166, 6),
       (170, 6),
       (175, 6),
       (28, 15),
       (83, 15),
       (84, 15),
       (85, 15),
       (100, 15),
       (187, 15),
       (28, 16),
       (66, 16),
       (95, 16),
       (120, 16),
       (28, 17),
       (33, 17),
       (116, 17),
       (28, 18),
       (30, 18),
       (32, 18),
       (84, 18),
       (96, 18),
       (136, 18),
       (28, 19),
       (37, 19),
       (38, 19),
       (121, 19),
       (159, 19),
       (28, 20),
       (33, 20),
       (37, 20),
       (47, 20),
       (49, 20),
       (54, 20),
       (61, 20),
       (83, 20),
       (86, 20),
       (110, 20),
       (122, 20),
       (134, 20),
       (136, 20),
       (169, 20),
       (28, 21),
       (29, 21),
       (31, 21),
       (33, 21),
       (34, 21),
       (43, 21),
       (44, 21),
       (46, 21),
       (48, 21),
       (49, 21),
       (51, 21),
       (55, 21),
       (57, 21),
       (58, 21),
       (62, 21),
       (66, 21),
       (73, 21),
       (74, 21),
       (77, 21),
       (83, 21),
       (86, 21),
       (89, 21),
       (90, 21),
       (95, 21),
       (97, 21),
       (99, 21),
       (107, 21),
       (110, 21),
       (115, 21),
       (119, 21),
       (120, 21),
       (121, 21),
       (122, 21),
       (124, 21),
       (125, 21),
       (126, 21),
       (129, 21),
       (131, 21),
       (134, 21),
       (136, 21),
       (163, 21),
       (167, 21),
       (172, 21),
       (187, 21),
       (189, 21),
       (28, 22),
       (34, 22),
       (44, 22),
       (55, 22),
       (66, 22),
       (72, 22),
       (99, 22),
       (107, 22),
       (121, 22),
       (125, 22),
       (126, 22),
       (131, 22),
       (28, 23),
       (31, 23),
       (39, 23),
       (40, 23),
       (49, 23),
       (54, 23),
       (62, 23),
       (66, 23),
       (90, 23),
       (100, 23),
       (105, 23),
       (107, 23),
       (108, 23),
       (110, 23),
       (120, 23),
       (121, 23),
       (129, 23),
       (172, 23),
       (179, 23),
       (28, 24),
       (118, 24),
       (28, 25),
       (181, 25),
       (29, 26),
       (99, 26),
       (122, 26),
       (173, 26),
       (29, 27),
       (29, 28),
       (29, 29),
       (29, 30),
       (31, 30),
       (69, 30),
       (99, 30),
       (117, 30),
       (122, 30),
       (138, 30),
       (173, 30),
       (29, 31),
       (29, 32),
       (31, 32),
       (44, 32),
       (46, 32),
       (47, 32),
       (55, 32),
       (62, 32),
       (65, 32),
       (66, 32),
       (74, 32),
       (77, 32),
       (84, 32),
       (86, 32),
       (99, 32),
       (125, 32),
       (126, 32),
       (136, 32),
       (154, 32),
       (167, 32),
       (29, 33),
       (32, 33),
       (34, 33),
       (41, 33),
       (47, 33),
       (60, 33),
       (72, 33),
       (73, 33),
       (80, 33),
       (113, 33),
       (115, 33),
       (141, 33),
       (147, 33),
       (148, 33),
       (152, 33),
       (165, 33),
       (178, 33),
       (180, 33),
       (29, 34),
       (32, 34),
       (48, 34),
       (69, 34),
       (71, 34),
       (89, 34),
       (115, 34),
       (29, 35),
       (37, 35),
       (40, 35),
       (57, 35),
       (71, 35),
       (90, 35),
       (114, 35),
       (115, 35),
       (170, 35),
       (173, 35),
       (187, 35),
       (77, 37),
       (105, 37),
       (126, 37),
       (30, 38),
       (69, 38),
       (77, 38),
       (153, 38),
       (31, 39),
       (135, 39),
       (154, 39),
       (186, 39),
       (31, 40),
       (95, 40),
       (121, 40),
       (124, 40),
       (134, 40),
       (161, 40),
       (163, 40),
       (167, 40),
       (189, 40),
       (31, 41),
       (53, 41),
       (60, 41),
       (65, 41),
       (73, 41),
       (82, 41),
       (84, 41),
       (113, 41),
       (120, 41),
       (121, 41),
       (131, 41),
       (154, 41),
       (178, 41),
       (187, 41),
       (188, 41),
       (31, 42),
       (50, 42),
       (60, 42),
       (78, 42),
       (86, 42),
       (95, 42),
       (111, 42),
       (123, 42),
       (124, 42),
       (136, 42),
       (154, 42),
       (158, 42),
       (164, 42),
       (167, 42),
       (189, 42),
       (31, 43),
       (34, 43),
       (47, 43),
       (48, 43),
       (66, 43),
       (95, 43),
       (119, 43),
       (120, 43),
       (148, 43),
       (149, 43),
       (164, 43),
       (170, 43),
       (172, 43),
       (32, 44),
       (35, 44),
       (32, 45),
       (51, 45),
       (75, 45),
       (33, 46),
       (33, 47),
       (68, 47),
       (97, 47),
       (110, 47),
       (129, 47),
       (171, 47),
       (189, 47),
       (33, 48),
       (83, 48),
       (96, 48),
       (99, 48),
       (110, 48),
       (154, 48),
       (186, 48),
       (187, 48),
       (34, 49),
       (38, 49),
       (66, 49),
       (107, 49),
       (113, 49),
       (115, 49),
       (34, 50),
       (44, 50),
       (57, 50),
       (97, 50),
       (125, 50),
       (142, 50),
       (146, 50),
       (35, 51),
       (35, 52),
       (49, 52),
       (98, 52),
       (36, 53),
       (38, 53),
       (44, 53),
       (61, 53),
       (63, 53),
       (65, 53),
       (84, 53),
       (86, 53),
       (91, 53),
       (144, 53),
       (152, 53),
       (153, 53),
       (37, 54),
       (37, 55),
       (38, 55),
       (116, 55),
       (37, 56),
       (38, 56),
       (47, 56),
       (72, 56),
       (73, 56),
       (84, 56),
       (85, 56),
       (170, 56),
       (37, 57),
       (38, 58),
       (135, 58),
       (38, 59),
       (38, 60),
       (39, 61),
       (40, 62),
       (40, 63),
       (41, 63),
       (76, 63),
       (80, 63),
       (150, 63),
       (152, 63),
       (156, 63),
       (179, 63),
       (184, 63),
       (40, 64),
       (80, 64),
       (175, 64),
       (180, 64),
       (184, 64),
       (40, 65),
       (106, 65),
       (40, 66),
       (40, 67),
       (41, 68),
       (74, 68),
       (81, 68),
       (102, 68),
       (154, 68),
       (41, 69),
       (174, 69),
       (185, 69),
       (41, 70),
       (87, 72),
       (43, 78),
       (51, 78),
       (43, 79),
       (189, 79),
       (43, 80),
       (43, 81),
       (43, 82),
       (43, 83),
       (63, 83),
       (84, 83),
       (122, 83),
       (172, 83),
       (189, 83),
       (44, 84),
       (44, 85),
       (104, 85),
       (44, 86),
       (48, 86),
       (99, 87),
       (104, 87),
       (148, 87),
       (48, 88),
       (57, 88),
       (66, 88),
       (89, 88),
       (93, 88),
       (111, 88),
       (113, 88),
       (57, 90),
       (119, 90),
       (121, 90),
       (60, 92),
       (62, 92),
       (63, 92),
       (153, 92),
       (46, 93),
       (46, 94),
       (46, 95),
       (119, 95),
       (123, 95),
       (132, 95),
       (46, 96),
       (46, 97),
       (46, 98),
       (47, 98),
       (66, 98),
       (126, 98),
       (47, 99),
       (47, 100),
       (48, 101),
       (125, 101),
       (48, 102),
       (49, 103),
       (49, 104),
       (124, 104),
       (50, 105),
       (52, 105),
       (50, 106),
       (57, 106),
       (77, 106),
       (89, 106),
       (95, 106),
       (107, 106),
       (115, 106),
       (120, 106),
       (121, 106),
       (125, 106),
       (126, 106),
       (127, 106),
       (129, 106),
       (134, 106),
       (136, 106),
       (154, 106),
       (162, 106),
       (163, 106),
       (170, 106),
       (172, 106),
       (189, 106),
       (192, 106),
       (50, 107),
       (53, 107),
       (51, 108),
       (122, 108),
       (131, 108),
       (51, 109),
       (51, 110),
       (69, 110),
       (51, 111),
       (52, 112),
       (55, 112),
       (71, 112),
       (112, 112),
       (52, 113),
       (53, 114),
       (54, 115),
       (116, 115),
       (54, 116),
       (128, 116),
       (161, 116),
       (163, 116),
       (54, 117),
       (54, 118),
       (113, 118),
       (129, 118),
       (146, 118),
       (164, 118),
       (54, 119),
       (60, 119),
       (88, 119),
       (95, 119),
       (164, 119),
       (173, 119),
       (55, 120),
       (55, 121),
       (57, 121),
       (60, 121),
       (115, 121),
       (55, 122),
       (163, 122),
       (166, 122),
       (178, 122),
       (55, 123),
       (69, 123),
       (153, 123),
       (55, 124),
       (55, 125),
       (74, 125),
       (176, 125),
       (187, 125),
       (57, 132),
       (68, 132),
       (86, 132),
       (127, 132),
       (167, 132),
       (57, 133),
       (57, 134),
       (57, 135),
       (57, 136),
       (180, 136),
       (57, 137),
       (64, 137),
       (65, 137),
       (173, 137),
       (193, 137),
       (58, 138),
       (58, 139),
       (62, 139),
       (83, 139),
       (58, 140),
       (108, 140),
       (188, 140),
       (58, 141),
       (111, 141),
       (124, 141),
       (125, 141),
       (129, 141),
       (59, 142),
       (129, 142),
       (59, 143),
       (95, 143),
       (100, 143),
       (117, 143),
       (154, 143),
       (170, 143),
       (59, 144),
       (60, 145),
       (182, 145),
       (60, 146),
       (77, 146),
       (141, 146),
       (60, 147),
       (60, 148),
       (178, 148),
       (60, 149),
       (101, 149),
       (105, 149),
       (106, 149),
       (152, 149),
       (165, 149),
       (181, 149),
       (61, 150),
       (62, 152),
       (173, 152),
       (62, 153),
       (62, 154),
       (62, 155),
       (62, 156),
       (110, 156),
       (121, 156),
       (64, 157),
       (64, 158),
       (86, 158),
       (64, 159),
       (64, 160),
       (66, 161),
       (68, 161),
       (69, 161),
       (71, 161),
       (74, 161),
       (66, 162),
       (66, 163),
       (68, 174),
       (108, 174),
       (110, 174),
       (155, 174),
       (69, 176),
       (79, 176),
       (80, 176),
       (69, 177),
       (71, 177),
       (87, 177),
       (113, 177),
       (71, 178),
       (113, 178),
       (71, 179),
       (90, 179),
       (71, 180),
       (71, 181),
       (72, 182),
       (72, 183),
       (72, 184),
       (73, 185),
       (73, 186),
       (73, 187),
       (74, 188),
       (77, 188),
       (74, 189),
       (74, 190),
       (74, 191),
       (74, 192),
       (75, 192),
       (74, 193),
       (75, 193),
       (77, 193),
       (93, 193),
       (94, 193),
       (103, 193),
       (134, 193),
       (138, 193),
       (166, 193),
       (170, 193),
       (176, 193),
       (193, 193),
       (75, 194),
       (75, 195),
       (76, 196),
       (76, 197),
       (76, 198),
       (76, 199),
       (76, 200),
       (76, 201),
       (76, 202),
       (76, 203),
       (150, 203),
       (175, 203),
       (76, 204),
       (77, 204),
       (102, 204),
       (149, 204),
       (175, 204),
       (184, 204),
       (76, 205),
       (76, 206),
       (77, 207),
       (77, 208),
       (82, 208),
       (77, 209),
       (78, 209),
       (77, 210),
       (127, 210),
       (154, 210),
       (164, 210),
       (78, 211),
       (160, 211),
       (78, 212),
       (195, 212),
       (78, 213),
       (104, 213),
       (106, 213),
       (142, 213),
       (160, 213),
       (164, 213),
       (79, 214),
       (79, 215),
       (178, 215),
       (79, 216),
       (180, 216),
       (80, 217),
       (80, 218),
       (80, 219),
       (81, 220),
       (93, 220),
       (94, 220),
       (81, 221),
       (81, 222),
       (81, 223),
       (88, 223),
       (82, 224),
       (82, 225),
       (82, 226),
       (82, 227),
       (82, 228),
       (82, 229),
       (82, 230),
       (85, 231),
       (85, 232),
       (166, 232),
       (85, 233),
       (86, 234),
       (87, 234),
       (88, 234),
       (89, 234),
       (90, 234),
       (91, 234),
       (98, 234),
       (100, 234),
       (111, 234),
       (133, 234),
       (89, 238),
       (90, 239),
       (90, 240),
       (126, 240),
       (129, 240),
       (90, 241),
       (93, 243),
       (94, 243),
       (97, 243),
       (99, 243),
       (93, 244),
       (94, 244),
       (95, 246),
       (96, 247),
       (96, 248),
       (129, 248),
       (96, 249),
       (97, 250),
       (97, 251),
       (97, 252),
       (97, 253),
       (98, 254),
       (110, 254),
       (98, 255),
       (99, 256),
       (119, 256),
       (99, 257),
       (99, 258),
       (99, 259),
       (155, 259),
       (99, 260),
       (100, 261),
       (101, 262),
       (101, 263),
       (101, 264),
       (102, 265),
       (155, 265),
       (175, 265),
       (184, 265),
       (102, 266),
       (102, 267),
       (102, 268),
       (102, 269),
       (166, 269),
       (102, 270),
       (103, 271),
       (103, 272),
       (103, 273),
       (169, 273),
       (174, 273),
       (176, 273),
       (103, 274),
       (122, 274),
       (126, 274),
       (162, 274),
       (170, 274),
       (172, 274),
       (188, 274),
       (104, 275),
       (104, 276),
       (104, 277),
       (104, 278),
       (139, 278),
       (142, 278),
       (143, 278),
       (146, 278),
       (160, 278),
       (164, 278),
       (104, 279),
       (105, 281),
       (106, 281),
       (181, 281),
       (105, 282),
       (105, 283),
       (139, 283),
       (105, 284),
       (181, 284),
       (185, 284),
       (105, 285),
       (105, 286),
       (105, 287),
       (106, 288),
       (106, 289),
       (106, 290),
       (107, 291),
       (107, 292),
       (107, 293),
       (107, 294),
       (107, 295),
       (107, 296),
       (108, 297),
       (133, 297),
       (195, 297),
       (108, 298),
       (108, 299),
       (108, 300),
       (111, 300),
       (108, 301),
       (108, 302),
       (108, 303),
       (108, 304),
       (108, 305),
       (108, 306),
       (108, 307),
       (108, 308),
       (110, 308),
       (108, 309),
       (108, 310),
       (108, 311),
       (108, 313),
       (161, 315),
       (125, 316),
       (126, 316),
       (125, 317),
       (126, 317),
       (124, 319),
       (125, 319),
       (126, 319),
       (155, 320),
       (192, 321),
       (110, 323),
       (110, 324),
       (110, 325),
       (110, 326),
       (110, 327),
       (127, 327),
       (167, 327),
       (111, 330),
       (112, 331),
       (112, 332),
       (112, 333),
       (115, 333),
       (113, 334),
       (113, 335),
       (113, 336),
       (121, 336),
       (123, 336),
       (114, 337),
       (115, 338),
       (116, 339),
       (117, 340),
       (136, 340),
       (154, 340),
       (117, 341),
       (117, 342),
       (117, 343),
       (134, 343),
       (117, 344),
       (118, 345),
       (118, 346),
       (118, 347),
       (168, 347),
       (118, 348),
       (119, 349),
       (120, 350),
       (123, 350),
       (144, 350),
       (145, 350),
       (121, 351),
       (158, 351),
       (122, 352),
       (122, 353),
       (122, 354),
       (122, 355),
       (122, 356),
       (124, 357),
       (124, 358),
       (125, 358),
       (126, 358),
       (146, 358),
       (124, 359),
       (124, 360),
       (124, 361),
       (124, 362),
       (124, 363),
       (125, 364),
       (128, 364),
       (125, 366),
       (125, 367),
       (177, 367),
       (178, 367),
       (125, 368),
       (126, 369),
       (127, 370),
       (127, 371),
       (127, 372),
       (127, 373),
       (128, 374),
       (128, 375),
       (130, 376),
       (130, 377),
       (130, 378),
       (130, 379),
       (130, 380),
       (130, 381),
       (130, 382),
       (130, 383),
       (130, 384),
       (131, 385),
       (131, 386),
       (132, 387),
       (132, 388),
       (132, 389),
       (133, 390),
       (133, 391),
       (133, 392),
       (133, 393),
       (172, 393),
       (174, 393),
       (133, 394),
       (134, 395),
       (137, 396),
       (138, 397),
       (139, 398),
       (139, 399),
       (139, 400),
       (139, 401),
       (140, 402),
       (140, 403),
       (140, 404),
       (140, 405),
       (141, 406),
       (141, 407),
       (142, 408),
       (142, 409),
       (142, 410),
       (143, 411),
       (143, 412),
       (144, 413),
       (145, 414),
       (145, 415),
       (145, 416),
       (146, 422),
       (146, 423),
       (147, 426),
       (147, 427),
       (147, 428),
       (147, 430),
       (147, 431),
       (148, 432),
       (166, 432),
       (149, 433),
       (166, 433),
       (149, 434),
       (149, 435),
       (150, 436),
       (150, 437),
       (150, 438),
       (150, 439),
       (151, 440),
       (152, 441),
       (152, 442),
       (165, 442),
       (152, 443),
       (155, 445),
       (156, 446),
       (156, 447),
       (156, 448),
       (156, 449),
       (158, 451),
       (158, 452),
       (158, 453),
       (159, 456),
       (161, 456),
       (160, 457),
       (160, 458),
       (160, 459),
       (162, 462),
       (163, 463),
       (164, 464),
       (164, 465),
       (164, 466),
       (165, 467),
       (166, 468),
       (166, 469),
       (166, 470),
       (166, 471),
       (166, 472),
       (166, 473),
       (167, 474),
       (168, 475),
       (168, 476),
       (168, 477),
       (169, 479),
       (169, 480),
       (169, 481),
       (170, 482),
       (170, 483),
       (173, 483),
       (171, 484),
       (171, 485),
       (171, 486),
       (172, 487),
       (172, 488),
       (173, 489),
       (173, 490),
       (173, 491),
       (173, 492),
       (174, 501),
       (174, 502),
       (174, 503),
       (175, 504),
       (175, 505),
       (175, 506),
       (176, 507),
       (178, 525),
       (178, 526),
       (178, 527),
       (189, 527),
       (178, 528),
       (178, 529),
       (178, 530),
       (178, 531),
       (178, 532),
       (178, 533),
       (178, 534),
       (180, 537),
       (180, 538),
       (181, 539),
       (182, 540),
       (182, 541),
       (182, 542),
       (185, 547),
       (185, 548),
       (186, 549),
       (186, 550),
       (187, 551),
       (188, 552),
       (188, 553),
       (188, 554),
       (192, 555),
       (192, 556),
       (192, 557),
       (192, 558),
       (193, 559),
       (193, 560),
       (193, 561),
       (194, 562),
       (194, 563),
       (194, 564),
       (194, 565),
       (195, 566),
       (195, 567),
       (195, 568),
       (195, 569);
/*!40000 ALTER TABLE `menu_food`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_tag`
--

DROP TABLE IF EXISTS `menu_tag`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_tag`
(
    `menu_id` int(11) NOT NULL COMMENT '菜谱id',
    `tag_id`  int(11) NOT NULL COMMENT 'tagid',
    PRIMARY KEY (`tag_id`, `menu_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1 COMMENT ='菜谱和tag关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_tag`
--

LOCK TABLES `menu_tag` WRITE;
/*!40000 ALTER TABLE `menu_tag`
    DISABLE KEYS */;
INSERT INTO `menu_tag`
VALUES (26, 1),
       (28, 1),
       (29, 1),
       (30, 1),
       (40, 1),
       (50, 1),
       (55, 1),
       (57, 1),
       (72, 1),
       (80, 1),
       (82, 1),
       (105, 1),
       (106, 1),
       (122, 1),
       (133, 1),
       (150, 1),
       (153, 1),
       (160, 1),
       (173, 1),
       (174, 1),
       (176, 1),
       (177, 1),
       (179, 1),
       (180, 1),
       (181, 1),
       (193, 1),
       (195, 1),
       (32, 2),
       (33, 2),
       (34, 2),
       (35, 2),
       (36, 2),
       (37, 2),
       (38, 2),
       (43, 2),
       (44, 2),
       (46, 2),
       (47, 2),
       (48, 2),
       (49, 2),
       (51, 2),
       (52, 2),
       (53, 2),
       (54, 2),
       (58, 2),
       (59, 2),
       (60, 2),
       (61, 2),
       (62, 2),
       (63, 2),
       (64, 2),
       (65, 2),
       (66, 2),
       (68, 2),
       (69, 2),
       (71, 2),
       (73, 2),
       (74, 2),
       (75, 2),
       (77, 2),
       (78, 2),
       (83, 2),
       (84, 2),
       (85, 2),
       (86, 2),
       (87, 2),
       (88, 2),
       (89, 2),
       (90, 2),
       (91, 2),
       (93, 2),
       (94, 2),
       (95, 2),
       (96, 2),
       (97, 2),
       (98, 2),
       (99, 2),
       (100, 2),
       (103, 2),
       (104, 2),
       (107, 2),
       (108, 2),
       (110, 2),
       (111, 2),
       (112, 2),
       (113, 2),
       (114, 2),
       (115, 2),
       (116, 2),
       (117, 2),
       (118, 2),
       (119, 2),
       (120, 2),
       (121, 2),
       (123, 2),
       (124, 2),
       (125, 2),
       (126, 2),
       (127, 2),
       (128, 2),
       (129, 2),
       (130, 2),
       (131, 2),
       (132, 2),
       (134, 2),
       (135, 2),
       (136, 2),
       (137, 2),
       (138, 2),
       (139, 2),
       (142, 2),
       (144, 2),
       (145, 2),
       (146, 2),
       (149, 2),
       (154, 2),
       (159, 2),
       (161, 2),
       (162, 2),
       (163, 2),
       (164, 2),
       (166, 2),
       (167, 2),
       (168, 2),
       (169, 2),
       (170, 2),
       (171, 2),
       (172, 2),
       (178, 2),
       (182, 2),
       (186, 2),
       (187, 2),
       (188, 2),
       (189, 2),
       (190, 2),
       (191, 2),
       (192, 2),
       (39, 3),
       (40, 3),
       (41, 3),
       (76, 3),
       (79, 3),
       (81, 3),
       (101, 3),
       (102, 3),
       (140, 3),
       (143, 3),
       (147, 3),
       (152, 3),
       (156, 3),
       (165, 3),
       (175, 3),
       (179, 3),
       (184, 3),
       (185, 3),
       (194, 3),
       (32, 4),
       (34, 4),
       (36, 4),
       (51, 4),
       (52, 4),
       (53, 4),
       (58, 4),
       (61, 4),
       (63, 4),
       (65, 4),
       (66, 4),
       (73, 4),
       (81, 4),
       (83, 4),
       (86, 4),
       (88, 4),
       (89, 4),
       (91, 4),
       (94, 4),
       (115, 4),
       (129, 4),
       (143, 4),
       (189, 4),
       (141, 5),
       (143, 5),
       (26, 6),
       (28, 6),
       (29, 6),
       (30, 6),
       (33, 6),
       (34, 6),
       (35, 6),
       (36, 6),
       (38, 6),
       (43, 6),
       (46, 6),
       (47, 6),
       (48, 6),
       (49, 6),
       (50, 6),
       (51, 6),
       (52, 6),
       (53, 6),
       (54, 6),
       (55, 6),
       (57, 6),
       (58, 6),
       (59, 6),
       (60, 6),
       (61, 6),
       (62, 6),
       (63, 6),
       (64, 6),
       (65, 6),
       (66, 6),
       (68, 6),
       (69, 6),
       (71, 6),
       (72, 6),
       (73, 6),
       (74, 6),
       (75, 6),
       (76, 6),
       (78, 6),
       (79, 6),
       (82, 6),
       (83, 6),
       (84, 6),
       (85, 6),
       (86, 6),
       (87, 6),
       (89, 6),
       (90, 6),
       (91, 6),
       (93, 6),
       (94, 6),
       (95, 6),
       (96, 6),
       (97, 6),
       (98, 6),
       (99, 6),
       (103, 6),
       (107, 6),
       (110, 6),
       (111, 6),
       (112, 6),
       (114, 6),
       (116, 6),
       (117, 6),
       (118, 6),
       (119, 6),
       (122, 6),
       (123, 6),
       (124, 6),
       (125, 6),
       (126, 6),
       (127, 6),
       (128, 6),
       (129, 6),
       (130, 6),
       (131, 6),
       (132, 6),
       (134, 6),
       (135, 6),
       (136, 6),
       (137, 6),
       (138, 6),
       (139, 6),
       (144, 6),
       (145, 6),
       (148, 6),
       (149, 6),
       (153, 6),
       (158, 6),
       (159, 6),
       (161, 6),
       (162, 6),
       (163, 6),
       (164, 6),
       (166, 6),
       (167, 6),
       (168, 6),
       (169, 6),
       (170, 6),
       (171, 6),
       (172, 6),
       (173, 6),
       (174, 6),
       (176, 6),
       (177, 6),
       (178, 6),
       (182, 6),
       (187, 6),
       (188, 6),
       (189, 6),
       (190, 6),
       (191, 6),
       (192, 6),
       (195, 6),
       (39, 7),
       (40, 7),
       (41, 7),
       (80, 7),
       (81, 7),
       (88, 7),
       (100, 7),
       (101, 7),
       (102, 7),
       (104, 7),
       (105, 7),
       (106, 7),
       (140, 7),
       (141, 7),
       (142, 7),
       (143, 7),
       (146, 7),
       (147, 7),
       (150, 7),
       (152, 7),
       (155, 7),
       (156, 7),
       (160, 7),
       (165, 7),
       (175, 7),
       (179, 7),
       (180, 7),
       (181, 7),
       (184, 7),
       (185, 7),
       (193, 7),
       (194, 7),
       (37, 8),
       (38, 8),
       (43, 8),
       (46, 8),
       (47, 8),
       (51, 8),
       (54, 8),
       (60, 8),
       (85, 8),
       (107, 8),
       (110, 8),
       (111, 8),
       (131, 8),
       (173, 8),
       (187, 8),
       (188, 8),
       (26, 9),
       (59, 9),
       (68, 9),
       (80, 9),
       (114, 9),
       (127, 9),
       (134, 9),
       (139, 9),
       (143, 9),
       (144, 9),
       (145, 9),
       (146, 9),
       (147, 9),
       (149, 9),
       (150, 9),
       (151, 9),
       (153, 9),
       (159, 9),
       (160, 9),
       (190, 9),
       (57, 20),
       (59, 20),
       (64, 20),
       (68, 20),
       (78, 20),
       (86, 20),
       (99, 20),
       (112, 20),
       (125, 20),
       (126, 20),
       (127, 20),
       (128, 20),
       (134, 20),
       (135, 20),
       (136, 20),
       (138, 20),
       (149, 20),
       (154, 20),
       (159, 20),
       (161, 20),
       (162, 20),
       (167, 20),
       (190, 20),
       (192, 20),
       (108, 21),
       (178, 21),
       (188, 22),
       (32, 23),
       (44, 23),
       (77, 23),
       (79, 23),
       (148, 23),
       (154, 23),
       (172, 23),
       (174, 23),
       (180, 23),
       (31, 24),
       (60, 24),
       (88, 24),
       (113, 24),
       (115, 24),
       (120, 24),
       (121, 24),
       (129, 24),
       (186, 24),
       (37, 25),
       (38, 25),
       (46, 25),
       (47, 25),
       (51, 25),
       (107, 25),
       (111, 25),
       (115, 25),
       (130, 25),
       (131, 25),
       (187, 25),
       (43, 26),
       (54, 26),
       (110, 26),
       (117, 26),
       (173, 26),
       (66, 67),
       (81, 67),
       (100, 67),
       (120, 67),
       (121, 67),
       (125, 67),
       (126, 67),
       (148, 67),
       (149, 67),
       (170, 67),
       (176, 67),
       (184, 67),
       (54, 68),
       (60, 68),
       (74, 68),
       (98, 68),
       (103, 68),
       (108, 68),
       (117, 68),
       (125, 68),
       (126, 68),
       (154, 68),
       (169, 68),
       (170, 68),
       (171, 68),
       (172, 68),
       (44, 69),
       (112, 69),
       (159, 69),
       (160, 69),
       (162, 69),
       (182, 69),
       (31, 70),
       (32, 70),
       (33, 70),
       (34, 70),
       (35, 70),
       (36, 70),
       (43, 70),
       (44, 70),
       (46, 70),
       (49, 70),
       (51, 70),
       (52, 70),
       (53, 70),
       (58, 70),
       (61, 70),
       (63, 70),
       (66, 70),
       (69, 70),
       (71, 70),
       (73, 70),
       (82, 70),
       (85, 70),
       (86, 70),
       (89, 70),
       (91, 70),
       (93, 70),
       (94, 70),
       (97, 70),
       (98, 70),
       (99, 70),
       (100, 70),
       (101, 70),
       (107, 70),
       (108, 70),
       (110, 70),
       (111, 70),
       (112, 70),
       (113, 70),
       (115, 70),
       (116, 70),
       (117, 70),
       (118, 70),
       (122, 70),
       (123, 70),
       (127, 70),
       (129, 70),
       (130, 70),
       (131, 70),
       (132, 70),
       (134, 70),
       (135, 70),
       (136, 70),
       (141, 70),
       (153, 70),
       (154, 70),
       (163, 70),
       (174, 70),
       (181, 70),
       (188, 70),
       (189, 70),
       (191, 70),
       (193, 70),
       (195, 70),
       (26, 71),
       (31, 71),
       (41, 71),
       (44, 71),
       (50, 71),
       (55, 71),
       (57, 71),
       (59, 71),
       (62, 71),
       (64, 71),
       (65, 71),
       (66, 71),
       (68, 71),
       (69, 71),
       (71, 71),
       (72, 71),
       (74, 71),
       (78, 71),
       (93, 71),
       (94, 71),
       (95, 71),
       (105, 71),
       (106, 71),
       (116, 71),
       (117, 71),
       (122, 71),
       (125, 71),
       (128, 71),
       (131, 71),
       (134, 71),
       (137, 71),
       (139, 71),
       (140, 71),
       (141, 71),
       (142, 71),
       (143, 71),
       (144, 71),
       (145, 71),
       (146, 71),
       (153, 71),
       (154, 71),
       (156, 71),
       (158, 71),
       (159, 71),
       (160, 71),
       (161, 71),
       (162, 71),
       (164, 71),
       (165, 71),
       (167, 71),
       (168, 71),
       (173, 71),
       (174, 71),
       (178, 71),
       (181, 71),
       (182, 71),
       (188, 71),
       (189, 71),
       (190, 71),
       (191, 71),
       (192, 71),
       (48, 72),
       (69, 72),
       (78, 72),
       (83, 72),
       (99, 72),
       (101, 72),
       (104, 72),
       (124, 72),
       (136, 72),
       (140, 72),
       (150, 72),
       (30, 73),
       (33, 73),
       (40, 73),
       (47, 73),
       (49, 73),
       (68, 73),
       (75, 73),
       (86, 73),
       (96, 73),
       (99, 73),
       (103, 73),
       (119, 73),
       (124, 73),
       (159, 73),
       (161, 73),
       (166, 73),
       (169, 73),
       (172, 73),
       (179, 73),
       (186, 73),
       (192, 73),
       (195, 73),
       (37, 74),
       (39, 74),
       (41, 74),
       (74, 74),
       (76, 74),
       (77, 74),
       (79, 74),
       (84, 74),
       (102, 74),
       (138, 74),
       (151, 74),
       (152, 74),
       (155, 74),
       (169, 74),
       (171, 74),
       (175, 74),
       (180, 74),
       (185, 74),
       (187, 74),
       (194, 74),
       (38, 75),
       (62, 75),
       (65, 75),
       (87, 75),
       (88, 75),
       (90, 75),
       (114, 75),
       (41, 76),
       (194, 76),
       (177, 77),
       (190, 77),
       (193, 77),
       (31, 99),
       (78, 99),
       (95, 99),
       (117, 99),
       (134, 99),
       (137, 99),
       (139, 99),
       (142, 99),
       (144, 99),
       (145, 99),
       (146, 99),
       (158, 99),
       (159, 99),
       (161, 99),
       (162, 99),
       (178, 99),
       (182, 99),
       (189, 99),
       (190, 99),
       (191, 99),
       (192, 99),
       (50, 100),
       (160, 100),
       (26, 101),
       (72, 101),
       (174, 101),
       (28, 102),
       (29, 102),
       (122, 102),
       (173, 102),
       (177, 102),
       (30, 103),
       (40, 103),
       (68, 103),
       (80, 103),
       (180, 103),
       (193, 103),
       (55, 104),
       (57, 104),
       (64, 104),
       (153, 104),
       (105, 105),
       (106, 105),
       (150, 105),
       (165, 105),
       (181, 105),
       (148, 106),
       (155, 106),
       (194, 106),
       (107, 120),
       (108, 120),
       (110, 120),
       (111, 120),
       (112, 121),
       (113, 121),
       (114, 121),
       (115, 121),
       (29, 122),
       (116, 122),
       (117, 122),
       (118, 122),
       (119, 122),
       (182, 122),
       (120, 123),
       (121, 123),
       (122, 123),
       (123, 123),
       (124, 124),
       (126, 124),
       (127, 125),
       (128, 126),
       (129, 126),
       (130, 126),
       (131, 126),
       (132, 127),
       (50, 133),
       (64, 133),
       (69, 133),
       (74, 133),
       (76, 133),
       (80, 133),
       (86, 133),
       (88, 133),
       (135, 133),
       (136, 133),
       (137, 133),
       (190, 133),
       (192, 133),
       (193, 133),
       (194, 133),
       (195, 133),
       (59, 134),
       (64, 134),
       (69, 134),
       (76, 134),
       (80, 134),
       (86, 134),
       (88, 134),
       (134, 134),
       (135, 134),
       (136, 134),
       (168, 134),
       (173, 134),
       (190, 134),
       (194, 134),
       (195, 134),
       (64, 135),
       (50, 136),
       (74, 136),
       (80, 136),
       (86, 136),
       (106, 136),
       (135, 136),
       (153, 136),
       (179, 136),
       (180, 136),
       (76, 137),
       (106, 137),
       (194, 137),
       (115, 138),
       (189, 138),
       (190, 138),
       (191, 138),
       (194, 138),
       (64, 139),
       (190, 139),
       (192, 139),
       (193, 139),
       (194, 139),
       (195, 139),
       (139, 151),
       (181, 151),
       (195, 151),
       (33, 170),
       (43, 170),
       (48, 170),
       (50, 170),
       (51, 170),
       (52, 170),
       (55, 170),
       (57, 170),
       (59, 170),
       (64, 170),
       (66, 170),
       (72, 170),
       (73, 170),
       (74, 170),
       (77, 170),
       (78, 170),
       (82, 170),
       (86, 170),
       (89, 170),
       (93, 170),
       (95, 170),
       (98, 170),
       (99, 170),
       (107, 170),
       (108, 170),
       (110, 170),
       (111, 170),
       (112, 170),
       (117, 170),
       (119, 170),
       (120, 170),
       (121, 170),
       (122, 170),
       (123, 170),
       (124, 170),
       (125, 170),
       (126, 170),
       (127, 170),
       (128, 170),
       (130, 170),
       (131, 170),
       (133, 170),
       (136, 170),
       (139, 170),
       (144, 170),
       (145, 170),
       (154, 170),
       (158, 170),
       (159, 170),
       (161, 170),
       (162, 170),
       (164, 170),
       (166, 170),
       (167, 170),
       (168, 170),
       (169, 170),
       (170, 170),
       (171, 170),
       (172, 170),
       (176, 170),
       (178, 170),
       (182, 170),
       (188, 170),
       (192, 170),
       (195, 170),
       (32, 171),
       (35, 171),
       (36, 171),
       (53, 171),
       (54, 171),
       (57, 171),
       (58, 171),
       (60, 171),
       (61, 171),
       (62, 171),
       (65, 171),
       (69, 171),
       (71, 171),
       (72, 171),
       (73, 171),
       (74, 171),
       (75, 171),
       (77, 171),
       (80, 171),
       (81, 171),
       (82, 171),
       (83, 171),
       (84, 171),
       (85, 171),
       (86, 171),
       (87, 171),
       (88, 171),
       (89, 171),
       (90, 171),
       (91, 171),
       (93, 171),
       (94, 171),
       (95, 171),
       (96, 171),
       (97, 171),
       (98, 171),
       (99, 171),
       (100, 171),
       (107, 171),
       (111, 171),
       (112, 171),
       (113, 171),
       (115, 171),
       (116, 171),
       (117, 171),
       (118, 171),
       (122, 171),
       (123, 171),
       (129, 171),
       (130, 171),
       (131, 171),
       (132, 171),
       (133, 171),
       (134, 171),
       (135, 171),
       (137, 171),
       (138, 171),
       (139, 171),
       (143, 171),
       (144, 171),
       (145, 171),
       (150, 171),
       (151, 171),
       (154, 171),
       (156, 171),
       (158, 171),
       (163, 171),
       (166, 171),
       (168, 171),
       (173, 171),
       (177, 171),
       (178, 171),
       (182, 171),
       (186, 171),
       (187, 171),
       (189, 171),
       (190, 171),
       (192, 171),
       (195, 171),
       (32, 173),
       (77, 173),
       (141, 173),
       (143, 173),
       (146, 173),
       (40, 174),
       (55, 174),
       (57, 174),
       (72, 174),
       (76, 174),
       (79, 174),
       (80, 174),
       (81, 174),
       (82, 174),
       (102, 174),
       (105, 174),
       (106, 174),
       (150, 174),
       (153, 174),
       (155, 174),
       (165, 174),
       (166, 174),
       (174, 174),
       (175, 174),
       (180, 174),
       (181, 174),
       (184, 174),
       (185, 174),
       (59, 175),
       (64, 175),
       (68, 175),
       (75, 175),
       (82, 175),
       (86, 175),
       (103, 175),
       (112, 175),
       (117, 175),
       (118, 175),
       (125, 175),
       (126, 175),
       (127, 175),
       (128, 175),
       (136, 175),
       (149, 175),
       (154, 175),
       (159, 175),
       (161, 175),
       (163, 175),
       (166, 175),
       (167, 175),
       (168, 175),
       (188, 175),
       (192, 175),
       (195, 175),
       (78, 200),
       (139, 200),
       (140, 200),
       (141, 200),
       (142, 200),
       (143, 201),
       (144, 201),
       (145, 201),
       (146, 201),
       (147, 201),
       (80, 202),
       (86, 202),
       (117, 202),
       (133, 202),
       (134, 202),
       (135, 202),
       (136, 202),
       (137, 202),
       (138, 202),
       (168, 202),
       (173, 202),
       (190, 202),
       (192, 202),
       (193, 202),
       (194, 202),
       (195, 202),
       (148, 210),
       (150, 210),
       (152, 210),
       (154, 210),
       (155, 210),
       (156, 210),
       (149, 211),
       (150, 211),
       (151, 211),
       (152, 211),
       (153, 212),
       (154, 212),
       (156, 212),
       (150, 213),
       (158, 213),
       (159, 213),
       (160, 213),
       (161, 213),
       (162, 213),
       (163, 213),
       (164, 213),
       (165, 230),
       (166, 230),
       (167, 230),
       (168, 230),
       (169, 231),
       (170, 231),
       (171, 231),
       (172, 231),
       (173, 231),
       (174, 232),
       (175, 232),
       (176, 232),
       (177, 233),
       (178, 233),
       (179, 240),
       (180, 240),
       (181, 240),
       (182, 240),
       (183, 240),
       (193, 240),
       (184, 241),
       (185, 241),
       (186, 242),
       (187, 242),
       (188, 242);
/*!40000 ALTER TABLE `menu_tag`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasoning`
--

DROP TABLE IF EXISTS `seasoning`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasoning`
(
    `id`              int(11) NOT NULL AUTO_INCREMENT,
    `fridgeId`        int(11) NOT NULL COMMENT '冰箱ID',
    `weight`          float       DEFAULT NULL COMMENT '食材重量单位为g',
    `seasoningStatus` int(11)     DEFAULT NULL COMMENT '调料补充的情况 0:不需要补充。1:已提示补充 ',
    `name`            varchar(32) DEFAULT NULL COMMENT '调料名称',
    PRIMARY KEY (`id`),
    KEY `fridgeId` (`fridgeId`),
    CONSTRAINT `seasoning_ibfk_1` FOREIGN KEY (`fridgeId`) REFERENCES `fridge_info` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasoning`
--

LOCK TABLES `seasoning` WRITE;
/*!40000 ALTER TABLE `seasoning`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `seasoning`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `describe` varchar(20) DEFAULT NULL COMMENT 'tag的描述',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 244
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag`
    DISABLE KEYS */;
INSERT INTO `tag`
VALUES (1, '主食'),
       (2, '菜'),
       (3, '甜点'),
       (4, '家常'),
       (5, '饮品'),
       (6, '咸口'),
       (7, '甜口'),
       (8, '辛辣'),
       (9, '清淡'),
       (10, ''),
       (11, ''),
       (12, ''),
       (20, '咸鲜'),
       (21, '酸辣'),
       (22, '麻辣'),
       (23, '甜咸'),
       (24, '酸甜'),
       (25, '香辣'),
       (26, '甜辣'),
       (50, ''),
       (67, '炸'),
       (68, '腌制'),
       (69, '炖'),
       (70, '炒'),
       (71, '煮'),
       (72, '蒸'),
       (73, '煎'),
       (74, '烤'),
       (75, '凉拌'),
       (76, '冰冻'),
       (77, '焖'),
       (80, NULL),
       (99, '汤'),
       (100, '粥'),
       (101, '面条'),
       (102, '饭'),
       (103, '饼'),
       (104, '饺子'),
       (105, '汤圆'),
       (106, '零食'),
       (107, NULL),
       (120, '川菜'),
       (121, '鲁菜'),
       (122, '粤菜'),
       (123, '闽菜'),
       (124, '苏菜'),
       (125, '浙菜'),
       (126, '湘菜'),
       (127, '徽菜'),
       (132, NULL),
       (133, '低脂'),
       (134, '低卡'),
       (135, '低盐'),
       (136, '低油'),
       (137, '低糖'),
       (138, '高钙'),
       (139, '高蛋白'),
       (150, NULL),
       (151, '坚果'),
       (170, '肉'),
       (171, '蔬菜'),
       (173, '水果'),
       (174, '面食'),
       (175, '海鲜'),
       (199, NULL),
       (200, '美容'),
       (201, '清热祛火'),
       (202, '减肥'),
       (209, NULL),
       (210, '儿童'),
       (211, '婴幼儿'),
       (212, '老人'),
       (213, '孕产妇'),
       (229, NULL),
       (230, '日式'),
       (231, '韩式'),
       (232, '西式'),
       (233, '东南亚'),
       (239, NULL),
       (240, '早餐'),
       (241, '下午茶'),
       (242, '宵夜');
/*!40000 ALTER TABLE `tag`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info`
(
    `id`       int(11)     NOT NULL AUTO_INCREMENT,
    `fridgeId` int(11)     NOT NULL COMMENT '冰箱ID',
    `role`     varchar(32) NOT NULL COMMENT '家庭角色，一般为父亲，母亲，孩子',
    `name`     varchar(32) NOT NULL,
    `weight`   float       NOT NULL COMMENT '体重 单位为kg',
    `bodyFat`  float       NOT NULL COMMENT '体脂 单位为%',
    `password` varchar(64) NOT NULL,
    `email`    varchar(64) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fridgeId` (`fridgeId`),
    CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`fridgeId`) REFERENCES `fridge_info` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2021-03-10 23:32:37
