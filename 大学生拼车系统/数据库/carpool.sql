/*
MySQL Backup
Source Server Version: 8.0.18
Source Database: cars
Date: 2019/12/18 14:38:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `admininfo`
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
--  Table structure for `admin_pswd`
-- ----------------------------
DROP TABLE IF EXISTS `admin_pswd`;
CREATE TABLE `admin_pswd` (
  `userid` int(11) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
--  Table structure for `carpoolinfo`
-- ----------------------------
DROP TABLE IF EXISTS `carpoolinfo`;
CREATE TABLE `carpoolinfo` (
  `carid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `sendtime` datetime DEFAULT NULL,
  `departuretime` datetime DEFAULT NULL,
  `departureplace` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `targetnum` int(11) DEFAULT '0',
  `currentnum` int(11) DEFAULT '0' COMMENT 'currentnum<=targetnum',
  PRIMARY KEY (`carid`),
  KEY `userid` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
--  Table structure for `usercarpool`
-- ----------------------------
DROP TABLE IF EXISTS `usercarpool`;
CREATE TABLE `usercarpool` (
  `carid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `state1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
--  Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
--  Table structure for `user_pswd`
-- ----------------------------
DROP TABLE IF EXISTS `user_pswd`;
CREATE TABLE `user_pswd` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `admininfo` VALUES ('123','admin','12312313','12312321','asdadad');
INSERT INTO `admin_pswd` VALUES ('13','222','222'), ('123','123','123');
INSERT INTO `carpoolinfo` VALUES ('1','1','2019-12-13 14:34:13','2019-12-11 20:26:57','闽江学院南门','福州北站','12','7'), ('2','2','2019-12-13 15:18:25','2019-12-12 13:33:47','闽江学院南门','福州南站','5','5'), ('3','3','2019-12-12 16:31:16','2019-12-19 12:21:00','闽江学院北门','福州北站','8','2'), ('4','1','2019-12-08 10:27:13','2019-12-12 12:00:00','闽江学院北门','福州南站','4','2'), ('5','1','2019-12-08 11:17:40','2019-12-12 13:00:00','闽江学院北门','福州汽车站','4','1'), ('6','1','2019-12-08 11:20:50','2019-12-12 13:00:00','闽江学院北门','福州汽车站','4','4'), ('7','3','2019-12-12 16:32:48','2019-12-07 12:33:00','闽江学院北门','福州南站','8','4'), ('8','3','2019-12-10 03:01:33','2019-12-12 12:45:00','闽江学院南门','福州汽车北站','4','4'), ('9','6','2019-12-09 07:56:09','2019-12-20 14:30:00','闽江学院北门','福州汽车站','4','3'), ('10','3','2019-12-11 23:31:44','2019-12-12 12:30:00','闽江学院北门','福州汽车站','4','4'), ('11','3','2019-12-10 03:22:06','2019-12-20 06:30:00','闽江学院北门','福州北站','4','1'), ('12','3','2019-12-12 14:10:12','2019-12-11 00:00:00','闽江学院北门','福州南站','4','3'), ('13','1','2019-12-10 17:12:30','2019-12-19 13:30:00','闽江学院北门','福州北站','4','4'), ('14','1','2019-12-10 17:23:31','2019-12-19 13:30:00','闽江学院北门','福州北站','4','3'), ('15','1','2019-12-10 17:24:43','2019-12-12 15:00:00','闽江学院南门','福州南站','5','5'), ('16','1','2019-12-10 17:39:22','2019-12-25 12:30:00','闽江学院南门','福州北站','5','5'), ('17','2','2019-12-10 19:23:16','2019-12-12 12:12:00','闽江学院南门','福州汽车站','5','5'), ('18','3','2019-12-10 22:25:59','2019-12-13 14:00:00','闽江学院北门','福州南站','5','5'), ('19','3','2019-12-10 22:25:46','2019-12-19 14:40:00','闽江学院北门','福州汽车站','5','4'), ('20','3','2019-12-10 22:29:45','2019-12-18 15:40:00','闽江学院南门','福州汽车北站','6','3'), ('22','2','2019-12-13 00:11:43','2019-12-17 11:30:00','闽江学院北门','福州汽车北站','5','4'), ('23','2','2019-12-13 00:12:05','2019-12-17 16:50:00','闽江学院南门','福州南站','8','4'), ('24','3','2019-12-13 13:25:25','2019-12-12 00:00:00','闽江学院南门','福州北站','6','2'), ('25','1','2019-12-13 14:58:20','2019-12-12 12:30:00','闽江学院北门','福州北站','4','4'), ('26','4','2019-12-13 15:05:54','2019-12-14 12:30:00','闽江学院南门','福州南站','4','3'), ('27','1','2019-12-13 15:33:00','2019-12-14 12:00:00','闽江学院北门','福州南站','5','5'), ('28','1','2019-12-16 21:16:55','2019-12-13 12:45:00','闽江学院北门','福州汽车站','3','3'), ('29','4','2019-12-16 21:41:09','2019-12-17 12:33:00','闽江学院北门','福州南站','3','3'), ('30','1','2019-12-16 23:45:04','2019-12-18 12:30:00','闽江学院北门','福州南站','3','3'), ('31','1','2019-12-17 14:46:43','2019-12-18 00:00:00','闽江学院北门','福州汽车站','3','3');
INSERT INTO `usercarpool` VALUES ('14','1','我发起的','拼车中'), ('15','1','我发起的','拼车成功'), ('17','2','我发起的','拼车失败'), ('18','3','我发起的','拼车成功'), ('19','3','我发起的','拼车成功'), ('20','3','我发起的','拼车中'), ('1','1','我发起的','拼车中'), ('2','2','我发起的','拼车中'), ('3','3','我发起的','拼车失败'), ('4','1','我发起的','拼车中'), ('5','1','我发起的','拼车中'), ('6','1','我发起的','拼车成功'), ('7','3','我发起的','拼车中'), ('8','3','我发起的','拼车成功'), ('9','1','我发起的','拼车中'), ('10','3','我发起的','拼车失败'), ('11','3','我发起的','拼车失败'), ('16','1','我发起的','拼车成功'), ('12','3','我发起的','拼车失败'), ('13','1','我发起的','拼车成功'), ('6','3','我加入的','拼车失败'), ('9','3','我加入的','拼车失败'), ('13','3','我加入的','拼车失败'), ('15','3','我加入的','拼车成功'), ('20','2','我加入的','拼车中'), ('19','2','我加入的','拼车失败'), ('14','2','我加入的','拼车失败'), ('18','2','我加入的','拼车中'), ('13','2','我加入的','拼车失败'), ('13','2','我加入的','拼车成功'), ('8','2','我加入的','拼车成功'), ('22','2','我发起的','拼车中'), ('23','2','我发起的','拼车中'), ('16','5','我加入的','拼车中'), ('16','6','我加入的','拼车成功'), ('22','6','我加入的','拼车中'), ('22','3','我加入的','拼车中'), ('22','1','我加入的','拼车失败'), ('18','1','我加入的','拼车成功'), ('6','3','我加入的','拼车成功'), ('9','3','我加入的','拼车失败'), ('19','1','我加入的','拼车成功'), ('19','2','我加入的','拼车失败'), ('14','2','我加入的','拼车失败'), ('24','3','我发起的','拼车中'), ('4','3','我加入的','拼车中'), ('14','3','我加入的','拼车中'), ('25','1','我发起的','拼车成功'), ('25','2','我加入的','拼车成功'), ('25','3','我加入的','拼车成功'), ('25','4','我加入的','拼车成功'), ('26','4','我发起的','拼车成功'), ('26','3','我加入的','拼车失败'), ('26','1','我加入的','拼车成功'), ('26','2','我加入的','拼车成功'), ('2','3','我加入的','拼车中'), ('2','1','我加入的','拼车中'), ('2','4','我加入的','拼车成功'), ('27','1','我发起的','拼车成功'), ('27','2','我加入的','拼车成功'), ('28','1','我发起的','拼车成功'), ('28','7','我加入的','拼车成功'), ('28','6','我加入的','拼车成功'), ('28','4','我加入的','拼车成功'), ('29','4','我发起的','拼车成功'), ('29','3','我加入的','拼车成功'), ('29','1','我加入的','拼车成功'), ('9','16','我加入的','拼车中'), ('30','1','我发起的','拼车成功'), ('30','6','我加入的','拼车成功'), ('30','16','我加入的','拼车成功'), ('31','1','我发起的','拼车成功'), ('31','2','我加入的','拼车成功'), ('31','3','我加入的','拼车成功');
INSERT INTO `userinfo` VALUES ('1','韦仲茜','18750783353','cathyweixi@gmail.com','1231','asada'), ('2','陈惠敏','13788230987','3036643270@qq.com','123qwe','闽江学院'), ('3','梁金秋','13788237344','1464735458@qq.com','21qeeq','闽江学院'), ('4','魏黎怡','2123412421','906638904@qq.com','12','电话发给'), ('5','张婷','185737355','zhangtimh@qq.com','321313','asdada'), ('6','肖雅文','13788237344','2640273213@qq.com','123133','asdada'), ('7','雒琳','13788237344','2606834546@qq.com','321313','江夏学院'), ('14',NULL,NULL,NULL,NULL,NULL), ('15',NULL,NULL,NULL,NULL,NULL), ('16','韦茜','13788237344','3171104101@stu.mju.edu.cn','fafa5sa','福建中医药大学'), ('17','用户17','2123412421','276923424@qq.com','321faad','福州大学'), ('18','梁金秋1','13788237344','2640273213@qq.com','','闽江学院');
INSERT INTO `user_pswd` VALUES ('1','3171104101','1234'), ('2','3171104102','1234'), ('3','3171104103','1234'), ('4','3171104104','1234'), ('5','3171104105','1234'), ('6','3171104106','1234'), ('7','3171104107','1234'), ('13','3171104113','1234'), ('14','1231231','1321231'), ('15','123','1234'), ('16','3171104116','123'), ('17','3171104117','123'), ('18','3171104118','123');

-- ----------------------------
--  Trigger definition for `carpoolinfo`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `mysend` AFTER INSERT ON `carpoolinfo` FOR EACH ROW insert into usercarpool values(new.carid,new.userid,'我发起的','拼车中')
;;
DELIMITER ;
