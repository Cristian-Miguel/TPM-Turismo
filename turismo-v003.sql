-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Turismo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Turismo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Turismo` DEFAULT CHARACTER SET utf8 ;
USE `Turismo` ;

-- -----------------------------------------------------
-- Table `Turismo`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Usuario` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `TipoUsuario` VARCHAR(45) NOT NULL COMMENT 'Administrador, Turista, Empresa',
  `Imagen` MEDIUMTEXT NOT NULL,
  `Nombre` VARCHAR(50) NULL,
  `ApellidoPaterno` VARCHAR(50) NULL,
  `ApellidoMaterno` VARCHAR(50) NULL,
  `FechNac` DATE NULL,
  `RFC` VARCHAR(13) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Restaurantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Restaurantes` (
  `idRestaurante` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  `Costo` DECIMAL(6,2) NOT NULL,
  `Imagen` MEDIUMTEXT NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  `Descuento` DECIMAL(5,2) NULL,
  `Calificacion` DECIMAL(2,1) NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idRestaurante`),
  INDEX `Res_Foreign_idReserva_idx` (`idUsuario` ASC),
  CONSTRAINT `Res_Foreign_idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Turismo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Turista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Turista` (
  `idTurista` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL,
  `Apellido Paterno` VARCHAR(50) NULL,
  `ApellidoMaterno` VARCHAR(50) NULL,
  PRIMARY KEY (`idTurista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Hotel` (
  `idHotel` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  `Imagen` MEDIUMTEXT NOT NULL,
  `Categoria` VARCHAR(50) NULL,
  `Costo` DECIMAL(6,2) NULL,
  `NumHabitacion` INT NULL,
  `TipoHabitacion` VARCHAR(50) NULL,
  `NumeroExterior` VARCHAR(10) NULL COMMENT 'Numero de direccion que se encuentra en la calle, 200, 240-A',
  `Calle` VARCHAR(50) NULL COMMENT 'Calle en donde se encuentra el hotel',
  `Colonia` MEDIUMTEXT NULL COMMENT 'Colonia en donde se encuentra el hotel',
  `Ciudad` VARCHAR(50) NULL COMMENT 'Ciudad donde se encuentra el hotel',
  `Estado` VARCHAR(70) NULL COMMENT 'Estado de la republica mexicana donde se encuentre',
  `CodigoPostal` INT NULL,
  `Descuento` DECIMAL(5,2) NULL,
  `Calificacion` DECIMAL(2,1) NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idHotel`),
  INDEX `Tour_Foreign_idUsuario_idx` (`idUsuario` ASC),
  CONSTRAINT `Hotel_Foreign_idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Turismo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Viajes` (
  `idViaje` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  `Origen` VARCHAR(45) NOT NULL,
  `Destino` VARCHAR(45) NOT NULL,
  `Imagen` MEDIUMTEXT NOT NULL,
  `Costo` DECIMAL(6,2) NULL,
  `NumPlazas` INT NULL,
  `Descuento` DECIMAL(5,2) NULL,
  `Calificacion` DECIMAL(2,1) NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idViaje`),
  INDEX `Foreign_idReserva_idx` (`idUsuario` ASC),
  CONSTRAINT `Viajes_Foreign_idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Turismo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Reserva_Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Reserva_Servicio` (
  `idReserva` INT NOT NULL AUTO_INCREMENT,
  `Tipo de servicio` VARCHAR(45) NULL,
  `FechaEntrada` DATE NULL,
  `FechaSalida` DATE NULL,
  `FormaPago` VARCHAR(45) NULL COMMENT 'Forma de pago del la reservacion, solo hay, con tarjeta de debito y de credito.',
  `CostoTotal` DECIMAL(6,2) NULL,
  `CantPersonas` INT NULL,  
  `confirmado` TINYINT NULL,
  `idTurista` INT NULL,
  `idUsuario` INT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `Foreingn_idTurista_idx` (`idTurista` ASC),
  INDEX `Foreingn_idUsuario_idx` (`idUsuario` ASC),
  CONSTRAINT `Foreingn_idTurista`
    FOREIGN KEY (`idTurista`)
    REFERENCES `Turismo`.`Turista` (`idTurista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Foreingn_idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Turismo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Mensajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Mensajes` (
  `idMensajes` INT NOT NULL AUTO_INCREMENT,
  `Contenido` LONGTEXT NULL,
  PRIMARY KEY (`idMensajes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Chat` (
  `IdMensaje` INT NOT NULL,
  `idUsuario1` INT NOT NULL,
  `idUsuario2` INT NOT NULL,
  `Remitente` INT NOT NULL,
  PRIMARY KEY (`IdMensaje`, `idUsuario1`, `idUsuario2`),
  INDEX `Foreign_idUsuario2_idx` (`idUsuario2` ASC),
  INDEX `Foreign_idUsuario1_idx` (`idUsuario1` ASC),
  CONSTRAINT `Foreign_idMensaje`
    FOREIGN KEY (`IdMensaje`)
    REFERENCES `Turismo`.`Mensajes` (`idMensajes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Foreign_idUsuario1`
    FOREIGN KEY (`idUsuario1`)
    REFERENCES `Turismo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Foreign_idUsuario2`
    FOREIGN KEY (`idUsuario2`)
    REFERENCES `Turismo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Paquetes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Paquetes` (
  `idPaquete` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Descripcion` LONGTEXT NOT NULL,
  `Costo` DECIMAL(5,2) NOT NULL COMMENT 'Costo total de todo el paquete',
  `NumeroPaquetes` INT NOT NULL COMMENT 'Numero total de reservaciones del paquete antes de agotarce',
  `Imagen` MEDIUMTEXT NOT NULL,
  `Descuento` DECIMAL(5,2) NULL,
  `Calificacion` DECIMAL(2,1) NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPaquete`),
  INDEX `Paquetes_Foreign_idUsuario_idx` (`idUsuario` ASC),
  CONSTRAINT `Paquetes_Foreign_idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Turismo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Tour`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Tour` (
  `idTour` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  `Cantidad` INT NOT NULL COMMENT 'Cantidad total de personas que pueden tomar el tour',
  `Imagen` MEDIUMTEXT NOT NULL,
  `Costo` DECIMAL(5,2) NOT NULL,
  `Ciudad` VARCHAR(50) NULL,
  `Descuento` DECIMAL(5,2) NULL,
  `Calificacion` DECIMAL(2,1) NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idTour`),
  INDEX `Tour_Foreign_idReserva_idx` (`idUsuario` ASC),
  CONSTRAINT `Tour_Foreign_idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Turismo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Favoritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Favoritos` (
  `idFavoritos` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idFavoritos`, `idUsuario`),
  INDEX `Foreign_idUsuario_idx` (`idUsuario` ASC),
  CONSTRAINT `Foreign_idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Turismo`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Organizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Organizador` (
  `idOrganizador` INT NOT NULL AUTO_INCREMENT,
  `TipoGuardado` VARCHAR(25) NOT NULL,
  `idReserva` INT NULL,
  `idFavoritos` INT NULL,
  `idPaquete` INT NULL,
  `idHotel` INT NULL,
  `idViaje` INT NULL,
  `idRestaurante` INT NULL,
  `idTour` INT NULL,
  PRIMARY KEY (`idOrganizador`),
  INDEX `Foreign_idReserva_idx` (`idReserva` ASC),
  INDEX `Foreign_idFavorito_idx` (`idFavoritos` ASC),
  INDEX `Foreign_idPaquete_idx` (`idPaquete` ASC),
  INDEX `Foreign_idHotel_idx` (`idHotel` ASC),
  INDEX `Foreign_idViaje_idx` (`idViaje` ASC),
  INDEX `Foreign_idRestaurante_idx` (`idRestaurante` ASC),
  INDEX `Foreign_idTour_idx` (`idTour` ASC),
  CONSTRAINT `Foreign_idReserva`
    FOREIGN KEY (`idReserva`)
    REFERENCES `Turismo`.`Reserva_Servicio` (`idReserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Foreign_idFavorito`
    FOREIGN KEY (`idFavoritos`)
    REFERENCES `Turismo`.`Favoritos` (`idFavoritos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Foreign_idPaquete`
    FOREIGN KEY (`idPaquete`)
    REFERENCES `Turismo`.`Paquetes` (`idPaquete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Foreign_idHotel`
    FOREIGN KEY (`idHotel`)
    REFERENCES `Turismo`.`Hotel` (`idHotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Foreign_idViaje`
    FOREIGN KEY (`idViaje`)
    REFERENCES `Turismo`.`Viajes` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Foreign_idRestaurante`
    FOREIGN KEY (`idRestaurante`)
    REFERENCES `Turismo`.`Restaurantes` (`idRestaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Foreign_idTour`
    FOREIGN KEY (`idTour`)
    REFERENCES `Turismo`.`Tour` (`idTour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turismo`.`Imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turismo`.`Imagenes` (
  `idImagenes` INT NOT NULL AUTO_INCREMENT,
  `Imagen` MEDIUMTEXT NOT NULL,
  `idPaquete` INT NULL,
  `idHotel` INT NULL,
  `idViaje` INT NULL,
  `idRestaurante` INT NULL,
  `idTour` INT NULL,
  PRIMARY KEY (`idImagenes`),
  INDEX `Imagenes_Foreign_idPaquete_idx` (`idPaquete` ASC),
  INDEX `Imagenes_Foreign_idHotel_idx` (`idHotel` ASC),
  INDEX `Imagenes_Foreign_idViaje_idx` (`idViaje` ASC),
  INDEX `Imagenes_Foreign_idRestaurante_idx` (`idRestaurante` ASC),
  INDEX `Imagenes_Foreign_idTour_idx` (`idTour` ASC),
  CONSTRAINT `Imagenes_Foreign_idPaquete`
    FOREIGN KEY (`idPaquete`)
    REFERENCES `Turismo`.`Paquetes` (`idPaquete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Imagenes_Foreign_idHotel`
    FOREIGN KEY (`idHotel`)
    REFERENCES `Turismo`.`Hotel` (`idHotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Imagenes_Foreign_idViaje`
    FOREIGN KEY (`idViaje`)
    REFERENCES `Turismo`.`Viajes` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Imagenes_Foreign_idRestaurante`
    FOREIGN KEY (`idRestaurante`)
    REFERENCES `Turismo`.`Restaurantes` (`idRestaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Imagenes_Foreign_idTour`
    FOREIGN KEY (`idTour`)
    REFERENCES `Turismo`.`Tour` (`idTour`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Data for table `Turismo`.`Usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `Turismo`;
INSERT INTO `Turismo`.`Usuarios` (`idUsuario`, `Usuario`, `Email`, `Password`, `TipoUsuario`, `Imagen`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechNac`, `RFC`) VALUES (1, 'Cris123', 'cristian_enano_99@hotmail.com', '123456789', 'Usuario', '1as12', 'Cristian', 'Marin', 'Barrera', '1999-02-26', '');
INSERT INTO `Turismo`.`Usuarios` (`idUsuario`, `Usuario`, `Email`, `Password`, `TipoUsuario`, `Imagen`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechNac`, `RFC`) VALUES (2, 'Empresa1', 'cristian-m-97@hotmail.com', '123456789', 'Empresa', '1233', 'Miguel', 'Apellido1', 'Apellido2', '1997-04-12', '1234567');
INSERT INTO `Turismo`.`Usuarios` (`idUsuario`, `Usuario`, `Email`, `Password`, `TipoUsuario`, `Imagen`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechNac`, `RFC`) VALUES (3, 'Empresa2', 'mike@hotmail.com', '1234', 'Empresa', '1233', 'Miguel', 'Apellido1', 'Apellido2', '1997-04-12', '1234567');
COMMIT;


-- -----------------------------------------------------
-- Data for table `Turismo`.`Favoritos`
-- -----------------------------------------------------
START TRANSACTION;
USE `Turismo`;
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (1, 1);
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (2, 1);
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (3, 1);
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (4, 1);
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (5, 1);
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (6, 1);
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (7, 1);
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (8, 1);
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (9, 1);
INSERT INTO `Turismo`.`Favoritos` (`idFavoritos`, `idUsuario`) VALUES (10, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Turismo`.`Turista`
-- -----------------------------------------------------
START TRANSACTION;
USE `Turismo`;
INSERT INTO `Turismo`.`Turista` (`idTurista`, `Nombre`, `Apellido Paterno`, `ApellidoMaterno`) VALUES (1, 'Mike', 'Paterno', 'Materno');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Turismo`.`Restaurantes`
-- -----------------------------------------------------
START TRANSACTION;
USE `Turismo`;
INSERT INTO `restaurantes` (`idRestaurante`, `Nombre`, `Descripcion`, `Costo`, `Imagen`, `Categoria`, `Descuento`, `Calificacion`, `idUsuario`) VALUES
(1,'Buffet  regional','Disfrute de una buena variedad de comida tipicas de Mexico',300.00,'https://th.bing.com/th/id/R.1b70ecd382f9467d60dab7303d8794b5?rik=HqkO4AVAuwXz5g&riu=http%3a%2f%2flh5.ggpht.com%2f-ZPSfkbYWxSg%2fTxiWFjWWEtI%2fAAAAAAAAC4g%2fnQjCx_CP4V4%2fbuffet%25252520morelia%25252520%252525283%25252529_thumb%2525255B1%2525255D.jpg%3fimgmax%3d800&ehk=NbSB1hK9v7q9ij3r3L6Uo3q1lnv1oetP1CTH3ZpczB4%3d&risl=&pid=ImgRaw&r=0','Buffet',0.00,4.1,2),
(2,'La Conspiracion de 1809','Apto para vegetarianos, Opciones veganas, Opciones sin gluten',80.00,'https://media-cdn.tripadvisor.com/media/photo-s/12/42/aa/63/el-portal-allende.jpg','Internacional',10.00,4.5,2),
(3,'Mandala Pizzas','Apto para vegetarianos, Opciones veganas',50.00,'https://media-cdn.tripadvisor.com/media/photo-s/18/b3/00/56/una-de-nuestras-deliciosas.jpg','Pizzeria',5.00,4.0,2),
(4,'Jardin Steak House','Un restaurante de comida internacional encontrado en Uruapan.',50.00,'https://media-cdn.tripadvisor.com/media/photo-s/07/c9/71/ba/jardin-steak-house.jpg','Internacional',0.00,4.3,2),
(5,'La Cocina Michoacana','Un restaurante en Morelia con comida de tipo Mexicana, Latina, Contemporanea',45.00,'https://media-cdn.tripadvisor.com/media/photo-s/1b/8b/dd/17/restaurante-lu-cocina.jpg','Michoacana',5.00,4.8,2),
(6,'Casa Del Naranjo Restaurante','Apto para vegetarianos, Opciones veganas, Opciones sin gluten',42.00,'https://media-cdn.tripadvisor.com/media/photo-s/21/71/59/12/que-evento-te-imaginas.jpg','Michoacana',6.00,4.2,2),
(7,'el Patio restaurant','Apto para vegetarianos, Opciones veganas, Opciones sin gluten',32.00,'https://media-cdn.tripadvisor.com/media/photo-s/12/9d/d3/d0/restaurante-el-patio.jpg','Michoacana',4.00,4.3,2),
(8,'El Arriero Churrasqueria','La mejor churrasqueria de La piedad Michoacan',50.00,'https://media-cdn.tripadvisor.com/media/photo-s/0a/2e/eb/02/el-arriero-churrasqueria.jpg','Churrasqueria',0.00,3.9,2),
(9,'El Pulpo','Disfrute de nuestro riquisimos marisco en el pueto de Lazaro Cardenas',34.00,'https://media-cdn.tripadvisor.com/media/photo-s/08/1f/bb/81/enramada-el-pulpo.jpg','Marisqueria',3.00,4.1,2),
(10,'Los Balcones','Si deseas pasar un momento unico ven a nuestro restaurante de mariscos',52.00,'https://media-cdn.tripadvisor.com/media/photo-s/1d/ee/58/8b/balcones.jpg','Marisqueria',6.00,4.5,2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Turismo`.`Hotel`
-- -----------------------------------------------------
START TRANSACTION;
USE `Turismo`;
INSERT INTO `hotel` (`idHotel`, `Nombre`, `Descripcion`, `Imagen`, `Categoria`, `Costo`, `NumHabitacion`, `TipoHabitacion`, `NumeroExterior`, `Calle`, `Colonia`, `Ciudad`, `Estado`, `CodigoPostal`, `Descuento`, `Calificacion`, `idUsuario`)  VALUES 
(1,'Hotel Charo','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://th.bing.com/th/id/R.ef074a82169f29e75398298d11259368?rik=3%2fhY3uWOGei4tQ&riu=http%3a%2f%2fmichoacan.travel%2fassets%2fcache%2f23ef43a8ba7034f8b17f26f28a9a3792%2fhotel-624-img-6532_726x408_adaptiveResize.jpg&ehk=wIepD6jU5ajbsI5w1Hu%2fxPQmXsTdUEzwG20R%2fxQ4r30%3d&risl=&pid=ImgRaw&r=0','Familiar',100.00,20,'Quad','123','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',59988,0.00,4.3,2),
(2,'Hotel Patzcuaro','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/db/ac/00/area-de-jardines.jpg?w=900&h=-1&s=1','Urbano',200.00,10,'Triple','2525','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',53433,10.00,3.4,2),
(3,'Puntacierra','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://th.bing.com/th/id/OIP.9-Is_Spt88N7J25gjZEtpwHaEK?pid=ImgDet&rs=1','Monumento',150.00,14,'Individual','948','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',56777,0.00,3.4,2),
(4,'Cielo','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://th.bing.com/th/id/R.ecf7c29495b925a514d913f3bd7531b0?rik=ySRd5q3jWnukGg&riu=http%3a%2f%2fapi-tarhiata.michoacan.travel%2ffiles%2f42dac78c17149caac83296b32af38f59%2fhotel-5-1-hall-del-hotel.jpg&ehk=L5e%2bw3iqV1lqBh8QzWFZbKDBGSNR7fCbK4HOlw%2b8FWU%3d&risl=&pid=ImgRaw&r=0','Balneario',300.00,11,'Doble','2672','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',59998,0.00,4.6,2),
(5,'Estrella','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://2.bp.blogspot.com/-uw161voH9uE/Wyji_NfIMrI/AAAAAAAAA4k/ixXOp8Y8te84-WZLM264s0GO9U5lf0qNgCLcBGAs/s1600/Homestay%2Bdi%2Bmelaka%2Btepi%2Bpantai%2BLaman%2BGuesthouse.jpg','Low cost',80.00,6,'Individual','27','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',51122,0.00,3.8,2),
(6,'Portico','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://th.bing.com/th/id/R.34aa8d523ca3d67077e39d47b09364d1?rik=dN2%2b0xNPDgl67A&riu=http%3a%2f%2fstatic.wixstatic.com%2fmedia%2f54c6f5_34aa8d523ca3d67077e39d47b09364d1.jpg&ehk=ZyjmxgrxLobaVJYvr%2f%2fp%2b7FbWKmurRPOPrArH5Oofh4%3d&risl=&pid=ImgRaw&r=0','Albergue turistico',200.00,4,'Individual','2181','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',50978,0.00,4.1,2),
(7,'El rio','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://th.bing.com/th/id/R.0a5a8657863379e10460dd956b26742e?rik=AtgNlHMvFrAURQ&riu=http%3a%2f%2fwww.hospedarme.com.mx%2fwp-content%2fuploads%2f2019%2f07%2fhotel-don-bruno-hoteles-en-angangueo.jpg&ehk=UXNOxwNZ8R1HM7pffWmVe2ZjvVDMEjhvv9uDwBUtRBA%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1','De apartamento',350.00,25,'Triple','9653','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',50988,0.00,4.0,2),
(8,'Hostalito','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://th.bing.com/th/id/R.d43138db5b164110669213d452733dd2?rik=3o3%2furn8jlLuOw&riu=http%3a%2f%2fmedia-cdn.tripadvisor.com%2fmedia%2fphoto-s%2f06%2fe6%2f85%2f24%2fpatio-colonial.jpg&ehk=Ilp0LZGV33zj0rTfLZmgJcBN8VuVDQu64qeeN6FYH1E%3d&risl=&pid=ImgRaw&r=0','De aeropuerto',300.00,25,'Doble','2723','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',53343,20.00,4.8,2),
(9,'La cierra','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://th.bing.com/th/id/R.52e7b596a91ee34873593ba105830c7f?rik=NZObRPIImmz26g&riu=http%3a%2f%2fcdn2.melodijolola.com%2fmedia%2ffiles%2fhotel_0.jpg&ehk=3OT%2fkHum%2bjocsomuzfLwoHTqz%2fR%2b%2fEYlwfNfg8eRCjo%3d&risl=&pid=ImgRaw&r=0','De naturaleza',180.00,16,'Doble','456','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',57887,0.00,3.9,2),
(10,'Camino','Pretium erat inceptos posuere metus risus massa sapien sociosqu scelerisque, conubia velit at','https://media-cdn.tripadvisor.com/media/photo-p/07/6a/52/89/hotel-concordia.jpg','Pasada',80.00,12,'Doble','8223','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos','Pretium erat inceptos',59086,0.00,4.0,2);
COMMIT;


-- -----------------------------------------------------
-- Data for table `Turismo`.`Reserva_Servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `Turismo`;
INSERT INTO `reserva_servicio` (`idReserva`, `Tipo de servicio`, `FechaEntrada`, `FechaSalida`, `FormaPago`, `CostoTotal`, `CantPersonas`, `confirmado`, `idTurista`, `idUsuario`) VALUES 
(1,'Restaurante',  '2022-05-05', '2022-05-15', 'Efectivo', 3000.00, 1, 1,    1, NULL),
(2,'Hotel',        '2022-05-05', '2022-05-15', 'Efectivo', 1500.00, 1, 1, NULL,    1),
(3,'Tour',         '2022-05-05', '2022-05-15', 'Efectivo', 2500.00, 1, 1, NULL,    1),
(4,'Restaurante',  '2022-05-05', '2022-05-15', 'Efectivo', 3000.00, 2, 1, NULL,    1),
(5,'Hotel',        '2022-05-05', '2022-05-15', 'Efectivo', 3200.00, 2, 1, NULL,    1),
(6,'Tour',         '2022-05-05', '2022-05-15', 'Efectivo', 4400.00, 4, 1,    1, NULL),
(7,'Restaurante',  '2022-05-05', '2022-05-15', 'Efectivo', 5000.00, 5, 1,    1, NULL),
(8,'Hotel',        '2022-05-05', '2022-05-15', 'Efectivo', 3440.00, 3, 1, NULL,    1),
(9,'Tour',         '2022-05-05', '2022-05-15', 'Efectivo', 4000.00, 2, 1, NULL,    1),
(10,'Restaurante', '2022-05-05', '2022-05-15', 'Efectivo', 3259.00, 2, 1, NULL,    1);
COMMIT;


-- -----------------------------------------------------
-- Data for table `Turismo`.`Tour`
-- -----------------------------------------------------
START TRANSACTION;
USE `Turismo`;
INSERT INTO `tour` (`idTour`, `Nombre`, `Descripcion`, `Cantidad`, `Imagen`, `Costo`, `Ciudad`, `Descuento`, `Calificacion`, `idUsuario`) VALUES 
(1,'Tour Patzcuaro','Total 5th generation solution',10,'https://th.bing.com/th/id/R.80962ebff84c86b57fdfcd1449725d68?rik=%2faBVAMcBTfl8dg&riu=http%3a%2f%2fhotelcasaencantada.com%2fes%2fassets%2fimages%2fimg-1708-2800x1866.jpg&ehk=ueio46ew6eg4Ag%2bneNQXWwbUKaoTB3%2feOXT%2fGHVq6iQ%3d&risl=&pid=ImgRaw&r=0',100.00,'Patzcuaro',20.00,3.0,2),
(2,'Salida Por Morelia','Visionary radical throughput',30,'https://images.pexels.com/photos/763429/pexels-photo-763429.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',200.00,'Morelia',20.00,2.0,2),
(3,'Maravillas de Quiroga','Synchronised even-keeled archive',40,'https://th.bing.com/th/id/R.54b2a19828443f8f3c781fa8967fd9ca?rik=vAgDwIJnXZvD%2fw&riu=http%3a%2f%2fwww.zihuatanejo.net%2fpatzcuaro%2fimages%2fquirogaplaza-1.jpg&ehk=z8uFhGO9pmRzC%2b8%2b%2bJVy7DNHxvD0%2fuIHiWh77NZhidc%3d&risl=&pid=ImgRaw&r=0',140.00,'Quiroga',10.00,1.0,2),
(4,'Caminos de Apatzingan','Re-contextualized hybrid complexity',30,'https://th.bing.com/th/id/R.b6ae2c1a37f19ad83e414edc8f6d4ed4?rik=3KY2VnH0lW6nLA&riu=http%3a%2f%2flauraelenamartinez.files.wordpress.com%2f2010%2f12%2fapatzingan.jpg&ehk=ti12uRMqTH%2buUGfJ42fR1LpHPDxTUpn5FHzkQ6SK2pI%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',127.00,'Aparzingan',40.00,3.0,2),
(5,'Tour Charo','Optional ',40,'https://th.bing.com/th/id/R.2370060cea02442ec2e2b8fe1d5cc040?rik=i8vz2fWhNch30A&riu=http%3a%2f%2fwww.elcharense.com%2fwp-content%2fuploads%2f2019%2f10%2fWhatsApp-Image-2019-09-15-at-10.21.01-PM-1.jpeg&ehk=df4CP4f45gYl6oqCQdHwKsjIHFR5zETkhCCpSrMklG0%3d&risl=&pid=ImgRaw&r=0',134.00,'Charo',30.00,4.0,2),
(6,'Tour Lazaro Cardenas','Universal maximized analyzer',30,'https://th.bing.com/th/id/R.6fa246cfd926ff7df6139838b41a1ca8?rik=%2bJ42QvDqo%2fyVvQ&riu=http%3a%2f%2fwww.lazarocardenasportcommunity.com%2fwp-content%2fuploads%2f2018%2f03%2fPUERTO-LAZARO-CARDENAS_045.jpg&ehk=PfNhVW%2bdIdJXNA1Hm3CSJncbmzCgMmPkBoC04RBDae8%3d&risl=&pid=ImgRaw&r=0',300.00,'Lazaro Cardenas',30.00,5.0,2),
(7,'Tour Urupan','Visionary dedicated focus group',20,'https://th.bing.com/th/id/R.9eacc1a99b231ab16388c250f0bdf730?rik=Io0iMOet7MdZzw&riu=http%3a%2f%2fwww.paduaweb.com.ar%2fimages%2ffotos_iglesia%2ffrente_completo.jpg&ehk=PdVRzQAz3NjVRXbwPoV0H7s%2bdvgFxAp4tVr%2bEyS0%2b08%3d&risl=&pid=ImgRaw&r=0',402.00,'Uruapan',40.00,2.0,2),
(8,'Tour Aguililla','Secured encompassing Graphic Interface',10,'https://th.bing.com/th/id/OIP.aANuzcOJiZ6rrqRUgghADQHaFj?pid=ImgDet&rs=1',500.00,'Agililla',40.00,1.0,2),
(9,'Tour Mariposa Monarca','Seamless object-oriented synergy',50,'https://th.bing.com/th/id/OIP.F6B8MfcA1pdYd5HOTYpFGgHaEK?pid=ImgDet&rs=1',143.00,'Tuzantia',50.00,3.0,2),
(10,'Recorrido por Paracho','Upgradable composite support',20,'https://tolucalabellacd.com/wp-content/uploads/2020/07/arton23614.jpg',100.00,'Kvartsitnyy',10.00,2.0,2);
COMMIT;


-- -----------------------------------------------------
-- Data for table `Turismo`.`Organizador`
-- -----------------------------------------------------
START TRANSACTION;
USE `Turismo`;
INSERT INTO `organizador` (`idOrganizador`, `TipoGuardado`, `idReserva`, `idFavoritos`, `idPaquete`, `idHotel`, `idViaje`, `idRestaurante`, `idTour`) VALUES 
(1,'Favorito',NULL,1,NULL,1,NULL,NULL,NULL),
(2,'Reserva',1,NULL,NULL,NULL,NULL,1,NULL),
(3,'Favorito',NULL,2,NULL,NULL,NULL,NULL,1),
(4,'Reserva',2,NULL,NULL,2,NULL,NULL,NULL),
(5,'Favorito',NULL,3,NULL,NULL,NULL,2,NULL),
(6,'Reserva',3,NULL,NULL,NULL,NULL,NULL,2),
(7,'Favorito',NULL,4,NULL,3,NULL,NULL,NULL),
(8,'Reserva',4,NULL,NULL,NULL,NULL,3,NULL),
(9,'Favorito',NULL,5,NULL,NULL,NULL,NULL,3),
(10,'Reserva',5,NULL,NULL,4,NULL,NULL,NULL),
(11,'Favorito',NULL,6,NULL,NULL,NULL,4,NULL),
(12,'Reserva',6,NULL,NULL,NULL,NULL,NULL,4),
(13,'Favorito',NULL,7,NULL,5,NULL,NULL,NULL),
(14,'Reserva',7,NULL,NULL,NULL,NULL,5,NULL),
(15,'Favorito',NULL,8,NULL,NULL,NULL,NULL,5),
(16,'Reserva',8,NULL,NULL,6,NULL,NULL,NULL),
(17,'Favorito',NULL,9,NULL,NULL,NULL,6,NULL),
(18,'Reserva',9,NULL,NULL,NULL,NULL,NULL,6),
(19,'Favorito',NULL,10,NULL,7,NULL,NULL,NULL),
(20,'Reserva',10,NULL,NULL,NULL,NULL,7,NULL);
COMMIT;



