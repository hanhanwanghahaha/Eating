/*
MySQL Backup
Source Server Version: 5.7.17
Source Database: eating
Date: 2019/12/17 21:59:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `food`
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cainame` varchar(255) DEFAULT NULL COMMENT '菜名',
  `price` varchar(255) DEFAULT NULL COMMENT '价格',
  `brief` varchar(255) DEFAULT NULL COMMENT '简介',
  `imgurl` varchar(500) DEFAULT NULL COMMENT '图片',
  `kind` varchar(255) DEFAULT NULL COMMENT '菜系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gouwuche`
-- ----------------------------
DROP TABLE IF EXISTS `gouwuche`;
CREATE TABLE `gouwuche` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车',
  `sessionid` varchar(255) DEFAULT NULL COMMENT '区别用户',
  `cainame` varchar(255) DEFAULT NULL COMMENT '菜名',
  `proid` varchar(255) DEFAULT NULL COMMENT '菜品id',
  `count` varchar(255) DEFAULT NULL COMMENT '份数',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '图片',
  `price` varchar(255) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `truename` varchar(255) DEFAULT NULL COMMENT '真名',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '管理员登录名',
  `mima` varchar(255) DEFAULT NULL COMMENT '管理员密码',
  `truename` varchar(255) DEFAULT NULL COMMENT '真名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ordered`
-- ----------------------------
DROP TABLE IF EXISTS `ordered`;
CREATE TABLE `ordered` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL COMMENT '订单号',
  `sname` varchar(255) DEFAULT NULL COMMENT '取餐者',
  `stel` varchar(255) DEFAULT NULL COMMENT '取餐者电话',
  `saddress` varchar(255) DEFAULT NULL COMMENT '取餐地址',
  `saddress2` varchar(255) DEFAULT NULL COMMENT '取餐门牌号',
  `sumprice` varchar(255) DEFAULT NULL COMMENT '总价',
  `memberid` varchar(255) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL COMMENT '下单时间',
  `userid` varchar(255) DEFAULT NULL COMMENT '用户',
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `orderedfood`
-- ----------------------------
DROP TABLE IF EXISTS `orderedfood`;
CREATE TABLE `orderedfood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL COMMENT '订单号',
  `proid` varchar(255) DEFAULT NULL COMMENT '菜品id',
  `cainame` varchar(255) DEFAULT NULL COMMENT '菜名',
  `price` varchar(255) DEFAULT NULL COMMENT '价格',
  `count` varchar(255) DEFAULT NULL COMMENT '份数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `food` VALUES ('27','回锅肉','88','口感爽滑、肥而不腻','20191125192144692.jpg','川菜'), ('28','萝卜丝炖大虾','78','大虾鲜嫩，汤汁浓厚，半汤半菜，美味可口，营养丰富','20191125192457347.jpg','鲁菜'), ('29','清平鸡','99','皮爽肉滑骨有味，肉质结实，却不太肥','20191125192554148.jpg','粤菜'), ('30','盐水鸭','89','鸭肉鲜美，皮白肉嫩','20191125192739987.jpg','苏菜'), ('31','东坡肉','55','入口香糯、肥而不腻，带有酒香，色泽红亮，味醇汁浓，酥烂而形不碎','20191125192807690.jpg','浙菜'), ('32','佛跳墙','9999','明目养颜、活血舒筋、滋阴补身、增进食欲','20191125192849107.jpg','闽菜'), ('33','剁椒鱼头','78','色泽红亮、味浓、肉质细嫩。肥而不腻、口感软糯、鲜辣适口','20191125192927212.jpg','湘菜'), ('34','火腿炖甲鱼','5555','净血，降低血胆固醇，滋阴补阳，补气','20191125193025894.jpg','徽菜'), ('35','水煮肉片','56','川菜取材广泛，调味多变，菜式多样，口味清鲜醇浓，善用麻辣调味，有着别具一格的烹调方法和浓郁的地方风味， 融汇了各方的特点，博采众家之长，善吸收，善创新，享誉中外。四川省会成都市被联合国教科文组织授予“世界美食之都”的荣誉称号。','20191125195948331.jpg','川菜'), ('36','泡椒鱼头','666','川菜取材广泛，调味多变，菜式多样，口味清鲜醇浓，善用麻辣调味，有着别具一格的烹调方法和浓郁的地方风味， 融汇了各方的特点，博采众家之长，善吸收，善创新，享誉中外。四川省会成都市被联合国教科文组织授予“世界美食之都”的荣誉称号。','20191125200033899.jpg','川菜'), ('37','毛血旺','169','川菜取材广泛，调味多变，菜式多样，口味清鲜醇浓，善用麻辣调味，有着别具一格的烹调方法和浓郁的地方风味， 融汇了各方的特点，博采众家之长，善吸收，善创新，享誉中外。四川省会成都市被联合国教科文组织授予“世界美食之都”的荣誉称号。','20191125200132173.jpg','川菜'), ('38','辣子鸡丁','888','川菜取材广泛，调味多变，菜式多样，口味清鲜醇浓，善用麻辣调味，有着别具一格的烹调方法和浓郁的地方风味， 融汇了各方的特点，博采众家之长，善吸收，善创新，享誉中外。四川省会成都市被联合国教科文组织授予“世界美食之都”的荣誉称号。','20191125200212278.jpg','川菜'), ('39','酸菜鱼','159','川菜取材广泛，调味多变，菜式多样，口味清鲜醇浓，善用麻辣调味，有着别具一格的烹调方法和浓郁的地方风味， 融汇了各方的特点，博采众家之长，善吸收，善创新，享誉中外。四川省会成都市被联合国教科文组织授予“世界美食之都”的荣誉称号。','20191125200342157.jpg','川菜'), ('40','玉米面糊糊','59','咸鲜为主、火候精湛、精于制汤、善烹海味、注重礼仪。','20191125200556037.jpg','鲁菜'), ('41','拔丝鸡蛋','79','咸鲜为主、火候精湛、精于制汤、善烹海味、注重礼仪。','20191125200721202.jpg','鲁菜'), ('42','樱桃肉','669','咸鲜为主、火候精湛、精于制汤、善烹海味、注重礼仪。','20191125200835204.jpg','鲁菜'), ('43','蜜汁山药','79','咸鲜为主、火候精湛、精于制汤、善烹海味、注重礼仪。','20191125200918121.jpg','鲁菜'), ('44','糖醋丸子','199','咸鲜为主、火候精湛、精于制汤、善烹海味、注重礼仪。','20191125201008349.jpg','鲁菜'), ('45','粤式白灼虾','89','广州菜是粤菜的代表， 民间有“食在广州”的美誉，顺德更被联合国教科文组织授予世界“美食之都”称号','20191125201433980.jpg','粤菜'), ('46','广式糯米鸡','89','广州菜是粤菜的代表， 民间有“食在广州”的美誉，顺德更被联合国教科文组织授予世界“美食之都”称号','20191125201546894.jpg','粤菜'), ('47','清蒸桂鱼','89','广州菜是粤菜的代表， 民间有“食在广州”的美誉，顺德更被联合国教科文组织授予世界“美食之都”称号','20191125201650053.jpg','粤菜'), ('48','糖不甩','59','广州菜是粤菜的代表， 民间有“食在广州”的美誉，顺德更被联合国教科文组织授予世界“美食之都”称号','20191125201737893.jpg','粤菜'), ('49','菠萝咕噜肉','99','广州菜是粤菜的代表， 民间有“食在广州”的美誉，顺德更被联合国教科文组织授予世界“美食之都”称号','20191125201813954.jpg','粤菜'), ('50','蟹黄豆腐','59','苏菜擅长炖、焖、蒸、炒，重视调汤，保持菜的原汁，风味清鲜，浓而不腻，淡而不薄，酥松脱骨而不失其形，滑嫩爽脆而不失其味。','20191125201950229.jpg','苏菜'), ('51','清蒸大闸蟹','89','苏菜擅长炖、焖、蒸、炒，重视调汤，保持菜的原汁，风味清鲜，浓而不腻，淡而不薄，酥松脱骨而不失其形，滑嫩爽脆而不失其味。','20191125202042596.jpg','苏菜'), ('52','阳春面','55','苏菜擅长炖、焖、蒸、炒，重视调汤，保持菜的原汁，风味清鲜，浓而不腻，淡而不薄，酥松脱骨而不失其形，滑嫩爽脆而不失其味。','20191125202134699.jpg','苏菜'), ('53','松鼠鳜鱼','169','苏菜擅长炖、焖、蒸、炒，重视调汤，保持菜的原汁，风味清鲜，浓而不腻，淡而不薄，酥松脱骨而不失其形，滑嫩爽脆而不失其味。','20191125202315671.jpg','苏菜'), ('54','鸭血粉丝汤','89','苏菜擅长炖、焖、蒸、炒，重视调汤，保持菜的原汁，风味清鲜，浓而不腻，淡而不薄，酥松脱骨而不失其形，滑嫩爽脆而不失其味。','20191125202447778.jpg','苏菜'), ('55','东坡肘子','988','浙江省位于我国东海之滨，北部水道成网，素有鱼米之乡之称。其地山清水秀，物产丰富佳肴美，故谚曰:\"上有天堂，下有苏杭\"。','20191125202528029.jpg','浙菜'), ('56','红烧牛筋','899','浙江省位于我国东海之滨，北部水道成网，素有鱼米之乡之称。其地山清水秀，物产丰富佳肴美，故谚曰:\"上有天堂，下有苏杭\"。','20191125202609221.jpg','浙菜'), ('57','姜汤面','89','浙江省位于我国东海之滨，北部水道成网，素有鱼米之乡之称。其地山清水秀，物产丰富佳肴美，故谚曰:\"上有天堂，下有苏杭\"。','20191125202644973.jpg','浙菜'), ('58','西湖醋鱼','899','浙江省位于我国东海之滨，北部水道成网，素有鱼米之乡之称。其地山清水秀，物产丰富佳肴美，故谚曰:\"上有天堂，下有苏杭\"。','20191125202733228.jpg','浙菜'), ('59','耗油焖虾','799','浙江省位于我国东海之滨，北部水道成网，素有鱼米之乡之称。其地山清水秀，物产丰富佳肴美，故谚曰:\"上有天堂，下有苏杭\"。','20191125202814090.jpg','浙菜'), ('60','清炒鳝丝','199','菜以烹制山珍海味著称，在色香味形俱佳基础上，尤以“香”、“味”见长，其清鲜、和醇、荤香、不腻的风格特色和 汤路广泛的特点，在烹坛园地中独具一席。','20191125202913420.jpg','闽菜'), ('61','清炖鸡汤','299','菜以烹制山珍海味著称，在色香味形俱佳基础上，尤以“香”、“味”见长，其清鲜、和醇、荤香、不腻的风格特色和 汤路广泛的特点，在烹坛园地中独具一席。','20191125202948788.jpg','闽菜'), ('62','沙蛤海鲜汤','899','菜以烹制山珍海味著称，在色香味形俱佳基础上，尤以“香”、“味”见长，其清鲜、和醇、荤香、不腻的风格特色和 汤路广泛的特点，在烹坛园地中独具一席。','20191125203044491.jpg','闽菜'), ('63','盐水虾','299','菜以烹制山珍海味著称，在色香味形俱佳基础上，尤以“香”、“味”见长，其清鲜、和醇、荤香、不腻的风格特色和 汤路广泛的特点，在烹坛园地中独具一席。','20191125203113990.jpg','闽菜'), ('64','酿豆腐','89','菜以烹制山珍海味著称，在色香味形俱佳基础上，尤以“香”、“味”见长，其清鲜、和醇、荤香、不腻的风格特色和 汤路广泛的特点，在烹坛园地中独具一席。','20191125203148118.jpg','闽菜'), ('65','红烧龙虾','499','安徽省宣城市绩溪县被授予中国徽菜之乡称号，每年均举办国际徽菜饮食文化节。','20191125203229261.jpg','徽菜'), ('66','爆炒牛肉丸','599','安徽省宣城市绩溪县被授予中国徽菜之乡称号，每年均举办国际徽菜饮食文化节。','20191125203314421.jpg','徽菜'), ('67','爆炒牛肉脯','499','安徽省宣城市绩溪县被授予中国徽菜之乡称号，每年均举办国际徽菜饮食文化节。','20191125203344237.jpg','徽菜'), ('68','香菇焖鸡腿','889','安徽省宣城市绩溪县被授予中国徽菜之乡称号，每年均举办国际徽菜饮食文化节。','20191125203413230.jpg','徽菜'), ('69','鱼子酱牛肉凉面','10086','安徽省宣城市绩溪县被授予中国徽菜之乡称号，每年均举办国际徽菜饮食文化节。','20191125203444510.jpg','徽菜'), ('70','土匪鸭','599','湘菜制作精细，用料上比较广泛，口味多变，品种繁多；色泽上油重色浓，讲求实惠； 品味上注重香辣、香鲜、软嫩；制法上以煨、炖、腊、蒸、炒诸法见称。','20191125203532702.jpg','湘菜'), ('71','干锅肥肠','299','湘菜制作精细，用料上比较广泛，口味多变，品种繁多；色泽上油重色浓，讲求实惠； 品味上注重香辣、香鲜、软嫩；制法上以煨、炖、腊、蒸、炒诸法见称。','20191125203603228.jpg','湘菜'), ('72','酱牛肉','345','湘菜制作精细，用料上比较广泛，口味多变，品种繁多；色泽上油重色浓，讲求实惠； 品味上注重香辣、香鲜、软嫩；制法上以煨、炖、腊、蒸、炒诸法见称。','20191125203631958.jpg','湘菜'), ('73','农家小炒肉','559','湘菜制作精细，用料上比较广泛，口味多变，品种繁多；色泽上油重色浓，讲求实惠； 品味上注重香辣、香鲜、软嫩；制法上以煨、炖、腊、蒸、炒诸法见称。','20191125203657598.jpg','湘菜'), ('74','板栗烧牛蛙','9.9','湘菜制作精细，用料上比较广泛，口味多变，品种繁多；色泽上油重色浓，讲求实惠； 品味上注重香辣、香鲜、软嫩；制法上以煨、炖、腊、蒸、炒诸法见称。','20191125203721046.jpg','湘菜');
INSERT INTO `guestbook` VALUES ('11','admin','123456',NULL,'112',NULL), ('13','X的三次方','13060298670',NULL,'13042326029',NULL), ('14','XXX','123456',NULL,'1252476453',NULL), ('16','admin123','123',NULL,'123',NULL), ('17','admin1233','123',NULL,'123',NULL), ('18','admin1234','1234',NULL,'1234',NULL), ('20','zxx','123456789',NULL,'1252476453',NULL), ('21','王燕','123456',NULL,'13256808429',NULL);
INSERT INTO `manager` VALUES ('1','admin01','123456','王燕'), ('2','admin02','123456','许小祥'), ('3','admin03','123456','张英明');
INSERT INTO `ordered` VALUES ('28','20191126110004851','许小祥','13060298670','C12','307','24087',NULL,'2019-11-26 11:00:04','14',NULL), ('29','20191127224317078','许小祥','13060295680','C12','307','561',NULL,'2019-11-27 22:43:17','13',NULL), ('30','20191128190949763','许小祥','13060295620','C12','307','1419',NULL,'2019-11-28 19:09:49','13',NULL), ('31','20191128191122966','许小祥','13251114987','C12','509','30260',NULL,'2019-11-28 19:11:22','13',NULL), ('32','20191206180008935','许小祥','13060298670','C12','307','561',NULL,'2019-12-06 18:00:08','14',NULL), ('33','20191210233808703','许小祥','13060298670','C01','512','561',NULL,'2019-12-10 23:38:08','15',NULL), ('34','20191212171411819','许小祥','13060298670','C12','509','1554',NULL,'2019-12-12 17:14:11','20',NULL), ('35','20191217105637284','许小祥','13060298670','C12','307','548',NULL,'2019-12-17 10:56:37','21',NULL);
INSERT INTO `orderedfood` VALUES ('76','20191125193832177','32','佛跳墙','9999','2'), ('77','20191126110004851','69','鱼子酱牛肉凉面','10086','2'), ('78','20191126110004851','73','农家小炒肉','559','7'), ('79','20191127224317078','73','农家小炒肉','559','1'), ('80','20191128190949763','71','干锅肥肠','299','1'), ('81','20191128190949763','73','农家小炒肉','559','2'), ('82','20191128191122966','69','鱼子酱牛肉凉面','10086','3'), ('83','20191206180008935','73','农家小炒肉','559','1'), ('84','20191210233808703','73','农家小炒肉','559','1'), ('85','20191212171411819','73','农家小炒肉','559','1'), ('86','20191212171411819','73','农家小炒肉','559','1'), ('87','20191212171411819','72','酱牛肉','345','1'), ('88','20191212171411819','45','粤式白灼虾','89','1'), ('89','20191217105637284','28','萝卜丝炖大虾','78','7');