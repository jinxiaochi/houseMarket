/*
 Navicat Premium Data Transfer

 Source Server         : mysql本地
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : housemarket

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 26/04/2020 11:56:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `houseId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '房屋id,主键',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '房屋发布之id,外键',
  `price` float UNSIGNED NOT NULL COMMENT '房屋价格',
  `isNew` tinyint(4) NOT NULL COMMENT '房屋是否为新,1表示新房0表示二手房',
  `type` tinyint(4) UNSIGNED NOT NULL COMMENT '值x表示x个房子',
  `area` float UNSIGNED NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房源所在位置',
  `imgUrls` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `hot` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热度',
  `recommend` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '户主推荐和介绍',
  PRIMARY KEY (`houseId`) USING BTREE,
  INDEX `userImport`(`userId`) USING BTREE,
  CONSTRAINT `userImport` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1, 1, 168, 0, 3, 91.17, '汉口花园幽兰居 - 塔子湖', '1_1.jpeg', 12, '二室一厅;正规的两房，客厅朝南有飘窗，阳光充足。主卧朝南带阳台，次卧朝北，自然通风，格局合理，精心营造空间阔度。动静分区明确，生活井然有序。进门右手边，餐厨一体，生活便利。户型方正实用，公摊小。\n                  ');
INSERT INTO `house` VALUES (2, 1, 175, 0, 4, 92.97, '星悦城华廷 - 塔子湖', '1_2.jpeg', 34, '二室二厅; 小区内设有篮球场、小池塘以及健身器材等。小区采用人车分流，人性化的保护您及您家人的安全。小区南门出去即是步行街，从星悦城二期到三期都是商铺。南门出行朝西步行50米是小区自带的小公园。北门出行步行80米即是菜市场。购物方便。\n                  ');
INSERT INTO `house` VALUES (3, 1, 159, 0, 4, 82.38, '光明上海公馆 - 塔子湖', '1_3.jpeg', 11, '二室二厅; 周围有中百仓储、大润发超市、南国北都广场、永旺梦乐城、汉口城市广场，塔子湖体育场，极地海洋世界，武汉城市客厅，武汉市第二人民医院，华南果批、华南海鲜。坐拥吃、喝、玩、乐商圈繁华。\n                  ');
INSERT INTO `house` VALUES (4, 1, 155, 0, 4, 92, '碧桂园海昌天澜二期 - 将军路', '1_4.jpeg', 8, '二室二厅;  小区位于东西湖金银潭大道与宏图大道交汇处。与三环线隔湖相望，处于城市北向发展轴上。地铁3号线与2号线交汇，外加多条公交路线.\n\n\n                  ');
INSERT INTO `house` VALUES (5, 1, 126, 1, 3, 140, ' 黄陂 / 武湖 / 汉口北大道特9号 ', '1_5.jpeg', 7, '二室一厅;\n地铁：项目距离轻轨21号线梅教街站约900米； 公交：项目门口100米左右有293、253、297等多条公交线路。\n商业：项目自带社区底商，附近有环宇超市、中百仓储、百尚购物中心； \n医疗：附近有血防医院、武湖医院；   \n教育：项目自带幼儿园，附近有江汉大学文理学院(新校区)、红根小学、武湖高车幼儿园、武湖高车小学、东方城幼儿园。');
INSERT INTO `house` VALUES (6, 1, 193, 1, 4, 150, ' 汉阳 / 王家湾 / 琴台大道与玉龙路交汇处 ', '1_6.jpeg', 5, '保利庭瑞阅江台由武汉保利打造二环滨江大盘 位于汉阳琴台大道与玉龙路交汇处  靠近地铁4号线，轨交出行比较方便，江汉七桥建设中，后期自驾出行或将更方便，整体交通状况不错。\n项目靠近汉阳核心王家湾商圈配套，商业资源不错 附近的医院有同济医院、协和医院、武汉中医医院等');
INSERT INTO `house` VALUES (7, 1, 120, 1, 3, 100, ' 黄陂 / 盘龙城 / 盘龙城经济开发区盘龙大道47号（百联奥特莱斯正对面） ', '1_7.jpeg', 66, '帝大御璟城位于黄陂区盘龙城版块，盘龙大道西侧、宋岗一路东侧。该项目在武汉新城区里的绝对地理位置相对不错，周边地铁已通车，同时也靠近天河机场，辐射临空经济区。\n项目位置：盘龙城经济开发区盘龙大道47号（百联奥特莱斯正对面）\n交通配套：地铁站2号线巨龙大道站，地铁7号线延长线旁\n商业配套：百联奥特莱斯广场，周围有中百超市、世纪华联购物中心\n医疗配套：黄陂区医院(盘龙城院区)、彤百堂中医院、武汉盘龙城经济开发区卫生院\n周边公园：盘龙城文化遗址公园，卓尔足球国际公园\n品牌房企、大规模小区、适合刚需人群居住；');
INSERT INTO `house` VALUES (8, 1, 146, 1, 3, 102, ' 东西湖 / 东西湖其它 / 临空港大道与三店西路交汇处 ', '1_8.jpeg', 31, '自带商场的小区，出门就能逛吃，以后下班回来直接去买菜或者找个地方吃饭，生活方便省时间，更多时间陪家人了');
INSERT INTO `house` VALUES (9, 2, 220, 1, 3, 115, ' 洪山 / 青山 / 友谊大道和仁和路交汇处 ', '2_1.jpeg', 41, '背面长江，南面东湖，西面二环线，东面武汉站，项目3公里范围内可到达众圆广场，奥山世纪城广场，群星城和销品茂，配套非常成熟，');
INSERT INTO `house` VALUES (10, 2, 224, 1, 5, 152, ' 汉阳 / 七里庙 / 汉阳大道与江城大道交汇处（四号线五里墩站D出口） ', '2_2.jpeg', 10, '二室一厅; 恒韵府位于汉阳区江城大道与汉阳大道交汇处，属于汉阳二环内五里墩板块，属于汉阳核心地段 东西两边分别连接王家湾和钟家村，距离汉口、武昌也都非常近，环线位置、区域地段都非常好。项目门口就是已开通运行的地铁4号线五里墩站。从D出口出来就是项目所在地  项目周边有规划的大体量商业、有公园、有地铁，还有成熟的居住小区，配套等各个方面都很成熟，居住氛围和环境较好。\n除了区域内规划的商业之外，项目还能受到王家湾商圈、钟家村商圈的辐射。');
INSERT INTO `house` VALUES (11, 2, 112, 1, 3, 140, ' 蔡甸 / 蔡甸城区 / 蔡甸大街中建锦绣双城 ', '2_3.jpeg', 21, '车位： 地下车位数2002\n周边规划： \n地铁：临嶂大道、新庙村\n教育设施：武汉精英学校、新东方(蔡甸蔡正街校区)、蔡甸老年大学、华辰培训学校、利成驾校训练报名处(树藩大街店)\n医院：济和中医堂、武汉市蔡甸区中医医院\n购物：中百仓储(蔡甸购物广场店)、中百超市(树藩大街店)、埖域、杰之行(蔡正街店)、富盟超市、勇行便民平价超市\n公园：运铎公园,离地铁4号线也不远。\n');
INSERT INTO `house` VALUES (12, 2, 135, 1, 3, 120, ' 硚口 / 汉正街 / 中山大道与多福路交汇处 ', '2_4.jpeg', 35, '位置:中山大道与多福路交汇处 \n交通:电1、电2、553、38、561、523 等多条线路到中山大道民意四路站下车即到 项目;地铁6号线汉正街站步行约350米可 达;地铁1号线,友谊路站步行约1100米可 达;地铁2号线,中山公园站步行约1100米 可达。 商业:综合商场武胜路凯德广场、武汉广 场、国际广场、沃尔玛、中百仓储、工贸家 电、江汉路商圈 优势:品牌房全自持商业环线房近主干道 医院:武汉协和医院、武汉同济医院、武汉 第一医院 劣势:周边商业比较多人群密集');
INSERT INTO `house` VALUES (13, 2, 102, 0, 4, 95.57, '水印桃源 - 金银湖', '2_5.jpeg', 44, '二室二厅;  339、713路、730路于环湖三路站下，直达本项目，其中339路直通地铁2号线及常青花园公交总站，转乘便利。目前十多条条线路 到常青花园站，通达汉口、汉阳、武昌三镇。\n                  ');
INSERT INTO `house` VALUES (14, 2, 126, 0, 2, 95.35, '恋湖家园四期 - 金银湖', '2_6.jpeg', 6, '二室二厅;  附近时学校,属于学区房');
INSERT INTO `house` VALUES (15, 2, 115, 0, 3, 92.16, '长源假日港湾 - 金银湖 ', '2_7.jpeg', 25, '二室一厅;   门口公交车比较多，H102,H93路，713路，距离6号线延长线停车场站（百度地图1.2公里）今年年底开通。一公里到达金山大道，300米到达硚孝高速。\n                  ');
INSERT INTO `house` VALUES (16, 2, 125, 0, 3, 95, '博大城市星座 - 吴家山', '2_8.jpeg', 26, '二室一厅;  H94（八方路博大城市星座）、H82环线（东吴大道八方路）、546、216 、H81外环、H82环线、H81内环（东吴大道八方路）； 地铁：1号线东吴大道A出口\n                  ');
INSERT INTO `house` VALUES (17, 4, 112, 0, 4, 92.4, '金鼎湾 - 吴家山', '4_1.jpeg', 28, '二室二厅;  小区距离1号线额头湾站626米（数据来源于百度地图），已近开通公交有：546路,741路,722路,621路,h89路,h88路,h81路环线,560路,h82路,737路,736路等公交线路，到达武汉三镇\n                  ');
INSERT INTO `house` VALUES (18, 4, 128, 0, 4, 95.66, '恋湖家园三期 - 金银湖', '4_2.jpeg', 29, '二室二厅  ;武汉轻工业学院 中百仓储 吴家山购物广场、武商量贩、工贸家电、中商平价购物广场等 银行中国银行、中国建设银行、中国工商银行、中国农业银行 医院东西湖区人民医院、泰康中西医结合医院、妇幼保健院等\n                  ');
INSERT INTO `house` VALUES (19, 4, 190, 1, 3, 100, ' 武昌 / 团结大道 / 才汇巷特1号 ', '4_3.jpeg', 32, '二室二厅 ;诺展星座位于武汉市洪山区才汇巷特一号，也就是铁机路与二环线交汇处。地处武汉徐东居住区核心位置。闹中取静，出则繁华，是集城，社交，美食，潮流的城市地标型CFP（家庭生活区）。');
INSERT INTO `house` VALUES (20, 4, 123, 1, 3, 78, ' 江夏 / 庙山 / 庙山金龙大街(金龙大街汽车公园对面) ', '4_4.jpeg', 24, '二室一厅; 楼盘环境很不错，户型方正。采光都比较好。后期规划感觉也还行。');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `passwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户住址',
  `phoneNum` char(11) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT '用户手机',
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `phone`(`phoneNum`) USING BTREE COMMENT '电话号码索引'
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '金晓治', 'adsnjkkas', '湖北省黄冈市罗田县胜利镇纸棚河村5组', '13628694735');
INSERT INTO `user` VALUES (2, '德玛西亚', 'dnskakdk', '哇诺兰大陆', '13412345678');
INSERT INTO `user` VALUES (4, '艾欧尼亚', 'dsankjsa', '哇诺兰大陆次大陆', '13277578910');
INSERT INTO `user` VALUES (5, '不知火舞', 'wqnidnj', '拳皇1997-2020', '13567893425');
INSERT INTO `user` VALUES (7, '慕容恪', 'qwdnijdqw', '光复我大燕王朝', '13825674512');
