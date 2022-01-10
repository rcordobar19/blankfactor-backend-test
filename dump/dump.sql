CREATE DATABASE IF NOT EXISTS blankfactor;

USE blankfactor;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100)  NOT NULL,
  `last_name` varchar(100) NULL,
  `email` varchar(250)  NOT NULL,
  `password` varchar(250)  NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
);
