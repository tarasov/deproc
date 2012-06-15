-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: deproc
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
-- Table structure for table `absences`
--

DROP TABLE IF EXISTS `absences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `absence` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absences_10d3e039` (`schedule_id`),
  KEY `absences_42ff452e` (`student_id`),
  CONSTRAINT `schedule_id_refs_id_57faa7e2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `student_id_refs_profile_ptr_id_45fe5e67` FOREIGN KEY (`student_id`) REFERENCES `students` (`profile_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absences`
--

LOCK TABLES `absences` WRITE;
/*!40000 ALTER TABLE `absences` DISABLE KEYS */;
/*!40000 ALTER TABLE `absences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date_pub` datetime NOT NULL,
  `theme_of_day_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_42ff452e` (`student_id`),
  KEY `assessment_6f7f52f2` (`theme_of_day_id`),
  CONSTRAINT `student_id_refs_profile_ptr_id_2d859c6f` FOREIGN KEY (`student_id`) REFERENCES `students` (`profile_ptr_id`),
  CONSTRAINT `theme_of_day_id_refs_id_52914d51` FOREIGN KEY (`theme_of_day_id`) REFERENCES `theme_of_day` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (1,5,10,'2010-11-01 00:00:00',2),(2,5,31,'2012-05-13 19:20:05',2),(3,4,10,'2012-05-13 20:22:27',2),(4,4,9,'2012-05-13 20:22:33',2),(8,4,9,'2012-05-28 19:02:40',11),(9,5,9,'2012-05-28 19:04:32',12),(10,4,31,'2012-05-28 20:06:08',13),(18,3,10,'2012-05-30 11:33:56',22),(19,4,9,'2012-05-30 11:34:14',23),(20,5,31,'2012-05-30 11:34:31',24),(21,5,10,'2012-05-30 12:40:48',26),(22,4,9,'2012-05-30 13:33:01',27),(24,2,9,'2012-05-30 13:37:36',3),(25,4,10,'2012-05-30 13:37:38',27),(26,4,31,'2012-05-30 13:42:52',30),(27,5,10,'2012-05-30 13:45:32',23),(29,2,10,'2012-05-30 14:51:33',37),(31,2,10,'2012-05-30 14:51:37',34),(32,2,10,'2012-05-30 14:51:39',11),(33,2,10,'2012-05-30 14:51:41',38),(38,2,10,'2012-05-30 15:36:31',41),(40,2,10,'2012-05-30 15:36:49',41),(42,4,10,'2012-05-30 15:52:55',41),(43,3,10,'2012-05-30 15:53:17',41),(53,5,10,'2012-05-30 16:06:42',41),(59,4,31,'2012-05-30 16:07:52',40),(60,5,9,'2012-05-30 16:07:54',40),(63,5,9,'2012-05-30 16:17:18',41),(64,4,10,'2012-05-30 16:19:54',44),(67,3,9,'2012-05-30 16:20:14',44),(68,3,9,'2012-05-30 16:20:15',44),(69,4,9,'2012-05-30 16:20:17',44),(70,5,31,'2012-05-30 16:20:20',44),(71,2,10,'2012-05-30 16:20:21',40),(74,3,31,'2012-05-30 17:11:37',46),(75,4,9,'2012-05-31 20:44:50',37),(76,4,9,'2012-05-31 20:44:52',37),(77,5,9,'2012-05-31 20:44:54',37),(79,4,31,'2012-05-31 20:45:01',11),(80,4,31,'2012-05-31 20:45:02',34),(81,5,31,'2012-05-31 20:45:04',11),(84,5,31,'2012-05-31 20:45:13',34),(86,4,31,'2012-05-31 20:45:18',34),(87,4,31,'2012-05-31 20:45:20',11),(88,3,31,'2012-05-31 20:45:22',11),(89,5,10,'2012-05-31 20:45:29',37),(90,5,10,'2012-05-31 20:45:30',11),(91,4,10,'2012-05-31 20:45:32',34),(92,4,9,'2012-05-31 20:45:35',39),(93,5,31,'2012-05-31 20:45:36',38),(94,5,10,'2012-05-31 20:48:01',50),(95,3,9,'2012-05-31 20:48:02',50),(96,4,31,'2012-06-01 21:21:51',38),(97,3,31,'2012-06-01 21:40:07',51),(98,3,9,'2012-06-01 23:12:05',41),(99,5,10,'2012-06-01 23:27:13',40),(100,4,31,'2012-06-01 23:27:15',45),(101,2,9,'2012-06-02 00:14:10',53),(102,2,9,'2012-06-02 00:14:12',55),(103,2,9,'2012-06-02 00:14:13',53),(104,2,9,'2012-06-02 00:14:16',52),(105,2,9,'2012-06-02 00:14:17',55),(106,2,9,'2012-06-02 00:14:19',55),(107,2,9,'2012-06-02 00:14:20',55),(108,5,10,'2012-06-02 00:14:22',53),(109,5,9,'2012-06-10 14:49:07',47),(110,2,31,'2012-06-14 17:14:35',41);
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add пользователь',9,'add_profile'),(26,'Can change пользователь',9,'change_profile'),(27,'Can delete пользователь',9,'delete_profile'),(28,'Can add студент',10,'add_students'),(29,'Can change студент',10,'change_students'),(30,'Can delete студент',10,'delete_students'),(31,'Can add преподователь',11,'add_teachers'),(32,'Can change преподователь',11,'change_teachers'),(33,'Can delete преподователь',11,'delete_teachers'),(34,'Can add статус',12,'add_userstatus'),(35,'Can change статус',12,'change_userstatus'),(36,'Can delete статус',12,'delete_userstatus'),(37,'Can add группа',13,'add_group'),(38,'Can change группа',13,'change_group'),(39,'Can delete группа',13,'delete_group'),(40,'Can add должность',14,'add_userpost'),(41,'Can change должность',14,'change_userpost'),(42,'Can delete должность',14,'delete_userpost'),(43,'Can add профессиональное образование',15,'add_po'),(44,'Can change профессиональное образование',15,'change_po'),(45,'Can delete профессиональное образование',15,'delete_po'),(46,'Can add специальность',16,'add_speciality'),(47,'Can change специальность',16,'change_speciality'),(48,'Can delete специальность',16,'delete_speciality'),(49,'Can add тип дисциплины',17,'add_disc_type'),(50,'Can change тип дисциплины',17,'change_disc_type'),(51,'Can delete тип дисциплины',17,'delete_disc_type'),(52,'Can add дисциплина',18,'add_discipline'),(53,'Can change дисциплина',18,'change_discipline'),(54,'Can delete дисциплина',18,'delete_discipline'),(55,'Can add учебный план',19,'add_uchplan'),(56,'Can change учебный план',19,'change_uchplan'),(57,'Can delete учебный план',19,'delete_uchplan'),(58,'Can add час учебного плана',20,'add_uchplanhour'),(59,'Can change час учебного плана',20,'change_uchplanhour'),(60,'Can delete час учебного плана',20,'delete_uchplanhour'),(61,'Can add учебный год',21,'add_year'),(62,'Can change учебный год',21,'change_year'),(63,'Can delete учебный год',21,'delete_year'),(64,'Can add группу студентов',22,'add_groups'),(65,'Can change группу студентов',22,'change_groups'),(66,'Can delete группу студентов',22,'delete_groups'),(67,'Can add студент группы',23,'add_groups_stud'),(68,'Can change студент группы',23,'change_groups_stud'),(69,'Can delete студент группы',23,'delete_groups_stud'),(70,'Can add план группы',24,'add_groups_plan'),(71,'Can change план группы',24,'change_groups_plan'),(72,'Can delete план группы',24,'delete_groups_plan'),(73,'Can add тарификация',25,'add_tariffication'),(74,'Can change тарификация',25,'change_tariffication'),(75,'Can delete тарификация',25,'delete_tariffication'),(76,'Can add кабинет',26,'add_classroom'),(77,'Can change кабинет',26,'change_classroom'),(78,'Can delete кабинет',26,'delete_classroom'),(79,'Can add день расписания',27,'add_schedule_day'),(80,'Can change день расписания',27,'change_schedule_day'),(81,'Can delete день расписания',27,'delete_schedule_day'),(82,'Can add расписание',28,'add_schedule'),(83,'Can change расписание',28,'change_schedule'),(84,'Can delete расписание',28,'delete_schedule'),(85,'Can add расписание на каждый день',29,'add_schedule_empty'),(86,'Can change расписание на каждый день',29,'change_schedule_empty'),(87,'Can delete расписание на каждый день',29,'delete_schedule_empty'),(88,'Can add расписание для преподавателя',30,'add_schedule_filled'),(89,'Can change расписание для преподавателя',30,'change_schedule_filled'),(90,'Can delete расписание для преподавателя',30,'delete_schedule_filled'),(91,'Can add пропуск',31,'add_absences'),(92,'Can change пропуск',31,'change_absences'),(93,'Can delete пропуск',31,'delete_absences'),(94,'Can add тип темы',32,'add_types_themes'),(95,'Can change тип темы',32,'change_types_themes'),(96,'Can delete тип темы',32,'delete_types_themes'),(97,'Can add тему',33,'add_themes'),(98,'Can change тему',33,'change_themes'),(99,'Can delete тему',33,'delete_themes'),(100,'Can add оценку',34,'add_assessment'),(101,'Can change оценку',34,'change_assessment'),(102,'Can delete оценку',34,'delete_assessment'),(124,'Can add пользователь',46,'add_profile'),(125,'Can change пользователь',46,'change_profile'),(126,'Can delete пользователь',46,'delete_profile'),(127,'Can add студента',37,'add_students'),(128,'Can change студента',37,'change_students'),(129,'Can delete студента',37,'delete_students'),(130,'Can add преподователя',38,'add_teachers'),(131,'Can change преподователя',38,'change_teachers'),(132,'Can delete преподователя',38,'delete_teachers'),(133,'Can add статус',36,'add_userstatus'),(134,'Can change статус',36,'change_userstatus'),(135,'Can delete статус',36,'delete_userstatus'),(136,'Can add группа',47,'add_group'),(137,'Can change группа',47,'change_group'),(138,'Can delete группа',47,'delete_group'),(139,'Can add должность',35,'add_userpost'),(140,'Can change должность',35,'change_userpost'),(141,'Can delete должность',35,'delete_userpost'),(142,'Can add профессиональное образование',48,'add_po'),(143,'Can change профессиональное образование',48,'change_po'),(144,'Can delete профессиональное образование',48,'delete_po'),(145,'Can add специальность',42,'add_speciality'),(146,'Can change специальность',42,'change_speciality'),(147,'Can delete специальность',42,'delete_speciality'),(148,'Can add тип дисциплины',45,'add_disc_type'),(149,'Can change тип дисциплины',45,'change_disc_type'),(150,'Can delete тип дисциплины',45,'delete_disc_type'),(151,'Can add дисциплина',44,'add_discipline'),(152,'Can change дисциплина',44,'change_discipline'),(153,'Can delete дисциплина',44,'delete_discipline'),(154,'Can add учебный план',43,'add_uchplan'),(155,'Can change учебный план',43,'change_uchplan'),(156,'Can delete учебный план',43,'delete_uchplan'),(157,'Can add час учебного плана',49,'add_uchplanhour'),(158,'Can change час учебного плана',49,'change_uchplanhour'),(159,'Can delete час учебного плана',49,'delete_uchplanhour'),(160,'Can add учебный год',40,'add_year'),(161,'Can change учебный год',40,'change_year'),(162,'Can delete учебный год',40,'delete_year'),(163,'Can add группу студентов',41,'add_groups'),(164,'Can change группу студентов',41,'change_groups'),(165,'Can delete группу студентов',41,'delete_groups'),(166,'Can add студент группы',50,'add_groups_stud'),(167,'Can change студент группы',50,'change_groups_stud'),(168,'Can delete студент группы',50,'delete_groups_stud'),(169,'Can add план группы',39,'add_groups_plan'),(170,'Can change план группы',39,'change_groups_plan'),(171,'Can delete план группы',39,'delete_groups_plan'),(172,'Can add тарификация',51,'add_tariffication'),(173,'Can change тарификация',51,'change_tariffication'),(174,'Can delete тарификация',51,'delete_tariffication'),(175,'Can add номер пары',52,'add_number_lesson'),(176,'Can change номер пары',52,'change_number_lesson'),(177,'Can delete номер пары',52,'delete_number_lesson'),(178,'Can add день',53,'add_theme_of_day'),(179,'Can change день',53,'change_theme_of_day'),(180,'Can delete день',53,'delete_theme_of_day'),(181,'Can add кабинет',54,'add_classroom'),(182,'Can change кабинет',54,'change_classroom'),(183,'Can delete кабинет',54,'delete_classroom'),(184,'Can add тип часа',55,'add_typehour'),(185,'Can change тип часа',55,'change_typehour'),(186,'Can delete тип часа',55,'delete_typehour');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (8,'admin','Админ','Админов','admin@admin.ru','pbkdf2_sha256$10000$InLwNkpyqino$9Q25JDAE9YN66VsZbmSzx21CplrKrCduK8bIAaFsv2g=',1,1,1,'2012-06-15 09:31:47','2012-04-29 19:13:48'),(9,'ruslan','Руслан','Тарасов','','pbkdf2_sha256$10000$vT6KP8iqg2jw$mwNe5EfbO2lj1WMUID0R+qKvqdByybpxawfp3SEU93o=',0,1,0,'2012-04-29 19:19:39','2012-04-29 19:19:39'),(10,'pasha','Павел','Гаврилов','','pbkdf2_sha256$10000$uSOMGBqRUeT2$nq7O5izw4ZecdMbE0QLVpsC0lRC2g0syke6a/d7UrGI=',0,1,0,'2012-04-29 19:20:35','2012-04-29 19:20:35'),(11,'vahromeev','Виталий','Вахромеев','','pbkdf2_sha256$10000$BAI8hrhG7nVQ$+zdgbiiTm7LCctlr4nPb0rmObNkIayusG8+ZM/lsC7w=',1,1,0,'2012-06-04 21:55:04','2012-04-29 19:21:25'),(12,'zhivoderova','Валентина','Живодерова','','pbkdf2_sha256$10000$7CsW60R5rXRL$0Txyngkbm7nTsp8Tz+KVkKkhaTpWvguqvEZcd/ACBkk=',0,1,0,'2012-05-31 22:23:48','2012-04-29 19:22:35'),(13,'lazareva','Юлия','Лазарева','','pbkdf2_sha256$10000$ggg2LNfXTuNY$sRXcmjtTgVu2QZO3A6oTLBZXGKJbNTpIj/BOHutNZtg=',0,1,0,'2012-05-04 08:51:37','2012-05-04 08:51:37'),(14,'gavrilova','Надежда','Гаврилова','','123',0,1,0,'2012-05-04 08:53:03','2012-05-04 08:53:03'),(15,'masalova','Евгения','Масалова','','123',1,1,0,'2012-05-07 16:56:37','2012-05-07 16:56:37'),(16,'podkolzina','Анджела','Подколзина','','123',0,1,0,'2012-05-07 16:57:30','2012-05-07 16:57:30'),(17,'anashkina','Ольга ','Анашкина','','pbkdf2_sha256$10000$8Qq6Zt0rUIfL$XooyHOSwNUigz+r8e9Elj4gH30yAXbMLzYomRI+Vg/g=',1,1,0,'2012-06-04 20:21:47','2012-05-11 11:24:02'),(18,'antonov','Владимир','Антонов','','123',0,1,0,'2012-05-11 11:25:30','2012-05-11 11:25:30'),(19,'vinogradova','Оксана','Виноградова','','123',1,1,0,'2012-05-11 11:28:32','2012-05-11 11:28:32'),(20,'pahomova','Наталья','Пахомова','','123',0,1,0,'2012-05-11 11:29:15','2012-05-11 11:29:15'),(21,'slepuzhnikova','Марина','Слепужникова','','123',0,1,0,'2012-05-11 11:29:56','2012-05-11 11:29:56'),(22,'hodyuk','Михаил','Ходюк','','123',0,1,0,'2012-05-11 11:30:45','2012-05-11 11:30:45'),(23,'baklanova','Раиса','Бакланова','','123',0,1,0,'2012-05-11 11:31:26','2012-05-11 11:31:26'),(24,'barinov','Василий','Баринов','','123',1,1,0,'2012-05-11 11:32:15','2012-05-11 11:32:15'),(25,'bogdanov','Сергей','Богданов','','123',0,1,0,'2012-05-11 11:33:03','2012-05-11 11:33:03'),(26,'vinokurova','Наталья','Винокурова','','123',0,1,0,'2012-05-11 21:50:41','2012-05-11 21:50:41'),(27,'vihlyaeva','Надежда','Вихляева','','pbkdf2_sha256$10000$rMkGagr47c1d$f70vuztmGNTEtcf5ZfKuRHc1ALILd9mtR1O8/bwj8YQ=',1,1,0,'2012-05-13 18:22:16','2012-05-11 21:54:51'),(28,'zhideeva','Светлана','Жидеева','','123',0,1,0,'2012-05-13 00:49:47','2012-05-13 00:49:47'),(29,'rachkova','Анастасия','Рачкова','','123',0,1,0,'2012-05-13 02:02:05','2012-05-13 02:02:05'),(30,'test','','','','pbkdf2_sha256$10000$ixyTorJJ6CEp$w5AItOGyirmwiu1l84psaEO8ZvymR2/fHAoQkp6fTU0=',0,1,0,'2012-05-13 15:11:53','2012-05-13 15:11:53'),(31,'ivan','Иван','Иванон','','123',0,1,0,'2012-05-13 15:18:44','2012-05-13 15:18:44'),(32,'kulichev',' Евгений','Куличев','','123',0,1,0,'2012-06-15 23:41:32','2012-06-15 23:41:32'),(34,'ulyanov','Алексей ','Ульянов ','','123',0,1,0,'2012-06-15 23:57:00','2012-06-15 23:57:00'),(35,'shadinov','Виктор','Шадинов','','123',0,1,0,'2012-06-16 00:03:08','2012-06-16 00:03:08'),(36,'reznikov','Петр ','Резников ','','123',0,1,0,'2012-06-16 00:25:03','2012-06-16 00:25:03');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES (5,301),(6,302),(7,201),(8,201),(9,216),(10,214),(11,404);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disc_type`
--

DROP TABLE IF EXISTS `disc_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disc_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disc_type`
--

