-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: myshop
-- ------------------------------------------------------
-- Server version	5.5.53

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detail`
--

DROP TABLE IF EXISTS `detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int(11) unsigned DEFAULT NULL,
  `goodsid` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `price` double(6,2) DEFAULT NULL,
  `num` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail`
--

LOCK TABLES `detail` WRITE;
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
INSERT INTO `detail` VALUES (1,1,8,'ECOVACS 科沃斯 地宝扫地机 CR540',1188.00,2),(2,1,9,'DAEWOO 大宇 壁挂式洗衣机 XQG30-888V',2869.00,1),(3,2,9,'DAEWOO 大宇 壁挂式洗衣机 XQG30-888V',2869.00,3),(15,8,25,'玛璐托 长崎蛋糕海绵蛋糕 260克/袋 ',36.90,1),(12,7,25,'玛璐托 长崎蛋糕海绵蛋糕 260克/袋 ',36.90,1),(14,8,23,' “橄榄油王国”西班牙皇室用油！货真价实的特级初榨，橄榄油榨取的',49.00,1),(13,7,23,' “橄榄油王国”西班牙皇室用油！货真价实的特级初榨，橄榄油榨取的',49.00,1),(16,9,14,'FLO e CLO花色时尚休闲淑女圆领桑蚕丝连衣裙',529.00,1),(21,11,33,'【eBay精选】Apple/苹果 iPhone 7 Plus 港',5879.00,2),(20,11,10,'SEVERIN 森威朗 RB7025 纤薄静音智能全自动扫地机器',999.00,1),(22,11,23,' “橄榄油王国”西班牙皇室用油！货真价实的特级初榨，橄榄油榨取的',49.00,1),(23,11,30,'Apple 苹果 iPhone 7（A1660）移动联通电信4G',4799.00,1),(24,12,13,'MO&Co.小高领针织拼梭织纯色褶裥短袖连衣裙伞裙MA1631D',1199.00,1),(25,12,26,'Ralph Lauren拉夫劳伦 男士修身条纹长袖衬衫 美码偏大',389.00,1),(26,13,33,'【eBay精选】Apple/苹果 iPhone 7 Plus 港',5879.00,1),(27,14,30,'Apple 苹果 iPhone 7（A1660）移动联通电信4G',4799.00,1),(29,16,33,'【eBay精选】Apple/苹果 iPhone 7 Plus 港',5879.00,1),(30,16,30,'Apple 苹果 iPhone 7（A1660）移动联通电信4G',4799.00,1),(31,17,33,'【eBay精选】Apple/苹果 iPhone 7 Plus 港',5879.00,1),(32,17,31,'HUAWEI 华为 P10 4GB+64GB 钻雕金 移动联通电',3749.00,1),(33,17,30,'Apple 苹果 iPhone 7（A1660）移动联通电信4G',4799.00,1);
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(11) unsigned DEFAULT NULL,
  `goods` varchar(32) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `descr` text,
  `price` double(6,2) DEFAULT NULL,
  `picname` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '1',
  `store` int(11) unsigned DEFAULT '0',
  `num` int(11) unsigned DEFAULT '0',
  `clicknum` int(11) unsigned DEFAULT '0',
  `addtime` int(11) unsigned DEFAULT NULL,
  `iscomm` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (9,29,'DAEWOO 大宇 壁挂式洗衣机 XQG30-888V','DAEWOO 大宇','不一样的洗衣，不一样的体验，壁挂式超轻重量；精细洗涤，快速洗衣；安全安静，你会想拥有它！',2869.00,'14918389237356.jpg',1,20,0,27,1491838923,0),(8,29,'ECOVACS 科沃斯 地宝扫地机 CR540','ECOVACS 科沃斯','均匀湿拖，自主加湿，强力干拖，清爽收尾，智能续航，精扫',1188.00,'14918386624557.jpg',1,10,0,12,1491838662,0),(10,29,'SEVERIN 森威朗 RB7025 纤薄静音智能全自动扫地机器','SEVERIN 森威朗','7cm纤细身材恰到好处，灵活进出各类家居死角！3阶简易模式，简单设置程序，解决清扫难题~智能防撞，防跌落感应，低噪清洁，为美好家居生活而生~',999.00,'14918389836540.jpg',1,30,0,13,1491838983,0),(11,29,'Hamilton Beach 汉美驰 电熨斗14014-CN','Hamilton Beach 汉美驰','360°可旋转超长电源线，中型特制陶瓷不沾底板，去皱能力强，独有防漏设计，自我清洁能力',112.00,'14918390245661.jpg',1,11,0,8,1491839024,0),(12,35,'Salvatore Ferragamo 菲拉格慕 梦中彩虹淡香水','Salvatore Ferragamo 菲拉格慕','充满和谐与自由的幻想世界',139.00,'14918396098062.jpg',1,10,0,0,1491839609,0),(13,27,'MO&Co.小高领针织拼梭织纯色褶裥短袖连衣裙伞裙MA1631D','MO&Co.摩安珂','小高领设计 拼接褶裥伞型',1199.00,'14918999941849.jpg',1,10,0,8,1491899995,0),(14,27,'FLO e CLO花色时尚休闲淑女圆领桑蚕丝连衣裙','FLO e CLO','FLO e CLO花色时尚休闲淑女圆领桑蚕丝连衣裙',529.00,'14919010776206.jpg',1,30,0,1,1491901077,0),(15,27,'MO&Co.连衣裙欧美春装数字开衩背心裙子修身MA151SKT3','MO&Co.摩安珂','连衣裙欧美春装数字开衩背心裙子修身',479.00,'14919011741588.jpg',1,23,0,1,1491901174,0),(16,27,'LILITH A PARIS 收腰修身简约气质连衣裙','LILITH A PARIS','修身显瘦 欧根纱拼接',129.00,'14919013213703.jpg',1,223,0,3,1491901321,0),(17,31,'Kasugai 春日井 冲绳黑糖 150克/袋 美容润喉','Kasugai 春日井','春日井的超级明星产品，由产自冲绳的黑糖，精心烘焙而成，有一般糖果的甜腻，反而有一种浓郁甘甜在舌尖流转，绝对是吃货必入的零食。其次它的造型也是萌萌哒，一口一个停不下来的美味。',22.90,'14919020782715.jpg',1,2000,0,1,1491902079,0),(18,31,'莱茜 花生牛奶味 甜甜圈 60克/袋','莱茜','打开包装袋你就能感受到甜甜的暖暖的味道，这种味道刚好和你的呼吸相碰撞，轻轻的拿出放进你的嘴巴，这份细腻感你值得拥有',9.90,'14919021525868.jpg',1,1000,0,1,1491902152,0),(19,31,'maltesers 麦提莎 牛奶巧克力礼盒 360克/盒 2盒装','maltesers 麦提莎','脆心牛奶朱古 力巧克力，旅途中不可少的巧克力',130.00,'14919022044485.jpg',1,1223,0,2,1491902204,0),(20,31,'Calbee 卡乐比 日本进口 北海道薯条三兄弟 180克/盒 ','Calbee 卡乐比','赏味期：1.30-4.30。原料只坚持采用北海道产的土豆，最好的俄罗斯北阿拉斯加海盐制成的薯条。吃起来口感松松脆脆，小而精致是他们的特点。日本旅行伴手礼甄选。',138.00,'14919022916070.jpg',1,122,0,7,1491902291,0),(21,27,'maxwin 马威 女式八分袖针织连衣裙','maxwin','maxwin 马威 女式八分袖针织连衣裙',179.00,'14919210278495.jpg',1,23,0,5,1491921027,0),(22,32,'PRESSED PURITY 澳洲坚果油 375毫升','PRESSED PURITY','澳洲厨师钟爱的食用油，自然半透明光泽，口感醇厚细腻，因为是冷榨油，未经提取，营养成分完整保留下来啦，耐高温，多种烹饪方法，用来煎鱼，煎牛排，再好不过啦~',84.00,'14920797764922.jpg',1,122,0,0,1492079776,0),(23,32,' “橄榄油王国”西班牙皇室用油！货真价实的特级初榨，橄榄油榨取的','BETIS 贝蒂斯','“橄榄油王国”西班牙皇室用油！货真价实的特级初榨，橄榄油榨取的次数越少品质越高。精选老橄榄树新鲜果实，通过一次冷榨获得的天然精华，用来做各类料理，口感都是棒棒哒！',49.00,'14920798707867.jpg',1,29,0,2,1492079870,0),(24,33,'MORINAGA 森永 浓郁芝士小方蛋糕 38克/盒','MORINAGA 森永','',22.00,'14920799697704.jpg',1,1000,0,1,1492079970,0),(25,33,'玛璐托 长崎蛋糕海绵蛋糕 260克/袋 ','玛璐托','玛璐托 长崎蛋糕海绵蛋糕',36.90,'14920800353026.jpg',1,203,0,4,1492080035,0),(26,24,'Ralph Lauren拉夫劳伦 男士修身条纹长袖衬衫 美码偏大','Ralph Lauren拉夫劳伦','Polo衫的开创者-Ralph Lauren，Polo衫文化已有34年历史。拉尔夫·劳伦(RALPH LAUREN)时装界\"美国经典\"品牌。拉尔夫· 劳伦(RalphLauren)是有着浓浓美国气息的高品味时装品牌， 款式高度风格化的特点。',389.00,'14920802566673.jpg',1,129,0,1,1492080256,0),(27,25,'Ralph Lauren拉夫劳伦 男士经典款纯色T恤 美码偏大一','Ralph Lauren拉夫劳伦 ','Polo衫的开创者-Ralph Lauren，Polo衫文化已有34年历史。拉尔夫·劳伦(RALPH LAUREN)时装界\"美国经典\"品牌。拉尔夫· 劳伦(RalphLauren)是有着浓浓美国气息的高品味时装品牌， 款式高度风格化的特点。',291.00,'14920803255858.jpg',1,124,0,0,1492080325,0),(28,24,'IZOD衬衫长袖男士格纹弹力棉质衬衣','IZOD','经典的格子衬衫，多色设计，适合各种场合穿着。棉质的面料，加入少许氨纶，微有弹力，增添舒适度。',129.00,'14920803791169.jpg',1,34,0,2,1492080380,0),(29,34,'LANCÔME 兰蔻 新根源补养洁面啫喱 125毫升 晨洁好帮手','LANCÔME 兰蔻','晨洁好帮手，汉方植物萃取，对于时常熬夜，或者长期对着电脑的疲惫黯黄，干燥暗沉的轻熟龄至熟龄肌肤是合适的基础护理哦。一扫疲倦肌 唤醒清晨肌，整日鲜活亮泽。',234.00,'14920806853223.jpg',1,1223,0,7,1492080685,0),(33,17,'【eBay精选】Apple/苹果 iPhone 7 Plus 港','Apple/苹果','两个镜头 一拍即合',5879.00,'14920834865795.jpg',1,3999,0,11,1492083486,1),(30,17,'Apple 苹果 iPhone 7（A1660）移动联通电信4G','Apple','这，就是 iPhone 7。它带来了先进的新摄像头系统、更胜以往的性能和电池续航力、富有沉浸感的立体声扬声器、色彩更明亮丰富的 iPhone 显示屏，以及防溅抗水的特性。',4799.00,'14920831495462.jpg',1,22,0,7,1492083149,1),(31,38,'HUAWEI 华为 P10 4GB+64GB 钻雕金 移动联通电','HUAWEI 华为','华为P10采用新一代徕卡双镜头，搭配专业人像摄影模式，替你省去繁琐复杂的参数调教，只需指尖轻触，便可完成一张品质与艺术感兼具的佳作。增加徕卡前置镜头，让你的每一次自拍，都令人赞叹。',3749.00,'14920832167499.jpg',1,10000,0,3,1492083216,1),(32,38,'HUAWEI 华为 Mate 9 移动联通电信4G手机 双卡双待','HUAWEI 华为','解决安卓卡顿，麒麟960芯片！徕卡双摄像头！4000mAh大电池！',3698.00,'14920833252857.jpg',1,20003,0,2,1492083325,1),(34,1,'2017款夏季粉色连衣裙','联想','2017款夏季粉色连衣裙',222.00,'14921516092722.jpg',3,11,0,1,1492151609,0);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webname` varchar(32) NOT NULL,
  `weburl` varchar(32) NOT NULL,
  `contacts` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,'百度一下','http://www.baidu.com','李彦宏'),(2,'网易新闻','http://news.163.com','丁磊'),(4,'前端网','http://www.qianduanw.com','连雷雷'),(5,'优设网','http://www.uisdc.com','张鹏');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `linkman` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `addtime` int(11) unsigned DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (8,12,'连雷雷','北京市昌平区回龙观','100000','13923340098','admin@admin.com',1492090643,85.90,0),(11,12,'连雷雷','北京市昌平区','100000','13023459908','asdqewqey@163.com',1492099645,17605.00,0),(9,24,'','','','','',1492097019,529.00,1),(12,12,'张三asfwef','北京市昌平区回龙观','450000','13923340098','admin@admin.com',1492099675,1588.00,0),(13,13,'连雷雷','北京市昌平区回龙观','100000','13923340098','975766126@qq.com',1492102312,5879.00,0),(14,27,'谷宇','大兴区','100000','13888888888','大',1492102937,4799.00,0),(16,28,'天涯','湖南省长沙市','100000','13509878890','sss@qq.com',1492132238,10678.00,1),(17,30,'连雷雷','北京市昌平区回龙观','100000','13923340098','asdqewqey@163.com',1492151391,14427.00,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `pid` int(11) unsigned DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'服饰鞋包',0,'0,'),(2,'数码家电',0,'0,'),(3,'美容彩妆',0,'0,'),(8,'男装',1,'0,1,'),(9,'女装',1,'0,1,'),(10,'童装',1,'0,1,'),(29,'生活电器',2,'0,2,'),(12,'电脑',2,'0,2,'),(17,'苹果',14,'0,2,14,'),(14,'手机/配件',2,'0,2,'),(19,'笔记本电脑',12,'0,2,12,'),(20,'平板电脑',12,'0,2,12,'),(21,'台式机',12,'0,2,12,'),(22,'西装',8,'0,1,8,'),(23,'休闲裤',8,'0,1,8,'),(24,'衬衫',8,'0,1,8,'),(25,'T恤',8,'0,1,8,'),(26,'短裙',9,'0,1,9,'),(27,'连衣裙',9,'0,1,9,'),(30,'美食',0,'0,'),(31,'休闲零食',30,'0,30,'),(32,'粮油副食',30,'0,30,'),(33,'饼干糕点',30,'0,30,'),(34,'护肤',3,'0,3,'),(36,'男士香水',3,'0,3,'),(38,'华为',14,'0,2,14,');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `pass` char(32) NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `state` tinyint(1) DEFAULT '1',
  `addtime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'admin','张三疯','21232f297a57a5a743894a0e4a801fc3',1,'北京市昌平区','000000','13023459908','admin@admin.com',0,1491229151),(12,'zhangsan','张三','21232f297a57a5a743894a0e4a801fc3',0,'山东省青岛市','100000','17809876656','975766126@qq.com',1,1491380446),(13,'hongdou','红豆','21232f297a57a5a743894a0e4a801fc3',0,'北京市海淀区上地七街','100000','13923340098','asdqewqey@163.com',1,1491405899),(14,'lianleilei','连雷雷','21232f297a57a5a743894a0e4a801fc3',1,'山西省长治市壶关县','140332','13923340098','admin@admin.com',1,1491490355),(15,'dafenqi','达芬奇','e10adc3949ba59abbe56e057f20f883e',1,'美国华盛顿','450000','15709782233','15709782233@gmail.com',1,1491563550),(16,'zhangwuji','张无忌','e10adc3949ba59abbe56e057f20f883e',1,'湖北省武当山','037403','18738878837','18738878837@qq.com',1,1491563617),(17,'zhangcuishan','张翠山','21232f297a57a5a743894a0e4a801fc3',0,'湖北省武当山山顶','450000','13203721123','13203721123@163.com',1,1491563685),(18,'wangxiao','王晓','21232f297a57a5a743894a0e4a801fc3',0,'湖南省长沙市','022222','18903890098','18903890098@gmail.com',1,1491563819),(19,'wangxiaoer','王小二','21232f297a57a5a743894a0e4a801fc3',0,'陕西省西安市','022222','18303840098','18303840098@gmail.com',1,1491563901),(20,'liao','老雷的小弟','3d186804534370c3c817db0563f0e461',1,'天竺','750001','10010','546912419@qq.com',1,1492062844),(27,'guyu','guyu','6eab5f4ff759a6a20edf5eefb56e6114',1,'北京','100000','18974458473','1234567@qq.com',1,1492102874),(23,'liao321','李傲','3d186804534370c3c817db0563f0e461',1,'我就来看看','750001','13895468978','5469851@qq.com',1,1492083850),(24,'321321','321321','3d186804534370c3c817db0563f0e461',1,'asdas','sadasd','32165156','54652@QQ.COM',1,1492096959),(25,'321','321','caf1a3dfb505ffed0d024130f58c5cfa',1,'3213','21','3213','321586@qq.com',1,1492098517),(26,'weitaming','维他命','827ccb0eea8a706c4c34a16891f84e7b',1,'山西省长治市壶关县','100000','13923340098','adofrew@173.com',1,1492102702),(28,'tianya','天涯','827ccb0eea8a706c4c34a16891f84e7b',1,'湖北省武汉市','200331','18903890098','tianya@gmail.com',1,1492132138),(29,'kaola','考啦','21232f297a57a5a743894a0e4a801fc3',1,'北京市昌平区','100000','13923340098','admin@admin.com',1,1492149744),(30,'hailan','海蓝','21232f297a57a5a743894a0e4a801fc3',0,'北京市昌平区回龙观','037405','13023459908','asdqewqey@163.com',1,1492151205),(31,'admin1','管理1','21232f297a57a5a743894a0e4a801fc3',1,'北京市昌平区','100000','13923340098','admin@admin.com',0,1492151483),(32,'admin2','李熬','81dc9bdb52d04dc20036dbd8313ed055',0,'qewqwe','qeqweq','qweqweqew','qweqew',1,1492154410);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webconfig`
