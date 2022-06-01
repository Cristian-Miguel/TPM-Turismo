-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2022 a las 09:04:41
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
-- Estructura de tabla para la tabla `restaurantes`
--

CREATE TABLE `restaurantes` (
  `idRestaurante` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Costo` decimal(6,2) NOT NULL,
  `Imagen` mediumtext NOT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Descuento` decimal(5,2) DEFAULT NULL,
  `Calificacion` decimal(2,1) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `restaurantes`
--

INSERT INTO `restaurantes` (`idRestaurante`, `Nombre`, `Descripcion`, `Costo`, `Imagen`, `Categoria`, `Descuento`, `Calificacion`, `idUsuario`) VALUES
(1, 'Buffet  regional', 'Disfrute de una buena variedad de comida tipicas de Mexico', '300.00', 'https://th.bing.com/th/id/R.1b70ecd382f9467d60dab7303d8794b5?rik=HqkO4AVAuwXz5g&riu=http%3a%2f%2flh5.ggpht.com%2f-ZPSfkbYWxSg%2fTxiWFjWWEtI%2fAAAAAAAAC4g%2fnQjCx_CP4V4%2fbuffet%25252520morelia%25252520%252525283%25252529_thumb%2525255B1%2525255D.jpg%3fimgmax%3d800&ehk=NbSB1hK9v7q9ij3r3L6Uo3q1lnv1oetP1CTH3ZpczB4%3d&risl=&pid=ImgRaw&r=0', 'Buffet', '0.00', '4.1', 2),
(2, 'La Conspiracion de 1809', 'Apto para vegetarianos, Opciones veganas, Opciones sin gluten', '80.00', 'https://media-cdn.tripadvisor.com/media/photo-s/12/42/aa/63/el-portal-allende.jpg', 'Internacional', '10.00', '4.5', 2),
(3, 'Mandala Pizzas', 'Apto para vegetarianos, Opciones veganas', '50.00', 'https://media-cdn.tripadvisor.com/media/photo-s/18/b3/00/56/una-de-nuestras-deliciosas.jpg', 'Pizzeria', '5.00', '4.0', 2),
(4, 'Jardin Steak House', 'Un restaurante de comida internacional encontrado en Uruapan.', '50.00', 'https://media-cdn.tripadvisor.com/media/photo-s/07/c9/71/ba/jardin-steak-house.jpg', 'Internacional', '0.00', '4.3', 2),
(5, 'La Cocina Michoacana', 'Un restaurante en Morelia con comida de tipo Mexicana, Latina, Contemporanea', '45.00', 'https://media-cdn.tripadvisor.com/media/photo-s/1b/8b/dd/17/restaurante-lu-cocina.jpg', 'Michoacana', '5.00', '4.8', 2),
(6, 'Casa Del Naranjo Restaurante', 'Apto para vegetarianos, Opciones veganas, Opciones sin gluten', '42.00', 'https://media-cdn.tripadvisor.com/media/photo-s/21/71/59/12/que-evento-te-imaginas.jpg', 'Michoacana', '6.00', '4.2', 2),
(7, 'el Patio restaurant', 'Apto para vegetarianos, Opciones veganas, Opciones sin gluten', '32.00', 'https://media-cdn.tripadvisor.com/media/photo-s/12/9d/d3/d0/restaurante-el-patio.jpg', 'Michoacana', '4.00', '4.3', 2),
(8, 'El Arriero Churrasqueria', 'La mejor churrasqueria de La piedad Michoacan', '50.00', 'https://media-cdn.tripadvisor.com/media/photo-s/0a/2e/eb/02/el-arriero-churrasqueria.jpg', 'Churrasqueria', '0.00', '3.9', 2),
(9, 'El Pulpo', 'Disfrute de nuestro riquisimos marisco en el pueto de Lazaro Cardenas', '34.00', 'https://media-cdn.tripadvisor.com/media/photo-s/08/1f/bb/81/enramada-el-pulpo.jpg', 'Marisqueria', '3.00', '4.1', 2),
(10, 'Los Balcones', 'Si deseas pasar un momento unico ven a nuestro restaurante de mariscos', '52.00', 'https://media-cdn.tripadvisor.com/media/photo-s/1d/ee/58/8b/balcones.jpg', 'Marisqueria', '6.00', '4.5', 2),
(11, 'Taqueria el mai', 'Tacos de carne asada al estilo purepecha', '20.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EUU3EpE__FxIsokRri0bdJcBVHO-QGimbZ7KKXci2NXb-w?e=lrPhCf', 'Michoacana', '10.00', '5.0', 2),
(12, 'Flor Purepecha', 'Comida típica de la zona, con el sazón de nuestros ancestros, ven y deleita tu paladar.', '100.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/ET4U4QW-eRxFgC8USlq6viQBjh82E7a4XRlZN_dbLv8Rew', 'Michoacana', '15.00', '4.0', 2),
(13, 'El paseito', 'Comida corrida con gran sabor y amor. Prueba nuestra gran variedad de platillos y deleita tu paladar', '50.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/Ec5s-hkv24tOpyjb2FTV-i4B71crq4ypjwW7iwvVET3GVw?e=Q3DAmh', 'Corrida', '5.00', '3.0', 2),
(14, 'El dorado', 'Comida típica de Michoacán, ven y prueba a que sabe la tierra de los pescadores.', '200.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/ESlKl9SHd75CgPQvcb8qNSQBPID-8tHKvOZ8vDlhOQUbHA?e=6catJQ', 'Michoacana', '5.00', '5.0', 2),
(15, 'La caso de don Pepe', 'Las mejores carnitas del estado, no has comido carnitas si no has probado el sazón de don Pepe', '50.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EZP-CoKHra9Akt52PrYEJoUBEErZuIeCMhiFawW7tE_tCg?e=LpUVnj', 'Michoacana', '0.00', '5.0', 2),
(16, 'La via', 'Comida americana de tamaño maniaco. ¿Crees poderte acabar la especialidad de la casa? ven y prueba l', '120.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EVDbqTRez8RKss5MwWz1GLsBvYd-_K4-WQs1zyaFfNihPA?e=qEWfEG', 'Americana', '10.00', '4.0', 2),
(17, 'El trailero', 'Comida tipo buffet, come todo lo que puedas!', '200.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/Ec2oNeAqjHdIoBQl484yC_8BhcGmXC7j5udD_OI5fc9iYA?e=PHypmg', 'buffet', '5.00', '3.0', 2),
(18, 'La garrafa', 'Buffet de nieves, prueba nuestros 50 sabores disponibles', '30.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EXogoAVYNaRKom8q6udLNokBxoNt9WdeP34fvGDRwqZkGA?e=qfUV5n', 'Postres', '0.00', '5.0', 1),
(19, 'El pimienton', 'Comida con la mejor relación calidad-sabor del condado ', '500.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EcIKKqYTsTdHixw3-EFzCJwBgcVoVOX7Uxxx2UxpAwvCSA?e=bnXYPb', 'Michoacana', '5.00', '3.0', 2),
(20, 'La voladora', 'Comida típica de la costa de Michoacán, ven y prueba la frescura de nuestras costas.', '250.00', 'https://itecm-my.sharepoint.com/:i:/g/personal/l18120164_morelia_tecnm_mx/EUqXsQmqJfJDm-JEKyXidhMB7tf1CRC1iNPeX6XysG1u0A?e=M9aFud', 'marisqueria', '15.00', '4.0', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  ADD PRIMARY KEY (`idRestaurante`),
  ADD KEY `Res_Foreign_idReserva_idx` (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  MODIFY `idRestaurante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  ADD CONSTRAINT `Res_Foreign_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
