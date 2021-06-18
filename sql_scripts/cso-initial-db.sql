/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.11-MariaDB : Database - cso_app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cso_app` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `cso_app`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`category_id`,`category`) values 
(1,'Impact'),
(2,'Outcome'),
(3,'Activity');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `frequencies` */

DROP TABLE IF EXISTS `frequencies`;

CREATE TABLE `frequencies` (
  `frequency_id` int(11) NOT NULL AUTO_INCREMENT,
  `frequency` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`frequency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `frequencies` */

insert  into `frequencies`(`frequency_id`,`frequency`) values 
(1,'Annually'),
(2,'Yearly'),
(3,'Once'),
(4,'Bi-Annual'),
(5,'Year 2');

/*Table structure for table `indicator` */

DROP TABLE IF EXISTS `indicator`;

CREATE TABLE `indicator` (
  `indicator_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `indicator_desc` varchar(255) NOT NULL,
  `indicator_no` varchar(100) DEFAULT NULL,
  `indicator` varchar(255) DEFAULT NULL,
  `indicator_type_id` int(11) DEFAULT NULL,
  `data_source` varchar(255) DEFAULT NULL,
  `frequency_id` int(11) DEFAULT NULL,
  `unit_measure` varchar(255) DEFAULT NULL,
  `ppr` varchar(1) DEFAULT NULL,
  `baseline_date` date DEFAULT NULL,
  `baseline_value` varchar(255) DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `target_value` varchar(255) DEFAULT NULL,
  `actual_date` date DEFAULT NULL,
  `indicator_status_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`indicator_id`),
  KEY `indicator_type_fk` (`indicator_type_id`),
  KEY `frequency_fk` (`frequency_id`),
  KEY `category_fk` (`category_id`),
  KEY `indicator_status_fk` (`indicator_status_id`),
  CONSTRAINT `category_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `frequency_fk` FOREIGN KEY (`frequency_id`) REFERENCES `frequencies` (`frequency_id`),
  CONSTRAINT `indicator_status_fk` FOREIGN KEY (`indicator_status_id`) REFERENCES `indicator_status` (`indicator_status_id`),
  CONSTRAINT `indicator_type_fk` FOREIGN KEY (`indicator_type_id`) REFERENCES `indicator_type` (`indicator_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `indicator` */

/*Table structure for table `indicator_status` */

DROP TABLE IF EXISTS `indicator_status`;

CREATE TABLE `indicator_status` (
  `indicator_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `indicator_status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `indicator_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`indicator_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `indicator_status` */

insert  into `indicator_status`(`indicator_status_id`,`indicator_status`,`indicator_color`) values 
(1,'Entry','#ffc107'),
(2,'Work in Progress','#007bff'),
(3,'Complete','#28a745'),
(4,'Delay','#dc3545');

/*Table structure for table `indicator_type` */

DROP TABLE IF EXISTS `indicator_type`;

CREATE TABLE `indicator_type` (
  `indicator_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `indicator_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`indicator_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `indicator_type` */

insert  into `indicator_type`(`indicator_type_id`,`indicator_type`) values 
(1,'Performance/Custom');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2021_04_03_154142_create_permission_tables',1),
(5,'2021_04_07_162914_create_posts_table',1);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values 
(1,'App\\Models\\User',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'add','web','2021-06-15 06:50:21','2021-06-15 06:50:21'),
(2,'update','web','2021-06-15 06:50:26','2021-06-15 06:50:26'),
(3,'delete','web','2021-06-15 06:50:30','2021-06-15 06:50:30'),
(4,'view','web','2021-06-15 06:50:35','2021-06-15 06:50:35'),
(5,'export_excel','web','2021-06-15 06:50:55','2021-06-15 06:50:55'),
(6,'import_data','web','2021-06-15 06:51:03','2021-06-15 06:51:03'),
(7,'print','web','2021-06-15 06:51:10','2021-06-15 06:51:10');

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `posts` */

insert  into `posts`(`id`,`title`,`created_at`,`updated_at`) values 
(1,'Odio ducimus occaecati aut odio repudiandae voluptates.','2021-06-15 06:45:48','2021-06-15 06:45:48'),
(2,'Quisquam maiores qui perspiciatis non et.','2021-06-15 06:45:48','2021-06-15 06:45:48'),
(3,'Deleniti nesciunt dicta rerum facere.','2021-06-15 06:45:48','2021-06-15 06:45:48'),
(4,'Quia nihil non dolores optio.','2021-06-15 06:45:48','2021-06-15 06:45:48'),
(5,'Et aut cumque dolor eius officia autem.','2021-06-15 06:45:48','2021-06-15 06:45:48'),
(6,'Doloribus et deleniti nulla a odio.','2021-06-15 06:45:48','2021-06-15 06:45:48'),
(7,'Eos illum aperiam et placeat dolor.','2021-06-15 06:45:48','2021-06-15 06:45:48'),
(8,'Sed iusto saepe dolorum.','2021-06-15 06:45:48','2021-06-15 06:45:48'),
(9,'Animi repudiandae ut veritatis necessitatibus.','2021-06-15 06:45:48','2021-06-15 06:45:48'),
(10,'Pariatur occaecati rerum fugit ut omnis.','2021-06-15 06:45:48','2021-06-15 06:45:48');

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'admin','web','2021-06-15 06:47:52','2021-06-15 06:47:52'),
(2,'partners','web','2021-06-15 06:48:14','2021-06-15 06:48:14');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','admin@email.com',NULL,'$2y$10$LVGIun.s/bwjV444yzqY1OV6.8hdYNd1tIGVzFQeX74JXUX2yiAai',NULL,'2021-06-15 06:41:52','2021-06-15 06:41:52');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
