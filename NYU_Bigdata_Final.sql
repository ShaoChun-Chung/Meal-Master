-- MySQL dump 10.13  Distrib 8.0.32, for macos11.7 (arm64)
--
-- Host: localhost    Database: NYU_Bigdata_Final
-- ------------------------------------------------------
-- Server version	5.7.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `MM_city`
--

DROP TABLE IF EXISTS `MM_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MM_city` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c` varchar(254) NOT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `c_name` (`c`)
) ENGINE=InnoDB AUTO_INCREMENT=461790 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MM_city`
--

LOCK TABLES `MM_city` WRITE;
/*!40000 ALTER TABLE `MM_city` DISABLE KEYS */;
INSERT INTO `MM_city` VALUES (348156,'Milan'),(415144,'Paris'),(461789,'Rome');
/*!40000 ALTER TABLE `MM_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MM_record`
--

DROP TABLE IF EXISTS `MM_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MM_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MM_record_r_id_9a457330_fk_MM_restaurant_r_id` (`r_id`),
  KEY `MM_record_u_id_4d2c2396_fk_MM_user_u_id` (`u_id`),
  CONSTRAINT `MM_record_r_id_9a457330_fk_MM_restaurant_r_id` FOREIGN KEY (`r_id`) REFERENCES `MM_restaurant` (`r_id`),
  CONSTRAINT `MM_record_u_id_4d2c2396_fk_MM_user_u_id` FOREIGN KEY (`u_id`) REFERENCES `MM_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MM_record`
--

LOCK TABLES `MM_record` WRITE;
/*!40000 ALTER TABLE `MM_record` DISABLE KEYS */;
INSERT INTO `MM_record` VALUES (1,3,12,2),(2,4,13,2),(3,5,14,2),(4,1,15,2),(5,5,16,2),(7,1,22,1),(8,1,12,2);
/*!40000 ALTER TABLE `MM_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MM_restaurant`
--

DROP TABLE IF EXISTS `MM_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MM_restaurant` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(100) NOT NULL,
  `r_type` varchar(100) NOT NULL,
  `r_price` varchar(100) DEFAULT NULL,
  `r_address` varchar(254) NOT NULL,
  `c_id` int(11) NOT NULL,
  PRIMARY KEY (`r_id`),
  UNIQUE KEY `r_name` (`r_name`),
  KEY `MM_restaurant_c_id_702c5aa3_fk_MM_city_c_id` (`c_id`),
  CONSTRAINT `MM_restaurant_c_id_702c5aa3_fk_MM_city_c_id` FOREIGN KEY (`c_id`) REFERENCES `MM_city` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MM_restaurant`
--

LOCK TABLES `MM_restaurant` WRITE;
/*!40000 ALTER TABLE `MM_restaurant` DISABLE KEYS */;
INSERT INTO `MM_restaurant` VALUES (12,'Panini di Mare Bistrò & Cucina','Italian','26-50','Via Edmondo de Amicis, 9, 20123 Milano MI, Italy',348156),(13,'Milano Ticinese','Italian','51-100','Via in Arcione, 115, 00187 Roma RM, Italy',461789),(14,'Fishbar de Milan Montebello','Italian','51-100','Via Lombardia, 47, 00187 Roma RM, Italy',461789),(15,'Osteria Al Piccolo Molo','Mexican','26-50','Via Antonio Grossich, 2, 20131 Milano MI, Italy',348156),(16,'Milano Island lounge & Sushi','Italian','51-100','9 Rue de Béarn, 75003 Paris, France',415144),(17,'Osteria il Piccolo Porto','Mexican','26-50','Vicolo Rosini, 6, 00186 Roma RM, Italy',461789),(18,'Incontro restaurant&drink','American','0-25','Corso di Porta Ticinese, 40, 20123 Milano MI, Italy',348156),(19,'Trattoria il Cormorano Sempione','American','51-100','Corso di Porta Ticinese, 16, 20123 Milano MI, Italy',348156),(20,'Terraferma','American','0-25','44 Rue Vieille-du-Temple, 75004 Paris, France',415144),(21,'Osteria della Concordia','American','0-25','Via Flavia, 46, 00187 Roma RM, Italy',461789),(22,'Pescadero','Italian','51-100','112 Rue du Faubourg Saint-Honoré, 75008 Paris, France',415144);
/*!40000 ALTER TABLE `MM_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MM_user`
--

DROP TABLE IF EXISTS `MM_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MM_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_email` varchar(254) NOT NULL,
  `u_password` varchar(100) NOT NULL,
  `u_name` varchar(100) NOT NULL,
  `u_gender` varchar(10) NOT NULL,
  `u_birth` datetime(6) NOT NULL,
  `c_id` int(11) NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `MM_user_u_email_f0c5a396_uniq` (`u_email`),
  KEY `MM_user_c_id_b7066837_fk_MM_city_c_id` (`c_id`),
  CONSTRAINT `MM_user_c_id_b7066837_fk_MM_city_c_id` FOREIGN KEY (`c_id`) REFERENCES `MM_city` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MM_user`
--

LOCK TABLES `MM_user` WRITE;
/*!40000 ALTER TABLE `MM_user` DISABLE KEYS */;
INSERT INTO `MM_user` VALUES (1,'q94284520@gmail.com','ljavaus870531','sandy','F','1998-05-31 00:00:00.000000',348156),(2,'1@1','1','1','M','1995-03-28 00:00:00.000000',348156),(3,'2@2','2','2','F','1991-09-12 00:00:00.000000',348156);
/*!40000 ALTER TABLE `MM_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add login',6,'add_login'),(17,'Can change login',6,'change_login'),(18,'Can delete login',6,'delete_login'),(19,'Can add restaurant',7,'add_restaurant'),(20,'Can change restaurant',7,'change_restaurant'),(21,'Can delete restaurant',7,'delete_restaurant'),(22,'Can add city',8,'add_city'),(23,'Can change city',8,'change_city'),(24,'Can delete city',8,'delete_city'),(25,'Can add record',9,'add_record'),(26,'Can change record',9,'change_record'),(27,'Can delete record',9,'delete_record'),(28,'Can add user',10,'add_user'),(29,'Can change user',10,'change_user'),(30,'Can delete user',10,'delete_user'),(31,'Can view log entry',1,'view_logentry'),(32,'Can view permission',2,'view_permission'),(33,'Can view group',3,'view_group'),(34,'Can view user',4,'view_user'),(35,'Can view content type',5,'view_contenttype'),(36,'Can add site',11,'add_site'),(37,'Can change site',11,'change_site'),(38,'Can delete site',11,'delete_site'),(39,'Can view site',11,'view_site'),(40,'Can add session',12,'add_session'),(41,'Can change session',12,'change_session'),(42,'Can delete session',12,'delete_session'),(43,'Can view session',12,'view_session'),(44,'Can view city',8,'view_city'),(45,'Can view record',9,'view_record'),(46,'Can view restaurant',7,'view_restaurant'),(47,'Can view user',10,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$Wjw4SAN055pg$pgBc6wU0KU8YZQvbV/GMz+aaWmlEN0sbev8S28iAeqc=',NULL,1,'sandy','','','q94284520@gmail.com',1,1,'2023-04-25 01:05:14.735478'),(2,'!VBmvOz0hYu6N9IjsCGM4GcrV7GA4gR1UydKVN6qw',NULL,0,'q94284520@gmail.com','','','ljavaus870531',0,1,'2023-04-25 01:52:01.154098'),(3,'pbkdf2_sha256$260000$DvSzztqyfPcHvmoO8VFnpn$1Q+wTcZmp28Jb+9zmNZPBFw+x9Pxy8epqLnJvNqqIaw=','2023-05-14 16:26:20.537029',0,'1@1','','','1@1',0,1,'2023-04-25 07:30:40.568221');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'MM','city'),(6,'MM','login'),(9,'MM','record'),(7,'MM','restaurant'),(10,'MM','user'),(12,'sessions','session'),(11,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-23 21:30:23.317788'),(2,'auth','0001_initial','2023-04-23 21:30:23.988949'),(3,'admin','0001_initial','2023-04-23 21:30:24.092882'),(4,'admin','0002_logentry_remove_auto_add','2023-04-23 21:30:24.111236'),(5,'contenttypes','0002_remove_content_type_name','2023-04-23 21:30:24.191266'),(6,'auth','0002_alter_permission_name_max_length','2023-04-23 21:30:24.229074'),(7,'auth','0003_alter_user_email_max_length','2023-04-23 21:30:24.269918'),(8,'auth','0004_alter_user_username_opts','2023-04-23 21:30:24.283241'),(9,'auth','0005_alter_user_last_login_null','2023-04-23 21:30:24.320174'),(10,'auth','0006_require_contenttypes_0002','2023-04-23 21:30:24.323250'),(11,'auth','0007_alter_validators_add_error_messages','2023-04-23 21:30:24.333650'),(12,'auth','0008_alter_user_username_max_length','2023-04-23 21:30:24.369430'),(13,'auth','0009_alter_user_last_name_max_length','2023-04-23 21:30:24.406002'),(14,'MM','0001_initial','2023-04-23 22:27:47.323943'),(15,'MM','0002_auto_20230423_2250','2023-04-23 22:50:49.200644'),(16,'MM','0003_auto_20230423_2254','2023-04-23 22:54:07.860793'),(17,'MM','0004_alter_user_u_email','2023-04-25 07:56:15.922428'),(18,'admin','0003_logentry_add_action_flag_choices','2023-04-25 07:56:15.931622'),(19,'auth','0010_alter_group_name_max_length','2023-04-25 07:56:15.976110'),(20,'auth','0011_update_proxy_permissions','2023-04-25 07:56:15.987045'),(21,'auth','0012_alter_user_first_name_max_length','2023-04-25 07:56:16.028803'),(22,'sessions','0001_initial','2023-04-25 07:56:16.089503'),(23,'sites','0001_initial','2023-04-25 07:56:16.122359'),(24,'sites','0002_alter_domain_unique','2023-04-25 07:56:16.150784');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('12lnt93m5awjvb1c0afuzv998we5psc6','.eJxVjEEOwiAQRe_C2pBOoUzHpXvPQAYYpGpoUtqV8e7apAvd_vfefynP21r81mTxU1JnZdTpdwscH1J3kO5cb7OOc12XKehd0Qdt-joneV4O9--gcCvf2jm2RNFYJ-w4mYxihtwRAzJahr5nFzKMGAQHJkIQMBa6QGMWZ6x6fwDfJzeA:1prSMa:Sn5SWdlW429sPbluvrW-1sUwS_iK0wWOfmasUMYM5hc','2023-05-09 23:46:24.274532'),('k305d3ao340y6ard0mv54nbn0kscb1ie','.eJxVjEEOwiAQRe_C2pBOoUzHpXvPQAYYpGpoUtqV8e7apAvd_vfefynP21r81mTxU1JnZdTpdwscH1J3kO5cb7OOc12XKehd0Qdt-joneV4O9--gcCvf2jm2RNFYJ-w4mYxihtwRAzJahr5nFzKMGAQHJkIQMBa6QGMWZ6x6fwDfJzeA:1pyEY8:MVCv3NyajRIPMjRCH-85zaobDGd375lQaOcLR8CDL20','2023-05-28 16:26:20.554776');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-14 12:44:17
