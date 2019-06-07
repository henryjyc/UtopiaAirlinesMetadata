CREATE DATABASE IF NOT EXISTS `utopia`;
USE `utopia`;
CREATE TABLE `tbl_airports` (
  `code` char(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `idtbl_airports_UNIQUE` (`code`)
);

CREATE TABLE `tbl_flights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departure` char(3) NOT NULL,
  `destination` char(3) NOT NULL,
  `departure_date` datetime NOT NULL,
  `arrival_date` datetime NOT NULL,
  `flight_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idtbl_flights_UNIQUE` (`id`),
  KEY `departure_idx` (`departure`),
  KEY `destination_idx` (`destination`),
  CONSTRAINT `departure` FOREIGN KEY (`departure`) REFERENCES `tbl_airports` (`code`),
  CONSTRAINT `destination` FOREIGN KEY (`destination`) REFERENCES `tbl_airports` (`code`),
  CONSTRAINT `departure!=destination` CHECK (`departure` != `destination`),
  CONSTRAINT `departure_date<destination_date` CHECK (`departure_date` < `arrival_date`)
);

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45),
  `password` varchar(255),
  `display_name` varchar(45) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `email` varchar(45),
  `phone` varchar(15),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `identifier_exists` CHECK ((`username` IS NOT NULL) OR (`email` IS NOT NULL) OR (`phone` IS NOT NULL))
);

CREATE TABLE `tbl_tickets` (
  `flight` int(11) NOT NULL,
  `row` int(11) NOT NULL,
  `seat` char(1) NOT NULL,
  `class` int(11) NOT NULL,
  `reserver` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `reservation_timeout` datetime DEFAULT NULL,
  `booking_id` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`flight`,`row`,`seat`),
  KEY `reserver_idx` (`reserver`),
  CONSTRAINT `flight` FOREIGN KEY (`flight`) REFERENCES `tbl_flights` (`id`),
  CONSTRAINT `reserver` FOREIGN KEY (`reserver`) REFERENCES `tbl_users` (`id`),
  CONSTRAINT `reserved_check` CHECK ( (`reserver` IS NULL AND `price` IS NULL AND `reservation_timeout` IS NULL)
  OR (`reserver` IS NOT NULL AND `price` IS NOT NULL AND `reservation_timeout` IS NULL)
  OR (`reserver` IS NOT NULL AND `price` IS NULL AND `reservation_timeout` IS NOT NULL) ),
  CONSTRAINT `booking_id_check` CHECK ((`reserver` IS NULL AND `booking_id` IS NULL) OR (`reserver` IS NOT NULL AND `booking_id` IS NOT NULL))
);

