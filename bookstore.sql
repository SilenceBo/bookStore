/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.20 : Database - bookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bookstore`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bid` char(32) NOT NULL,
  `bname` varchar(100) DEFAULT NULL,
  `price` decimal(5,1) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`bid`),
  KEY `cid` (`cid`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`bid`,`bname`,`price`,`author`,`image`,`cid`,`del`) values ('1','Java编程思想（第4版）','75.6','qdmmy6','book_img/9317290-1_l.jpg','1',0),('2','Java核心技术卷1','68.5','qdmmy6','book_img/20285763-1_l.jpg','1',0),('3','Java就业培训教程','39.9','张孝祥','book_img/8758723-1_l.jpg','1',0),('4','Head First java','47.5','（美）塞若','book_img/9265169-1_l.jpg','1',0),('5','JavaWeb开发详解','83.3','孙鑫','book_img/22788412-1_l.jpg','2',0),('6','Struts2深入详解','63.2','孙鑫','book_img/20385925-1_l.jpg','2',0),('7','精通Hibernate','30.0','孙卫琴','book_img/8991366-1_l.jpg','2',0),('8','精通Spring2.x','63.2','陈华雄','book_img/20029394-1_l.jpg','2',0),('9','Javascript权威指南','93.6','（美）弗兰纳根','book_img/22722790-1_l.jpg','3',0);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cid`,`cname`) values ('1','JavaSE'),('2','JavaEE'),('3','Javascript');

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `iid` char(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `oid` (`oid`),
  KEY `bid` (`bid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`iid`,`count`,`subtotal`,`oid`,`bid`) values ('4796B67A358C42D59F60F7C28BE7204C',1,'83','BEC1682FD7854DADAB47EA08F3466A0A','5'),('6C9E3E0734FC418F88E2B825EFC33579',1,'94','BEC1682FD7854DADAB47EA08F3466A0A','9'),('B3DC264A0CD1440EA4F14B15A7D87773',1,'76','BEC1682FD7854DADAB47EA08F3466A0A','1'),('B426728D2B9C44F4878E7E92F629270E',1,'69','BEC1682FD7854DADAB47EA08F3466A0A','2');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` char(32) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `state` smallint(1) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`oid`,`ordertime`,`total`,`state`,`uid`,`address`) values ('BEC1682FD7854DADAB47EA08F3466A0A','2018-06-21 16:23:38','321',1,'557396C3F2C74167B8DAD50C2DF50228',NULL);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `uid` char(32) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `code` char(64) NOT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`uid`,`username`,`password`,`email`,`code`,`state`) values ('557396C3F2C74167B8DAD50C2DF50228','zhaobo','123456','1123016794@qq.com','EB408209DC054908A53AFA5CD0389399185F634B53E64816B659D153E7BF3DBD',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
