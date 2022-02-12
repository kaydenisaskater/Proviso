/*
James Smith, Travis Nickerson, Kayden Linner, Daniel Woldegiorgis, Kaymon McCain
2/8/2022
CSD460
Module 9 Assignment
*/

DROP DATABASE IF EXISTS proviso;
CREATE DATABASE proviso;

DROP USER IF EXISTS 'proviso_user'@'localhost';

CREATE USER 'proviso_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQLIsGreat!';

GRANT ALL PRIVILEGES ON proviso.* TO'proviso_user'@'localhost';

CREATE TABLE `proviso`.`guest_options` (
  `guest_option_id` INT NOT NULL AUTO_INCREMENT,
  `guest_count` INT NOT NULL,
  `price` DOUBLE NOT NULL DEFAULT 0.00,
  CONSTRAINT PK_guest_options PRIMARY KEY (`guest_option_id`)
);

CREATE TABLE `proviso`.`room_sizes` (
  `room_size_id` INT NOT NULL AUTO_INCREMENT,
  `room_size_description` VARCHAR(150) NOT NULL,
  CONSTRAINT PK_room_size PRIMARY KEY (`room_size_id`)
);

CREATE TABLE `proviso`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(320) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50),
  `accrued_loyalty_points` INT NOT NULL DEFAULT 0,
  CONSTRAINT PK_user PRIMARY KEY (`user_id`),
  CONSTRAINT UK_user_email UNIQUE (`email`)
);

CREATE TABLE `proviso`.`amenities` (
  `amenity_id` INT NOT NULL AUTO_INCREMENT,
  `amenity_description` VARCHAR(150),
  `price` DOUBLE NOT NULL DEFAULT 0.00,
  `pay_rate` VARCHAR(50),
  CONSTRAINT PK_amenity PRIMARY KEY (`amenity_id`)
);

CREATE TABLE `proviso`.`reservations` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT,
  `check_in_date` DATE NOT NULL,
  `check_out_date` DATE NOT NULL,
  `total_price` DOUBLE NOT NULL DEFAULT 0.00,
  `loyalty_points` INT NOT NULL DEFAULT 0,
  `room_size_id` INT NOT NULL,
  `guest_option_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  CONSTRAINT PK_reservation PRIMARY KEY (`reservation_id`),
  CONSTRAINT FK_reservations_users_user_id FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT FK_reservations_guest_options_guest_options_id FOREIGN KEY (`guest_option_id`) REFERENCES `guest_options`(`guest_option_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT FK_reservations_room_sizes_room_size_id FOREIGN KEY (`room_size_id`) REFERENCES `room_sizes`(`room_size_id`) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE `proviso`.`include` (
  `reservation_id` INT NOT NULL,
  `amenity_id` INT NOT NULL,
  CONSTRAINT PK_include PRIMARY KEY (`reservation_id`, `amenity_id`),
  CONSTRAINT FK_include_reservations_reservation_id FOREIGN KEY (`reservation_id`) REFERENCES `reservations`(`reservation_id`),
  CONSTRAINT FK_include_amenities_amenity_id FOREIGN KEY (`amenity_id`) REFERENCES `amenities`(`amenity_id`)
);

INSERT INTO `proviso`.`guest_options` (`guest_count`, `price`) 
	VALUES 
	(1, 115.00),
	(2, 115.00),
	(3, 150.00),
	(4, 150.00),
	(5, 150.00);
	
INSERT INTO `proviso`.`room_sizes` (`room_size_description`) 
	VALUES 
	('Double Full Beds'),
	('Queen'),
	('Double Queen Beds'),
	('King');

INSERT INTO `proviso`.`amenities` (`amenity_description`, `price`, `pay_rate`) 
	VALUES 
	('WI-FI', 12.99, 'flat'),
	('Breakfast', 8.99, 'per'),
	('Parking', 19.99, 'per');
    
INSERT INTO `proviso`.`users` (`email`, `password`, `first_name`, `last_name`) 
	VALUES 
	('user@email.com', MD5('password'), 'User', 'Name');