--

DROP TABLE IF EXISTS `webconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webconfig` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `web_title` varchar(120) DEFAULT NULL,
  `web_keywords` varchar(120) DEFAULT NULL,
  `web_description` varchar(240) DEFAULT NULL,
  `web_icp` varchar(32) DEFAULT NULL,
  `web_anbei` varchar(32) DEFAULT NULL,
  `com_name` varchar(128) DEFAULT NULL,
  `com_tel` varchar(32) DEFAULT NULL,
  `com_fax` varchar(32) DEFAULT NULL,
  `com_address` varchar(128) DEFAULT NULL,
  `com_email` varchar(64) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webconfig`
--

LOCK TABLES `webconfig` WRITE;
/*!40000 ALTER TABLE `webconfig` DISABLE KEYS */;
INSERT INTO `webconfig` VALUES (2,'考啦嗨购_正品低价_海外直采_海外直邮','考啦嗨购,B2C,商城,数码商城,Thinkpad,华为P9','考啦嗨购是综合服装,食品,数码产品等商品为一体的大型本地化商城。','京ICP备09072691号-2','京公网安备11010502022270','北京海蓝天空文化传播有限公司','400-6060-100 ','010-888888','北京市海淀区上地七街','admin@admin.com',NULL);
/*!40000 ALTER TABLE `webconfig` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14 18:54:27
