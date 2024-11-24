-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2024 a las 04:25:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `force4x4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedido`
--

CREATE TABLE `detallespedido` (
  `iddetallespedido` int(8) NOT NULL,
  `pedido_id` int(8) NOT NULL,
  `producto_id` int(8) NOT NULL,
  `cantidad` int(4) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedido` int(8) NOT NULL,
  `usuario_id` int(8) NOT NULL,
  `fechapedido` datetime NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalizaciones`
--

CREATE TABLE `personalizaciones` (
  `idpersonalizacion` int(8) NOT NULL,
  `pedido_id` int(8) NOT NULL,
  `colorpintura` text NOT NULL,
  `tamanorines` text NOT NULL,
  `tipopolarizado` text NOT NULL,
  `otrosdetalles` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(8) NOT NULL,
  `nombre` text NOT NULL,
  `descripcion` text NOT NULL,
  `precio` float NOT NULL,
  `categoria` text NOT NULL,
  `existencia` int(4) NOT NULL,
  `fechaagregado` datetime NOT NULL,
  `Imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `descripcion`, `precio`, `categoria`, `existencia`, `fechaagregado`, `Imagen`) VALUES
(1, 'Llantas', 'llanta grandes o mas chicas ', 2500, 'automovil', 100, '2024-10-31 00:00:00', 'Llantas.webp'),
(2, 'Rines', 'rines de todo tipo', 12000, 'automovil', 40, '2024-11-01 00:00:00', 'Rines.webp'),
(3, 'Pintura', 'pintura a tu gusto', 3000, 'automovil', 99, '2024-11-02 00:00:00', 'Pintura.webp'),
(4, 'Filtro alto Flujo', 'pa que luzca chido', 1350, 'automovil', 24, '2024-11-03 00:00:00', 'Filtro alto flujo.jpg'),
(5, 'Escape', 'pa que se oiga perron', 2000, 'automovil', 65, '2024-11-04 00:00:00', 'Escape.webp'),
(6, 'Suspension', 'para andar comodo ', 4099, 'automovil', 87, '2024-11-05 00:00:00', 'Suspencion.jpg'),
(7, 'Frenos', 'frenos mejorados para mayor seguridad', 2350, 'automovil', 154, '2024-11-06 00:00:00', 'Frenos.jpg'),
(8, 'Faros ', 'fraros a tu gusto led o de algun clor', 500, 'automovil', 300, '2024-11-07 00:00:00', 'Faros.jpg'),
(9, 'Vinil', 'vinil de tu preferencia ', 999, 'automovil', 24, '2024-11-08 00:00:00', 'Vinil.jpg'),
(10, 'Tapizado', 'tapizado de interiores a tu gusto', 2500, 'automovil', 56, '2024-11-09 00:00:00', 'Tapizado.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `fechareg` datetime NOT NULL,
  `perfil` char(1) NOT NULL DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `correo`, `clave`, `fechareg`, `perfil`) VALUES
(1, 'Manuel Lara Ruvalcaba1', 'manuel.lara1788@alumnos.udg.mx', 'scrypt:32768:8:1$8A9h4EU7Jdkmsv44$b5f4b9c9773cdd0ba5a4087e4c532cdd1bd9b94372db9a0236c2fee229f12ca6f7e44f1458ae8a37f3aad782afb26aa9405f919836433b93f6a792855707748f', '2024-10-24 11:16:48', 'A'),
(8, 'manuel lara ruvalcaba', 'manuales741@gmail.com', 'scrypt:32768:8:1$uX8bEhpCnXmAcJxM$b93b7b2b341463c3c69d0118251f1ceb024cb9015e6f2b5212281292c41f0c5532a709ccfdf24a292ddedf38f02d8fbb0cf1f4d61719fe2544d56e0d8639213d', '2024-10-16 12:23:39', 'U'),
(10, 'kick', 'holadd@gmail.com', 'scrypt:32768:8:1$xXdVFjFm6XGxS3Dr$af9319897fcb523db32ea0946ac44602f169c8a48d9cd940d55d6cc13167b2bfce1d3b6d56027cfb69327c2b8055811d3f6b04d0dd33103dd49253a2d06f6cf5', '2024-10-17 11:15:27', 'A'),
(13, 'tonto', 'tonto@gmail.com', 'scrypt:32768:8:1$C7OKtdgY4JTq2bFq$c934b025ea8f54ca3b6b53e76f16b900186b67ae2ab309f6bc2cbb6485802b28954470975d3fabf5c58282b8ee9c1736cda31c0e813dac2204286b11949fa918', '2024-10-24 09:42:11', 'U'),
(15, 'manuel', 'maguatss123@gmail.com', 'scrypt:32768:8:1$mYhqhVGpdUfgTIva$7115a9af5baee52eb96a25fdc564d5e38295fe0a3d4e5c2a01d7fa8451f9e37046b1c69105db2fcfba1a95dd79a2d626b9cbecefd7ef34f22e0b728279699404', '2024-11-20 19:21:15', 'U');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD PRIMARY KEY (`iddetallespedido`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `personalizaciones`
--
ALTER TABLE `personalizaciones`
  ADD PRIMARY KEY (`idpersonalizacion`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD CONSTRAINT `detallespedido_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`idproducto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detallespedido_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`idpedido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `personalizaciones`
--
ALTER TABLE `personalizaciones`
  ADD CONSTRAINT `personalizaciones_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`idpedido`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
