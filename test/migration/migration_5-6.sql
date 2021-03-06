ALTER TABLE `user` DROP COLUMN `name`;
ALTER TABLE `user` DROP COLUMN `age`;
ALTER TABLE `user` ADD COLUMN `username` varchar(255) NULL DEFAULT NULL;
ALTER TABLE `user` ADD COLUMN `password` varchar(255) NULL DEFAULT NULL;
ALTER TABLE `user` ADD COLUMN `firstname` varchar(255) NULL DEFAULT NULL;
ALTER TABLE `user` ADD COLUMN `surname` varchar(255) NULL DEFAULT NULL;
CREATE TABLE IF NOT EXISTS `user_roles` (`user_id` int(11) NOT NULL,`role_id` int(11) NOT NULL, PRIMARY KEY (`user_id`,`role_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `accesstoken` (`id` int(11) NOT NULL AUTO_INCREMENT,PRIMARY KEY (`id`),`token` varchar(255) NULL DEFAULT NULL,`expire` datetime NULL DEFAULT NULL,`user_id` int(11) NULL DEFAULT NULL,KEY `user_id` (`user_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `role` (`id` int(11) NOT NULL AUTO_INCREMENT,PRIMARY KEY (`id`),`name` varchar(255) NULL DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;