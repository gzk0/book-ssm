/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.32-log : Database - bms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bms`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `a_email` varchar(50) NOT NULL COMMENT '邮箱（登录账户）',
  `a_password` varchar(25) NOT NULL COMMENT '密码',
  `a_nick` varchar(50) NOT NULL COMMENT '昵称',
  `a_privilege` int(1) NOT NULL DEFAULT '0' COMMENT '权限（0-系统管理员，1图书管理员）',
  `a_photo` varchar(100) DEFAULT NULL COMMENT '头像路径',
  `a_sex` int(1) NOT NULL DEFAULT '0' COMMENT '性别（0-男，1-女）',
  `a_regist_time` datetime NOT NULL COMMENT '注册时间',
  `a_creed` text COMMENT '人生信条',
  `a_state` int(11) NOT NULL DEFAULT '0' COMMENT '0:可以，1禁用',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(30) NOT NULL,
  `b_name` varchar(500) NOT NULL,
  `b_price` float(5,2) NOT NULL,
  `b_author` varchar(100) NOT NULL,
  `b_publisher` varchar(100) NOT NULL,
  `b_num` int(5) NOT NULL,
  `b_pub_time` date NOT NULL,
  `b_join_time` datetime NOT NULL,
  `b_path` varchar(100) DEFAULT NULL,
  `b_introduce` text,
  `b_lend_num` int(5) NOT NULL DEFAULT '0',
  `b_state` int(11) NOT NULL DEFAULT '0' COMMENT '0:上架 1：下架',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ISBN` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Table structure for table `borrow` */

DROP TABLE IF EXISTS `borrow`;

CREATE TABLE `borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0:未还，1:已还',
  `return_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `r_id` (`r_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `reader` (`r_id`),
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `reader` */

DROP TABLE IF EXISTS `reader`;

CREATE TABLE `reader` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `r_card` varchar(20) NOT NULL COMMENT '借阅卡号',
  `r_nick` varchar(50) NOT NULL COMMENT '昵称',
  `r_privilege` int(1) NOT NULL DEFAULT '0' COMMENT '权限（0-学生，1-教师）',
  `r_sex` int(1) NOT NULL DEFAULT '0' COMMENT '性别（0-男，1-女）',
  `r_photo` varchar(100) DEFAULT NULL COMMENT '头像路径',
  `r_regist_time` datetime DEFAULT NULL COMMENT '注册时间',
  `r_password` varchar(20) NOT NULL COMMENT '密码',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
