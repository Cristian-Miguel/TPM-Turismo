-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2022 a las 09:12:24
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
-- Estructura de tabla para la tabla `turista`
--

CREATE TABLE `turista` (
  `idTurista` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido Paterno` varchar(50) DEFAULT NULL,
  `ApellidoMaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `turista`
--

INSERT INTO `turista` (`idTurista`, `Nombre`, `Apellido Paterno`, `ApellidoMaterno`) VALUES
(1, 'Mike', 'Paterno', 'Materno'),
(2, 'Juan', 'Garcia', 'Paredes'),
(3, 'Jatziri', 'Torres', 'Galvan'),
(4, 'Alberto', 'Zacarias', 'Gallardo'),
(5, 'Jeff', 'Corona', 'Herrera'),
(6, 'Luis', 'Gallardo ', 'Pereira'),
(7, 'Claudia ', 'Gonzales ', 'Torres'),
(8, 'Rosaura ', 'Pineda ', 'Rodriguez'),
(9, 'Jorge', 'Perez', 'Gallardo'),
(10, 'Ricardo', 'Pineda ', 'Zavala');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `turista`
--
ALTER TABLE `turista`
  ADD PRIMARY KEY (`idTurista`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `turista`
--
ALTER TABLE `turista`
  MODIFY `idTurista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
