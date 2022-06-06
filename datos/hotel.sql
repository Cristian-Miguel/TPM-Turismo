-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2022 a las 06:17:22
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
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `idHotel` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Imagen` mediumtext NOT NULL,
  `Categoria` varchar(50) DEFAULT NULL,
  `Costo` decimal(6,2) DEFAULT NULL,
  `NumHabitacion` int(11) DEFAULT NULL,
  `TipoHabitacion` varchar(50) DEFAULT NULL,
  `NumeroExterior` varchar(10) DEFAULT NULL COMMENT 'Numero de direccion que se encuentra en la calle, 200, 240-A',
  `Calle` varchar(50) DEFAULT NULL COMMENT 'Calle en donde se encuentra el hotel',
  `Colonia` mediumtext DEFAULT NULL COMMENT 'Colonia en donde se encuentra el hotel',
  `Ciudad` varchar(50) DEFAULT NULL COMMENT 'Ciudad donde se encuentra el hotel',
  `Estado` varchar(70) DEFAULT NULL COMMENT 'Estado de la republica mexicana donde se encuentre',
  `CodigoPostal` int(11) DEFAULT NULL,
  `Descuento` decimal(5,2) DEFAULT NULL,
  `Calificacion` decimal(2,1) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`idHotel`, `Nombre`, `Descripcion`, `Imagen`, `Categoria`, `Costo`, `NumHabitacion`, `TipoHabitacion`, `NumeroExterior`, `Calle`, `Colonia`, `Ciudad`, `Estado`, `CodigoPostal`, `Descuento`, `Calificacion`, `idUsuario`) VALUES
(1, 'Charo', 'Hotel rustico ubicado en la zona centro de la ciudad de Charo', 'https://th.bing.com/th/id/R.ef074a82169f29e75398298d11259368?rik=3%2fhY3uWOGei4tQ&riu=http%3a%2f%2fmichoacan.travel%2fassets%2fcache%2f23ef43a8ba7034f8b17f26f28a9a3792%2fhotel-624-img-6532_726x408_adaptiveResize.jpg&ehk=wIepD6jU5ajbsI5w1Hu%2fxPQmXsTdUEzwG20R%2fxQ4r30%3d&risl=&pid=ImgRaw&r=0', 'Familiar', '100.00', 20, 'Quad', '123', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 59988, '0.00', '4.3', 3),
(2, 'Patzcuaro', 'El mejor hotel de del pueblo mágico numero 1 del país', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/db/ac/00/area-de-jardines.jpg?w=900&h=-1&s=1', 'Urbano', '200.00', 10, 'Triple', '2525', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 53433, '10.00', '3.4', 2),
(3, 'Puntacierra', 'Lujo y comodidad en un mismo hotel.', 'https://th.bing.com/th/id/OIP.9-Is_Spt88N7J25gjZEtpwHaEK?pid=ImgDet&rs=1', 'Monumento', '150.00', 14, 'Individual', '948', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 56777, '0.00', '3.4', 2),
(4, 'Cielo', 'Si buscas un ambiente familiar con excelente servicio hotel Cielo es tu mejor opcion.', 'https://th.bing.com/th/id/R.ecf7c29495b925a514d913f3bd7531b0?rik=ySRd5q3jWnukGg&riu=http%3a%2f%2fapi-tarhiata.michoacan.travel%2ffiles%2f42dac78c17149caac83296b32af38f59%2fhotel-5-1-hall-del-hotel.jpg&ehk=L5e%2bw3iqV1lqBh8QzWFZbKDBGSNR7fCbK4HOlw%2b8FWU%3d&risl=&pid=ImgRaw&r=0', 'Balneario', '300.00', 11, 'Doble', '2672', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 59998, '0.00', '4.6', 2),
(5, 'Estrella', 'Servicio  y buena ubicación nos caracteriza, ven y conócenos.', 'https://2.bp.blogspot.com/-uw161voH9uE/Wyji_NfIMrI/AAAAAAAAA4k/ixXOp8Y8te84-WZLM264s0GO9U5lf0qNgCLcBGAs/s1600/Homestay%2Bdi%2Bmelaka%2Btepi%2Bpantai%2BLaman%2BGuesthouse.jpg', 'Low cost', '80.00', 6, 'Individual', '27', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 51122, '0.00', '3.8', 2),
(6, 'Portico', 'Visítanos y siéntete como en tu casa.', 'https://cdn.bestday.net/_lib/vimages/Morelia_Michoacan/Hotels/Portico-Hotel-Cultural/fachada_xl.jpg', 'Albergue turistico', '200.00', 4, 'Individual', '2181', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 50978, '0.00', '4.1', 2),
(7, 'El rio', 'Cómodos departamentos de gran espacio y con excelente vistas que te enamoraran', 'https://th.bing.com/th/id/R.0a5a8657863379e10460dd956b26742e?rik=AtgNlHMvFrAURQ&riu=http%3a%2f%2fwww.hospedarme.com.mx%2fwp-content%2fuploads%2f2019%2f07%2fhotel-don-bruno-hoteles-en-angangueo.jpg&ehk=UXNOxwNZ8R1HM7pffWmVe2ZjvVDMEjhvv9uDwBUtRBA%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1', 'De apartamento', '350.00', 25, 'Triple', '9653', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 50988, '0.00', '4.0', 2),
(8, 'Hostalito', 'Higiene y servicio y excelente precio nos caracterizan. ', 'https://media.cntraveler.com/photos/5bb24b45db225a4f50684ba1/master/w_1200,c_limit/Hotel-de-la-Soledad_PATIO-SOLEDAD_10.jpg', 'De aeropuerto', '300.00', 25, 'Doble', '2723', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 53343, '20.00', '4.8', 2),
(9, 'La cierra', 'Si buscas un break de la ciudad, el hotel La Sierra te conectaremos con tu lado natural.', 'https://th.bing.com/th/id/R.52e7b596a91ee34873593ba105830c7f?rik=NZObRPIImmz26g&riu=http%3a%2f%2fcdn2.melodijolola.com%2fmedia%2ffiles%2fhotel_0.jpg&ehk=3OT%2fkHum%2bjocsomuzfLwoHTqz%2fR%2b%2fEYlwfNfg8eRCjo%3d&risl=&pid=ImgRaw&r=0', 'De naturaleza', '180.00', 16, 'Doble', '456', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 57887, '0.00', '3.9', 2),
(10, 'Camino', 'Ven y atrévete a sentir un trato como los reyes, calidad premium característica de el Camino', 'https://media-cdn.tripadvisor.com/media/photo-p/07/6a/52/89/hotel-concordia.jpg', 'Pasada', '80.00', 12, 'Doble', '8223', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 'Pretium erat inceptos', 59086, '0.00', '4.0', 2),
(11, 'El  Arroyo', 'Toda la comodidad cerca de la naturaleza.', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EU9WROL4OSBMoEgTeeJQSg8B5a_yOEnlRx-haXkicEviKg?e=C5TBFX', 'de Naturaleza', '1000.00', 50, 'doble', '225', 'el paso', 'Ojo de Agua ', 'Tiristaran', 'Michoacán', 58112, '10.00', '8.0', 2),
(12, 'El Arbolito', 'Ambiente 100% familiar y con excelente servicio.', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/ET4U4QW-eRxFgC8USlq6viQBjh82E7a4XRlZN_dbLv8Rew?e=vxXTDi', 'Familiar', '300.00', 100, 'Cuadruple', '18', 'arriaga', 'Héroes anónimos', 'Morelia', 'Michoacán', 58446, '5.00', '9.0', 3),
(13, 'Mandarina', 'Hotel  rustico de ambiente familiar y con gran servicio', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/Ec5s-hkv24tOpyjb2FTV-i4B71crq4ypjwW7iwvVET3GVw?e=iaOrZz', 'Rustico ', '500.00', 200, 'doble', '47', 'Vicente guerrero', 'los Alamos', 'ciudad Hidalgo', 'Michoacán', 52114, '20.00', '8.0', 2),
(14, 'el Tejado', 'Hotel con piscina y habitaciones dobles con hermosea vista a la montaña.', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EW0wmd8FqBdGrM_-SOq_HSYBPQVsrP213tix_UVQcSHMTQ?e=EdhNCh', 'de Naturaleza', '799.00', 75, 'triples', '765', 'el arroyo', 'ejidales', 'villa madero', 'Michoacán', 58447, '5.00', '7.0', 2),
(15, 'Luna llena', 'Hotel con ubicación céntrica a 5 min del centro histórico.', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EX53E7yvNxFFi5dyVZVPAzABzqtGgJISxuvJ00sxU_YCIA?e=k9cuzt', 'urbano', '250.00', 150, 'Cuadruple', '554', 'Santana', 'Centro', 'Morelia', 'Michoacán', 58334, '15.00', '9.9', 2),
(16, 'la Casona', 'Hotel ubicado a las afueras de la ciudad, sumérgete en la naturaleza y salte de la rutina.', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EaSeB6gM5aVFh9pcsaobOY0BNPql5cIxPrwOD3IdrQ0eLA?e=QlLaIU', 'de Naturaleza', '499.00', 100, 'doble', '55', 'rondanilla', 'Alberto Zapata', 'Morelia', 'Michoacán', 58334, '5.00', '9.0', 2),
(17, 'el Bajalabu', 'Hotel rustico con actividades diarias, recreativas, culturales y de arte.', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EVWq1C2g2PpIgxS0i-mh0xQBFvZt7WTS82IrmV5FGNc1Hw?e=zV8c6k', 'Rustico ', '399.00', 200, 'doble', '887', 'Miguel Hidalgo', 'Independencia ', 'Uruapan', 'Michoacán', 57448, '15.00', '8.0', 3),
(18, 'El rinconsito', 'a 5 minutos de la zona centro con los costos mas bajos de la zona', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/ES59W8ae9C9OmE2-FJ934GQBQ5-iGBmNrySv8ZQ2jPMfKA?e=zHCiYp', 'urbano', '199.00', 50, 'Cuadruple', '19', 'alameda', 'chapultepec', 'Morelia', 'Michoacán', 58447, '10.00', '9.0', 2),
(19, 'El Resplandor', 'Hotel temático con ambiente de terror, ¿eres valiente? atrevete a sobrevivir la experiencia', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EQk3uIK3FeJHmhmhDSx3Z7YBQ_IUmlSXLbIrB4t_i66JJg?e=qrPaVZ', 'tematico', '999.00', 666, 'Cuadruple', '666', 'el Nigromante', 'centro', 'Patzcuaro', 'Michoacán', 56441, '15.00', '9.0', 3),
(20, 'Crystal Palace', 'Lujos, comodidad y servicio que caracterizan a la lineal de hoteles Crystal con el toque de la ciuda', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EWuuOvPLHOBJghcm_st2iIUBgE-Uq0hH5my6nz-LnP8Lsw?e=ao7Hkr', 'Familiar', '599.00', 100, 'doble', '78', 'Héroes de Nocupetaro  ', 'Revolución', 'Zamora', 'Micchoacán', 56448, '15.00', '9.0', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`idHotel`),
  ADD KEY `Tour_Foreign_idUsuario_idx` (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `idHotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `Hotel_Foreign_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
