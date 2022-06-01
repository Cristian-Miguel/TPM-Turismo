-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2022 a las 09:04:10
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `turismo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tour`
--

CREATE TABLE `tour` (
  `idTour` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Cantidad` int(11) NOT NULL COMMENT 'Cantidad total de personas que pueden tomar el tour',
  `Imagen` mediumtext NOT NULL,
  `Costo` decimal(5,2) NOT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Descuento` decimal(5,2) DEFAULT NULL,
  `Calificacion` decimal(2,1) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tour`
--

INSERT INTO `tour` (`idTour`, `Nombre`, `Descripcion`, `Cantidad`, `Imagen`, `Costo`, `Ciudad`, `Descuento`, `Calificacion`, `idUsuario`) VALUES
(1, 'Tour Patzcuaro', 'Conoce los principales edificios de la zona centro de Patz', 10, 'https://th.bing.com/th/id/R.80962ebff84c86b57fdfcd1449725d68?rik=%2faBVAMcBTfl8dg&riu=http%3a%2f%2fhotelcasaencantada.com%2fes%2fassets%2fimages%2fimg-1708-2800x1866.jpg&ehk=ueio46ew6eg4Ag%2bneNQXWwbUKaoTB3%2feOXT%2fGHVq6iQ%3d&risl=&pid=ImgRaw&r=0', '100.00', 'Patzcuaro', '20.00', '3.0', 2),
(2, 'Salida Por Morelia', 'Disfruta de los atractivos turísticos con los que cuenta Morelia en sus bordes exteriores.', 30, 'https://a.travel-assets.com/findyours-php/viewfinder/images/res60/66000/66886-Morelia.jpg', '200.00', 'Morelia', '20.00', '2.0', 2),
(3, 'Maravillas de Quiroga', 'Conoce los lugares emblemáticos con los que cuenta la bella ciudad de Quiroga', 40, 'https://th.bing.com/th/id/R.54b2a19828443f8f3c781fa8967fd9ca?rik=vAgDwIJnXZvD%2fw&riu=http%3a%2f%2fwww.zihuatanejo.net%2fpatzcuaro%2fimages%2fquirogaplaza-1.jpg&ehk=z8uFhGO9pmRzC%2b8%2b%2bJVy7DNHxvD0%2fuIHiWh77NZhidc%3d&risl=&pid=ImgRaw&r=0', '140.00', 'Quiroga', '10.00', '1.0', 2),
(4, 'Caminos de Apatzingan', 'Recorre la famosa ruta de tierra caliente y todos los atractivos que esta ofrece.', 30, 'https://i.pinimg.com/originals/89/4e/2c/894e2cd4557100e402d0e08dae877620.jpg', '127.00', 'Apatzingan', '40.00', '3.0', 2),
(5, 'Tour Charo', 'Recorre los lugares mas visitados de la historica ciudad de Hidalgo', 40, 'https://i.pinimg.com/originals/bb/0a/24/bb0a249626944e13b6a2f7a1f7f98d7b.jpg', '134.00', 'Charo', '30.00', '4.0', 2),
(6, 'Tour Lazaro Cardenas', 'Disfruta de las paradisiacas playas de internacional ciudad de lázaro cárdenas', 30, 'https://www.playasmexico.com.mx/wp-content/uploads/2008/09/lazaro-cardenas.jpg', '300.00', 'Lazaro Cardenas', '30.00', '5.0', 2),
(7, 'Tour Urupan', 'Visita desde el parque nacional con sus leyendas hasta la hermosa catedral de Uruapan', 20, 'https://th.bing.com/th/id/R.9eacc1a99b231ab16388c250f0bdf730?rik=Io0iMOet7MdZzw&riu=http%3a%2f%2fwww.paduaweb.com.ar%2fimages%2ffotos_iglesia%2ffrente_completo.jpg&ehk=PdVRzQAz3NjVRXbwPoV0H7s%2bdvgFxAp4tVr%2bEyS0%2b08%3d&risl=&pid=ImgRaw&r=0', '402.00', 'Uruapan', '40.00', '2.0', 2),
(8, 'Tour Agililla', 'Disfruta de este survivor, si sobrevives te ganas una botella completamente gratis.', 10, 'https://revolucion.news/wp-content/uploads/2020/07/20431469_1239984089445342_39635582563087740_n.jpg', '500.00', 'Agililla', '40.00', '1.0', 2),
(9, 'Tour Mariposa Monarca', 'Disfruta de esta maravilla de naturaleza mientras aprendes como conservar su ecosistema.', 50, 'https://th.bing.com/th/id/OIP.F6B8MfcA1pdYd5HOTYpFGgHaEK?pid=ImgDet&rs=1', '143.00', 'Tuzantla', '50.00', '3.0', 2),
(10, 'Recorrido por Paracho', 'Conoce los principales museos de la ciudad', 20, 'https://tolucalabellacd.com/wp-content/uploads/2020/07/arton23614.jpg', '100.00', 'Kvartsitnyy', '10.00', '2.0', 2),
(11, 'Zirahuen', 'Disfruta de la magia del cristalino lago de Ziruhen y sus actividades y restaurantes.', 20, 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EW7r_bE-DCZAhKU0yFRrOUABawK9HKMBLv7NFgXSRVmFIQ?e=akVGSv', '200.00', 'Zirahuen', '10.00', '5.0', 2),
(12, 'Los azufres', 'Disfruta de las aguas termales así como de la esencia del bosque del norte de Michoacán', 25, 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EdddYo4u8gtHsjVljM2FAdABEBr0VqWMXT0H-Xe5nrJ1Ew?e=07tuNU', '300.00', 'Morelia', '15.00', '5.0', 2),
(13, 'Tour a la alberca', 'Disfruta de la maravilla natural de la comunidad de Teremendo y sumérgete en su historia y belleza', 10, 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EQH2vkpkW1xMof6a1WEDMvEB71GO-pNpKBHJP_nz2nkVMw?e=iMacJu', '150.00', 'Teremendo', '5.00', '4.0', 2),
(14, 'La alberca 2', 'Sumérgete en las profundidades del volcán ubicado en Villajimenez', 20, 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EQH2vkpkW1xMof6a1WEDMvEB71GO-pNpKBHJP_nz2nkVMw?e=bl9rF2', '300.00', 'Villa Jimenez', '5.00', '5.0', 1),
(15, 'Tour Parikutin', 'Vista el volcán mas joven del mundo y las ruinas del pueblo enterrado bajo la lava de su única erupc', 30, 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EemWQhrBDu1Iq67NN4BKCsEBAVLVG3y6UF-Yb7EqH2RhAQ?e=WIBF6j', '300.00', 'San Juan', '5.00', '5.0', 2),
(16, 'Tour Janitzio', 'Conoce el misticismo de día de muertos con el lugar mas famoso.', 40, 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EXHBO1T0PO9Pp-SWMlefA5oBfABqQLoHS2gi8PtxA_UIhg?e=uX4cdO', '200.00', 'Patzcuaro', '5.00', '5.0', 2),
(18, 'Tour Santa clara ', 'Vista a los maestros constructores en cobre reconocidos mundialmente por su calidad.', 20, 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EUm78EJ9zKFGk2wOEibBJhQBgUOX8M-Uc0i8rtwQKjPhgw?e=zrnYWB', '300.00', 'Santa Clara del Cobre', '5.00', '3.0', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`idTour`),
  ADD KEY `Tour_Foreign_idReserva_idx` (`idUsuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tour`
--
ALTER TABLE `tour`
  ADD CONSTRAINT `Tour_Foreign_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