LOCK TABLES `disc_type` WRITE;
/*!40000 ALTER TABLE `disc_type` DISABLE KEYS */;
INSERT INTO `disc_type` VALUES (2,'Дисциплина');
/*!40000 ALTER TABLE `disc_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `short_name` varchar(100) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discipline_777d41c8` (`type_id`),
  CONSTRAINT `type_id_refs_id_43d4e7ea` FOREIGN KEY (`type_id`) REFERENCES `disc_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipline`
--

LOCK TABLES `discipline` WRITE;
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
INSERT INTO `discipline` VALUES (14,'Физическая культура','Физ-ра',2),(15,'Информатика','Информатика',2),(16,'Немецкий язык','Немецкий язык',2),(17,'Физика','Физика',2),(18,'Литература','Литература',2),(19,'Русский язык','Русский язык',2),(20,'Английский язык','Английский язык',2),(21,'Химия','Химия',2),(22,'Биология с основами экологии','Биология/Экология',2),(23,'Обществознание','Общество',2),(24,'История','История',2),(25,'Математика','Математика',2),(26,'Основы безопасности жизнедеятельности','О.Б.Ж',2),(27,'Техническая механика','Тех механика',2),(28,'Инженерная графика','Инж графика',2),(29,'Основы социологии и политологии','Осн соц и полит',2),(30,'Краеведение','Краеведение',2),(31,'Русский язык и культура речи','Рус яз и культ речи',2),(32,'Автомобили','Автомобили',2),(33,'Электротехника и электроника','Электротехника',2),(34,'Материаловедение','Материаловедение',2),(35,'Основы экономики','Осн экономики',2),(36,'Основы права','Основы права',2),(37,'Экологические основы природопользования','Эколог осн природ',2),(38,'Безопасность жизнедеятельности','БЖ',2),(39,'Информационные технологии в профессиональной деятельности','Инф тех в проф д',2),(40,'Философия','Философия',2),(41,'Ремонт автомобилей','Ремонт авто',2),(42,'Автомобильные перевозки	','Авто перевоз	',2),(43,'Автомобильные эксплуатационные материалы','Авто экс мат',2),(44,'Правила и безопасность дорожного движения	','ПИБДД',2),(45,'Метрология, стандартизация, сертификация','Метр станд сертиф',2),(46,'Техническое обслуживание автомобиля','Техн обс авто',2);
/*!40000 ALTER TABLE `discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (236,'2012-04-29 19:17:55',8,36,'1','работник',1,''),(237,'2012-04-29 19:17:55',8,36,'2','работник',1,''),(238,'2012-04-29 19:18:00',8,35,'1','admin',1,''),(239,'2012-04-29 19:20:32',8,37,'9','Тарасов Руслан ',1,''),(240,'2012-04-29 19:21:05',8,37,'10','Гаврилов Павел ',1,''),(241,'2012-04-29 19:22:20',8,38,'11','Вахромеев Виталий ',1,''),(242,'2012-04-29 19:24:43',8,38,'12','Живодерова  ',1,''),(243,'2012-04-29 19:26:07',8,40,'2','2011-09-01 2012-06-30',1,''),(244,'2012-04-29 19:27:08',8,42,'4','Программное обеспечение вычислительной техники и автоматизированных систем 230105.0',1,''),(245,'2012-04-29 19:27:31',8,41,'11','808',1,''),(246,'2012-04-29 19:27:40',8,41,'12','809',1,''),(247,'2012-04-29 19:32:18',8,39,'7','808 / 4 курc',1,''),(248,'2012-04-29 19:32:25',8,39,'8','809 / 3 курc',1,''),(249,'2012-04-29 19:35:52',8,42,'5','Организация обслуживания в общественном питании 1.0',1,''),(250,'2012-04-29 19:36:21',8,41,'13','108',1,''),(251,'2012-04-29 19:37:04',8,41,'14','109',1,''),(252,'2012-04-29 19:37:26',8,41,'15','110',1,''),(253,'2012-04-29 19:37:35',8,41,'16','111',1,''),(254,'2012-04-29 19:40:12',8,42,'6','Реклама 324001.0',1,''),(255,'2012-04-29 19:40:38',8,41,'17','711',1,''),(256,'2012-04-29 19:40:45',8,41,'18','710',1,''),(257,'2012-04-29 19:40:53',8,41,'19','709',1,''),(258,'2012-04-29 19:52:18',8,45,'2','Дисциплина',1,''),(259,'2012-04-29 19:52:25',8,44,'6','ПОКС',1,''),(260,'2012-04-29 19:53:02',8,44,'7','ТРПП',1,''),(261,'2012-04-29 19:54:06',8,44,'8','ИБ',1,''),(262,'2012-04-29 19:54:53',8,44,'9','БД',1,''),(263,'2012-04-29 19:55:07',8,44,'10','Физика',1,''),(264,'2012-04-29 19:58:58',8,43,'11','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(265,'2012-04-29 19:59:05',8,43,'12','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(266,'2012-04-29 20:05:24',8,39,'9','711 / 1 курc',1,''),(267,'2012-04-29 20:05:32',8,39,'10','710 / 2 курc',1,''),(268,'2012-04-29 20:06:38',8,43,'13','ТРПП / Реклама / 1 семестр',1,''),(269,'2012-04-29 20:06:46',8,43,'14','ТРПП / Реклама / 2 семестр',1,''),(270,'2012-04-29 20:28:37',8,3,'11','vahromeev',2,'Изменен password и is_staff.'),(271,'2012-04-30 13:03:54',8,27,'1','2012-04-26 (False)',3,''),(272,'2012-04-30 13:11:19',8,27,'2','2012-04-26 (False)',3,''),(273,'2012-05-03 14:15:49',8,32,'1','ТИП ТЕМЫ',1,''),(274,'2012-05-03 14:16:23',8,33,'1','Лось и его разновидности',1,''),(275,'2012-05-03 14:16:42',8,34,'1','5',1,''),(276,'2012-05-03 14:39:26',8,34,'2','4',1,''),(277,'2012-05-03 14:58:31',8,26,'1','216',1,''),(278,'2012-05-03 14:58:55',8,28,'1','Вахромеев Виталий , ПОКС, 808, 2012-05-03 (False), 1',1,''),(279,'2012-05-03 17:14:42',8,28,'2','Вахромеев Виталий , ПОКС, 808, 2012-05-03, 2',1,''),(280,'2012-05-03 17:14:54',8,28,'3','Вахромеев Виталий , ПОКС, 808, 2012-05-03, 4',1,''),(281,'2012-05-04 08:51:20',8,28,'4','Вахромеев Виталий , ПОКС, 808, 2012-05-04, 1',1,''),(282,'2012-05-04 08:53:03',8,38,'13','Лазарева Юлия ',1,''),(283,'2012-05-04 08:53:57',8,38,'14','Гаврилова Надежда ',1,''),(284,'2012-05-04 08:54:13',8,38,'12','Живодерова Валентина ',2,'Изменен first_name.'),(285,'2012-05-04 08:55:18',8,44,'11','Анг. яз',1,''),(286,'2012-05-04 08:55:30',8,44,'12','История',1,''),(287,'2012-05-04 08:55:48',8,44,'13','Общество',1,''),(288,'2012-05-04 08:56:10',8,43,'15','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(289,'2012-05-04 08:56:20',8,43,'16','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(290,'2012-05-04 08:56:31',8,43,'17','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',1,''),(291,'2012-05-04 08:56:39',8,43,'18','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',1,''),(292,'2012-05-04 08:57:01',8,49,'37','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',1,''),(293,'2012-05-04 08:57:11',8,49,'38','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',1,''),(294,'2012-05-04 08:57:22',8,49,'39','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр / L / 160 часов',1,''),(295,'2012-05-04 08:57:38',8,51,'34','Лазарева Юлия  808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',1,''),(296,'2012-05-04 08:57:53',8,51,'35','Лазарева Юлия  808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',1,''),(297,'2012-05-04 08:58:55',8,28,'5','Лазарева Юлия , Анг. яз, 808, 2012-05-04, 1',1,''),(298,'2012-05-04 08:59:06',8,28,'6','Вахромеев Виталий , ПОКС, 808, 2012-05-04, 2',1,''),(299,'2012-05-04 08:59:25',8,28,'7','Живодерова Валентина , ТРПП, 711, 2012-05-04, 3',1,''),(300,'2012-05-04 09:00:48',8,26,'2','202',1,''),(301,'2012-05-04 09:00:52',8,26,'3','201',1,''),(302,'2012-05-04 09:00:58',8,26,'4','306',1,''),(303,'2012-05-04 09:01:33',8,28,'4','Вахромеев Виталий , ПОКС, 808, 2012-05-04, 5',2,'Изменен num_less.'),(304,'2012-05-04 09:14:24',8,38,'11','Вахромеев Виталий Владимирович',2,'Изменен other_name.'),(305,'2012-05-04 09:14:46',8,38,'12','Живодерова Валентина Викторовна',2,'Изменен other_name и sex.'),(306,'2012-05-04 09:15:04',8,38,'13','Лазарева Юлия Николаевна',2,'Изменен other_name и sex.'),(307,'2012-05-04 09:15:24',8,38,'14','Гаврилова Надежда Алексеевна',2,'Изменен other_name и sex.'),(308,'2012-05-04 16:29:59',8,28,'8','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 5',1,''),(309,'2012-05-06 02:10:07',8,28,'9','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 2',1,''),(310,'2012-05-06 02:10:20',8,28,'10','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 3',1,''),(311,'2012-05-06 02:11:15',8,28,'11','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-05, 2',1,''),(312,'2012-05-06 02:11:51',8,28,'11','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-05, 2',3,''),(313,'2012-05-07 15:36:39',8,28,'11','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 5',1,''),(314,'2012-05-07 15:36:58',8,28,'11','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 4',2,'Изменен num_less.'),(315,'2012-05-07 15:37:19',8,28,'12','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-04, 3',1,''),(316,'2012-05-07 16:32:30',8,28,'1','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-03, 1',3,''),(317,'2012-05-07 16:32:30',8,28,'2','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-03, 2',3,''),(318,'2012-05-07 16:32:30',8,28,'3','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-03, 4',3,''),(319,'2012-05-07 16:32:30',8,28,'4','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-04, 5',3,''),(320,'2012-05-07 16:32:30',8,28,'5','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-04, 1',3,''),(321,'2012-05-07 16:32:30',8,28,'6','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-04, 2',3,''),(322,'2012-05-07 16:32:30',8,28,'7','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 3',3,''),(323,'2012-05-07 16:32:30',8,28,'8','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 5',3,''),(324,'2012-05-07 16:32:30',8,28,'9','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 2',3,''),(325,'2012-05-07 16:32:30',8,28,'10','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 3',3,''),(326,'2012-05-07 16:32:30',8,28,'11','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 4',3,''),(327,'2012-05-07 16:32:30',8,28,'12','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-04, 3',3,''),(328,'2012-05-07 16:39:40',8,26,'1','216',3,''),(329,'2012-05-07 16:39:40',8,26,'2','202',3,''),(330,'2012-05-07 16:39:40',8,26,'3','201',3,''),(331,'2012-05-07 16:39:40',8,26,'4','306',3,''),(332,'2012-05-07 16:39:53',8,27,'3','2012-04-30 (False)',3,''),(333,'2012-05-07 16:39:53',8,27,'4','2012-05-01 (False)',3,''),(334,'2012-05-07 16:39:53',8,27,'5','2012-05-03 (False)',3,''),(335,'2012-05-07 16:39:53',8,27,'6','2012-05-02 (False)',3,''),(336,'2012-05-07 16:39:53',8,27,'7','2012-05-04 (False)',3,''),(337,'2012-05-07 16:39:53',8,27,'8','2012-05-05 (False)',3,''),(338,'2012-05-07 16:39:53',8,27,'9','2012-05-06 (False)',3,''),(339,'2012-05-07 16:39:53',8,27,'10','2012-05-10 (False)',3,''),(340,'2012-05-07 16:43:34',8,51,'18','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 170 часов',3,''),(341,'2012-05-07 16:43:34',8,51,'19','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / P / 70 часов',3,''),(342,'2012-05-07 16:43:34',8,51,'20','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / S / 0 часов',3,''),(343,'2012-05-07 16:43:34',8,51,'21','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / E / 0 часов',3,''),(344,'2012-05-07 16:43:34',8,51,'22','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 120 часов',3,''),(345,'2012-05-07 16:43:34',8,51,'23','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / P / 70 часов',3,''),(346,'2012-05-07 16:43:34',8,51,'24','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / S / 8 часов',3,''),(347,'2012-05-07 16:43:34',8,51,'25','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 12 часов',3,''),(348,'2012-05-07 16:43:34',8,51,'26','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / L / 170 часов',3,''),(349,'2012-05-07 16:43:34',8,51,'27','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / P / 40 часов',3,''),(350,'2012-05-07 16:43:34',8,51,'28','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / S / 0 часов',3,''),(351,'2012-05-07 16:43:34',8,51,'29','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / E / 0 часов',3,''),(352,'2012-05-07 16:43:34',8,51,'30','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / L / 50 часов',3,''),(353,'2012-05-07 16:43:35',8,51,'31','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / P / 0 часов',3,''),(354,'2012-05-07 16:43:35',8,51,'32','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / S / 8 часов',3,''),(355,'2012-05-07 16:43:35',8,51,'33','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / E / 12 часов',3,''),(356,'2012-05-07 16:43:35',8,51,'34','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',3,''),(357,'2012-05-07 16:43:35',8,51,'35','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',3,''),(358,'2012-05-07 16:49:15',8,42,'7','Прикладная информатика по отраслям 230701.0',1,''),(359,'2012-05-07 16:49:54',8,42,'8','Техническое обслуживание и ремонт автомобильного транспорта 190604.0',1,''),(360,'2012-05-07 16:50:14',8,42,'9','Повар 34.2',1,''),(361,'2012-05-07 16:50:33',8,42,'10','Автомеханик 30.2',1,''),(362,'2012-05-07 16:50:52',8,42,'11','Программирование в компьютерных системах 230115.0',1,''),(363,'2012-05-07 16:53:02',8,41,'20','208',1,''),(364,'2012-05-07 16:53:13',8,41,'21','209',1,''),(365,'2012-05-07 16:53:39',8,41,'22','908',1,''),(366,'2012-05-07 16:53:49',8,41,'23','910',1,''),(367,'2012-05-07 16:53:56',8,41,'24','911',1,''),(368,'2012-05-07 16:54:31',8,41,'25','410',1,''),(369,'2012-05-07 16:54:58',8,41,'26','507',1,''),(370,'2012-05-07 16:55:07',8,41,'27','508',1,''),(371,'2012-05-07 16:55:18',8,41,'28','509',1,''),(372,'2012-05-07 16:55:28',8,41,'29','510',1,''),(373,'2012-05-07 16:55:35',8,41,'30','511',1,''),(374,'2012-05-07 16:57:29',8,38,'15','Масалова Евгения Алексеевна',1,''),(375,'2012-05-07 16:59:16',8,38,'16','Подколзина Анджела Ивановна',1,''),(376,'2012-05-07 17:13:22',8,39,'11','908 / 4 курc',1,''),(377,'2012-05-07 17:13:31',8,39,'12','910 / 2 курc',1,''),(378,'2012-05-07 17:13:43',8,39,'13','208 / 4 курc',1,''),(379,'2012-05-07 17:13:57',8,39,'14','209 / 3 курc',1,''),(380,'2012-05-07 17:14:04',8,39,'15','507 / 5 курc',1,''),(381,'2012-05-07 17:14:11',8,39,'16','508 / 4 курc',1,''),(382,'2012-05-07 17:14:18',8,39,'17','509 / 3 курc',1,''),(383,'2012-05-07 17:26:15',8,39,'18','510 / 2 курc',1,''),(384,'2012-05-07 17:26:21',8,39,'19','511 / 1 курc',1,''),(385,'2012-05-07 17:51:42',8,43,'19','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',1,''),(386,'2012-05-07 17:51:50',8,43,'20','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',1,''),(387,'2012-05-07 17:51:57',8,43,'21','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',1,''),(388,'2012-05-07 17:52:07',8,43,'22','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',1,''),(389,'2012-05-07 17:52:19',8,43,'23','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(390,'2012-05-07 17:52:27',8,43,'24','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(391,'2012-05-07 18:05:28',8,43,'25','История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр',1,''),(392,'2012-05-07 18:05:36',8,43,'26','История / Техническое обслуживание и ремонт автомобильного транспорта / 2 семестр',1,''),(393,'2012-05-07 18:06:09',8,49,'40','История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / L / 100 часов',1,''),(394,'2012-05-07 18:06:17',8,49,'41','История / Техническое обслуживание и ремонт автомобильного транспорта / 2 семестр / L / 80 часов',1,''),(395,'2012-05-07 18:06:53',8,51,'36','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 200 часов',1,''),(396,'2012-05-07 18:07:04',8,51,'37','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 120 часов',1,''),(397,'2012-05-07 18:07:35',8,51,'38','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / L / 100 часов',1,''),(398,'2012-05-07 18:07:45',8,51,'39','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / L / 50 часов',1,''),(399,'2012-05-07 18:08:48',8,51,'40','Вахромеев Виталий Владимирович 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',1,''),(400,'2012-05-07 18:09:02',8,51,'41','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',1,''),(401,'2012-05-07 18:09:21',8,51,'42','Гаврилова Надежда Алексеевна 511 / 1 курc История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / L / 100 часов',1,''),(402,'2012-05-07 18:09:49',8,26,'5','301',1,''),(403,'2012-05-07 18:09:55',8,26,'6','302',1,''),(404,'2012-05-07 18:10:00',8,26,'7','201',1,''),(405,'2012-05-07 18:10:00',8,26,'8','201',1,''),(406,'2012-05-07 18:10:04',8,26,'9','216',1,''),(407,'2012-05-07 18:10:07',8,26,'10','214',1,''),(408,'2012-05-07 18:10:25',8,28,'13','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 1',1,''),(409,'2012-05-07 18:10:39',8,28,'14','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 2',1,''),(410,'2012-05-07 18:11:03',8,28,'15','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-07, 1',1,''),(411,'2012-05-07 18:11:27',8,28,'16','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-07, 2',1,''),(412,'2012-05-07 18:11:37',8,28,'17','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-07, 3',1,''),(413,'2012-05-07 18:11:48',8,28,'18','Вахромеев Виталий Владимирович, Анг. яз, 808, 2012-05-07, 4',1,''),(414,'2012-05-11 00:05:13',8,28,'19','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-07, 5',1,''),(415,'2012-05-11 00:26:13',8,49,'42','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 10 часов',1,''),(416,'2012-05-11 00:27:09',8,51,'43','Вахромеев Виталий Владимирович 908 / 4 курc ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 10 часов',1,''),(417,'2012-05-11 00:28:09',8,28,'20','Вахромеев Виталий Владимирович, ИБ, 908, 2012-05-07, 1',1,''),(418,'2012-05-11 00:28:19',8,28,'21','Вахромеев Виталий Владимирович, ИБ, 908, 2012-05-07, 5',1,''),(419,'2012-05-11 00:50:00',8,28,'22','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 3',1,''),(420,'2012-05-11 00:50:11',8,28,'23','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 4',1,''),(421,'2012-05-11 00:50:19',8,28,'24','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 5',1,''),(422,'2012-05-11 11:22:39',8,44,'14','Физ-ра',1,''),(423,'2012-05-11 11:23:14',8,43,'27','Физ-ра / Прикладная информатика по отраслям / 1 семестр',1,''),(424,'2012-05-11 11:23:23',8,49,'43','Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 110 часов',1,''),(425,'2012-05-11 11:23:52',8,39,'20','911 / 1 курc',1,''),(426,'2012-05-11 11:25:01',8,38,'17','Анашкина Ольга  Викторовна',1,''),(427,'2012-05-11 11:25:08',8,51,'44','Анашкина Ольга  Викторовна 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 110 часов',1,''),(428,'2012-05-11 11:25:26',8,49,'44','Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 107 часов',1,''),(429,'2012-05-11 11:26:06',8,38,'18','Антонов Владимир Иванович',1,''),(430,'2012-05-11 11:26:12',8,51,'45','Антонов Владимир Иванович 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 107 часов',1,''),(431,'2012-05-11 11:26:43',8,26,'11','404',1,''),(432,'2012-05-11 11:26:49',8,28,'25','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 1',1,''),(433,'2012-05-11 11:27:00',8,28,'26','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 3',1,''),(434,'2012-05-11 11:27:11',8,28,'27','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 5',1,''),(435,'2012-05-11 11:27:22',8,28,'28','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 2',1,''),(436,'2012-05-11 11:27:36',8,28,'29','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 4',1,''),(437,'2012-05-11 11:29:15',8,38,'19','Виноградова Оксана Владимировна',1,''),(438,'2012-05-11 11:29:55',8,38,'20','Пахомова Наталья Валерьевна',1,''),(439,'2012-05-11 11:30:44',8,38,'21','Слепужникова Марина Ивановна',1,''),(440,'2012-05-11 11:31:26',8,38,'22','Ходюк Михаил Андреевич',1,''),(441,'2012-05-11 11:32:15',8,38,'23','Бакланова Раиса Абдуловна',1,''),(442,'2012-05-11 11:33:03',8,38,'24','Баринов Василий Константинович',1,''),(443,'2012-05-11 11:33:43',8,38,'25','Богданов Сергей Григорьевич',1,''),(444,'2012-05-11 20:39:42',8,51,'36','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 200 часов',3,''),(445,'2012-05-11 20:39:42',8,51,'37','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 120 часов',3,''),(446,'2012-05-11 20:39:42',8,51,'38','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / L / 100 часов',3,''),(447,'2012-05-11 20:39:42',8,51,'39','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / L / 50 часов',3,''),(448,'2012-05-11 20:39:42',8,51,'40','Вахромеев Виталий Владимирович 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',3,''),(449,'2012-05-11 20:39:42',8,51,'41','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',3,''),(450,'2012-05-11 20:39:42',8,51,'42','Гаврилова Надежда Алексеевна 511 / 1 курc История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / L / 100 часов',3,''),(451,'2012-05-11 20:39:42',8,51,'43','Вахромеев Виталий Владимирович 908 / 4 курc ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 10 часов',3,''),(452,'2012-05-11 20:41:03',8,43,'11','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',3,''),(453,'2012-05-11 20:41:03',8,43,'12','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',3,''),(454,'2012-05-11 20:41:03',8,43,'13','ТРПП / Реклама / 1 семестр',3,''),(455,'2012-05-11 20:41:03',8,43,'14','ТРПП / Реклама / 2 семестр',3,''),(456,'2012-05-11 20:41:03',8,43,'15','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',3,''),(457,'2012-05-11 20:41:03',8,43,'16','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',3,''),(458,'2012-05-11 20:41:03',8,43,'17','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',3,''),(459,'2012-05-11 20:41:04',8,43,'18','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',3,''),(460,'2012-05-11 20:41:04',8,43,'19','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',3,''),(461,'2012-05-11 20:41:04',8,43,'20','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',3,''),(462,'2012-05-11 20:41:04',8,43,'21','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',3,''),(463,'2012-05-11 20:41:04',8,43,'22','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',3,''),(464,'2012-05-11 20:41:04',8,43,'23','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',3,''),(465,'2012-05-11 20:41:04',8,43,'24','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',3,''),(466,'2012-05-11 20:41:04',8,43,'25','История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр',3,''),(467,'2012-05-11 20:41:04',8,43,'26','История / Техническое обслуживание и ремонт автомобильного транспорта / 2 семестр',3,''),(468,'2012-05-11 20:42:50',8,44,'15','Инф-ка',1,''),(469,'2012-05-11 20:43:21',8,43,'28','Инф-ка / Прикладная информатика по отраслям / 1 семестр',1,''),(470,'2012-05-11 20:43:53',8,49,'45','Инф-ка / Прикладная информатика по отраслям / 1 семестр / P / 50 часов',1,''),(471,'2012-05-11 20:44:00',8,49,'46','Инф-ка / Прикладная информатика по отраслям / 1 семестр / K / 3 часов',1,''),(472,'2012-05-11 20:44:20',8,51,'46','Виноградова Оксана Владимировна 911 / 1 курc Инф-ка / Прикладная информатика по отраслям / 1 семестр / P / 50 часов',1,''),(473,'2012-05-11 20:44:33',8,51,'47','Виноградова Оксана Владимировна 911 / 1 курc Инф-ка / Прикладная информатика по отраслям / 1 семестр / K / 3 часов',1,''),(474,'2012-05-11 20:45:04',8,28,'25','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 1',3,''),(475,'2012-05-11 20:45:04',8,28,'26','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 3',3,''),(476,'2012-05-11 20:45:04',8,28,'27','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 5',3,''),(477,'2012-05-11 20:45:04',8,28,'28','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 2',3,''),(478,'2012-05-11 20:45:04',8,28,'29','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 4',3,''),(479,'2012-05-11 20:45:18',8,28,'30','Виноградова Оксана Владимировна, Инф-ка, 911, 2012-05-11, 1',1,''),(480,'2012-05-11 20:45:34',8,28,'31','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-11, 1',1,''),(481,'2012-05-11 20:45:46',8,28,'32','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-11, 3',1,''),(482,'2012-05-11 20:45:56',8,28,'33','Виноградова Оксана Владимировна, Инф-ка, 911, 2012-05-11, 3',1,''),(483,'2012-05-11 20:46:17',8,28,'34','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-11, 2',1,''),(484,'2012-05-11 20:46:28',8,28,'35','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-11, 2',1,''),(485,'2012-05-11 21:26:19',8,44,'6','ПОКС',3,''),(486,'2012-05-11 21:26:19',8,44,'7','ТРПП',3,''),(487,'2012-05-11 21:26:19',8,44,'8','ИБ',3,''),(488,'2012-05-11 21:26:19',8,44,'9','БД',3,''),(489,'2012-05-11 21:26:19',8,44,'10','Физика',3,''),(490,'2012-05-11 21:26:19',8,44,'11','Анг. яз',3,''),(491,'2012-05-11 21:26:19',8,44,'12','История',3,''),(492,'2012-05-11 21:26:19',8,44,'13','Общество',3,''),(493,'2012-05-11 21:27:50',8,44,'16','Нем яз',1,''),(494,'2012-05-11 21:28:05',8,44,'17','Физика',1,''),(495,'2012-05-11 21:28:32',8,44,'18','Лит-ра',1,''),(496,'2012-05-11 21:28:52',8,44,'19','Рус яз',1,''),(497,'2012-05-11 21:29:16',8,44,'20','Анг яз',1,''),(498,'2012-05-11 21:29:28',8,44,'21','Химия',1,''),(499,'2012-05-11 21:30:29',8,44,'22','Биол/экол',1,''),(500,'2012-05-11 21:30:49',8,44,'23','Общество',1,''),(501,'2012-05-11 21:31:24',8,44,'19','Русский язык',2,'Изменен short_name.'),(502,'2012-05-11 21:31:35',8,44,'20','Английский язык',2,'Изменен short_name.'),(503,'2012-05-11 21:31:44',8,44,'16','Немецкий язык',2,'Изменен short_name.'),(504,'2012-05-11 21:31:53',8,44,'15','Информатика',2,'Изменен short_name.'),(505,'2012-05-11 21:32:12',8,44,'18','Литература',2,'Изменен short_name.'),(506,'2012-05-11 21:33:05',8,44,'22','Биология/Экология',2,'Изменен short_name.'),(507,'2012-05-11 21:33:40',8,44,'24','История',1,''),(508,'2012-05-11 21:34:11',8,44,'25','Математика',1,''),(509,'2012-05-11 21:35:01',8,44,'26','О.Б.Ж',1,''),(510,'2012-05-11 21:36:18',8,43,'29','Немецкий язык / Прикладная информатика по отраслям / 1 семестр',1,''),(511,'2012-05-11 21:36:48',8,43,'30','Немецкий язык / Прикладная информатика по отраслям / 1 семестр',1,''),(512,'2012-05-11 21:37:00',8,43,'30','Физика / Прикладная информатика по отраслям / 1 семестр',2,'Изменен disc.'),(513,'2012-05-11 21:38:20',8,43,'31','Литература / Прикладная информатика по отраслям / 1 семестр',1,''),(514,'2012-05-11 21:38:29',8,43,'32','Русский язык / Прикладная информатика по отраслям / 1 семестр',1,''),(515,'2012-05-11 21:38:57',8,43,'33','Английский язык / Прикладная информатика по отраслям / 1 семестр',1,''),(516,'2012-05-11 21:39:08',8,43,'34','Химия / Прикладная информатика по отраслям / 1 семестр',1,''),(517,'2012-05-11 21:39:31',8,43,'35','Биология/Экология / Прикладная информатика по отраслям / 1 семестр',1,''),(518,'2012-05-11 21:39:39',8,43,'36','Общество / Прикладная информатика по отраслям / 1 семестр',1,''),(519,'2012-05-11 21:39:47',8,43,'37','История / Прикладная информатика по отраслям / 1 семестр',1,''),(520,'2012-05-11 21:40:12',8,43,'38','Математика / Прикладная информатика по отраслям / 1 семестр',1,''),(521,'2012-05-11 21:40:20',8,43,'39','О.Б.Ж / Прикладная информатика по отраслям / 1 семестр',1,''),(522,'2012-05-11 21:41:19',8,49,'47','Немецкий язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(523,'2012-05-11 21:42:09',8,49,'48','Немецкий язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',1,''),(524,'2012-05-11 21:42:27',8,49,'49','Физика / Прикладная информатика по отраслям / 1 семестр / L / 195 часов',1,''),(525,'2012-05-11 21:42:39',8,49,'50','Физика / Прикладная информатика по отраслям / 1 семестр / K / 15 часов',1,''),(526,'2012-05-11 21:44:17',8,49,'51','Информатика / Прикладная информатика по отраслям / 1 семестр / L / 95 часов',1,''),(527,'2012-05-11 21:44:45',8,49,'52','Информатика / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',1,''),(528,'2012-05-11 21:44:53',8,49,'53','Информатика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(529,'2012-05-11 21:45:08',8,49,'54','Литература / Прикладная информатика по отраслям / 1 семестр / L / 117 часов',1,''),(530,'2012-05-11 21:45:22',8,49,'55','Литература / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(531,'2012-05-11 21:45:39',8,49,'56','Русский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(532,'2012-05-11 21:45:48',8,49,'57','Русский язык / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',1,''),(533,'2012-05-11 21:45:57',8,49,'58','Русский язык / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(534,'2012-05-11 21:46:30',8,49,'59','Английский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(535,'2012-05-11 21:46:39',8,49,'60','Английский язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',1,''),(536,'2012-05-11 21:46:55',8,49,'61','Химия / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(537,'2012-05-11 21:47:09',8,49,'62','Химия / Прикладная информатика по отраслям / 1 семестр / P / 6 часов',1,''),(538,'2012-05-11 21:47:19',8,49,'63','Химия / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(539,'2012-05-11 21:47:33',8,49,'64','Биология/Экология / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(540,'2012-05-11 21:47:45',8,49,'65','Биология/Экология / Прикладная информатика по отраслям / 1 семестр / P / 4 часов',1,''),(541,'2012-05-11 21:47:54',8,49,'66','Биология/Экология / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(542,'2012-05-11 21:48:11',8,49,'67','Общество / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',1,''),(543,'2012-05-11 21:48:20',8,49,'68','Общество / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(544,'2012-05-11 21:48:44',8,49,'69','История / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',1,''),(545,'2012-05-11 21:48:55',8,49,'70','История / Прикладная информатика по отраслям / 1 семестр / K / 10 часов',1,''),(546,'2012-05-11 21:49:15',8,49,'71','Математика / Прикладная информатика по отраслям / 1 семестр / L / 290 часов',1,''),(547,'2012-05-11 21:49:27',8,49,'72','Математика / Прикладная информатика по отраслям / 1 семестр / K / 18 часов',1,''),(548,'2012-05-11 21:49:35',8,49,'73','Математика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(549,'2012-05-11 21:49:53',8,49,'74','О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / L / 68 часов',1,''),(550,'2012-05-11 21:49:59',8,49,'75','О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / K / 2 часов',1,''),(551,'2012-05-11 21:51:22',8,38,'26','Винокурова Наталья Васильевна',1,''),(552,'2012-05-11 21:51:49',8,51,'48','Винокурова Наталья Васильевна 911 / 1 курc Немецкий язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(553,'2012-05-11 21:52:00',8,51,'49','Винокурова Наталья Васильевна 911 / 1 курc Немецкий язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',1,''),(554,'2012-05-11 21:55:40',8,38,'27','Вихляева Надежда Валентиновна',1,''),(555,'2012-05-11 21:56:07',8,51,'50','Вихляева Надежда Валентиновна 911 / 1 курc Физика / Прикладная информатика по отраслям / 1 семестр / L / 195 часов',1,''),(556,'2012-05-11 21:56:27',8,51,'51','Вихляева Надежда Валентиновна 911 / 1 курc Физика / Прикладная информатика по отраслям / 1 семестр / K / 15 часов',1,''),(557,'2012-05-11 21:58:40',8,51,'52','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / L / 95 часов',1,''),(558,'2012-05-11 21:58:49',8,51,'53','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',1,''),(559,'2012-05-11 21:59:01',8,51,'54','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(560,'2012-05-11 23:07:37',8,28,'36','Живодерова Валентина Викторовна, Информатика, 911, 2012-05-11, 4',1,''),(561,'2012-05-11 23:07:52',8,28,'37','Вихляева Надежда Валентиновна, Физика, 911, 2012-05-11, 5',1,''),(562,'2012-05-12 23:34:16',8,28,'38','Виноградова Оксана Владимировна, Информатика, 911, 2012-05-13, 1',1,''),(563,'2012-05-12 23:34:32',8,28,'39','Живодерова Валентина Викторовна, Информатика, 911, 2012-05-13, 1',1,''),(564,'2012-05-12 23:37:12',8,28,'40','Вихляева Надежда Валентиновна, Физика, 911, 2012-05-14, 1',1,''),(565,'2012-05-12 23:37:56',8,28,'41','Винокурова Наталья Васильевна, Немецкий язык, 911, 2012-05-14, 2',1,''),(566,'2012-05-12 23:38:16',8,28,'42','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-14, 3',1,''),(567,'2012-05-12 23:38:28',8,28,'43','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-14, 3',1,''),(568,'2012-05-12 23:39:03',8,28,'44','Живодерова Валентина Викторовна, Информатика, 911, 2012-05-14, 5',1,''),(569,'2012-05-12 23:39:15',8,28,'45','Виноградова Оксана Владимировна, Информатика, 911, 2012-05-14, 5',1,''),(570,'2012-05-13 00:50:48',8,38,'28','Жидеева Светлана Михайловна',1,''),(571,'2012-05-13 00:52:33',8,51,'55','Жидеева Светлана Михайловна 911 / 1 курc Литература / Прикладная информатика по отраслям / 1 семестр / L / 117 часов',1,''),(572,'2012-05-13 00:53:07',8,51,'56','Жидеева Светлана Михайловна 911 / 1 курc Литература / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(573,'2012-05-13 00:53:21',8,51,'57','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(574,'2012-05-13 00:53:32',8,51,'58','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',1,''),(575,'2012-05-13 00:53:44',8,51,'59','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(576,'2012-05-13 01:59:42',8,51,'60','Лазарева Юлия Николаевна 911 / 1 курc Английский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(577,'2012-05-13 01:59:58',8,51,'61','Лазарева Юлия Николаевна 911 / 1 курc Английский язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',1,''),(578,'2012-05-13 02:00:14',8,51,'62','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(579,'2012-05-13 02:00:31',8,51,'63','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / P / 6 часов',1,''),(580,'2012-05-13 02:00:46',8,51,'64','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(581,'2012-05-13 02:01:20',8,51,'65','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(582,'2012-05-13 02:01:32',8,51,'66','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / P / 4 часов',1,''),(583,'2012-05-13 02:01:48',8,51,'67','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(584,'2012-05-13 02:02:43',8,38,'29','Рачкова Анастасия Михайловна',1,''),(585,'2012-05-13 02:03:10',8,51,'68','Рачкова Анастасия Михайловна 911 / 1 курc Общество / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',1,''),(586,'2012-05-13 02:03:26',8,51,'69','Рачкова Анастасия Михайловна 911 / 1 курc Общество / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(587,'2012-05-13 02:03:48',8,51,'70','Рачкова Анастасия Михайловна 911 / 1 курc История / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',1,''),(588,'2012-05-13 02:04:01',8,51,'71','Рачкова Анастасия Михайловна 911 / 1 курc История / Прикладная информатика по отраслям / 1 семестр / K / 10 часов',1,''),(589,'2012-05-13 02:04:21',8,51,'72','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / L / 290 часов',1,''),(590,'2012-05-13 02:04:35',8,51,'73','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / K / 18 часов',1,''),(591,'2012-05-13 02:04:47',8,51,'74','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(592,'2012-05-13 02:05:00',8,51,'75','Ходюк Михаил Андреевич 911 / 1 курc О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / L / 68 часов',1,''),(593,'2012-05-13 02:05:11',8,51,'76','Ходюк Михаил Андреевич 911 / 1 курc О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / K / 2 часов',1,''),(594,'2012-05-13 12:05:56',8,39,'21','410 / 2 курc',1,''),(595,'2012-05-13 12:07:38',8,43,'40','Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(596,'2012-05-13 12:08:02',8,44,'27','Тех механика',1,''),(597,'2012-05-13 12:08:21',8,43,'41','Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(598,'2012-05-13 12:08:33',8,44,'28','Инж графика',1,''),(599,'2012-05-13 12:08:50',8,43,'42','Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(600,'2012-05-13 12:09:11',8,43,'43','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(601,'2012-05-13 12:09:24',8,43,'44','Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(602,'2012-05-13 12:09:45',8,44,'29','Осн соц и полит',1,''),(603,'2012-05-13 12:10:01',8,43,'45','Осн соц и полит / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(604,'2012-05-13 12:10:01',8,43,'46','Осн соц и полит / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(605,'2012-05-13 12:10:12',8,44,'30','Краеведение',1,''),(606,'2012-05-13 12:10:41',8,43,'47','Краеведение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(607,'2012-05-13 12:11:11',8,44,'31','Рус яз и культ речи',1,''),(608,'2012-05-13 12:11:24',8,43,'48','Рус яз и культ речи / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(609,'2012-05-13 12:11:39',8,44,'32','Автомобили',1,''),(610,'2012-05-13 12:12:00',8,44,'33','Электротехника',1,''),(611,'2012-05-13 12:12:08',8,44,'34','Материаловедение',1,''),(612,'2012-05-13 12:12:20',8,44,'35','Осн экономики',1,''),(613,'2012-05-13 12:12:28',8,44,'36','Основы права',1,''),(614,'2012-05-13 12:12:50',8,44,'37','Эколог осн природ',1,''),(615,'2012-05-13 12:13:47',8,43,'49','Автомобили / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(616,'2012-05-13 12:13:59',8,43,'50','Электротехника / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(617,'2012-05-13 12:14:14',8,43,'51','Английский язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(618,'2012-05-13 12:14:29',8,43,'52','Математика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(619,'2012-05-13 12:14:40',8,43,'53','Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(620,'2012-05-13 12:14:52',8,43,'54','Осн экономики / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(621,'2012-05-13 12:15:04',8,43,'55','Основы права / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(622,'2012-05-13 12:15:11',8,43,'56','Эколог осн природ / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(623,'2012-05-13 12:16:13',8,49,'76','Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(624,'2012-05-13 12:16:26',8,49,'77','Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',1,''),(625,'2012-05-13 12:16:40',8,49,'78','Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 176 часов',1,''),(626,'2012-05-13 12:16:57',8,49,'79','Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 14 часов',1,''),(627,'2012-05-13 12:17:06',8,49,'80','Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / E / 10 часов',1,''),(628,'2012-05-13 12:17:23',8,49,'81','Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 144 часов',1,''),(629,'2012-05-13 12:17:32',8,49,'82','Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 10 часов',1,''),(630,'2012-05-13 12:17:49',8,49,'83','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 30 часов',1,''),(631,'2012-05-13 12:18:02',8,49,'84','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 2 часов',1,''),(632,'2012-05-13 12:18:14',8,49,'85','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(633,'2012-05-13 12:18:25',8,49,'86','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',1,''),(634,'2012-05-13 12:18:43',8,49,'87','Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(635,'2012-05-13 12:18:51',8,49,'88','Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',1,''),(636,'2012-05-13 12:19:24',8,51,'77','Анашкина Ольга  Викторовна 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(637,'2012-05-13 12:19:36',8,51,'78','Антонов Владимир Иванович 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',1,''),(638,'2012-05-13 12:19:37',8,51,'79','Антонов Владимир Иванович 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',1,''),(639,'2012-05-13 12:20:12',8,51,'80','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 176 часов',1,''),(640,'2012-05-13 12:20:24',8,51,'81','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 14 часов',1,''),(641,'2012-05-13 12:20:40',8,51,'82','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / E / 10 часов',1,''),(642,'2012-05-13 12:20:54',8,51,'83','Бакланова Раиса Абдуловна 410 / 2 курc Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 144 часов',1,''),(643,'2012-05-13 12:21:21',8,51,'84','Бакланова Раиса Абдуловна 410 / 2 курc Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 10 часов',1,''),(644,'2012-05-13 12:21:41',8,51,'85','Богданов Сергей Григорьевич 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 30 часов',1,''),(645,'2012-05-13 12:21:54',8,51,'86','Богданов Сергей Григорьевич 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 2 часов',1,''),(646,'2012-05-13 12:22:21',8,51,'87','Виноградова Оксана Владимировна 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(647,'2012-05-13 12:22:39',8,51,'88','Виноградова Оксана Владимировна 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',1,''),(648,'2012-05-13 12:22:51',8,51,'89','Винокурова Наталья Васильевна 410 / 2 курc Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(649,'2012-05-13 12:23:05',8,51,'90','Винокурова Наталья Васильевна 410 / 2 курc Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',1,''),(650,'2012-05-13 15:11:53',8,3,'30','test',1,''),(651,'2012-05-13 15:19:08',8,37,'31','Иванон Иван ',1,''),(652,'2012-05-13 15:43:20',8,50,'1','808',2,'Ни одно поле не изменено.'),(653,'2012-05-13 15:46:11',8,50,'2','911',2,'Изменен student.'),(654,'2012-05-13 18:22:01',8,3,'27','vihlyaeva',2,'Изменен password и is_staff.'),(655,'2012-05-13 21:34:06',8,55,'1','лк',1,''),(656,'2012-05-13 21:34:18',8,55,'2','пк',1,''),(657,'2012-05-13 21:34:31',8,55,'3','кн',1,''),(658,'2012-05-13 21:34:45',8,55,'4','эк',1,''),(659,'2012-05-13 21:35:58',8,55,'5','кп',1,''),(660,'2012-05-13 21:36:41',8,55,'6','пк',1,''),(661,'2012-05-14 00:49:23',8,55,'6','пк',2,'Изменен name.'),(662,'2012-05-14 00:51:01',8,55,'5','кп',2,'Изменен name.'),(663,'2012-05-27 16:08:13',8,55,'2','пр',2,'Изменен short_name.'),(664,'2012-05-27 21:44:52',8,50,'3','208',1,''),(665,'2012-05-31 22:56:45',8,3,'8','admin',2,'Изменен password,first_name и last_name.'),(666,'2012-06-04 20:20:57',8,38,'17','Анашкина Ольга  Викторовна',2,'Изменен cabinet и manager.'),(667,'2012-06-15 23:25:34',8,51,'197','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / лк / 0 часов',3,''),(668,'2012-06-15 23:25:34',8,51,'197','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / лк / 0 часов',3,''),(669,'2012-06-15 23:25:34',8,51,'198','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / пр / 0 часов',3,''),(670,'2012-06-15 23:25:34',8,51,'198','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / пр / 0 часов',3,''),(671,'2012-06-15 23:25:34',8,51,'199','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / кн / 0 часов',3,''),(672,'2012-06-15 23:25:34',8,51,'199','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / кн / 0 часов',3,''),(673,'2012-06-15 23:25:34',8,51,'200','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / эк / 0 часов',3,''),(674,'2012-06-15 23:25:34',8,51,'200','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / эк / 0 часов',3,''),(675,'2012-06-15 23:25:34',8,51,'201','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / кп / 0 часов',3,''),(676,'2012-06-15 23:25:34',8,51,'201','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / кп / 0 часов',3,''),(677,'2012-06-15 23:25:34',8,51,'202','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / пк / 0 часов',3,''),(678,'2012-06-15 23:25:34',8,51,'202','Ходюк Михаил Андреевич 509 / 3 курc Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / пк / 0 часов',3,''),(679,'2012-06-15 23:25:35',8,51,'203','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / лк / 62 часов',3,''),(680,'2012-06-15 23:25:35',8,51,'203','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / лк / 62 часов',3,''),(681,'2012-06-15 23:25:35',8,51,'204','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / лк / 62 часов',3,''),(682,'2012-06-15 23:25:35',8,51,'204','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / лк / 62 часов',3,''),(683,'2012-06-15 23:25:35',8,51,'205','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / пр / 0 часов',3,''),(684,'2012-06-15 23:25:35',8,51,'205','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / пр / 0 часов',3,''),(685,'2012-06-15 23:25:35',8,51,'206','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кн / 4 часов',3,''),(686,'2012-06-15 23:25:35',8,51,'206','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кн / 4 часов',3,''),(687,'2012-06-15 23:25:35',8,51,'207','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кн / 4 часов',3,''),(688,'2012-06-15 23:25:35',8,51,'207','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кн / 4 часов',3,''),(689,'2012-06-15 23:25:35',8,51,'208','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кн / 4 часов',3,''),(690,'2012-06-15 23:25:35',8,51,'208','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кн / 4 часов',3,''),(691,'2012-06-15 23:25:35',8,51,'209','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / эк / 0 часов',3,''),(692,'2012-06-15 23:25:35',8,51,'209','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / эк / 0 часов',3,''),(693,'2012-06-15 23:25:35',8,51,'210','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / эк / 0 часов',3,''),(694,'2012-06-15 23:25:35',8,51,'210','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / эк / 0 часов',3,''),(695,'2012-06-15 23:25:35',8,51,'211','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / эк / 0 часов',3,''),(696,'2012-06-15 23:25:35',8,51,'211','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / эк / 0 часов',3,''),(697,'2012-06-15 23:25:35',8,51,'212','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кп / 0 часов',3,''),(698,'2012-06-15 23:25:35',8,51,'212','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кп / 0 часов',3,''),(699,'2012-06-15 23:25:35',8,51,'213','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кп / 0 часов',3,''),(700,'2012-06-15 23:25:35',8,51,'213','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кп / 0 часов',3,''),(701,'2012-06-15 23:25:35',8,51,'214','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кп / 0 часов',3,''),(702,'2012-06-15 23:25:35',8,51,'214','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / кп / 0 часов',3,''),(703,'2012-06-15 23:25:36',8,51,'215','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / пк / 0 часов',3,''),(704,'2012-06-15 23:25:36',8,51,'215','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / пк / 0 часов',3,''),(705,'2012-06-15 23:25:36',8,51,'216','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / пк / 0 часов',3,''),(706,'2012-06-15 23:25:36',8,51,'216','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / пк / 0 часов',3,''),(707,'2012-06-15 23:25:36',8,51,'217','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / пк / 0 часов',3,''),(708,'2012-06-15 23:25:36',8,51,'217','Ходюк Михаил Андреевич 509 / 3 курc БЖ / Техническое обслуживание и ремонт автомобильного транспорта / 6 семестр / пк / 0 часов',3,''),(709,'2012-06-15 23:42:19',8,38,'32','Куличев  Евгений Николаевич',1,''),(710,'2012-06-15 23:43:13',8,38,'14','Гаврилова Надежда Алексеевна',2,'Изменен sex и cabinet.'),(711,'2012-06-15 23:57:23',8,38,'34','Ульянов  Алексей  Анатольевич',1,''),(712,'2012-06-16 00:03:32',8,38,'35','Шадинов Виктор  Валерьевич',1,''),(713,'2012-06-16 00:12:21',8,51,'284','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / лк / 107 часов',3,''),(714,'2012-06-16 00:12:21',8,51,'285','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / лк / 107 часов',3,''),(715,'2012-06-16 00:12:21',8,51,'286','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пр / 0 часов',3,''),(716,'2012-06-16 00:12:21',8,51,'287','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пр / 0 часов',3,''),(717,'2012-06-16 00:12:21',8,51,'288','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кн / 0 часов',3,''),(718,'2012-06-16 00:12:21',8,51,'289','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кн / 0 часов',3,''),(719,'2012-06-16 00:12:21',8,51,'290','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / эк / 0 часов',3,''),(720,'2012-06-16 00:12:21',8,51,'291','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / эк / 0 часов',3,''),(721,'2012-06-16 00:12:21',8,51,'292','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кп / 0 часов',3,''),(722,'2012-06-16 00:12:21',8,51,'293','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кп / 0 часов',3,''),(723,'2012-06-16 00:12:21',8,51,'294','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пк / 0 часов',3,''),(724,'2012-06-16 00:12:21',8,51,'295','Анашкина Ольга  Викторовна 511 / 1 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пк / 0 часов',3,''),(725,'2012-06-16 00:15:44',8,51,'322','Вихляева Надежда Валентиновна 511 / 1 курc Физика / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пр / 0 часов',3,''),(726,'2012-06-16 00:15:44',8,51,'324','Вихляева Надежда Валентиновна 511 / 1 курc Физика / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кн / 16 часов',3,''),(727,'2012-06-16 00:15:44',8,51,'326','Вихляева Надежда Валентиновна 511 / 1 курc Физика / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / эк / 10 часов',3,''),(728,'2012-06-16 00:15:44',8,51,'328','Вихляева Надежда Валентиновна 511 / 1 курc Физика / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кп / 0 часов',3,''),(729,'2012-06-16 00:15:44',8,51,'330','Вихляева Надежда Валентиновна 511 / 1 курc Физика / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пк / 0 часов',3,''),(730,'2012-06-16 00:22:00',8,51,'350','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / лк / 78 часов',3,''),(731,'2012-06-16 00:22:00',8,51,'350','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / лк / 78 часов',3,''),(732,'2012-06-16 00:22:00',8,51,'352','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пр / 0 часов',3,''),(733,'2012-06-16 00:22:00',8,51,'352','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пр / 0 часов',3,''),(734,'2012-06-16 00:22:00',8,51,'354','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кн / 6 часов',3,''),(735,'2012-06-16 00:22:00',8,51,'354','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кн / 6 часов',3,''),(736,'2012-06-16 00:22:01',8,51,'356','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / эк / 10 часов',3,''),(737,'2012-06-16 00:22:01',8,51,'356','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / эк / 10 часов',3,''),(738,'2012-06-16 00:22:01',8,51,'358','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кп / 0 часов',3,''),(739,'2012-06-16 00:22:01',8,51,'358','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / кп / 0 часов',3,''),(740,'2012-06-16 00:22:01',8,51,'360','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пк / 0 часов',3,''),(741,'2012-06-16 00:22:01',8,51,'360','Жидеева Светлана Михайловна 511 / 1 курc Русский язык / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / пк / 0 часов',3,''),(742,'2012-06-16 00:25:22',8,38,'36','Резников  Петр  Викторович',1,''),(743,'2012-06-16 00:38:36',8,39,'22','110 / 2 курc',1,''),(744,'2012-06-16 00:55:12',8,51,'417','Богданов Сергей Григорьевич 110 / 2 курc Информатика / Организация обслуживания в общественном питании / 3 семестр / пр / 0 часов',3,''),(745,'2012-06-16 00:55:12',8,51,'419','Богданов Сергей Григорьевич 110 / 2 курc Информатика / Организация обслуживания в общественном питании / 3 семестр / кн / 3 часов',3,''),(746,'2012-06-16 00:55:12',8,51,'421','Богданов Сергей Григорьевич 110 / 2 курc Информатика / Организация обслуживания в общественном питании / 3 семестр / эк / 0 часов',3,''),(747,'2012-06-16 00:55:12',8,51,'423','Богданов Сергей Григорьевич 110 / 2 курc Информатика / Организация обслуживания в общественном питании / 3 семестр / кп / 0 часов',3,''),(748,'2012-06-16 00:55:12',8,51,'425','Богданов Сергей Григорьевич 110 / 2 курc Информатика / Организация обслуживания в общественном питании / 3 семестр / пк / 0 часов',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'пользователь','main','profile'),(10,'студент','main','students'),(11,'преподователь','main','teachers'),(12,'статус','main','userstatus'),(13,'группа','main','group'),(14,'должность','main','userpost'),(15,'профессиональное образование','main','po'),(16,'специальность','main','speciality'),(17,'тип дисциплины','main','disc_type'),(18,'дисциплина','main','discipline'),(19,'учебный план','main','uchplan'),(20,'час учебного плана','main','uchplanhour'),(21,'учебный год','main','year'),(22,'группу студентов','main','groups'),(23,'студент группы','main','groups_stud'),(24,'план группы','main','groups_plan'),(25,'тарификация','main','tariffication'),(26,'кабинет','schedule','classroom'),(27,'день расписания','schedule','schedule_day'),(28,'расписание','schedule','schedule'),(29,'расписание на каждый день','schedule','schedule_empty'),(30,'расписание для преподавателя','schedule','schedule_filled'),(31,'пропуск','schedule','absences'),(32,'тип темы','journal','types_themes'),(33,'тему','journal','themes'),(34,'оценку','journal','assessment'),(35,'должность','tariffication','userpost'),(36,'статус','tariffication','userstatus'),(37,'студент','tariffication','students'),(38,'преподователя','tariffication','teachers'),(39,'план группы','tariffication','groups_plan'),(40,'учебный год','tariffication','year'),(41,'группу студентов','tariffication','groups'),(42,'специальность','tariffication','speciality'),(43,'учебный план','tariffication','uchplan'),(44,'дисциплина','tariffication','discipline'),(45,'тип дисциплины','tariffication','disc_type'),(46,'пользователь','tariffication','profile'),(47,'группа','tariffication','group'),(48,'профессиональное образование','tariffication','po'),(49,'час учебного плана','tariffication','uchplanhour'),(50,'студент группы','tariffication','groups_stud'),(51,'тарификация','tariffication','tariffication'),(52,'номер пары','schedule','number_lesson'),(53,'день','journal','theme_of_day'),(54,'кабинет','tariffication','classroom'),(55,'тип часа','tariffication','typehour');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0f5dd281919437a255e13a0fbea5ee2c','MmRkYTM4NzIzNzNkZDBkNDg0YmYyMDkyZjBiNjRhZjFjNGM1N2I1ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQt1Lg==\n','2012-05-13 20:29:24'),('114b157d179346ac7db812088279ff49','ZDFjMGJhODhmYzE0YWMyMjViMzYyNTkxNzE3ODliOTQyYWNlYmQzZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQhVCV9tZXNzYWdlc3EFXXEGKGNkamFuZ28uY29udHJpYi5tZXNz\nYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxBymBcQh9cQkoVQpleHRyYV90YWdzcQpYAAAAAFUH\nbWVzc2FnZXELWJ8AAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0JjRgdGC0L7RgNC40Y8iINCx0YvQ\nuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC1\n0YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C40L3Q\nsC5xDFUFbGV2ZWxxDUsUdWJoBymBcQ59cQ8oVQpleHRyYV90YWdzcRBYAAAAAFUHbWVzc2FnZXER\nWE8AAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0J7QsdGJ0LXRgdGC0LLQviIg0LHRi9C7INGD0YHQ\nv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0ucRJVBWxldmVscRNLFHViaAcpgXEUfXEVKFUKZXh0\ncmFfdGFnc3EWWAAAAABVB21lc3NhZ2VxF1hHAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCQ\n0L3Qsy4g0Y/QtyAvINCf0YDQvtCz0YDQsNC80LzQvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQ\ntSDQstGL0YfQuNGB0LvQuNGC0LXQu9GM0L3QvtC5INGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+\n0LzQsNGC0LjQt9C40YDQvtCy0LDQvdC90YvRhSDRgdC40YHRgtC10LwgLyA3INGB0LXQvNC10YHR\ngtGAIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLR\niyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQ\nvdGL0Lkg0L/Qu9Cw0L0ucRhVBWxldmVscRlLFHViaAcpgXEafXEbKFUKZXh0cmFfdGFnc3EcWAAA\nAABVB21lc3NhZ2VxHVhHAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCQ0L3Qsy4g0Y/QtyAv\nINCf0YDQvtCz0YDQsNC80LzQvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQtSDQstGL0YfQuNGB\n0LvQuNGC0LXQu9GM0L3QvtC5INGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+0LzQsNGC0LjQt9C4\n0YDQvtCy0LDQvdC90YvRhSDRgdC40YHRgtC10LwgLyA4INGB0LXQvNC10YHRgtGAIiDQsdGL0Lsg\n0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC\n0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw\n0L0ucR5VBWxldmVscR9LFHViaAcpgXEgfXEhKFUKZXh0cmFfdGFnc3EiWAAAAABVB21lc3NhZ2Vx\nI1hJAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCY0YHRgtC+0YDQuNGPIC8g0J/RgNC+0LPR\ngNCw0LzQvNC90L7QtSDQvtCx0LXRgdC/0LXRh9C10L3QuNC1INCy0YvRh9C40YHQu9C40YLQtdC7\n0YzQvdC+0Lkg0YLQtdGF0L3QuNC60Lgg0Lgg0LDQstGC0L7QvNCw0YLQuNC30LjRgNC+0LLQsNC9\n0L3Ri9GFINGB0LjRgdGC0LXQvCAvIDEg0YHQtdC80LXRgdGC0YAiINCx0YvQuyDRg9GB0L/QtdGI\n0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQ\nsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRg9GH0LXQsdC90YvQuSDQv9C70LDQvS5xJFUFbGV2\nZWxxJUsUdWJoBymBcSZ9cScoVQpleHRyYV90YWdzcShYAAAAAFUHbWVzc2FnZXEpWPQAAADRg9GH\n0LXQsdC90YvQuSDQv9C70LDQvSAi0JjRgdGC0L7RgNC40Y8gLyDQn9GA0L7Qs9GA0LDQvNC80L3Q\nvtC1INC+0LHQtdGB0L/QtdGH0LXQvdC40LUg0LLRi9GH0LjRgdC70LjRgtC10LvRjNC90L7QuSDR\ngtC10YXQvdC40LrQuCDQuCDQsNCy0YLQvtC80LDRgtC40LfQuNGA0L7QstCw0L3QvdGL0YUg0YHQ\nuNGB0YLQtdC8IC8gMiDRgdC10LzQtdGB0YLRgCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7Q\nsdCw0LLQu9C10L0ucSpVBWxldmVscStLFHViaAcpgXEsfXEtKFUKZXh0cmFfdGFnc3EuWAAAAABV\nB21lc3NhZ2VxL1hyAQAA0YfQsNGBINGD0YfQtdCx0L3QvtCz0L4g0L/Qu9Cw0L3QsCAi0JDQvdCz\nLiDRj9C3IC8g0J/RgNC+0LPRgNCw0LzQvNC90L7QtSDQvtCx0LXRgdC/0LXRh9C10L3QuNC1INCy\n0YvRh9C40YHQu9C40YLQtdC70YzQvdC+0Lkg0YLQtdGF0L3QuNC60Lgg0Lgg0LDQstGC0L7QvNCw\n0YLQuNC30LjRgNC+0LLQsNC90L3Ri9GFINGB0LjRgdGC0LXQvCAvIDcg0YHQtdC80LXRgdGC0YAg\nLyBMIC8gMTIwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQ\ntdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQ\nvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQv9C70LDQvdCwLnEwVQVsZXZlbHExSxR1\nYmgHKYFxMn1xMyhVCmV4dHJhX3RhZ3NxNFgAAAAAVQdtZXNzYWdlcTVYcQEAANGH0LDRgSDRg9GH\n0LXQsdC90L7Qs9C+INC/0LvQsNC90LAgItCQ0L3Qsy4g0Y/QtyAvINCf0YDQvtCz0YDQsNC80LzQ\nvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQtSDQstGL0YfQuNGB0LvQuNGC0LXQu9GM0L3QvtC5\nINGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+0LzQsNGC0LjQt9C40YDQvtCy0LDQvdC90YvRhSDR\ngdC40YHRgtC10LwgLyA4INGB0LXQvNC10YHRgtGAIC8gTCAvIDcwINGH0LDRgdC+0LIiINCx0YvQ\nuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC1\n0YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+\n0LPQviDQv9C70LDQvdCwLnE2VQVsZXZlbHE3SxR1YmgHKYFxOH1xOShVCmV4dHJhX3RhZ3NxOlgA\nAAAAVQdtZXNzYWdlcTtYdAEAANGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQsNC90LAgItCY\n0YHRgtC+0YDQuNGPIC8g0J/RgNC+0LPRgNCw0LzQvNC90L7QtSDQvtCx0LXRgdC/0LXRh9C10L3Q\nuNC1INCy0YvRh9C40YHQu9C40YLQtdC70YzQvdC+0Lkg0YLQtdGF0L3QuNC60Lgg0Lgg0LDQstGC\n0L7QvNCw0YLQuNC30LjRgNC+0LLQsNC90L3Ri9GFINGB0LjRgdGC0LXQvCAvIDEg0YHQtdC80LXR\ngdGC0YAgLyBMIC8gMTYwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQ\nsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC1\n0YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQv9C70LDQvdCwLnE8VQVsZXZl\nbHE9SxR1YmgHKYFxPn1xPyhVCmV4dHJhX3RhZ3NxQFgAAAAAVQdtZXNzYWdlcUFYhQEAANGC0LDR\ngNC40YTQuNC60LDRhtC40Y8gItCb0LDQt9Cw0YDQtdCy0LAg0K7Qu9C40Y8gIDgwOCAvIDQg0LrR\ng9GAYyDQkNC90LMuINGP0LcgLyDQn9GA0L7Qs9GA0LDQvNC80L3QvtC1INC+0LHQtdGB0L/QtdGH\n0LXQvdC40LUg0LLRi9GH0LjRgdC70LjRgtC10LvRjNC90L7QuSDRgtC10YXQvdC40LrQuCDQuCDQ\nsNCy0YLQvtC80LDRgtC40LfQuNGA0L7QstCw0L3QvdGL0YUg0YHQuNGB0YLQtdC8IC8gNyDRgdC1\n0LzQtdGB0YLRgCAvIEwgLyAxMjAg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC0\n0L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC\n0Ywg0LXRidC1INC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8ucUJVBWxldmVscUNLFHVi\naAcpgXFEfXFFKFUKZXh0cmFfdGFnc3FGWAAAAABVB21lc3NhZ2VxR1gwAQAA0YLQsNGA0LjRhNC4\n0LrQsNGG0LjRjyAi0JvQsNC30LDRgNC10LLQsCDQrtC70LjRjyAgODA4IC8gNCDQutGD0YBjINCQ\n0L3Qsy4g0Y/QtyAvINCf0YDQvtCz0YDQsNC80LzQvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQ\ntSDQstGL0YfQuNGB0LvQuNGC0LXQu9GM0L3QvtC5INGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+\n0LzQsNGC0LjQt9C40YDQvtCy0LDQvdC90YvRhSDRgdC40YHRgtC10LwgLyA4INGB0LXQvNC10YHR\ngtGAIC8gTCAvIDcwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy\n0LvQtdC9LnFIVQVsZXZlbHFJSxR1YmgHKYFxSn1xSyhVCmV4dHJhX3RhZ3NxTFgAAAAAVQdtZXNz\nYWdlcU1YzQAAANGA0LDRgdC/0LjRgdCw0L3QuNC1ICLQm9Cw0LfQsNGA0LXQstCwINCu0LvQuNGP\nICwg0JDQvdCzLiDRj9C3LCA4MDgsIDIwMTItMDUtMDQsIDEiINCx0YvQuyDRg9GB0L/QtdGI0L3Q\nviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy\n0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgNCw0YHQv9C40YHQsNC90LjQtS5xTlUFbGV2ZWxxT0sU\ndWJoBymBcVB9cVEoVQpleHRyYV90YWdzcVJYAAAAAFUHbWVzc2FnZXFTWNEAAADRgNCw0YHQv9C4\n0YHQsNC90LjQtSAi0JLQsNGF0YDQvtC80LXQtdCyINCS0LjRgtCw0LvQuNC5ICwg0J/QntCa0KEs\nIDgwOCwgMjAxMi0wNS0wNCwgMiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C1\n0L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+\n0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnFUVQVsZXZlbHFVSxR1YmgHKYFxVn1xVyhVCmV4\ndHJhX3RhZ3NxWFgAAAAAVQdtZXNzYWdlcVlYhQAAANGA0LDRgdC/0LjRgdCw0L3QuNC1ICLQltC4\n0LLQvtC00LXRgNC+0LLQsCDQktCw0LvQtdC90YLQuNC90LAgLCDQotCg0J/QnywgNzExLCAyMDEy\nLTA1LTA0LCAzIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS5xWlUFbGV2\nZWxxW0sUdWJoBymBcVx9cV0oVQpleHRyYV90YWdzcV5YAAAAAFUHbWVzc2FnZXFfWIgAAADQutCw\n0LHQuNC90LXRgiAiMjAyIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g\n0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC4\n0L0g0LrQsNCx0LjQvdC10YIucWBVBWxldmVscWFLFHViaAcpgXFifXFjKFUKZXh0cmFfdGFnc3Fk\nWAAAAABVB21lc3NhZ2VxZViIAAAA0LrQsNCx0LjQvdC10YIgIjIwMSIg0LHRi9C7INGD0YHQv9C1\n0YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7Q\nsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC60LDQsdC40L3QtdGCLnFmVQVsZXZlbHFnSxR1\nYmgHKYFxaH1xaShVCmV4dHJhX3RhZ3NxalgAAAAAVQdtZXNzYWdlcWtYiAAAANC60LDQsdC40L3Q\ntdGCICIzMDYiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQ\ntSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQutCw\n0LHQuNC90LXRgi5xbFUFbGV2ZWxxbUsUdWJoBymBcW59cW8oVQpleHRyYV90YWdzcXBYAAAAAFUH\nbWVzc2FnZXFxWH0AAADRgNCw0YHQv9C40YHQsNC90LjQtSAi0JLQsNGF0YDQvtC80LXQtdCyINCS\n0LjRgtCw0LvQuNC5ICwg0J/QntCa0KEsIDgwOCwgMjAxMi0wNS0wNCwgNSIg0LHRi9C7INGD0YHQ\nv9C10YjQvdC+INC40LfQvNC10L3QtdC9LnFyVQVsZXZlbHFzSxR1YmgHKYFxdH1xdShVCmV4dHJh\nX3RhZ3NxdlgAAAAAVQdtZXNzYWdlcXdYfQAAANC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQ\nktCw0YXRgNC+0LzQtdC10LIg0JLQuNGC0LDQu9C40Lkg0JLQu9Cw0LTQuNC80LjRgNC+0LLQuNGH\nIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0ucXhVBWxldmVscXlLFHViaAcp\ngXF6fXF7KFUKZXh0cmFfdGFnc3F8WAAAAABVB21lc3NhZ2VxfVh/AAAA0L/RgNC10L/QvtC00L7Q\nstCw0YLQtdC70Y8gItCW0LjQstC+0LTQtdGA0L7QstCwINCS0LDQu9C10L3RgtC40L3QsCDQktC4\n0LrRgtC+0YDQvtCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LnF+\nVQVsZXZlbHF/SxR1YmgHKYFxgH1xgShVCmV4dHJhX3RhZ3NxglgAAAAAVQdtZXNzYWdlcYNYcQAA\nANC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQm9Cw0LfQsNGA0LXQstCwINCu0LvQuNGPINCd\n0LjQutC+0LvQsNC10LLQvdCwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0u\ncYRVBWxldmVscYVLFHViaAcpgXGGfXGHKFUKZXh0cmFfdGFnc3GIWAAAAABVB21lc3NhZ2VxiVh5\nAAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8gItCT0LDQstGA0LjQu9C+0LLQsCDQndCw0LTQ\ntdC20LTQsCDQkNC70LXQutGB0LXQtdCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQ\nvNC10L3QtdC9LnGKVQVsZXZlbHGLSxR1YmgHKYFxjH1xjShVCmV4dHJhX3RhZ3NxjlgAAAAAVQdt\nZXNzYWdlcY9YKwAAANCf0LDRgNC+0LvRjCDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS5x\nkFUFbGV2ZWxxkUsZdWJldS4=\n','2012-05-18 09:15:43'),('22a1aed379cafc6e4d819e7626af8f04','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-25 11:01:37'),('3bed60a3df6366ab17be1402921c8691','ZDRiMzhjNDQ0NmFlNDMyMjc5NTc0NGU2M2MwZWM4MWRkMjJhYTgzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==\n','2012-06-28 18:41:23'),('3e528699c35d3a88be9936e29d19e37b','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-27 17:30:04'),('4aea3198e6c225e423c72e4f949534e8','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-14 13:01:59'),('58727e6379d3e8d3128be32b6b1fe392','YTEzNzBkMGM4YjE4OWU3YTdkNDJjNmZiNmNhNTQ0MmViOTUwNmRhNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQhVCV9tZXNzYWdlc3EFXXEGKGNkamFuZ28uY29udHJpYi5tZXNz\nYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxBymBcQh9cQkoVQpleHRyYV90YWdzcQpYAAAAAFUH\nbWVzc2FnZXELWOMAAADRgNCw0YHQv9C40YHQsNC90LjQtSAi0JDQvdCw0YjQutC40L3QsCDQntC7\n0YzQs9CwICDQktC40LrRgtC+0YDQvtCy0L3QsCwg0KTQuNC3LdGA0LAsIDkxMSwgMjAxMi0wNS0x\nNCwgMyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy\n0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGA0LDRgdC/\n0LjRgdCw0L3QuNC1LnEMVQVsZXZlbHENSxR1YmgHKYFxDn1xDyhVCmV4dHJhX3RhZ3NxEFgAAAAA\nVQdtZXNzYWdlcRFYkAAAANGA0LDRgdC/0LjRgdCw0L3QuNC1ICLQkNC90YLQvtC90L7QsiDQktC7\n0LDQtNC40LzQuNGAINCY0LLQsNC90L7QstC40YcsINCk0LjQty3RgNCwLCA5MTEsIDIwMTItMDUt\nMTQsIDMiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LnESVQVsZXZlbHET\nSxR1YmgHKYFxFH1xFShVCmV4dHJhX3RhZ3NxFlgAAAAAVQdtZXNzYWdlcRdY+QAAANGA0LDRgdC/\n0LjRgdCw0L3QuNC1ICLQltC40LLQvtC00LXRgNC+0LLQsCDQktCw0LvQtdC90YLQuNC90LAg0JLQ\nuNC60YLQvtGA0L7QstC90LAsINCY0L3RhNC+0YDQvNCw0YLQuNC60LAsIDkxMSwgMjAxMi0wNS0x\nNCwgNSIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy\n0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGA0LDRgdC/\n0LjRgdCw0L3QuNC1LnEYVQVsZXZlbHEZSxR1YmgHKYFxGn1xGyhVCmV4dHJhX3RhZ3NxHFgAAAAA\nVQdtZXNzYWdlcR1Y+QAAANGA0LDRgdC/0LjRgdCw0L3QuNC1ICLQktC40L3QvtCz0YDQsNC00L7Q\nstCwINCe0LrRgdCw0L3QsCDQktC70LDQtNC40LzQuNGA0L7QstC90LAsINCY0L3RhNC+0YDQvNCw\n0YLQuNC60LAsIDkxMSwgMjAxMi0wNS0xNCwgNSIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7Q\nsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg\n0LXRidC1INC+0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnEeVQVsZXZlbHEfSxR1YmgHKYFx\nIH1xIShVCmV4dHJhX3RhZ3NxIlgAAAAAVQdtZXNzYWdlcSNY0QAAANC/0YDQtdC/0L7QtNC+0LLQ\nsNGC0LXQu9GPICLQltC40LTQtdC10LLQsCDQodCy0LXRgtC70LDQvdCwINCc0LjRhdCw0LnQu9C+\n0LLQvdCwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg\n0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0L/RgNC1\n0L/QvtC00L7QstCw0YLQtdC70Y8ucSRVBWxldmVscSVLFHViaAcpgXEmfXEnKFUKZXh0cmFfdGFn\nc3EoWAAAAABVB21lc3NhZ2VxKVhaAQAA0YLQsNGA0LjRhNC40LrQsNGG0LjRjyAi0JbQuNC00LXQ\ntdCy0LAg0KHQstC10YLQu9Cw0L3QsCDQnNC40YXQsNC50LvQvtCy0L3QsCA5MTEgLyAxINC60YPR\ngGMg0JvQuNGC0LXRgNCw0YLRg9GA0LAgLyDQn9GA0LjQutC70LDQtNC90LDRjyDQuNC90YTQvtGA\n0LzQsNGC0LjQutCwINC/0L4g0L7RgtGA0LDRgdC70Y/QvCAvIDEg0YHQtdC80LXRgdGC0YAgLyBM\nIC8gMTE3INGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9\nLiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC0\n0LjQvSDRgtCw0YDQuNGE0LjQutCw0YbQuNGPLnEqVQVsZXZlbHErSxR1YmgHKYFxLH1xLShVCmV4\ndHJhX3RhZ3NxLlgAAAAAVQdtZXNzYWdlcS9YWAEAANGC0LDRgNC40YTQuNC60LDRhtC40Y8gItCW\n0LjQtNC10LXQstCwINCh0LLQtdGC0LvQsNC90LAg0JzQuNGF0LDQudC70L7QstC90LAgOTExIC8g\nMSDQutGD0YBjINCb0LjRgtC10YDQsNGC0YPRgNCwIC8g0J/RgNC40LrQu9Cw0LTQvdCw0Y8g0LjQ\nvdGE0L7RgNC80LDRgtC40LrQsCDQv9C+INC+0YLRgNCw0YHQu9GP0LwgLyAxINGB0LXQvNC10YHR\ngtGAIC8gSyAvIDgg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQ\nu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1\nINC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8ucTBVBWxldmVscTFLFHViaAcpgXEyfXEz\nKFUKZXh0cmFfdGFnc3E0WAAAAABVB21lc3NhZ2VxNVhcAQAA0YLQsNGA0LjRhNC40LrQsNGG0LjR\njyAi0JbQuNC00LXQtdCy0LAg0KHQstC10YLQu9Cw0L3QsCDQnNC40YXQsNC50LvQvtCy0L3QsCA5\nMTEgLyAxINC60YPRgGMg0KDRg9GB0YHQutC40Lkg0Y/Qt9GL0LogLyDQn9GA0LjQutC70LDQtNC9\n0LDRjyDQuNC90YTQvtGA0LzQsNGC0LjQutCwINC/0L4g0L7RgtGA0LDRgdC70Y/QvCAvIDEg0YHQ\ntdC80LXRgdGC0YAgLyBMIC8gNzgg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC0\n0L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC\n0Ywg0LXRidC1INC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8ucTZVBWxldmVscTdLFHVi\naAcpgXE4fXE5KFUKZXh0cmFfdGFnc3E6WAAAAABVB21lc3NhZ2VxO1hbAQAA0YLQsNGA0LjRhNC4\n0LrQsNGG0LjRjyAi0JbQuNC00LXQtdCy0LAg0KHQstC10YLQu9Cw0L3QsCDQnNC40YXQsNC50LvQ\nvtCy0L3QsCA5MTEgLyAxINC60YPRgGMg0KDRg9GB0YHQutC40Lkg0Y/Qt9GL0LogLyDQn9GA0LjQ\nutC70LDQtNC90LDRjyDQuNC90YTQvtGA0LzQsNGC0LjQutCwINC/0L4g0L7RgtGA0LDRgdC70Y/Q\nvCAvIDEg0YHQtdC80LXRgdGC0YAgLyBLIC8gNiDRh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/0LXR\niNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx\n0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQsNGA0LjRhNC40LrQsNGG0LjRjy5xPFUFbGV2\nZWxxPUsUdWJoBymBcT59cT8oVQpleHRyYV90YWdzcUBYAAAAAFUHbWVzc2FnZXFBWFwBAADRgtCw\n0YDQuNGE0LjQutCw0YbQuNGPICLQltC40LTQtdC10LLQsCDQodCy0LXRgtC70LDQvdCwINCc0LjR\nhdCw0LnQu9C+0LLQvdCwIDkxMSAvIDEg0LrRg9GAYyDQoNGD0YHRgdC60LjQuSDRj9C30YvQuiAv\nINCf0YDQuNC60LvQsNC00L3QsNGPINC40L3RhNC+0YDQvNCw0YLQuNC60LAg0L/QviDQvtGC0YDQ\nsNGB0LvRj9C8IC8gMSDRgdC10LzQtdGB0YLRgCAvIEUgLyAxMCDRh9Cw0YHQvtCyIiDQsdGL0Lsg\n0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC\n0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQsNGA0LjRhNC40LrQsNGG0LjR\njy5xQlUFbGV2ZWxxQ0sUdWJoBymBcUR9cUUoVQpleHRyYV90YWdzcUZYAAAAAFUHbWVzc2FnZXFH\nWFwBAADRgtCw0YDQuNGE0LjQutCw0YbQuNGPICLQm9Cw0LfQsNGA0LXQstCwINCu0LvQuNGPINCd\n0LjQutC+0LvQsNC10LLQvdCwIDkxMSAvIDEg0LrRg9GAYyDQkNC90LPQu9C40LnRgdC60LjQuSDR\nj9C30YvQuiAvINCf0YDQuNC60LvQsNC00L3QsNGPINC40L3RhNC+0YDQvNCw0YLQuNC60LAg0L/Q\nviDQvtGC0YDQsNGB0LvRj9C8IC8gMSDRgdC10LzQtdGB0YLRgCAvIEwgLyA3OCDRh9Cw0YHQvtCy\nIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQ\nvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQsNGA0LjRhNC4\n0LrQsNGG0LjRjy5xSFUFbGV2ZWxxSUsUdWJoBymBcUp9cUsoVQpleHRyYV90YWdzcUxYAAAAAFUH\nbWVzc2FnZXFNWFsBAADRgtCw0YDQuNGE0LjQutCw0YbQuNGPICLQm9Cw0LfQsNGA0LXQstCwINCu\n0LvQuNGPINCd0LjQutC+0LvQsNC10LLQvdCwIDkxMSAvIDEg0LrRg9GAYyDQkNC90LPQu9C40LnR\ngdC60LjQuSDRj9C30YvQuiAvINCf0YDQuNC60LvQsNC00L3QsNGPINC40L3RhNC+0YDQvNCw0YLQ\nuNC60LAg0L/QviDQvtGC0YDQsNGB0LvRj9C8IC8gMSDRgdC10LzQtdGB0YLRgCAvIEsgLyA0INGH\n0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQ\ntSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgtCw\n0YDQuNGE0LjQutCw0YbQuNGPLnFOVQVsZXZlbHFPSxR1YmgHKYFxUH1xUShVCmV4dHJhX3RhZ3Nx\nUlgAAAAAVQdtZXNzYWdlcVNYTwEAANGC0LDRgNC40YTQuNC60LDRhtC40Y8gItCf0LDRhdC+0LzQ\nvtCy0LAg0J3QsNGC0LDQu9GM0Y8g0JLQsNC70LXRgNGM0LXQstC90LAgOTExIC8gMSDQutGD0YBj\nINCl0LjQvNC40Y8gLyDQn9GA0LjQutC70LDQtNC90LDRjyDQuNC90YTQvtGA0LzQsNGC0LjQutCw\nINC/0L4g0L7RgtGA0LDRgdC70Y/QvCAvIDEg0YHQtdC80LXRgdGC0YAgLyBMIC8gNzgg0YfQsNGB\n0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy\n0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGC0LDRgNC4\n0YTQuNC60LDRhtC40Y8ucVRVBWxldmVscVVLFHViaAcpgXFWfXFXKFUKZXh0cmFfdGFnc3FYWAAA\nAABVB21lc3NhZ2VxWVhOAQAA0YLQsNGA0LjRhNC40LrQsNGG0LjRjyAi0J/QsNGF0L7QvNC+0LLQ\nsCDQndCw0YLQsNC70YzRjyDQktCw0LvQtdGA0YzQtdCy0L3QsCA5MTEgLyAxINC60YPRgGMg0KXQ\nuNC80LjRjyAvINCf0YDQuNC60LvQsNC00L3QsNGPINC40L3RhNC+0YDQvNCw0YLQuNC60LAg0L/Q\nviDQvtGC0YDQsNGB0LvRj9C8IC8gMSDRgdC10LzQtdGB0YLRgCAvIFAgLyA2INGH0LDRgdC+0LIi\nINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC8\n0L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgtCw0YDQuNGE0LjQ\nutCw0YbQuNGPLnFaVQVsZXZlbHFbSxR1YmgHKYFxXH1xXShVCmV4dHJhX3RhZ3NxXlgAAAAAVQdt\nZXNzYWdlcV9YTgEAANGC0LDRgNC40YTQuNC60LDRhtC40Y8gItCf0LDRhdC+0LzQvtCy0LAg0J3Q\nsNGC0LDQu9GM0Y8g0JLQsNC70LXRgNGM0LXQstC90LAgOTExIC8gMSDQutGD0YBjINCl0LjQvNC4\n0Y8gLyDQn9GA0LjQutC70LDQtNC90LDRjyDQuNC90YTQvtGA0LzQsNGC0LjQutCwINC/0L4g0L7R\ngtGA0LDRgdC70Y/QvCAvIDEg0YHQtdC80LXRgdGC0YAgLyBLIC8gOCDRh9Cw0YHQvtCyIiDQsdGL\n0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQ\ntdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQsNGA0LjRhNC40LrQsNGG\n0LjRjy5xYFUFbGV2ZWxxYUsUdWJoBymBcWJ9cWMoVQpleHRyYV90YWdzcWRYAAAAAFUHbWVzc2Fn\nZXFlWGYBAADRgtCw0YDQuNGE0LjQutCw0YbQuNGPICLQn9Cw0YXQvtC80L7QstCwINCd0LDRgtCw\n0LvRjNGPINCS0LDQu9C10YDRjNC10LLQvdCwIDkxMSAvIDEg0LrRg9GAYyDQkdC40L7Qu9C+0LPQ\nuNGPL9Ct0LrQvtC70L7Qs9C40Y8gLyDQn9GA0LjQutC70LDQtNC90LDRjyDQuNC90YTQvtGA0LzQ\nsNGC0LjQutCwINC/0L4g0L7RgtGA0LDRgdC70Y/QvCAvIDEg0YHQtdC80LXRgdGC0YAgLyBMIC8g\nNzgg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd\n0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9\nINGC0LDRgNC40YTQuNC60LDRhtC40Y8ucWZVBWxldmVscWdLFHViaAcpgXFofXFpKFUKZXh0cmFf\ndGFnc3FqWAAAAABVB21lc3NhZ2Vxa1hlAQAA0YLQsNGA0LjRhNC40LrQsNGG0LjRjyAi0J/QsNGF\n0L7QvNC+0LLQsCDQndCw0YLQsNC70YzRjyDQktCw0LvQtdGA0YzQtdCy0L3QsCA5MTEgLyAxINC6\n0YPRgGMg0JHQuNC+0LvQvtCz0LjRjy/QrdC60L7Qu9C+0LPQuNGPIC8g0J/RgNC40LrQu9Cw0LTQ\nvdCw0Y8g0LjQvdGE0L7RgNC80LDRgtC40LrQsCDQv9C+INC+0YLRgNCw0YHQu9GP0LwgLyAxINGB\n0LXQvNC10YHRgtGAIC8gUCAvIDQg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC0\n0L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC\n0Ywg0LXRidC1INC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8ucWxVBWxldmVscW1LFHVi\naAcpgXFufXFvKFUKZXh0cmFfdGFnc3FwWAAAAABVB21lc3NhZ2VxcVhlAQAA0YLQsNGA0LjRhNC4\n0LrQsNGG0LjRjyAi0J/QsNGF0L7QvNC+0LLQsCDQndCw0YLQsNC70YzRjyDQktCw0LvQtdGA0YzQ\ntdCy0L3QsCA5MTEgLyAxINC60YPRgGMg0JHQuNC+0LvQvtCz0LjRjy/QrdC60L7Qu9C+0LPQuNGP\nIC8g0J/RgNC40LrQu9Cw0LTQvdCw0Y8g0LjQvdGE0L7RgNC80LDRgtC40LrQsCDQv9C+INC+0YLR\ngNCw0YHQu9GP0LwgLyAxINGB0LXQvNC10YHRgtGAIC8gSyAvIDgg0YfQsNGB0L7QsiIg0LHRi9C7\nINGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXR\ngtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC4\n0Y8ucXJVBWxldmVscXNLFHViaAcpgXF0fXF1KFUKZXh0cmFfdGFnc3F2WAAAAABVB21lc3NhZ2Vx\nd1h7AAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8gItCg0LDRh9C60L7QstCwINCQ0L3QsNGB\n0YLQsNGB0LjRjyDQnNC40YXQsNC50LvQvtCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC0\n0L7QsdCw0LLQu9C10L0ucXhVBWxldmVscXlLFHViaAcpgXF6fXF7KFUKZXh0cmFfdGFnc3F8WAAA\nAABVB21lc3NhZ2VxfVhYAQAA0YLQsNGA0LjRhNC40LrQsNGG0LjRjyAi0KDQsNGH0LrQvtCy0LAg\n0JDQvdCw0YHRgtCw0YHQuNGPINCc0LjRhdCw0LnQu9C+0LLQvdCwIDkxMSAvIDEg0LrRg9GAYyDQ\nntCx0YnQtdGB0YLQstC+IC8g0J/RgNC40LrQu9Cw0LTQvdCw0Y8g0LjQvdGE0L7RgNC80LDRgtC4\n0LrQsCDQv9C+INC+0YLRgNCw0YHQu9GP0LwgLyAxINGB0LXQvNC10YHRgtGAIC8gTCAvIDExNCDR\nh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC2\n0LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQ\nsNGA0LjRhNC40LrQsNGG0LjRjy5xflUFbGV2ZWxxf0sUdWJoBymBcYB9cYEoVQpleHRyYV90YWdz\ncYJYAAAAAFUHbWVzc2FnZXGDWFYBAADRgtCw0YDQuNGE0LjQutCw0YbQuNGPICLQoNCw0YfQutC+\n0LLQsCDQkNC90LDRgdGC0LDRgdC40Y8g0JzQuNGF0LDQudC70L7QstC90LAgOTExIC8gMSDQutGD\n0YBjINCe0LHRidC10YHRgtCy0L4gLyDQn9GA0LjQutC70LDQtNC90LDRjyDQuNC90YTQvtGA0LzQ\nsNGC0LjQutCwINC/0L4g0L7RgtGA0LDRgdC70Y/QvCAvIDEg0YHQtdC80LXRgdGC0YAgLyBLIC8g\nOCDRh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3Q\nuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g\n0YLQsNGA0LjRhNC40LrQsNGG0LjRjy5xhFUFbGV2ZWxxhUsUdWJoBymBcYZ9cYcoVQpleHRyYV90\nYWdzcYhYAAAAAFUHbWVzc2FnZXGJWFYBAADRgtCw0YDQuNGE0LjQutCw0YbQuNGPICLQoNCw0YfQ\nutC+0LLQsCDQkNC90LDRgdGC0LDRgdC40Y8g0JzQuNGF0LDQudC70L7QstC90LAgOTExIC8gMSDQ\nutGD0YBjINCY0YHRgtC+0YDQuNGPIC8g0J/RgNC40LrQu9Cw0LTQvdCw0Y8g0LjQvdGE0L7RgNC8\n0LDRgtC40LrQsCDQv9C+INC+0YLRgNCw0YHQu9GP0LwgLyAxINGB0LXQvNC10YHRgtGAIC8gTCAv\nIDExNCDRh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g\n0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC4\n0L0g0YLQsNGA0LjRhNC40LrQsNGG0LjRjy5xilUFbGV2ZWxxi0sUdWJoBymBcYx9cY0oVQpleHRy\nYV90YWdzcY5YAAAAAFUHbWVzc2FnZXGPWFUBAADRgtCw0YDQuNGE0LjQutCw0YbQuNGPICLQoNCw\n0YfQutC+0LLQsCDQkNC90LDRgdGC0LDRgdC40Y8g0JzQuNGF0LDQudC70L7QstC90LAgOTExIC8g\nMSDQutGD0YBjINCY0YHRgtC+0YDQuNGPIC8g0J/RgNC40LrQu9Cw0LTQvdCw0Y8g0LjQvdGE0L7R\ngNC80LDRgtC40LrQsCDQv9C+INC+0YLRgNCw0YHQu9GP0LwgLyAxINGB0LXQvNC10YHRgtGAIC8g\nSyAvIDEwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9\nLiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC0\n0LjQvSDRgtCw0YDQuNGE0LjQutCw0YbQuNGPLnGQVQVsZXZlbHGRSxR1YmgHKYFxkn1xkyhVCmV4\ndHJhX3RhZ3NxlFgAAAAAVQdtZXNzYWdlcZVYXAEAANGC0LDRgNC40YTQuNC60LDRhtC40Y8gItCh\n0LvQtdC/0YPQttC90LjQutC+0LLQsCDQnNCw0YDQuNC90LAg0JjQstCw0L3QvtCy0L3QsCA5MTEg\nLyAxINC60YPRgGMg0JzQsNGC0LXQvNCw0YLQuNC60LAgLyDQn9GA0LjQutC70LDQtNC90LDRjyDQ\nuNC90YTQvtGA0LzQsNGC0LjQutCwINC/0L4g0L7RgtGA0LDRgdC70Y/QvCAvIDEg0YHQtdC80LXR\ngdGC0YAgLyBMIC8gMjkwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQ\nsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC1\n0YnQtSDQvtC00LjQvSDRgtCw0YDQuNGE0LjQutCw0YbQuNGPLnGWVQVsZXZlbHGXSxR1YmgHKYFx\nmH1xmShVCmV4dHJhX3RhZ3NxmlgAAAAAVQdtZXNzYWdlcZtYWwEAANGC0LDRgNC40YTQuNC60LDR\nhtC40Y8gItCh0LvQtdC/0YPQttC90LjQutC+0LLQsCDQnNCw0YDQuNC90LAg0JjQstCw0L3QvtCy\n0L3QsCA5MTEgLyAxINC60YPRgGMg0JzQsNGC0LXQvNCw0YLQuNC60LAgLyDQn9GA0LjQutC70LDQ\ntNC90LDRjyDQuNC90YTQvtGA0LzQsNGC0LjQutCwINC/0L4g0L7RgtGA0LDRgdC70Y/QvCAvIDEg\n0YHQtdC80LXRgdGC0YAgLyBLIC8gMTgg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQ\nuNGC0Ywg0LXRidC1INC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8ucZxVBWxldmVscZ1L\nFHViaAcpgXGefXGfKFUKZXh0cmFfdGFnc3GgWAAAAABVB21lc3NhZ2VxoVhbAQAA0YLQsNGA0LjR\nhNC40LrQsNGG0LjRjyAi0KHQu9C10L/Rg9C20L3QuNC60L7QstCwINCc0LDRgNC40L3QsCDQmNCy\n0LDQvdC+0LLQvdCwIDkxMSAvIDEg0LrRg9GAYyDQnNCw0YLQtdC80LDRgtC40LrQsCAvINCf0YDQ\nuNC60LvQsNC00L3QsNGPINC40L3RhNC+0YDQvNCw0YLQuNC60LAg0L/QviDQvtGC0YDQsNGB0LvR\nj9C8IC8gMSDRgdC10LzQtdGB0YLRgCAvIEUgLyAxMCDRh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/\n0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQ\nvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQsNGA0LjRhNC40LrQsNGG0LjRjy5xolUF\nbGV2ZWxxo0sUdWJoBymBcaR9caUoVQpleHRyYV90YWdzcaZYAAAAAFUHbWVzc2FnZXGnWEMBAADR\ngtCw0YDQuNGE0LjQutCw0YbQuNGPICLQpdC+0LTRjtC6INCc0LjRhdCw0LjQuyDQkNC90LTRgNC1\n0LXQstC40YcgOTExIC8gMSDQutGD0YBjINCeLtCRLtCWIC8g0J/RgNC40LrQu9Cw0LTQvdCw0Y8g\n0LjQvdGE0L7RgNC80LDRgtC40LrQsCDQv9C+INC+0YLRgNCw0YHQu9GP0LwgLyAxINGB0LXQvNC1\n0YHRgtGAIC8gTCAvIDY4INGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQ\nsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC1\n0YnQtSDQvtC00LjQvSDRgtCw0YDQuNGE0LjQutCw0YbQuNGPLnGoVQVsZXZlbHGpSxR1YmgHKYFx\nqn1xqyhVCmV4dHJhX3RhZ3NxrFgAAAAAVQdtZXNzYWdlca1YQgEAANGC0LDRgNC40YTQuNC60LDR\nhtC40Y8gItCl0L7QtNGO0Log0JzQuNGF0LDQuNC7INCQ0L3QtNGA0LXQtdCy0LjRhyA5MTEgLyAx\nINC60YPRgGMg0J4u0JEu0JYgLyDQn9GA0LjQutC70LDQtNC90LDRjyDQuNC90YTQvtGA0LzQsNGC\n0LjQutCwINC/0L4g0L7RgtGA0LDRgdC70Y/QvCAvIDEg0YHQtdC80LXRgdGC0YAgLyBLIC8gMiDR\nh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC2\n0LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQ\nsNGA0LjRhNC40LrQsNGG0LjRjy5xrlUFbGV2ZWxxr0sUdWJoBymBcbB9cbEoVQpleHRyYV90YWdz\ncbJYAAAAAFUHbWVzc2FnZXGzWE8AAADQv9C70LDQvSDQs9GA0YPQv9C/0YsgIjQxMCAvIDIg0LrR\ng9GAYyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0ucbRVBWxldmVscbVL\nFHViaAcpgXG2fXG3KFUKZXh0cmFfdGFnc3G4WAAAAABVB21lc3NhZ2VxuVgpAQAA0YPRh9C10LHQ\nvdGL0Lkg0L/Qu9Cw0L0gItCk0LjQty3RgNCwIC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx\n0YHQu9GD0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM\n0L3QvtCz0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIiDQsdGL0Lsg\n0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC\n0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw\n0L0ucbpVBWxldmVscbtLFHViaAcpgXG8fXG9KFUKZXh0cmFfdGFnc3G+WAAAAABVB21lc3NhZ2Vx\nv1ioAAAA0LTQuNGB0YbQuNC/0LvQuNC90LAgItCi0LXRhSDQvNC10YXQsNC90LjQutCwIiDQsdGL\n0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQ\ntdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0LTQuNGB0YbQuNC/0LvQuNC9\n0LAuccBVBWxldmVsccFLFHViaAcpgXHCfXHDKFUKZXh0cmFfdGFnc3HEWAAAAABVB21lc3NhZ2Vx\nxVg1AQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCi0LXRhSDQvNC10YXQsNC90LjQutCwIC8g\n0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC8\n0L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3QvtCz0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAg\nLyAzINGB0LXQvNC10YHRgtGAIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQ\nvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7Q\ntNC40L0g0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0uccZVBWxldmVsccdLFHViaAcpgXHIfXHJKFUK\nZXh0cmFfdGFnc3HKWAAAAABVB21lc3NhZ2Vxy1imAAAA0LTQuNGB0YbQuNC/0LvQuNC90LAgItCY\n0L3QtiDQs9GA0LDRhNC40LrQsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C1\n0L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+\n0LTQuNC9INC00LjRgdGG0LjQv9C70LjQvdCwLnHMVQVsZXZlbHHNSxR1YmgHKYFxzn1xzyhVCmV4\ndHJhX3RhZ3Nx0FgAAAAAVQdtZXNzYWdlcdFYMwEAANGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9ICLQ\nmNC90LYg0LPRgNCw0YTQuNC60LAgLyDQotC10YXQvdC40YfQtdGB0LrQvtC1INC+0LHRgdC70YPQ\nttC40LLQsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+0LHQuNC70YzQvdC+0LPQ\nviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAiINCx0YvQuyDRg9GB0L/Q\ntdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+\n0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRg9GH0LXQsdC90YvQuSDQv9C70LDQvS5x0lUF\nbGV2ZWxx00sUdWJoBymBcdR9cdUoVQpleHRyYV90YWdzcdZYAAAAAFUHbWVzc2FnZXHXWDQBAADR\ng9GH0LXQsdC90YvQuSDQv9C70LDQvSAi0JjQvdGE0L7RgNC80LDRgtC40LrQsCAvINCi0LXRhdC9\n0LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1INC4INGA0LXQvNC+0L3RgiDQ\nsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC90YHQv9C+0YDRgtCwIC8gMyDRgdC1\n0LzQtdGB0YLRgCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQ\nttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGD\n0YfQtdCx0L3Ri9C5INC/0LvQsNC9LnHYVQVsZXZlbHHZSxR1YmgHKYFx2n1x2yhVCmV4dHJhX3Rh\nZ3Nx3FgAAAAAVQdtZXNzYWdlcd1YNwEAANGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9ICLQndC10LzQ\ntdGG0LrQuNC5INGP0LfRi9C6IC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD0LbQ\nuNCy0LDQvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3QvtCz0L4g\n0YLRgNCw0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIiDQsdGL0Lsg0YPRgdC/0LXR\niNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx\n0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0ucd5VBWxl\ndmVscd9LFHViaAcpgXHgfXHhKFUKZXh0cmFfdGFnc3HiWAAAAABVB21lc3NhZ2Vx41isAAAA0LTQ\nuNGB0YbQuNC/0LvQuNC90LAgItCe0YHQvSDRgdC+0YYg0Lgg0L/QvtC70LjRgiIg0LHRi9C7INGD\n0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1\nINC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC00LjRgdGG0LjQv9C70LjQvdCwLnHk\nVQVsZXZlbHHlSxR1YmgHKYFx5n1x5yhVCmV4dHJhX3RhZ3Nx6FgAAAAAVQdtZXNzYWdlcelYOQEA\nANGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9ICLQntGB0L0g0YHQvtGGINC4INC/0L7Qu9C40YIgLyDQ\notC10YXQvdC40YfQtdGB0LrQvtC1INC+0LHRgdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC10LzQ\nvtC90YIg0LDQstGC0L7QvNC+0LHQuNC70YzQvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAv\nIDMg0YHQtdC80LXRgdGC0YAiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9\nLiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC0\n0LjQvSDRg9GH0LXQsdC90YvQuSDQv9C70LDQvS5x6lUFbGV2ZWxx60sUdWJoBymBcex9ce0oVQpl\neHRyYV90YWdzce5YAAAAAFUHbWVzc2FnZXHvWKcAAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0JrR\ngNCw0LXQstC10LTQtdC90LjQtSIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C1\n0L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+\n0LTQuNC9INC00LjRgdGG0LjQv9C70LjQvdCwLnHwVQVsZXZlbHHxSxR1YmgHKYFx8n1x8yhVCmV4\ndHJhX3RhZ3Nx9FgAAAAAVQdtZXNzYWdlcfVYNAEAANGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9ICLQ\nmtGA0LDQtdCy0LXQtNC10L3QuNC1IC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD\n0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3QvtCz\n0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIiDQsdGL0Lsg0YPRgdC/\n0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQ\nvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0ucfZV\nBWxldmVscfdLFHViaAcpgXH4fXH5KFUKZXh0cmFfdGFnc3H6WAAAAABVB21lc3NhZ2Vx+1izAAAA\n0LTQuNGB0YbQuNC/0LvQuNC90LAgItCg0YPRgSDRj9C3INC4INC60YPQu9GM0YIg0YDQtdGH0Lgi\nINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC8\n0L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Q\nu9C40L3QsC5x/FUFbGV2ZWxx/UsUdWJoBymBcf59cf8oVQpleHRyYV90YWdzcgABAABYAAAAAFUH\nbWVzc2FnZXIBAQAAWEABAADRg9GH0LXQsdC90YvQuSDQv9C70LDQvSAi0KDRg9GBINGP0Lcg0Lgg\n0LrRg9C70YzRgiDRgNC10YfQuCAvINCi0LXRhdC90LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C2\n0LjQstCw0L3QuNC1INC4INGA0LXQvNC+0L3RgiDQsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+\nINGC0YDQsNC90YHQv9C+0YDRgtCwIC8gMyDRgdC10LzQtdGB0YLRgCIg0LHRi9C7INGD0YHQv9C1\n0YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7Q\nsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9LnICAQAA\nVQVsZXZlbHIDAQAASxR1YmgHKYFyBAEAAH1yBQEAAChVCmV4dHJhX3RhZ3NyBgEAAFgAAAAAVQdt\nZXNzYWdlcgcBAABYpQAAANC00LjRgdGG0LjQv9C70LjQvdCwICLQkNCy0YLQvtC80L7QsdC40LvQ\nuCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg\n0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC00LjRgdGG0LjQ\nv9C70LjQvdCwLnIIAQAAVQVsZXZlbHIJAQAASxR1YmgHKYFyCgEAAH1yCwEAAChVCmV4dHJhX3Rh\nZ3NyDAEAAFgAAAAAVQdtZXNzYWdlcg0BAABYrQAAANC00LjRgdGG0LjQv9C70LjQvdCwICLQrdC7\n0LXQutGC0YDQvtGC0LXRhdC90LjQutCwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQ\nstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ\n0LUg0L7QtNC40L0g0LTQuNGB0YbQuNC/0LvQuNC90LAucg4BAABVBWxldmVscg8BAABLFHViaAcp\ngXIQAQAAfXIRAQAAKFUKZXh0cmFfdGFnc3ISAQAAWAAAAABVB21lc3NhZ2VyEwEAAFixAAAA0LTQ\nuNGB0YbQuNC/0LvQuNC90LAgItCc0LDRgtC10YDQuNCw0LvQvtCy0LXQtNC10L3QuNC1IiDQsdGL\n0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQ\ntdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0LTQuNGB0YbQuNC/0LvQuNC9\n0LAuchQBAABVBWxldmVschUBAABLFHViaAcpgXIWAQAAfXIXAQAAKFUKZXh0cmFfdGFnc3IYAQAA\nWAAAAABVB21lc3NhZ2VyGQEAAFiqAAAA0LTQuNGB0YbQuNC/0LvQuNC90LAgItCe0YHQvSDRjdC6\n0L7QvdC+0LzQuNC60LgiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQ\nndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQ\nvSDQtNC40YHRhtC40L/Qu9C40L3QsC5yGgEAAFUFbGV2ZWxyGwEAAEsUdWJoBymBchwBAAB9ch0B\nAAAoVQpleHRyYV90YWdzch4BAABYAAAAAFUHbWVzc2FnZXIfAQAAWKgAAADQtNC40YHRhtC40L/Q\nu9C40L3QsCAi0J7RgdC90L7QstGLINC/0YDQsNCy0LAiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQ\ntNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjR\ngtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C40L3QsC5yIAEAAFUFbGV2ZWxyIQEA\nAEsUdWJoBymBciIBAAB9ciMBAAAoVQpleHRyYV90YWdzciQBAABYAAAAAFUHbWVzc2FnZXIlAQAA\nWLEAAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0K3QutC+0LvQvtCzINC+0YHQvSDQv9GA0LjRgNC+\n0LQiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGL\nINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC4\n0L/Qu9C40L3QsC5yJgEAAFUFbGV2ZWxyJwEAAEsUdWJoBymBcigBAAB9cikBAAAoVQpleHRyYV90\nYWdzcioBAABYAAAAAFUHbWVzc2FnZXIrAQAAWDIBAADRg9GH0LXQsdC90YvQuSDQv9C70LDQvSAi\n0JDQstGC0L7QvNC+0LHQuNC70LggLyDQotC10YXQvdC40YfQtdGB0LrQvtC1INC+0LHRgdC70YPQ\nttC40LLQsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+0LHQuNC70YzQvdC+0LPQ\nviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAiINCx0YvQuyDRg9GB0L/Q\ntdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+\n0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRg9GH0LXQsdC90YvQuSDQv9C70LDQvS5yLAEA\nAFUFbGV2ZWxyLQEAAEsUdWJoBymBci4BAAB9ci8BAAAoVQpleHRyYV90YWdzcjABAABYAAAAAFUH\nbWVzc2FnZXIxAQAAWDoBAADRg9GH0LXQsdC90YvQuSDQv9C70LDQvSAi0K3Qu9C10LrRgtGA0L7R\ngtC10YXQvdC40LrQsCAvINCi0LXRhdC90LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw\n0L3QuNC1INC4INGA0LXQvNC+0L3RgiDQsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQ\nsNC90YHQv9C+0YDRgtCwIC8gMyDRgdC10LzQtdGB0YLRgCIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQ\nuNGC0Ywg0LXRidC1INC+0LTQuNC9INGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9LnIyAQAAVQVsZXZl\nbHIzAQAASxR1YmgHKYFyNAEAAH1yNQEAAChVCmV4dHJhX3RhZ3NyNgEAAFgAAAAAVQdtZXNzYWdl\ncjcBAABYOwEAANGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9ICLQkNC90LPQu9C40LnRgdC60LjQuSDR\nj9C30YvQuiAvINCi0LXRhdC90LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1\nINC4INGA0LXQvNC+0L3RgiDQsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC90YHQ\nv9C+0YDRgtCwIC8gMyDRgdC10LzQtdGB0YLRgCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7Q\nsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg\n0LXRidC1INC+0LTQuNC9INGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9LnI4AQAAVQVsZXZlbHI5AQAA\nSxR1YmgHKYFyOgEAAH1yOwEAAChVCmV4dHJhX3RhZ3NyPAEAAFgAAAAAVQdtZXNzYWdlcj0BAABY\nMgEAANGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9ICLQnNCw0YLQtdC80LDRgtC40LrQsCAvINCi0LXR\nhdC90LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1INC4INGA0LXQvNC+0L3R\ngiDQsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC90YHQv9C+0YDRgtCwIC8gMyDR\ngdC10LzQtdGB0YLRgCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd\n0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9\nINGD0YfQtdCx0L3Ri9C5INC/0LvQsNC9LnI+AQAAVQVsZXZlbHI/AQAASxR1YmgHKYFyQAEAAH1y\nQQEAAChVCmV4dHJhX3RhZ3NyQgEAAFgAAAAAVQdtZXNzYWdlckMBAABYPgEAANGD0YfQtdCx0L3R\ni9C5INC/0LvQsNC9ICLQnNCw0YLQtdGA0LjQsNC70L7QstC10LTQtdC90LjQtSAvINCi0LXRhdC9\n0LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1INC4INGA0LXQvNC+0L3RgiDQ\nsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC90YHQv9C+0YDRgtCwIC8gMyDRgdC1\n0LzQtdGB0YLRgCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQ\nttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGD\n0YfQtdCx0L3Ri9C5INC/0LvQsNC9LnJEAQAAVQVsZXZlbHJFAQAASxR1YmgHKYFyRgEAAH1yRwEA\nAChVCmV4dHJhX3RhZ3NySAEAAFgAAAAAVQdtZXNzYWdlckkBAABYNwEAANGD0YfQtdCx0L3Ri9C5\nINC/0LvQsNC9ICLQntGB0L0g0Y3QutC+0L3QvtC80LjQutC4IC8g0KLQtdGF0L3QuNGH0LXRgdC6\n0L7QtSDQvtCx0YHQu9GD0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQ\nvtCx0LjQu9GM0L3QvtCz0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGA\nIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQ\nvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQvdGL\n0Lkg0L/Qu9Cw0L0uckoBAABVBWxldmVscksBAABLFHViaAcpgXJMAQAAfXJNAQAAKFUKZXh0cmFf\ndGFnc3JOAQAAWAAAAABVB21lc3NhZ2VyTwEAAFg1AQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0g\nItCe0YHQvdC+0LLRiyDQv9GA0LDQstCwIC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQ\nu9GD0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3Q\nvtCz0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIiDQsdGL0Lsg0YPR\ngdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg\n0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0u\nclABAABVBWxldmVsclEBAABLFHViaAcpgXJSAQAAfXJTAQAAKFUKZXh0cmFfdGFnc3JUAQAAWAAA\nAABVB21lc3NhZ2VyVQEAAFg+AQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCt0LrQvtC70L7Q\nsyDQvtGB0L0g0L/RgNC40YDQvtC0IC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD\n0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3QvtCz\n0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIiDQsdGL0Lsg0YPRgdC/\n0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQ\nvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0uclYB\nAABVBWxldmVsclcBAABLFHViaAcpgXJYAQAAfXJZAQAAKFUKZXh0cmFfdGFnc3JaAQAAWAAAAABV\nB21lc3NhZ2VyWwEAAFhTAQAA0YfQsNGBINGD0YfQtdCx0L3QvtCz0L4g0L/Qu9Cw0L3QsCAi0KTQ\nuNC3LdGA0LAgLyDQotC10YXQvdC40YfQtdGB0LrQvtC1INC+0LHRgdC70YPQttC40LLQsNC90LjQ\ntSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+0LHQuNC70YzQvdC+0LPQviDRgtGA0LDQvdGB\n0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAgLyBMIC8gNjQg0YfQsNGB0L7QsiIg0LHRi9C7\nINGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXR\ngtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGH0LDRgSDRg9GH0LXQsdC90L7Q\ns9C+INC/0LvQsNC90LAuclwBAABVBWxldmVscl0BAABLFHViaAcpgXJeAQAAfXJfAQAAKFUKZXh0\ncmFfdGFnc3JgAQAAWAAAAABVB21lc3NhZ2VyYQEAAFhTAQAA0YfQsNGBINGD0YfQtdCx0L3QvtCz\n0L4g0L/Qu9Cw0L3QsCAi0KTQuNC3LdGA0LAgLyDQotC10YXQvdC40YfQtdGB0LrQvtC1INC+0LHR\ngdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+0LHQuNC70YzQ\nvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAgLyBMIC8gNTQg\n0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQ\nttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGH\n0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQsNC90LAucmIBAABVBWxldmVscmMBAABLFHViaAcp\ngXJkAQAAfXJlAQAAKFUKZXh0cmFfdGFnc3JmAQAAWAAAAABVB21lc3NhZ2VyZwEAAFhgAQAA0YfQ\nsNGBINGD0YfQtdCx0L3QvtCz0L4g0L/Qu9Cw0L3QsCAi0KLQtdGFINC80LXRhdCw0L3QuNC60LAg\nLyDQotC10YXQvdC40YfQtdGB0LrQvtC1INC+0LHRgdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC1\n0LzQvtC90YIg0LDQstGC0L7QvNC+0LHQuNC70YzQvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQ\nsCAvIDMg0YHQtdC80LXRgdGC0YAgLyBMIC8gMTc2INGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/Q\ntdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+\n0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQv9C7\n0LDQvdCwLnJoAQAAVQVsZXZlbHJpAQAASxR1YmgHKYFyagEAAH1yawEAAChVCmV4dHJhX3RhZ3Ny\nbAEAAFgAAAAAVQdtZXNzYWdlcm0BAABYXwEAANGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQ\nsNC90LAgItCi0LXRhSDQvNC10YXQsNC90LjQutCwIC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQ\nvtCx0YHQu9GD0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQ\nu9GM0L3QvtCz0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIC8gSyAv\nIDE0INGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQ\nndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQ\nvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQv9C70LDQvdCwLnJuAQAAVQVsZXZlbHJvAQAASxR1\nYmgHKYFycAEAAH1ycQEAAChVCmV4dHJhX3RhZ3NycgEAAFgAAAAAVQdtZXNzYWdlcnMBAABYXwEA\nANGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQsNC90LAgItCi0LXRhSDQvNC10YXQsNC90LjQ\nutCwIC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD0LbQuNCy0LDQvdC40LUg0Lgg\n0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3QvtCz0L4g0YLRgNCw0L3RgdC/0L7R\ngNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIC8gRSAvIDEwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB\n0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQ\ntNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQ\nv9C70LDQvdCwLnJ0AQAAVQVsZXZlbHJ1AQAASxR1YmgHKYFydgEAAH1ydwEAAChVCmV4dHJhX3Rh\nZ3NyeAEAAFgAAAAAVQdtZXNzYWdlcnkBAABYXgEAANGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/\n0LvQsNC90LAgItCY0L3QtiDQs9GA0LDRhNC40LrQsCAvINCi0LXRhdC90LjRh9C10YHQutC+0LUg\n0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1INC4INGA0LXQvNC+0L3RgiDQsNCy0YLQvtC80L7QsdC4\n0LvRjNC90L7Qs9C+INGC0YDQsNC90YHQv9C+0YDRgtCwIC8gMyDRgdC10LzQtdGB0YLRgCAvIEwg\nLyAxNDQg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0u\nINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQ\nuNC9INGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQsNC90LAucnoBAABVBWxldmVscnsBAABL\nFHViaAcpgXJ8AQAAfXJ9AQAAKFUKZXh0cmFfdGFnc3J+AQAAWAAAAABVB21lc3NhZ2VyfwEAAFhd\nAQAA0YfQsNGBINGD0YfQtdCx0L3QvtCz0L4g0L/Qu9Cw0L3QsCAi0JjQvdC2INCz0YDQsNGE0LjQ\nutCwIC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD0LbQuNCy0LDQvdC40LUg0Lgg\n0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3QvtCz0L4g0YLRgNCw0L3RgdC/0L7R\ngNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIC8gSyAvIDEwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB\n0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQ\ntNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQ\nv9C70LDQvdCwLnKAAQAAVQVsZXZlbHKBAQAASxR1YmgHKYFyggEAAH1ygwEAAChVCmV4dHJhX3Rh\nZ3NyhAEAAFgAAAAAVQdtZXNzYWdlcoUBAABYXgEAANGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/\n0LvQsNC90LAgItCY0L3RhNC+0YDQvNCw0YLQuNC60LAgLyDQotC10YXQvdC40YfQtdGB0LrQvtC1\nINC+0LHRgdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+0LHQ\nuNC70YzQvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAgLyBM\nIC8gMzAg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0u\nINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQ\nuNC9INGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQsNC90LAucoYBAABVBWxldmVscocBAABL\nFHViaAcpgXKIAQAAfXKJAQAAKFUKZXh0cmFfdGFnc3KKAQAAWAAAAABVB21lc3NhZ2VyiwEAAFhd\nAQAA0YfQsNGBINGD0YfQtdCx0L3QvtCz0L4g0L/Qu9Cw0L3QsCAi0JjQvdGE0L7RgNC80LDRgtC4\n0LrQsCAvINCi0LXRhdC90LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1INC4\nINGA0LXQvNC+0L3RgiDQsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC90YHQv9C+\n0YDRgtCwIC8gMyDRgdC10LzQtdGB0YLRgCAvIEsgLyAyINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB\n0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQ\ntNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQ\nv9C70LDQvdCwLnKMAQAAVQVsZXZlbHKNAQAASxR1YmgHKYFyjgEAAH1yjwEAAChVCmV4dHJhX3Rh\nZ3NykAEAAFgAAAAAVQdtZXNzYWdlcpEBAABYXgEAANGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/\n0LvQsNC90LAgItCY0L3RhNC+0YDQvNCw0YLQuNC60LAgLyDQotC10YXQvdC40YfQtdGB0LrQvtC1\nINC+0LHRgdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+0LHQ\nuNC70YzQvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAgLyBM\nIC8gNjQg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0u\nINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQ\nuNC9INGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQsNC90LAucpIBAABVBWxldmVscpMBAABL\nFHViaAcpgXKUAQAAfXKVAQAAKFUKZXh0cmFfdGFnc3KWAQAAWAAAAABVB21lc3NhZ2VylwEAAFhd\nAQAA0YfQsNGBINGD0YfQtdCx0L3QvtCz0L4g0L/Qu9Cw0L3QsCAi0JjQvdGE0L7RgNC80LDRgtC4\n0LrQsCAvINCi0LXRhdC90LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1INC4\nINGA0LXQvNC+0L3RgiDQsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC90YHQv9C+\n0YDRgtCwIC8gMyDRgdC10LzQtdGB0YLRgCAvIEsgLyA0INGH0LDRgdC+0LIiINCx0YvQuyDRg9GB\n0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQ\ntNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQ\nv9C70LDQvdCwLnKYAQAAVQVsZXZlbHKZAQAASxR1YmgHKYFymgEAAH1ymwEAAChVCmV4dHJhX3Rh\nZ3NynAEAAFgAAAAAVQdtZXNzYWdlcp0BAABYYQEAANGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/\n0LvQsNC90LAgItCd0LXQvNC10YbQutC40Lkg0Y/Qt9GL0LogLyDQotC10YXQvdC40YfQtdGB0LrQ\nvtC1INC+0LHRgdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+\n0LHQuNC70YzQvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAg\nLyBMIC8gNjQg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C1\n0L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+\n0LTQuNC9INGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQsNC90LAucp4BAABVBWxldmVscp8B\nAABLFHViaAcpgXKgAQAAfXKhAQAAKFUKZXh0cmFfdGFnc3KiAQAAWAAAAABVB21lc3NhZ2VyowEA\nAFhgAQAA0YfQsNGBINGD0YfQtdCx0L3QvtCz0L4g0L/Qu9Cw0L3QsCAi0J3QtdC80LXRhtC60LjQ\nuSDRj9C30YvQuiAvINCi0LXRhdC90LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3Q\nuNC1INC4INGA0LXQvNC+0L3RgiDQsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC9\n0YHQv9C+0YDRgtCwIC8gMyDRgdC10LzQtdGB0YLRgCAvIEsgLyA0INGH0LDRgdC+0LIiINCx0YvQ\nuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC1\n0YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+\n0LPQviDQv9C70LDQvdCwLnKkAQAAVQVsZXZlbHKlAQAASxR1YmgHKYFypgEAAH1ypwEAAChVCmV4\ndHJhX3RhZ3NyqAEAAFgAAAAAVQdtZXNzYWdlcqkBAABYfQEAANGC0LDRgNC40YTQuNC60LDRhtC4\n0Y8gItCQ0L3QsNGI0LrQuNC90LAg0J7Qu9GM0LPQsCAg0JLQuNC60YLQvtGA0L7QstC90LAgNDEw\nIC8gMiDQutGD0YBjINCk0LjQty3RgNCwIC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQ\nu9GD0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3Q\nvtCz0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIC8gTCAvIDY0INGH\n0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQ\ntSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgtCw\n0YDQuNGE0LjQutCw0YbQuNGPLnKqAQAAVQVsZXZlbHKrAQAASxR1YmgHKYFyrAEAAH1yrQEAAChV\nCmV4dHJhX3RhZ3NyrgEAAFgAAAAAVQdtZXNzYWdlcq8BAABYfAEAANGC0LDRgNC40YTQuNC60LDR\nhtC40Y8gItCQ0L3RgtC+0L3QvtCyINCS0LvQsNC00LjQvNC40YAg0JjQstCw0L3QvtCy0LjRhyA0\nMTAgLyAyINC60YPRgGMg0KTQuNC3LdGA0LAgLyDQotC10YXQvdC40YfQtdGB0LrQvtC1INC+0LHR\ngdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+0LHQuNC70YzQ\nvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAgLyBMIC8gNTQg\n0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQ\nttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGC\n0LDRgNC40YTQuNC60LDRhtC40Y8ucrABAABVBWxldmVscrEBAABLFHViaAcpgXKyAQAAfXKzAQAA\nKFUKZXh0cmFfdGFnc3K0AQAAWAAAAABVB21lc3NhZ2VytQEAAFiJAQAA0YLQsNGA0LjRhNC40LrQ\nsNGG0LjRjyAi0JHQsNC60LvQsNC90L7QstCwINCg0LDQuNGB0LAg0JDQsdC00YPQu9C+0LLQvdCw\nIDQxMCAvIDIg0LrRg9GAYyDQotC10YUg0LzQtdGF0LDQvdC40LrQsCAvINCi0LXRhdC90LjRh9C1\n0YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1INC4INGA0LXQvNC+0L3RgiDQsNCy0YLQ\nvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC90YHQv9C+0YDRgtCwIC8gMyDRgdC10LzQtdGB\n0YLRgCAvIEwgLyAxNzYg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw\n0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXR\nidC1INC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8ucrYBAABVBWxldmVscrcBAABLFHVi\naAcpgXK4AQAAfXK5AQAAKFUKZXh0cmFfdGFnc3K6AQAAWAAAAABVB21lc3NhZ2VyuwEAAFiIAQAA\n0YLQsNGA0LjRhNC40LrQsNGG0LjRjyAi0JHQsNC60LvQsNC90L7QstCwINCg0LDQuNGB0LAg0JDQ\nsdC00YPQu9C+0LLQvdCwIDQxMCAvIDIg0LrRg9GAYyDQotC10YUg0LzQtdGF0LDQvdC40LrQsCAv\nINCi0LXRhdC90LjRh9C10YHQutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1INC4INGA0LXQ\nvNC+0L3RgiDQsNCy0YLQvtC80L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC90YHQv9C+0YDRgtCw\nIC8gMyDRgdC10LzQtdGB0YLRgCAvIEsgLyAxNCDRh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/0LXR\niNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx\n0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQsNGA0LjRhNC40LrQsNGG0LjRjy5yvAEAAFUF\nbGV2ZWxyvQEAAEsUdWJoBymBcr4BAAB9cr8BAAAoVQpleHRyYV90YWdzcsABAABYAAAAAFUHbWVz\nc2FnZXLBAQAAWIgBAADRgtCw0YDQuNGE0LjQutCw0YbQuNGPICLQkdCw0LrQu9Cw0L3QvtCy0LAg\n0KDQsNC40YHQsCDQkNCx0LTRg9C70L7QstC90LAgNDEwIC8gMiDQutGD0YBjINCi0LXRhSDQvNC1\n0YXQsNC90LjQutCwIC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD0LbQuNCy0LDQ\nvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3QvtCz0L4g0YLRgNCw\n0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIC8gRSAvIDEwINGH0LDRgdC+0LIiINCx\n0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7Q\nttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgtCw0YDQuNGE0LjQutCw\n0YbQuNGPLnLCAQAAVQVsZXZlbHLDAQAASxR1YmgHKYFyxAEAAH1yxQEAAChVCmV4dHJhX3RhZ3Ny\nxgEAAFgAAAAAVQdtZXNzYWdlcscBAABYhwEAANGC0LDRgNC40YTQuNC60LDRhtC40Y8gItCR0LDQ\nutC70LDQvdC+0LLQsCDQoNCw0LjRgdCwINCQ0LHQtNGD0LvQvtCy0L3QsCA0MTAgLyAyINC60YPR\ngGMg0JjQvdC2INCz0YDQsNGE0LjQutCwIC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQ\nu9GD0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3Q\nvtCz0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIC8gTCAvIDE0NCDR\nh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC2\n0LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQ\nsNGA0LjRhNC40LrQsNGG0LjRjy5yyAEAAFUFbGV2ZWxyyQEAAEsUdWJoBymBcsoBAAB9cssBAAAo\nVQpleHRyYV90YWdzcswBAABYAAAAAFUHbWVzc2FnZXLNAQAAWIYBAADRgtCw0YDQuNGE0LjQutCw\n0YbQuNGPICLQkdCw0LrQu9Cw0L3QvtCy0LAg0KDQsNC40YHQsCDQkNCx0LTRg9C70L7QstC90LAg\nNDEwIC8gMiDQutGD0YBjINCY0L3QtiDQs9GA0LDRhNC40LrQsCAvINCi0LXRhdC90LjRh9C10YHQ\nutC+0LUg0L7QsdGB0LvRg9C20LjQstCw0L3QuNC1INC4INGA0LXQvNC+0L3RgiDQsNCy0YLQvtC8\n0L7QsdC40LvRjNC90L7Qs9C+INGC0YDQsNC90YHQv9C+0YDRgtCwIC8gMyDRgdC10LzQtdGB0YLR\ngCAvIEsgLyAxMCDRh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC7\n0LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg\n0L7QtNC40L0g0YLQsNGA0LjRhNC40LrQsNGG0LjRjy5yzgEAAFUFbGV2ZWxyzwEAAEsUdWJoBymB\nctABAAB9ctEBAAAoVQpleHRyYV90YWdzctIBAABYAAAAAFUHbWVzc2FnZXLTAQAAWIsBAADRgtCw\n0YDQuNGE0LjQutCw0YbQuNGPICLQkdC+0LPQtNCw0L3QvtCyINCh0LXRgNCz0LXQuSDQk9GA0LjQ\ns9C+0YDRjNC10LLQuNGHIDQxMCAvIDIg0LrRg9GAYyDQmNC90YTQvtGA0LzQsNGC0LjQutCwIC8g\n0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD0LbQuNCy0LDQvdC40LUg0Lgg0YDQtdC8\n0L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3QvtCz0L4g0YLRgNCw0L3RgdC/0L7RgNGC0LAg\nLyAzINGB0LXQvNC10YHRgtGAIC8gTCAvIDMwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI\n0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQ\nsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgtCw0YDQuNGE0LjQutCw0YbQuNGPLnLUAQAAVQVs\nZXZlbHLVAQAASxR1YmgHKYFy1gEAAH1y1wEAAChVCmV4dHJhX3RhZ3Ny2AEAAFgAAAAAVQdtZXNz\nYWdlctkBAABYigEAANGC0LDRgNC40YTQuNC60LDRhtC40Y8gItCR0L7Qs9C00LDQvdC+0LIg0KHQ\ntdGA0LPQtdC5INCT0YDQuNCz0L7RgNGM0LXQstC40YcgNDEwIC8gMiDQutGD0YBjINCY0L3RhNC+\n0YDQvNCw0YLQuNC60LAgLyDQotC10YXQvdC40YfQtdGB0LrQvtC1INC+0LHRgdC70YPQttC40LLQ\nsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+0LHQuNC70YzQvdC+0LPQviDRgtGA\n0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAgLyBLIC8gMiDRh9Cw0YHQvtCyIiDQ\nsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+\n0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQsNGA0LjRhNC40LrQ\nsNGG0LjRjy5y2gEAAFUFbGV2ZWxy2wEAAEsUdWJoBymBctwBAAB9ct0BAAAoVQpleHRyYV90YWdz\nct4BAABYAAAAAFUHbWVzc2FnZXLfAQAAWJMBAADRgtCw0YDQuNGE0LjQutCw0YbQuNGPICLQktC4\n0L3QvtCz0YDQsNC00L7QstCwINCe0LrRgdCw0L3QsCDQktC70LDQtNC40LzQuNGA0L7QstC90LAg\nNDEwIC8gMiDQutGD0YBjINCY0L3RhNC+0YDQvNCw0YLQuNC60LAgLyDQotC10YXQvdC40YfQtdGB\n0LrQvtC1INC+0LHRgdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7Q\nvNC+0LHQuNC70YzQvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC\n0YAgLyBMIC8gNjQg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQ\nu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1\nINC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8ucuABAABVBWxldmVscuEBAABLFHViaAcp\ngXLiAQAAfXLjAQAAKFUKZXh0cmFfdGFnc3LkAQAAWAAAAABVB21lc3NhZ2Vy5QEAAFiSAQAA0YLQ\nsNGA0LjRhNC40LrQsNGG0LjRjyAi0JLQuNC90L7Qs9GA0LDQtNC+0LLQsCDQntC60YHQsNC90LAg\n0JLQu9Cw0LTQuNC80LjRgNC+0LLQvdCwIDQxMCAvIDIg0LrRg9GAYyDQmNC90YTQvtGA0LzQsNGC\n0LjQutCwIC8g0KLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD0LbQuNCy0LDQvdC40LUg\n0Lgg0YDQtdC80L7QvdGCINCw0LLRgtC+0LzQvtCx0LjQu9GM0L3QvtCz0L4g0YLRgNCw0L3RgdC/\n0L7RgNGC0LAgLyAzINGB0LXQvNC10YHRgtGAIC8gSyAvIDQg0YfQsNGB0L7QsiIg0LHRi9C7INGD\n0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1\nINC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8u\ncuYBAABVBWxldmVscucBAABLFHViaAcpgXLoAQAAfXLpAQAAKFUKZXh0cmFfdGFnc3LqAQAAWAAA\nAABVB21lc3NhZ2Vy6wEAAFiSAQAA0YLQsNGA0LjRhNC40LrQsNGG0LjRjyAi0JLQuNC90L7QutGD\n0YDQvtCy0LAg0J3QsNGC0LDQu9GM0Y8g0JLQsNGB0LjQu9GM0LXQstC90LAgNDEwIC8gMiDQutGD\n0YBjINCd0LXQvNC10YbQutC40Lkg0Y/Qt9GL0LogLyDQotC10YXQvdC40YfQtdGB0LrQvtC1INC+\n0LHRgdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC10LzQvtC90YIg0LDQstGC0L7QvNC+0LHQuNC7\n0YzQvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAvIDMg0YHQtdC80LXRgdGC0YAgLyBMIC8g\nNjQg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd\n0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9\nINGC0LDRgNC40YTQuNC60LDRhtC40Y8ucuwBAABVBWxldmVscu0BAABLFHViaAcpgXLuAQAAfXLv\nAQAAKFUKZXh0cmFfdGFnc3LwAQAAWAAAAABVB21lc3NhZ2Vy8QEAAFiRAQAA0YLQsNGA0LjRhNC4\n0LrQsNGG0LjRjyAi0JLQuNC90L7QutGD0YDQvtCy0LAg0J3QsNGC0LDQu9GM0Y8g0JLQsNGB0LjQ\nu9GM0LXQstC90LAgNDEwIC8gMiDQutGD0YBjINCd0LXQvNC10YbQutC40Lkg0Y/Qt9GL0LogLyDQ\notC10YXQvdC40YfQtdGB0LrQvtC1INC+0LHRgdC70YPQttC40LLQsNC90LjQtSDQuCDRgNC10LzQ\nvtC90YIg0LDQstGC0L7QvNC+0LHQuNC70YzQvdC+0LPQviDRgtGA0LDQvdGB0L/QvtGA0YLQsCAv\nIDMg0YHQtdC80LXRgdGC0YAgLyBLIC8gNCDRh9Cw0YHQvtCyIiDQsdGL0Lsg0YPRgdC/0LXRiNC9\n0L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQ\nstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YLQsNGA0LjRhNC40LrQsNGG0LjRjy5y8gEAAFUFbGV2\nZWxy8wEAAEsUdWJldS4=\n','2012-05-27 12:23:06'),('726e150a856a3fcb40e73ee172911ae1','YmNjZGU3ZGJhZDkyNzM1Y2ZjYmM1NDVlZWMwMDYzYzhiY2NlYmUzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-05-22 00:22:03'),('72b3d2c131a0537f55f8fb772f2f803b','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-25 11:01:38'),('8e438fb347e16bfcc0375bf7f24d93ee','ODEwMDZjMDU4MmQ5NWEzZmM0MWJhZGNiMGEyOWNiMmM0NDBmYmRmODqAAn1xAShVCV9tZXNzYWdl\nc3ECXXEDY2RqYW5nby5jb250cmliLm1lc3NhZ2VzLnN0b3JhZ2UuYmFzZQpNZXNzYWdlCnEEKYFx\nBX1xBihVCmV4dHJhX3RhZ3NxB1gAAAAAVQdtZXNzYWdlcQhYiQAAANGC0LjQvyDRh9Cw0YHQsCAi\n0LrQvyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LiDQndC40LbQtSDQstGL\nINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgtC40L8g0YfQ\nsNGB0LAuVQVsZXZlbHEJSxR1YmFVDV9hdXRoX3VzZXJfaWSKAQhVEl9hdXRoX3VzZXJfYmFja2Vu\nZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1Lg==\n','2012-05-28 00:51:01'),('9c20b6b7a26f20fc3f0d9fef18b52f6c','MmRkYTM4NzIzNzNkZDBkNDg0YmYyMDkyZjBiNjRhZjFjNGM1N2I1ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQt1Lg==\n','2012-06-18 21:55:05'),('9e2f53fa3d59c6bbde647b9701987f1f','YmNjZGU3ZGJhZDkyNzM1Y2ZjYmM1NDVlZWMwMDYzYzhiY2NlYmUzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-05-14 13:01:59'),('a1e44e9fc98da76d8cd739c0092e1458','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-17 17:31:09'),('a9da73c40bd5b8fa740d3de5107727a4','ZWI5ZjI4MzdiMDY5NjhkMGE1MzNhMTI0ZGIwYjg4NmFmNDQ0Yzg4YTqAAn1xAShVCV9tZXNzYWdl\nc3ECXXEDKGNkamFuZ28uY29udHJpYi5tZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxBCmB\ncQV9cQYoVQpleHRyYV90YWdzcQdYAAAAAFUHbWVzc2FnZXEIWOMAAADRgNCw0YHQv9C40YHQsNC9\n0LjQtSAi0JDQvdCw0YjQutC40L3QsCDQntC70YzQs9CwICDQktC40LrRgtC+0YDQvtCy0L3QsCwg\n0KTQuNC3LdGA0LAsIDkxMSwgMjAxMi0wNS0wNywgMyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC0\n0L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC\n0Ywg0LXRidC1INC+0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnEJVQVsZXZlbHEKSxR1YmgE\nKYFxC31xDChVCmV4dHJhX3RhZ3NxDVgAAAAAVQdtZXNzYWdlcQ5Y4wAAANGA0LDRgdC/0LjRgdCw\n0L3QuNC1ICLQkNC90LDRiNC60LjQvdCwINCe0LvRjNCz0LAgINCS0LjQutGC0L7RgNC+0LLQvdCw\nLCDQpNC40Lct0YDQsCwgOTExLCAyMDEyLTA1LTA3LCA1IiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g\n0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC4\n0YLRjCDQtdGJ0LUg0L7QtNC40L0g0YDQsNGB0L/QuNGB0LDQvdC40LUucQ9VBWxldmVscRBLFHVi\naAQpgXERfXESKFUKZXh0cmFfdGFnc3ETWAAAAABVB21lc3NhZ2VxFFjiAAAA0YDQsNGB0L/QuNGB\n0LDQvdC40LUgItCQ0L3RgtC+0L3QvtCyINCS0LvQsNC00LjQvNC40YAg0JjQstCw0L3QvtCy0LjR\nhywg0KTQuNC3LdGA0LAsIDkxMSwgMjAxMi0wNS0wNywgMiIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQ\nuNGC0Ywg0LXRidC1INC+0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnEVVQVsZXZlbHEWSxR1\nYmgEKYFxF31xGChVCmV4dHJhX3RhZ3NxGVgAAAAAVQdtZXNzYWdlcRpYkAAAANGA0LDRgdC/0LjR\ngdCw0L3QuNC1ICLQkNC90YLQvtC90L7QsiDQktC70LDQtNC40LzQuNGAINCY0LLQsNC90L7QstC4\n0YcsINCk0LjQty3RgNCwLCA5MTEsIDIwMTItMDUtMDcsIDQiINCx0YvQuyDRg9GB0L/QtdGI0L3Q\nviDQtNC+0LHQsNCy0LvQtdC9LnEbVQVsZXZlbHEcSxR1YmgEKYFxHX1xHihVCmV4dHJhX3RhZ3Nx\nH1gAAAAAVQdtZXNzYWdlcSBY2QAAANC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQktC40L3Q\nvtCz0YDQsNC00L7QstCwINCe0LrRgdCw0L3QsCDQktC70LDQtNC40LzQuNGA0L7QstC90LAiINCx\n0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7Q\nttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQv9GA0LXQv9C+0LTQvtCy\n0LDRgtC10LvRjy5xIVUFbGV2ZWxxIksUdWJoBCmBcSN9cSQoVQpleHRyYV90YWdzcSVYAAAAAFUH\nbWVzc2FnZXEmWNEAAADQv9GA0LXQv9C+0LTQvtCy0LDRgtC10LvRjyAi0J/QsNGF0L7QvNC+0LLQ\nsCDQndCw0YLQsNC70YzRjyDQktCw0LvQtdGA0YzQtdCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQ\nvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw\n0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPLnEnVQVs\nZXZlbHEoSxR1YmgEKYFxKX1xKihVCmV4dHJhX3RhZ3NxK1gAAAAAVQdtZXNzYWdlcSxY0wAAANC/\n0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQodC70LXQv9GD0LbQvdC40LrQvtCy0LAg0JzQsNGA\n0LjQvdCwINCY0LLQsNC90L7QstC90LAiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy\n0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQ\ntSDQvtC00LjQvSDQv9GA0LXQv9C+0LTQvtCy0LDRgtC10LvRjy5xLVUFbGV2ZWxxLksUdWJoBCmB\ncS99cTAoVQpleHRyYV90YWdzcTFYAAAAAFUHbWVzc2FnZXEyWMcAAADQv9GA0LXQv9C+0LTQvtCy\n0LDRgtC10LvRjyAi0KXQvtC00Y7QuiDQnNC40YXQsNC40Lsg0JDQvdC00YDQtdC10LLQuNGHIiDQ\nsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+\n0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0L/RgNC10L/QvtC00L7Q\nstCw0YLQtdC70Y8ucTNVBWxldmVscTRLFHViaAQpgXE1fXE2KFUKZXh0cmFfdGFnc3E3WAAAAABV\nB21lc3NhZ2VxOFjNAAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8gItCR0LDQutC70LDQvdC+\n0LLQsCDQoNCw0LjRgdCwINCQ0LHQtNGD0LvQvtCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQ\nuNGC0Ywg0LXRidC1INC+0LTQuNC9INC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPLnE5VQVsZXZl\nbHE6SxR1YmgEKYFxO31xPChVCmV4dHJhX3RhZ3NxPVgAAAAAVQdtZXNzYWdlcT5Y1wAAANC/0YDQ\ntdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQkdCw0YDQuNC90L7QsiDQktCw0YHQuNC70LjQuSDQmtC+\n0L3RgdGC0LDQvdGC0LjQvdC+0LLQuNGHIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQ\nstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ\n0LUg0L7QtNC40L0g0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8ucT9VBWxldmVscUBLFHViaAQp\ngXFBfXFCKFUKZXh0cmFfdGFnc3FDWAAAAABVB21lc3NhZ2VxRFjRAAAA0L/RgNC10L/QvtC00L7Q\nstCw0YLQtdC70Y8gItCR0L7Qs9C00LDQvdC+0LIg0KHQtdGA0LPQtdC5INCT0YDQuNCz0L7RgNGM\n0LXQstC40YciINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQ\ntSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQv9GA\n0LXQv9C+0LTQvtCy0LDRgtC10LvRjy5xRVUFbGV2ZWxxRksUdWJlVQ1fYXV0aF91c2VyX2lkcUeK\nAQhVEl9hdXRoX3VzZXJfYmFja2VuZHFIVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1v\nZGVsQmFja2VuZHFJdS4=\n','2012-05-25 11:33:43'),('d92d810dd6e0f7cef64b83cb72770530','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-27 13:37:57'),('e5328297808ea73d238dde6f588df251','ZDRiMzhjNDQ0NmFlNDMyMjc5NTc0NGU2M2MwZWM4MWRkMjJhYTgzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==\n','2012-06-28 18:41:23'),('e62b37906f79bfdcace75d6047127588','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-13 20:29:00'),('edb6714b88e040ec441ac7e9959fcdf9','YmNjZGU3ZGJhZDkyNzM1Y2ZjYmM1NDVlZWMwMDYzYzhiY2NlYmUzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-06-30 01:13:35');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_ptr_id` int(11) NOT NULL,
  `describe` varchar(150) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  CONSTRAINT `group_ptr_id_refs_id_2690094b` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_status`
--

DROP TABLE IF EXISTS `group_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `userstatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`userstatus_id`),
  KEY `group_status_425ae3c4` (`group_id`),
  KEY `group_status_1f306917` (`userstatus_id`),
  CONSTRAINT `group_id_refs_group_ptr_id_23a4540f` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_ptr_id`),
  CONSTRAINT `userstatus_id_refs_id_6635e41a` FOREIGN KEY (`userstatus_id`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_status`
--

LOCK TABLES `group_status` WRITE;
/*!40000 ALTER TABLE `group_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `semestr` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `groups_1d8e9887` (`spec_id`),
  CONSTRAINT `spec_id_refs_id_2317142e` FOREIGN KEY (`spec_id`) REFERENCES `speciality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (11,4,808,'7, 8'),(12,4,809,'5, 6'),(13,5,108,'7, 8'),(14,5,109,'5, 6'),(15,5,110,'3, 4'),(16,5,111,'1, 2'),(17,6,711,'1, 2'),(18,6,710,'3, 4'),(19,6,709,'5, 6'),(21,9,209,'5, 6'),(22,7,908,'7, 8'),(23,7,910,'3, 4'),(24,7,911,'1, 2'),(25,8,410,'3, 4'),(26,8,507,'9, 10'),(27,8,508,'7, 8'),(28,8,509,'5, 6'),(29,8,510,'3, 4'),(30,8,511,'1, 2');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_plan`
--

DROP TABLE IF EXISTS `groups_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `course` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_plan_15a19819` (`year_id`),
  KEY `groups_plan_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_285979b8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `year_id_refs_id_782d46b` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_plan`
--

LOCK TABLES `groups_plan` WRITE;
/*!40000 ALTER TABLE `groups_plan` DISABLE KEYS */;
INSERT INTO `groups_plan` VALUES (7,2,11,4),(8,2,12,3),(9,2,17,1),(10,2,18,2),(11,2,22,4),(12,2,23,2),(14,2,21,3),(15,2,26,5),(16,2,27,4),(17,2,28,3),(18,2,29,2),(19,2,30,1),(20,2,24,1),(21,2,25,2),(22,2,15,2);
/*!40000 ALTER TABLE `groups_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_stud`
--

DROP TABLE IF EXISTS `groups_stud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_stud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_stud_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_19713723` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_stud`
--

LOCK TABLES `groups_stud` WRITE;
/*!40000 ALTER TABLE `groups_stud` DISABLE KEYS */;
INSERT INTO `groups_stud` VALUES (1,11),(2,24);
/*!40000 ALTER TABLE `groups_stud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_stud_student`
--

DROP TABLE IF EXISTS `groups_stud_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_stud_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groups_stud_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_stud_id` (`groups_stud_id`,`students_id`),
  KEY `groups_stud_student_3504022` (`groups_stud_id`),
  KEY `groups_stud_student_2ea7519c` (`students_id`),
  CONSTRAINT `groups_stud_id_refs_id_2115ea9b` FOREIGN KEY (`groups_stud_id`) REFERENCES `groups_stud` (`id`),
  CONSTRAINT `students_id_refs_profile_ptr_id_2b837593` FOREIGN KEY (`students_id`) REFERENCES `students` (`profile_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_stud_student`
--

LOCK TABLES `groups_stud_student` WRITE;
/*!40000 ALTER TABLE `groups_stud_student` DISABLE KEYS */;
INSERT INTO `groups_stud_student` VALUES (9,1,9),(10,1,10),(11,2,9),(12,2,10),(13,2,31);
/*!40000 ALTER TABLE `groups_stud_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po`
--

DROP TABLE IF EXISTS `po`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po`
--

LOCK TABLES `po` WRITE;
/*!40000 ALTER TABLE `po` DISABLE KEYS */;
/*!40000 ALTER TABLE `po` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_ptr_id` int(11) NOT NULL,
  `other_name` varchar(100) DEFAULT NULL,
  `b_day` date DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_ptr_id`),
  CONSTRAINT `user_ptr_id_refs_id_59efa1d8` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (9,'',NULL,'',NULL),(10,'',NULL,'',NULL),(11,'Владимирович',NULL,'',NULL),(12,'Викторовна',NULL,'','B'),(13,'Николаевна',NULL,'','B'),(14,'Алексеевна',NULL,'','W'),(15,'Алексеевна',NULL,'','B'),(16,'Ивановна',NULL,'','B'),(17,'Викторовна',NULL,'','W'),(18,'Иванович',NULL,'','M'),(19,'Владимировна',NULL,'','W'),(20,'Валерьевна',NULL,'','W'),(21,'Ивановна',NULL,'','W'),(22,'Андреевич',NULL,'','M'),(23,'Абдуловна',NULL,'','W'),(24,'Константинович',NULL,'','M'),(25,'Григорьевич',NULL,'','M'),(26,'Васильевна',NULL,'','W'),(27,'Валентиновна',NULL,'','W'),(28,'Михайловна',NULL,'','W'),(29,'Михайловна',NULL,'','W'),(31,'',NULL,'',NULL),(32,'Николаевич',NULL,'','M'),(34,'Анатольевич',NULL,'','M'),(35,' Валерьевич',NULL,'',NULL),(36,'Викторович',NULL,'',NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `day_id` int(11) NOT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `num_less` int(11) NOT NULL,
  `comment` longtext,
  `count_hours` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_5a80280f` (`plan_id`),
  KEY `schedule_2831cc73` (`day_id`),
  KEY `schedule_3fa87ba8` (`classroom_id`),
  CONSTRAINT `classroom_id_refs_id_5193473c` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`id`),
  CONSTRAINT `day_id_refs_id_71dbb36c` FOREIGN KEY (`day_id`) REFERENCES `schedule_day` (`id`),
  CONSTRAINT `plan_id_refs_id_a121fc8` FOREIGN KEY (`plan_id`) REFERENCES `tariffication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (31,44,14,NULL,1,'',2),(32,44,14,NULL,3,'',2),(34,45,14,NULL,2,'',2),(35,44,14,NULL,2,'',2),(36,52,14,NULL,4,'',2),(37,50,14,NULL,5,'',2),(39,53,16,NULL,1,'',2),(40,50,17,11,1,'',2),(41,48,17,NULL,2,'',2),(42,44,17,NULL,3,'',2),(43,45,17,NULL,3,'',2),(44,53,17,NULL,5,'',2),(46,44,17,NULL,4,NULL,2),(47,52,18,NULL,1,NULL,2),(48,NULL,18,NULL,1,NULL,2),(49,48,18,NULL,2,NULL,2),(50,54,19,NULL,1,NULL,2),(51,54,19,NULL,2,NULL,2),(52,54,19,NULL,3,NULL,2),(53,54,19,NULL,4,NULL,2),(54,54,19,NULL,5,NULL,2),(55,57,17,NULL,1,NULL,2),(56,60,18,NULL,2,NULL,2),(57,72,18,NULL,3,NULL,2),(58,75,18,NULL,4,NULL,2),(59,65,18,NULL,5,NULL,2),(60,60,16,NULL,2,NULL,2),(61,48,16,NULL,2,NULL,2),(62,50,16,NULL,3,NULL,2),(63,65,16,NULL,4,NULL,2),(64,70,16,NULL,5,NULL,2),(65,85,16,NULL,1,NULL,2),(66,80,16,NULL,2,NULL,2),(67,83,16,NULL,3,NULL,2),(68,48,16,NULL,4,NULL,2),(69,48,16,NULL,4,NULL,2),(70,48,16,NULL,4,NULL,2),(71,77,28,NULL,1,NULL,2),(72,44,28,NULL,2,NULL,1),(73,44,28,NULL,2,NULL,1),(74,117,28,NULL,3,NULL,2),(75,56,28,NULL,4,NULL,2),(76,49,28,NULL,4,NULL,2),(77,49,28,NULL,5,NULL,2),(78,76,29,NULL,1,NULL,2),(79,56,29,NULL,2,NULL,2),(82,51,29,NULL,2,NULL,2),(83,62,29,NULL,3,NULL,2),(84,69,29,NULL,3,NULL,2),(85,55,25,NULL,1,NULL,2),(86,68,25,NULL,1,NULL,2),(87,61,25,NULL,2,NULL,2),(88,58,25,NULL,2,NULL,2),(89,89,25,NULL,1,NULL,2),(90,87,25,NULL,1,NULL,2),(91,87,25,NULL,2,NULL,2),(92,91,25,NULL,2,NULL,2),(94,190,25,NULL,3,NULL,2),(95,86,25,NULL,3,NULL,2),(96,79,25,NULL,4,NULL,2),(98,131,25,NULL,4,NULL,2),(99,130,25,NULL,5,NULL,2),(100,91,25,NULL,5,NULL,2),(101,60,25,NULL,3,NULL,2),(102,44,25,NULL,3,NULL,2),(103,55,25,NULL,4,NULL,2),(104,53,25,NULL,4,NULL,2),(105,66,25,NULL,5,NULL,2),(106,52,25,NULL,5,NULL,2),(107,45,26,NULL,1,NULL,2),(108,48,26,NULL,1,NULL,2),(109,59,26,NULL,2,NULL,2),(110,74,26,NULL,2,NULL,2),(111,57,26,NULL,3,NULL,2),(112,68,26,NULL,3,NULL,2),(113,45,26,NULL,4,NULL,2),(114,55,26,NULL,4,NULL,2),(115,65,26,NULL,5,NULL,2),(116,57,26,NULL,5,NULL,2),(117,77,26,NULL,1,NULL,2),(118,80,26,NULL,1,NULL,2),(119,84,26,NULL,2,NULL,2),(120,93,26,NULL,2,NULL,2),(121,132,26,NULL,3,NULL,2),(123,190,26,NULL,3,NULL,2),(124,190,26,NULL,4,NULL,2),(125,130,26,NULL,4,NULL,2),(126,191,26,NULL,5,NULL,2),(127,89,26,NULL,5,NULL,2),(128,50,30,NULL,1,NULL,2),(129,44,30,NULL,1,NULL,2),(130,50,30,NULL,2,NULL,2),(131,59,30,NULL,2,NULL,2),(132,45,30,NULL,3,NULL,2),(133,44,30,NULL,3,NULL,2),(134,44,30,NULL,4,NULL,2),(135,45,30,NULL,4,NULL,2),(136,52,30,NULL,5,NULL,2),(137,62,30,NULL,5,NULL,2),(138,85,30,NULL,1,NULL,2),(139,88,30,NULL,1,NULL,2),(140,89,30,NULL,2,NULL,2),(141,190,30,NULL,2,NULL,2),(142,191,30,NULL,3,NULL,2),(144,85,30,NULL,3,NULL,2),(145,89,30,NULL,4,NULL,2),(146,190,30,NULL,4,NULL,2),(147,79,30,NULL,5,NULL,2),(148,77,30,NULL,5,NULL,2),(149,51,31,NULL,1,NULL,2),(150,56,31,NULL,1,NULL,2),(151,57,31,NULL,2,NULL,2),(152,66,31,NULL,2,NULL,2),(153,74,31,NULL,3,NULL,2),(154,71,31,NULL,3,NULL,2),(155,59,31,NULL,4,NULL,2),(156,174,31,NULL,4,NULL,2),(157,60,31,NULL,5,NULL,2),(158,48,31,NULL,5,NULL,2),(159,85,31,NULL,1,NULL,2),(160,79,31,NULL,1,NULL,2),(161,77,31,NULL,2,NULL,2),(162,79,31,NULL,2,NULL,2),(163,130,31,NULL,3,NULL,2),(164,88,31,NULL,3,NULL,1),(165,130,31,NULL,4,NULL,2),(166,90,31,NULL,4,NULL,2),(167,79,31,NULL,5,NULL,2),(168,77,31,NULL,5,NULL,2),(169,51,32,NULL,1,NULL,2),(170,56,32,NULL,1,NULL,2),(171,74,32,NULL,2,NULL,2),(172,64,32,NULL,2,NULL,2),(173,73,32,NULL,3,NULL,2),(174,67,32,NULL,3,NULL,2),(175,75,32,NULL,4,NULL,1),(176,72,32,NULL,4,NULL,2),(177,75,32,NULL,5,NULL,2),(178,72,32,NULL,5,NULL,2),(179,224,32,NULL,1,NULL,2),(180,232,32,NULL,1,NULL,2),(181,91,32,NULL,1,NULL,2),(182,79,32,NULL,1,NULL,2),(183,236,32,NULL,2,NULL,2),(184,224,32,NULL,2,NULL,2),(185,224,32,NULL,3,NULL,2),(186,236,32,NULL,3,NULL,2),(187,239,32,NULL,4,NULL,2),(188,226,32,NULL,4,NULL,2),(189,232,32,NULL,5,NULL,2),(190,239,32,NULL,5,NULL,2),(191,77,32,NULL,2,NULL,2),(192,84,32,NULL,2,NULL,2),(193,85,32,NULL,3,NULL,2),(194,130,32,NULL,3,NULL,2),(195,117,32,NULL,4,NULL,2),(196,131,32,NULL,4,NULL,2),(197,83,32,NULL,5,NULL,2),(198,191,32,NULL,5,NULL,2),(199,296,32,NULL,1,NULL,2),(200,337,32,NULL,1,NULL,2),(201,314,32,NULL,2,NULL,2),(202,302,32,NULL,2,NULL,2),(203,296,32,NULL,3,NULL,2),(204,302,32,NULL,3,NULL,2),(205,302,32,NULL,4,NULL,2),(206,314,32,NULL,4,NULL,2),(207,323,32,NULL,5,NULL,2),(208,302,32,NULL,5,NULL,2),(209,391,33,NULL,1,NULL,2),(210,368,33,NULL,1,NULL,2),(211,368,33,NULL,2,NULL,2),(212,361,33,NULL,2,NULL,2),(213,296,33,NULL,3,NULL,2),(214,339,33,NULL,3,NULL,2),(215,296,33,NULL,4,NULL,2),(216,314,33,NULL,4,NULL,2),(217,367,33,NULL,5,NULL,2),(218,331,33,NULL,5,NULL,2),(219,397,33,NULL,1,NULL,2),(220,403,33,NULL,1,NULL,2),(221,397,33,NULL,2,NULL,2),(222,418,33,NULL,2,NULL,2),(223,440,33,NULL,3,NULL,2),(224,434,33,NULL,3,NULL,2),(225,438,33,NULL,4,NULL,2),(226,409,33,NULL,4,NULL,2),(227,432,33,NULL,5,NULL,2),(228,415,33,NULL,5,NULL,2),(229,91,33,NULL,1,NULL,2),(230,83,33,NULL,1,NULL,2),(231,80,33,NULL,2,NULL,2),(232,91,33,NULL,2,NULL,2),(233,90,33,NULL,3,NULL,1),(234,83,33,NULL,3,NULL,2),(235,85,33,NULL,4,NULL,2),(236,93,33,NULL,4,NULL,2),(237,91,33,NULL,5,NULL,2),(238,77,33,NULL,5,NULL,2),(239,52,33,NULL,1,NULL,2),(240,58,33,NULL,1,NULL,2),(241,70,33,NULL,2,NULL,2),(242,58,33,NULL,2,NULL,2),(243,174,33,NULL,3,NULL,2),(244,68,33,NULL,3,NULL,2),(245,51,33,NULL,4,NULL,1),(246,62,33,NULL,4,NULL,2),(247,48,33,NULL,5,NULL,2),(248,68,33,NULL,5,NULL,2);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_day`
--

DROP TABLE IF EXISTS `schedule_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `real` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_day`
--

LOCK TABLES `schedule_day` WRITE;
/*!40000 ALTER TABLE `schedule_day` DISABLE KEYS */;
INSERT INTO `schedule_day` VALUES (11,'2012-05-04',0),(12,'2012-05-07',0),(13,'2012-05-10',0),(14,'2012-05-11',0),(15,'2012-05-12',0),(16,'2012-05-13',0),(17,'2012-05-14',0),(18,'2012-05-15',0),(19,'2012-05-16',0),(20,'2012-05-06',0),(21,'2012-05-23',0),(22,'2012-05-28',0),(23,'2012-05-31',0),(24,'2012-06-01',0),(25,'2012-06-04',0),(26,'2012-06-05',0),(27,'2012-06-10',0),(28,'2012-05-18',0),(29,'2012-06-15',0),(30,'2012-06-06',0),(31,'2012-06-07',0),(32,'2012-06-08',0),(33,'2012-06-09',0),(34,'2012-06-16',0);
/*!40000 ALTER TABLE `schedule_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_empty`
--

DROP TABLE IF EXISTS `schedule_empty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_empty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `num_less` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_empty_425ae3c4` (`group_id`),
  KEY `schedule_empty_2831cc73` (`day_id`),
  CONSTRAINT `day_id_refs_id_10e90834` FOREIGN KEY (`day_id`) REFERENCES `schedule_day` (`id`),
  CONSTRAINT `group_id_refs_id_21797e06` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_empty`
--

LOCK TABLES `schedule_empty` WRITE;
/*!40000 ALTER TABLE `schedule_empty` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_empty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_filled`
--

DROP TABLE IF EXISTS `schedule_filled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_filled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_filled_6d25d6e2` (`lesson_id`),
  KEY `schedule_filled_5a80280f` (`plan_id`),
  KEY `schedule_filled_3fa87ba8` (`classroom_id`),
  CONSTRAINT `classroom_id_refs_id_6705ee86` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`id`),
  CONSTRAINT `lesson_id_refs_id_6527c6e9` FOREIGN KEY (`lesson_id`) REFERENCES `schedule_empty` (`id`),
  CONSTRAINT `plan_id_refs_id_6dc6ce8a` FOREIGN KEY (`plan_id`) REFERENCES `tariffication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_filled`
--

LOCK TABLES `schedule_filled` WRITE;
/*!40000 ALTER TABLE `schedule_filled` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_filled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'schedule','0001_initial','2012-05-07 16:38:17'),(2,'tariffication','0001_initial','2012-05-07 17:22:49'),(3,'journal','0001_initial','2012-05-07 17:22:49'),(4,'schedule','0002_auto__add_field_schedule_hour_type','2012-05-11 20:39:18'),(5,'schedule','0003_auto__add_field_schedule_comment','2012-05-11 20:39:18'),(6,'journal','0002_add_field_Assessment_day','2012-05-11 23:56:03'),(7,'journal','0003_auto__chg_field_assessment_day','2012-05-11 23:56:03'),(8,'journal','0006_auto__del_field_assessment_theme__add_field_assessment_theme_of_day__d','2012-05-13 17:05:23'),(9,'tariffication','0002_auto__add_classroom__add_typehour__del_field_groups_stud_student__add_','2012-05-13 17:27:42'),(10,'tariffication','0003_auto__chg_field_teachers_cabinet','2012-05-13 17:27:44'),(12,'tariffication','0004_auto__chg_field_typehour_name','2012-05-13 19:38:10'),(13,'schedule','0002_auto__add_field_schedule_count_hours','2012-05-28 08:23:31'),(14,'tariffication','0002_auto__del_field_uchplanhour_type','2012-05-28 08:42:28'),(16,'tariffication','0002_auto__add_field_teachers_manager','2012-06-04 16:20:13'),(17,'tariffication','0003_auto__add_field_students_is_elder','2012-06-10 14:48:57');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speciality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `num_spec` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
INSERT INTO `speciality` VALUES (4,'Программное обеспечение вычислительной техники и автоматизированных систем',230105),(5,'Организация обслуживания в общественном питании',324001),(6,'Реклама',324001),(7,'Прикладная информатика по отраслям',230701),(8,'Техническое обслуживание и ремонт автомобильного транспорта',190604),(9,'Повар',34.2),(10,'Автомеханик',30.2),(11,'Программирование в компьютерных системах',230115);
/*!40000 ALTER TABLE `speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `profile_ptr_id` int(11) NOT NULL,
  `cart` int(11) NOT NULL,
  `is_elder` tinyint(1) NOT NULL,
  PRIMARY KEY (`profile_ptr_id`),
  CONSTRAINT `profile_ptr_id_refs_user_ptr_id_18ce0375` FOREIGN KEY (`profile_ptr_id`) REFERENCES `profile` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (9,2997,0),(10,2983,0),(31,896789,0);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariffication`
--

DROP TABLE IF EXISTS `tariffication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariffication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `group_plan_id` int(11) NOT NULL,
  `uch_plan_hour_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariffication`
--

LOCK TABLES `tariffication` WRITE;
/*!40000 ALTER TABLE `tariffication` DISABLE KEYS */;
INSERT INTO `tariffication` VALUES (44,17,20,43),(45,18,20,44),(48,26,20,47),(49,26,20,48),(50,27,20,49),(51,27,20,50),(52,12,20,51),(53,12,20,52),(54,12,20,53),(55,28,20,54),(56,28,20,55),(57,28,20,56),(58,28,20,57),(59,28,20,58),(60,13,20,59),(61,13,20,60),(62,20,20,61),(63,20,20,62),(64,20,20,63),(65,20,20,64),(66,20,20,65),(67,20,20,66),(68,29,20,67),(69,29,20,68),(70,29,20,69),(71,29,20,70),(72,21,20,71),(73,21,20,72),(74,21,20,73),(75,22,20,74),(76,22,20,75),(77,17,21,76),(79,18,21,77),(80,23,21,78),(81,23,21,79),(82,23,21,80),(83,23,21,81),(84,23,21,82),(85,25,21,83),(86,25,21,84),(87,19,21,85),(88,19,21,86),(89,26,21,87),(90,26,21,88),(91,24,21,89),(92,24,21,90),(93,24,21,91),(94,24,21,92),(95,17,20,93),(96,17,20,94),(97,17,20,95),(98,18,20,96),(99,18,20,97),(100,18,20,98),(109,13,18,107),(110,13,18,108),(111,13,18,109),(112,13,18,110),(113,13,18,111),(114,13,18,112),(115,17,21,113),(116,17,21,114),(117,17,21,115),(118,17,21,116),(119,17,21,117),(120,17,20,118),(121,17,20,119),(122,18,20,120),(123,18,20,121),(124,19,21,122),(125,19,21,123),(126,28,20,124),(127,28,20,125),(128,28,20,126),(129,28,20,127),(130,23,21,128),(131,23,21,129),(132,23,21,130),(133,23,21,131),(134,23,21,132),(135,23,21,133),(136,23,21,134),(137,25,21,135),(138,25,21,136),(139,25,21,137),(140,25,21,138),(141,24,21,139),(142,24,21,140),(143,26,21,141),(144,26,21,142),(145,26,21,143),(146,26,21,144),(151,26,20,149),(152,26,20,150),(153,26,20,151),(154,26,20,152),(155,27,20,153),(156,27,20,154),(157,27,20,155),(158,27,20,156),(159,12,20,157),(160,12,20,158),(161,12,20,159),(162,28,20,160),(163,28,20,161),(164,28,20,162),(165,13,20,163),(166,13,20,164),(167,13,20,165),(168,13,20,166),(169,20,20,167),(170,20,20,168),(171,20,20,169),(172,20,20,170),(173,20,20,171),(174,20,20,172),(175,29,20,173),(176,29,20,174),(177,29,20,175),(178,29,20,176),(179,29,20,177),(180,29,20,178),(181,29,20,179),(182,29,20,180),(183,22,20,181),(184,22,20,182),(185,22,20,183),(186,22,20,184),(187,21,20,185),(188,21,20,186),(189,21,20,187),(190,19,21,188),(191,19,21,189),(192,18,21,190),(193,18,21,191),(194,18,21,192),(195,18,21,193),(196,18,21,194),(218,22,17,216),(219,22,17,217),(220,22,17,218),(221,22,17,219),(222,22,17,220),(223,22,17,221),(224,19,17,222),(225,19,17,223),(226,19,17,224),(227,19,17,225),(228,19,17,226),(229,19,17,227),(230,26,17,228),(231,26,17,229),(232,26,17,230),(233,26,17,231),(234,26,17,232),(235,26,17,233),(236,14,17,234),(237,14,17,235),(238,14,17,236),(239,14,17,237),(240,14,17,238),(241,14,17,239),(242,32,17,240),(243,32,17,241),(244,32,17,242),(245,32,17,243),(246,32,17,244),(247,32,17,245),(248,32,17,246),(249,32,17,247),(250,32,17,248),(251,32,17,249),(252,32,17,250),(253,32,17,251),(254,32,17,252),(255,32,17,253),(256,32,17,254),(257,32,17,255),(258,32,17,256),(259,32,17,257),(260,34,17,258),(261,34,17,259),(262,34,17,260),(263,34,17,261),(264,34,17,262),(265,34,17,263),(266,34,17,264),(267,34,17,265),(268,34,17,266),(269,34,17,267),(270,34,17,268),(271,34,17,269),(272,35,17,270),(273,35,17,271),(274,35,17,272),(275,35,17,273),(276,35,17,274),(277,35,17,275),(278,34,17,276),(279,34,17,277),(280,34,17,278),(281,34,17,279),(282,34,17,280),(283,34,17,281),(296,17,19,294),(297,17,19,295),(298,17,19,296),(299,17,19,297),(300,17,19,298),(301,17,19,299),(302,18,19,300),(303,18,19,301),(304,18,19,302),(305,18,19,303),(306,18,19,304),(307,18,19,305),(308,19,19,306),(309,19,19,307),(310,19,19,308),(311,19,19,309),(312,19,19,310),(313,19,19,311),(314,26,19,312),(315,26,19,313),(316,26,19,314),(317,26,19,315),(318,26,19,316),(319,26,19,317),(320,27,19,318),(321,27,19,319),(323,27,19,321),(325,27,19,323),(327,27,19,325),(329,27,19,327),(331,14,19,329),(332,14,19,330),(333,14,19,331),(334,14,19,332),(335,14,19,333),(336,14,19,334),(337,14,19,335),(338,14,19,336),(339,14,19,337),(340,14,19,338),(341,14,19,339),(342,14,19,340),(343,28,19,341),(344,28,19,342),(345,28,19,343),(346,28,19,344),(347,28,19,345),(348,28,19,346),(349,28,19,347),(351,28,19,349),(353,28,19,351),(355,28,19,353),(357,28,19,355),(359,28,19,357),(361,13,19,359),(362,13,19,360),(363,13,19,361),(364,13,19,362),(365,13,19,363),(366,13,19,364),(367,20,19,365),(368,20,19,366),(369,20,19,367),(370,20,19,368),(371,20,19,369),(372,20,19,370),(373,20,19,371),(374,20,19,372),(375,20,19,373),(376,20,19,374),(377,20,19,375),(378,20,19,376),(379,36,19,377),(380,36,19,378),(381,36,19,379),(382,36,19,380),(383,36,19,381),(384,36,19,382),(385,21,19,383),(386,21,19,384),(387,21,19,385),(388,21,19,386),(389,21,19,387),(390,21,19,388),(391,22,19,389),(392,22,19,390),(393,22,19,391),(394,22,19,392),(395,22,19,393),(396,22,19,394),(397,17,22,395),(398,17,22,396),(399,17,22,397),(400,17,22,398),(401,17,22,399),(402,17,22,400),(403,18,22,401),(404,18,22,402),(405,18,22,403),(406,18,22,404),(407,18,22,405),(408,18,22,406),(409,23,22,407),(410,23,22,408),(411,23,22,409),(412,23,22,410),(413,23,22,411),(414,23,22,412),(415,25,22,413),(416,25,22,414),(418,25,22,416),(420,25,22,418),(422,25,22,420),(424,25,22,422),(426,26,22,424),(427,26,22,425),(428,26,22,426),(429,26,22,427),(430,26,22,428),(431,26,22,429),(432,28,22,430),(433,28,22,431),(434,28,22,432),(435,28,22,433),(436,28,22,434),(437,28,22,435),(438,13,22,436),(439,13,22,437),(440,13,22,438),(441,13,22,439),(442,13,22,440),(443,13,22,441),(444,15,22,442),(445,15,22,443),(446,15,22,444),(447,15,22,445),(448,15,22,446),(449,15,22,447),(450,29,22,448),(451,29,22,449),(452,29,22,450),(453,29,22,451),(454,29,22,452),(455,29,22,453);
/*!40000 ALTER TABLE `tariffication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `profile_ptr_id` int(11) NOT NULL,
  `cabinet_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`profile_ptr_id`),
  KEY `teachers_cabinet_id` (`cabinet_id`),
  KEY `teachers_501a2222` (`manager_id`),
  CONSTRAINT `cabinet_id_refs_id_31642ec6` FOREIGN KEY (`cabinet_id`) REFERENCES `classroom` (`id`),
  CONSTRAINT `manager_id_refs_id_d97ac78` FOREIGN KEY (`manager_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `profile_ptr_id_refs_user_ptr_id_2470ed9a` FOREIGN KEY (`profile_ptr_id`) REFERENCES `profile` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (11,207,NULL),(12,203,NULL),(13,205,NULL),(14,NULL,NULL),(15,405,NULL),(16,305,NULL),(17,NULL,24),(18,404,NULL),(19,215,NULL),(20,402,NULL),(21,407,NULL),(22,101,NULL),(23,308,NULL),(24,309,NULL),(25,209,NULL),(26,304,NULL),(27,409,NULL),(28,105,NULL),(29,210,NULL),(32,5,NULL),(34,NULL,NULL),(35,NULL,NULL),(36,NULL,NULL);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_of_day`
--

DROP TABLE IF EXISTS `theme_of_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_of_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `describe` varchar(255) NOT NULL,
  `day_of_schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_of_day_2a91ef6d` (`day_of_schedule_id`),
  CONSTRAINT `day_of_schedule_id_refs_id_62c8b2e0` FOREIGN KEY (`day_of_schedule_id`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_of_day`
--

LOCK TABLES `theme_of_day` WRITE;
/*!40000 ALTER TABLE `theme_of_day` DISABLE KEYS */;
INSERT INTO `theme_of_day` VALUES (3,'Вторая тема',50),(4,'Создание миграций и их проводка',60),(11,'',41),(12,'',52),(13,'Тема дня, пошли все нахер',56),(22,'',44),(23,'',36),(24,'',54),(25,'16 мая, 4 пара, проходили жизнь программного кода.',53),(26,'',51),(27,'',47),(30,'',39),(34,'',69),(37,'13 мая, 2 пара :)',61),(38,'Очень большая тема для проверки, как будут выглядеть блоки, ведь почти все темы длинные в названии и преподы тратят по 2-3 колонки =)',49),(39,'Очень большая тема для проверки, как будут выглядеть блоки, ведь почти все темы длинные в названии и преподы тратят по 2-3 колонки =)',68),(40,'14 мая, тема самая крутая, потому что она стоит третьей парой!!!!',42),(41,'',31),(44,'',46),(45,'',35),(46,'',57),(47,'Вторая тема',43),(50,'Я ПЛЯСАЛ У ВСЕХ НА ВЕДУ',58),(51,'',70),(52,'Физика СУПЕР!',37),(53,'Да ты гонишь)))))',62),(55,'',40),(57,'тема',34),(58,'11 мая 3 мая, я так пишу что, бы проверять данные',32);
/*!40000 ALTER TABLE `theme_of_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typehour`
--

DROP TABLE IF EXISTS `typehour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typehour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `short_name` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typehour`
--

LOCK TABLES `typehour` WRITE;
/*!40000 ALTER TABLE `typehour` DISABLE KEYS */;
INSERT INTO `typehour` VALUES (1,'Лекция','лк'),(2,'Практика','пр'),(3,'Консультация','кн'),(4,'Экзамен','эк'),(5,'Курсовое проектирование','кп'),(6,'Проверка курсового проекта','пк');
/*!40000 ALTER TABLE `typehour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_themes`
--

DROP TABLE IF EXISTS `types_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_themes`
--

LOCK TABLES `types_themes` WRITE;
/*!40000 ALTER TABLE `types_themes` DISABLE KEYS */;
INSERT INTO `types_themes` VALUES (1,'ТИП ТЕМЫ');
/*!40000 ALTER TABLE `types_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uch_plan`
--

DROP TABLE IF EXISTS `uch_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uch_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disc_id` int(11) NOT NULL,
  `spec_id` int(11) NOT NULL,
  `semestr` int(11) NOT NULL,
  `otch` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uch_plan_432800c5` (`disc_id`),
  KEY `uch_plan_1d8e9887` (`spec_id`),
  CONSTRAINT `disc_id_refs_id_12b66d61` FOREIGN KEY (`disc_id`) REFERENCES `discipline` (`id`),
  CONSTRAINT `spec_id_refs_id_12ccd756` FOREIGN KEY (`spec_id`) REFERENCES `speciality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uch_plan`
--

LOCK TABLES `uch_plan` WRITE;
/*!40000 ALTER TABLE `uch_plan` DISABLE KEYS */;
INSERT INTO `uch_plan` VALUES (27,14,7,1,'Z'),(28,15,7,1,'Z'),(29,16,7,1,'Z'),(30,17,7,1,'Z'),(31,18,7,1,'Z'),(32,19,7,1,'E'),(33,20,7,1,'Z'),(34,21,7,1,'Z'),(35,22,7,1,'Z'),(36,23,7,1,'Z'),(37,24,7,1,'Z'),(38,25,7,1,'E'),(39,26,7,1,'Z'),(40,14,8,3,'Z'),(41,27,8,3,'E'),(42,28,8,3,'Z'),(43,15,8,3,'Z'),(44,16,8,3,'Z'),(45,29,8,3,'Z'),(46,29,8,3,'Z'),(47,30,8,3,'Z'),(48,31,8,3,'Z'),(49,32,8,3,'E'),(50,33,8,3,'E'),(51,20,8,3,'Z'),(52,25,8,3,'Z'),(53,34,8,3,'E'),(54,35,8,3,'Z'),(55,36,8,3,'Z'),(56,37,8,3,'Z'),(57,38,8,5,'Z'),(58,39,8,5,'Z'),(59,40,8,5,'E'),(60,20,8,5,'Z'),(61,16,8,5,'Z'),(62,14,8,5,'Z'),(63,41,8,5,'E'),(64,42,8,5,'Z'),(65,43,8,5,'E'),(66,45,8,5,'Z'),(67,32,8,5,'E'),(68,44,8,5,'Z'),(69,46,8,5,'Z'),(70,14,8,1,'Z'),(71,16,8,1,'Z'),(72,17,8,1,'E'),(73,15,8,1,'Z'),(74,23,8,1,'Z'),(75,24,8,1,'Z'),(76,18,8,1,'Z'),(77,19,8,1,'E'),(78,20,8,1,'Z'),(79,21,8,1,'Z'),(80,22,8,1,'Z'),(81,25,8,1,'E'),(82,26,8,1,'Z'),(83,14,5,3,'Z'),(84,45,5,3,'Z'),(85,16,5,3,'Z'),(86,15,5,3,'Z'),(87,31,5,3,'Z'),(88,20,5,3,'Z'),(89,25,5,3,'Z'),(90,36,5,3,'Z'),(91,35,5,3,'E');
/*!40000 ALTER TABLE `uch_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uch_plan_hour`
--

DROP TABLE IF EXISTS `uch_plan_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uch_plan_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uch_plan_id` int(11) NOT NULL,
  `count_hours` int(11) NOT NULL,
  `type_hour_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uch_plan_hour_f8da33a` (`uch_plan_id`),
  KEY `uch_plan_hour_a61604` (`type_hour_id`),
  CONSTRAINT `uch_plan_id_refs_id_54233f09` FOREIGN KEY (`uch_plan_id`) REFERENCES `uch_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uch_plan_hour`
--

LOCK TABLES `uch_plan_hour` WRITE;
/*!40000 ALTER TABLE `uch_plan_hour` DISABLE KEYS */;
INSERT INTO `uch_plan_hour` VALUES (43,27,110,1),(44,27,107,1),(45,28,0,2),(46,28,3,3),(47,29,78,1),(48,29,4,3),(49,30,195,1),(50,30,15,3),(51,28,95,1),(52,28,6,3),(53,28,10,4),(54,31,117,1),(55,31,8,3),(56,32,78,1),(57,32,6,3),(58,32,10,4),(59,33,78,1),(60,33,4,3),(61,34,78,1),(62,34,0,2),(63,34,8,3),(64,35,78,1),(65,35,4,2),(66,35,8,3),(67,36,114,1),(68,36,8,3),(69,37,114,1),(70,37,10,3),(71,38,290,1),(72,38,18,3),(73,38,10,4),(74,39,68,1),(75,39,2,3),(76,40,64,1),(77,40,54,1),(78,41,176,1),(79,41,0,3),(80,41,0,4),(81,42,144,1),(82,42,10,3),(83,43,30,1),(84,43,2,3),(85,43,4,1),(86,43,3,3),(87,44,64,1),(88,44,4,3),(89,55,78,1),(90,55,0,2),(91,55,10,3),(92,55,0,4),(93,27,0,2),(94,27,0,3),(95,27,0,4),(96,27,0,2),(97,27,0,3),(98,27,0,4),(99,43,77,2),(100,43,66,4),(101,30,208,1),(102,30,37,2),(103,30,0,3),(104,30,0,4),(105,30,22,5),(106,30,0,6),(107,51,110,1),(108,51,80,2),(109,51,0,3),(110,51,0,4),(111,51,42,5),(112,51,8,6),(113,40,0,2),(114,40,0,3),(115,40,10,4),(116,40,0,5),(117,40,0,6),(118,27,0,5),(119,27,0,6),(120,27,0,5),(121,27,0,6),(122,43,0,5),(123,43,0,6),(124,31,0,2),(125,31,0,4),(126,31,0,5),(127,31,0,6),(128,41,70,2),(129,41,24,5),(130,41,12,6),(131,42,0,2),(132,42,0,4),(133,42,0,5),(134,42,0,6),(135,43,0,2),(136,43,0,4),(137,43,0,5),(138,43,0,6),(139,55,0,5),(140,55,0,6),(141,44,0,2),(142,44,0,4),(143,44,0,5),(144,44,0,6),(145,28,0,1),(146,28,0,4),(147,28,0,5),(148,28,0,6),(149,29,0,2),(150,29,0,4),(151,29,0,5),(152,29,0,6),(153,30,0,2),(154,30,0,4),(155,30,0,5),(156,30,0,6),(157,28,0,2),(158,28,0,5),(159,28,0,6),(160,32,0,2),(161,32,0,5),(162,32,0,6),(163,33,0,2),(164,33,0,4),(165,33,0,5),(166,33,0,6),(167,34,0,4),(168,34,0,5),(169,34,0,6),(170,35,0,4),(171,35,0,5),(172,35,4,6),(173,36,0,2),(174,36,0,4),(175,36,0,5),(176,36,0,6),(177,37,0,2),(178,37,0,4),(179,37,0,5),(180,37,0,6),(181,39,0,2),(182,39,0,4),(183,39,0,5),(184,39,0,6),(185,38,0,2),(186,38,0,5),(187,38,0,6),(188,43,22,2),(189,43,6,4),(190,40,0,2),(191,40,0,3),(192,40,0,4),(193,40,0,5),(194,40,0,6),(195,53,0,1),(196,53,0,2),(197,53,0,3),(198,53,0,4),(199,53,0,5),(200,53,0,6),(201,57,62,1),(202,57,62,1),(203,57,0,2),(204,57,4,3),(205,57,4,3),(206,57,4,3),(207,57,0,4),(208,57,0,4),(209,57,0,4),(210,57,0,5),(211,57,0,5),(212,57,0,5),(213,57,0,6),(214,57,0,6),(215,57,0,6),(216,57,62,1),(217,57,0,2),(218,57,4,3),(219,57,0,4),(220,57,0,5),(221,57,0,6),(222,58,52,1),(223,58,0,2),(224,58,4,3),(225,58,0,4),(226,58,0,5),(227,58,0,6),(228,61,60,1),(229,61,0,2),(230,61,6,3),(231,61,0,4),(232,61,0,5),(233,61,0,6),(234,59,48,1),(235,59,0,2),(236,59,4,3),(237,59,10,4),(238,59,0,5),(239,59,0,6),(240,63,96,1),(241,63,0,2),(242,63,14,3),(243,63,10,4),(244,63,0,5),(245,63,0,6),(246,64,64,1),(247,64,0,2),(248,64,4,3),(249,64,0,4),(250,64,0,5),(251,64,0,6),(252,67,186,1),(253,67,0,2),(254,67,14,3),(255,67,10,4),(256,67,0,5),(257,67,0,6),(258,65,60,1),(259,65,0,2),(260,65,6,3),(261,65,10,4),(262,65,0,5),(263,65,0,6),(264,69,222,1),(265,69,0,2),(266,69,22,3),(267,69,10,4),(268,69,52,5),(269,69,0,6),(270,66,60,1),(271,66,0,2),(272,66,6,3),(273,66,0,4),(274,66,0,5),(275,66,0,6),(276,68,120,1),(277,68,0,2),(278,68,10,3),(279,68,0,4),(280,68,0,5),(281,68,0,6),(282,70,107,1),(283,70,107,1),(284,70,0,2),(285,70,0,2),(286,70,0,3),(287,70,0,3),(288,70,0,4),(289,70,0,4),(290,70,0,5),(291,70,0,5),(292,70,0,6),(293,70,0,6),(294,70,107,1),(295,70,0,2),(296,70,0,3),(297,70,0,4),(298,70,0,5),(299,70,0,6),(300,70,110,1),(301,70,0,2),(302,70,0,3),(303,70,0,4),(304,70,0,5),(305,70,0,6),(306,73,95,1),(307,73,0,2),(308,73,6,3),(309,73,0,4),(310,73,0,5),(311,73,0,6),(312,71,78,1),(313,71,0,2),(314,71,4,3),(315,71,0,4),(316,71,0,5),(317,71,0,6),(318,72,196,1),(319,72,0,2),(320,72,0,2),(321,72,16,3),(322,72,16,3),(323,72,10,4),(324,72,10,4),(325,72,0,5),(326,72,0,5),(327,72,0,6),(328,72,0,6),(329,74,111,1),(330,74,0,2),(331,74,7,3),(332,74,0,4),(333,74,0,5),(334,74,0,6),(335,75,111,1),(336,75,0,2),(337,75,10,3),(338,75,0,4),(339,75,0,5),(340,75,0,6),(341,76,117,1),(342,76,0,2),(343,76,8,3),(344,76,0,4),(345,76,0,5),(346,76,0,6),(347,77,78,1),(348,77,78,1),(349,77,0,2),(350,77,0,2),(351,77,6,3),(352,77,6,3),(353,77,10,4),(354,77,10,4),(355,77,0,5),(356,77,0,5),(357,77,0,6),(358,77,0,6),(359,78,78,1),(360,78,0,2),(361,78,4,3),(362,78,0,4),(363,78,0,5),(364,78,0,6),(365,79,78,1),(366,79,6,2),(367,79,8,3),(368,79,0,4),(369,79,0,5),(370,79,0,6),(371,80,78,1),(372,80,4,2),(373,80,8,3),(374,80,0,4),(375,80,0,5),(376,80,0,6),(377,73,50,1),(378,73,0,2),(379,73,2,3),(380,73,0,4),(381,73,0,5),(382,73,0,6),(383,81,290,1),(384,81,0,2),(385,81,18,3),(386,81,10,4),(387,81,0,5),(388,81,0,6),(389,82,68,1),(390,82,0,2),(391,82,22,3),(392,82,0,4),(393,82,0,5),(394,82,0,6),(395,83,48,1),(396,83,0,2),(397,83,0,3),(398,83,0,4),(399,83,0,5),(400,83,0,6),(401,83,38,1),(402,83,0,2),(403,83,0,3),(404,83,0,4),(405,83,0,5),(406,83,0,6),(407,84,42,1),(408,84,0,2),(409,84,4,3),(410,84,0,4),(411,84,0,5),(412,84,0,6),(413,86,30,1),(414,86,0,2),(415,86,0,2),(416,86,3,3),(417,86,3,3),(418,86,0,4),(419,86,0,4),(420,86,0,5),(421,86,0,5),(422,86,0,6),(423,86,0,6),(424,85,48,1),(425,85,0,2),(426,85,4,3),(427,85,0,4),(428,85,0,5),(429,85,0,6),(430,87,56,1),(431,87,0,2),(432,87,6,3),(433,87,0,4),(434,87,0,5),(435,87,0,6),(436,88,48,1),(437,88,0,2),(438,88,4,3),(439,88,0,4),(440,88,0,5),(441,88,0,6),(442,89,48,1),(443,89,0,2),(444,89,12,3),(445,89,0,4),(446,89,0,5),(447,89,0,6),(448,90,32,1),(449,90,0,2),(450,90,2,3),(451,90,0,4),(452,90,0,5),(453,90,0,6);
/*!40000 ALTER TABLE `uch_plan_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_post_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_5f095de3` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post`
--

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;
INSERT INTO `user_post` VALUES (1,8,'2012-04-29',NULL);
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post_status`
--

DROP TABLE IF EXISTS `user_post_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_post_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userpost_id` int(11) NOT NULL,
  `userstatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpost_id` (`userpost_id`,`userstatus_id`),
  KEY `user_post_status_38fa4dc1` (`userpost_id`),
  KEY `user_post_status_1f306917` (`userstatus_id`),
  CONSTRAINT `userpost_id_refs_id_28eaa4c1` FOREIGN KEY (`userpost_id`) REFERENCES `user_post` (`id`),
  CONSTRAINT `userstatus_id_refs_id_56f159d9` FOREIGN KEY (`userstatus_id`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post_status`
--

LOCK TABLES `user_post_status` WRITE;
/*!40000 ALTER TABLE `user_post_status` DISABLE KEYS */;
INSERT INTO `user_post_status` VALUES (1,1,2);
/*!40000 ALTER TABLE `user_post_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` VALUES (1,'работник'),(2,'работник');
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (2,'2011-09-01','2012-06-30');
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-16  1:15:00
