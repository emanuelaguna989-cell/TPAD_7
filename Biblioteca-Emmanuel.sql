-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2026 a las 22:03:05
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
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `ID_AUTOR` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `NACIONALIDAD` varchar(50) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`ID_AUTOR`, `nombre`, `NACIONALIDAD`, `Fecha_Nacimiento`) VALUES
(1, 'Gabriel García Márquez', 'Colombiana', '1927-03-06'),
(2, 'J.K. Rowling', 'Británica', '1965-07-31'),
(3, 'George Orwell', 'Británica', '1903-06-25'),
(4, 'Julio Verne', 'Francesa', '1828-02-08'),
(5, 'Mario Vargas Llosa', 'Peruana', '1936-03-28'),
(6, 'Isabel Allende', 'Chilena', '1942-08-02'),
(7, 'Stephen King', 'Estadounidense', '1947-09-21'),
(8, 'J.R.R. Tolkien', 'Británica', '1892-01-03'),
(9, 'Pablo Neruda', 'Chilena', '1904-07-12'),
(10, 'Miguel de Cervantes', 'Española', '1547-09-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL,
  `Nombre_Categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_Categoria`, `Nombre_Categoria`) VALUES
(1, 'Novela'),
(2, 'Fantasía'),
(3, 'Ciencia Ficción'),
(4, 'Ensayo'),
(5, 'Terror'),
(6, 'Poesía');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_prestamo`
--

CREATE TABLE `detalle_prestamo` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Prestamo` int(11) NOT NULL,
  `ID_Libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_prestamo`
--

INSERT INTO `detalle_prestamo` (`ID_Detalle`, `ID_Prestamo`, `ID_Libro`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 4, 6),
(7, 5, 7),
(8, 6, 8),
(9, 6, 9),
(10, 7, 10),
(11, 8, 1),
(12, 8, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID_Libro` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Año_Publicacion` int(11) DEFAULT NULL,
  `Disponible` tinyint(1) DEFAULT 1,
  `ID_Categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID_Libro`, `Titulo`, `Año_Publicacion`, `Disponible`, `ID_Categoria`) VALUES
(1, 'Cien Años de Soledad', 1967, 1, 1),
(2, 'Harry Potter y la Piedra Filosofal', 1997, 1, 2),
(3, '1984', 1949, 1, 3),
(4, 'Viaje al Centro de la Tierra', 1864, 1, 3),
(5, 'La Ciudad y los Perros', 1963, 1, 1),
(6, 'La Casa de los Espíritus', 1982, 1, 1),
(7, 'It', 1986, 1, 5),
(8, 'El Señor de los Anillos', 1954, 1, 2),
(9, 'Veinte Poemas de Amor', 1924, 1, 6),
(10, 'Don Quijote de la Mancha', 1605, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_autores`
--

CREATE TABLE `libros_autores` (
  `ID_Libro` int(11) NOT NULL,
  `ID_Autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros_autores`
--

INSERT INTO `libros_autores` (`ID_Libro`, `ID_Autor`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multas`
--

CREATE TABLE `multas` (
  `ID_Multa` int(11) NOT NULL,
  `ID_Prestamo` int(11) NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `Fecha_Multa` date NOT NULL,
  `Pagada` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `multas`
--

INSERT INTO `multas` (`ID_Multa`, `ID_Prestamo`, `Monto`, `Fecha_Multa`, `Pagada`) VALUES
(1, 1, 5000.00, '2024-08-20', 1),
(2, 2, 7000.00, '2024-08-21', 0),
(3, 3, 4000.00, '2024-08-22', 1),
(4, 4, 6000.00, '2024-08-23', 0),
(5, 5, 3000.00, '2024-08-24', 1),
(6, 6, 8000.00, '2024-08-25', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_Prestamo` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Fecha_Prestamo` date NOT NULL,
  `Fecha_Devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID_Prestamo`, `ID_Usuario`, `Fecha_Prestamo`, `Fecha_Devolucion`) VALUES
(1, 1, '2024-08-01', '2024-08-15'),
(2, 2, '2024-08-02', '2024-08-16'),
(3, 3, '2024-08-03', '2024-08-17'),
(4, 4, '2024-08-04', '2024-08-18'),
(5, 5, '2024-08-05', '2024-08-19'),
(6, 6, '2024-08-06', '2024-08-20'),
(7, 7, '2024-08-07', '2024-08-21'),
(8, 8, '2024-08-08', '2024-08-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `ID_Reserva` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_Libro` int(11) NOT NULL,
  `Fecha_Reserva` date NOT NULL,
  `Estado` enum('Activa','Cancelada','Completada') DEFAULT 'Activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`ID_Reserva`, `ID_Usuario`, `ID_Libro`, `Fecha_Reserva`, `Estado`) VALUES
(1, 1, 3, '2024-09-01', 'Activa'),
(2, 2, 4, '2024-09-02', 'Completada'),
(3, 3, 5, '2024-09-03', 'Activa'),
(4, 4, 6, '2024-09-04', 'Cancelada'),
(5, 5, 7, '2024-09-05', 'Activa'),
(6, 6, 8, '2024-09-06', 'Completada'),
(7, 7, 9, '2024-09-07', 'Activa'),
(8, 8, 10, '2024-09-08', 'Activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `Nombre`, `Direccion`, `Telefono`) VALUES
(1, 'Carlos Martínez', 'Calle Luna 123', '3001112233'),
(2, 'Lucía Fernández', 'Av. Sol 456', '3002223344'),
(3, 'Pedro Gómez', 'Cra 10 #20-30', '3003334455'),
(4, 'Ana Torres', 'Calle 8 #15-22', '3004445566'),
(5, 'Juan Pérez', 'Av. Siempre Viva 742', '3005556677'),
(6, 'María López', 'Calle 45 #10-50', '3006667788'),
(7, 'Luis Ramírez', 'Cra 7 #90-10', '3007778899'),
(8, 'Sofía Herrera', 'Av. Central 88', '3008889900'),
(9, 'Diego Morales', 'Calle 30 #40-50', '3011112233'),
(10, 'Paula Rincón', 'Cra 12 #18-25', '3012223344');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`ID_AUTOR`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `detalle_prestamo`
--
ALTER TABLE `detalle_prestamo`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Prestamo` (`ID_Prestamo`),
  ADD KEY `ID_Libro` (`ID_Libro`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID_Libro`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indices de la tabla `libros_autores`
--
ALTER TABLE `libros_autores`
  ADD PRIMARY KEY (`ID_Libro`,`ID_Autor`),
  ADD KEY `ID_Autor` (`ID_Autor`);

--
-- Indices de la tabla `multas`
--
ALTER TABLE `multas`
  ADD PRIMARY KEY (`ID_Multa`),
  ADD KEY `ID_Prestamo` (`ID_Prestamo`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_Prestamo`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`ID_Reserva`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Libro` (`ID_Libro`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `ID_AUTOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_prestamo`
--
ALTER TABLE `detalle_prestamo`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `ID_Libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `multas`
--
ALTER TABLE `multas`
  MODIFY `ID_Multa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_Prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `ID_Reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_prestamo`
--
ALTER TABLE `detalle_prestamo`
  ADD CONSTRAINT `detalle_prestamo_ibfk_1` FOREIGN KEY (`ID_Prestamo`) REFERENCES `prestamos` (`ID_Prestamo`),
  ADD CONSTRAINT `detalle_prestamo_ibfk_2` FOREIGN KEY (`ID_Libro`) REFERENCES `libros` (`ID_Libro`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`);

--
-- Filtros para la tabla `libros_autores`
--
ALTER TABLE `libros_autores`
  ADD CONSTRAINT `libros_autores_ibfk_1` FOREIGN KEY (`ID_Libro`) REFERENCES `libros` (`ID_Libro`),
  ADD CONSTRAINT `libros_autores_ibfk_2` FOREIGN KEY (`ID_Autor`) REFERENCES `autores` (`ID_AUTOR`);

--
-- Filtros para la tabla `multas`
--
ALTER TABLE `multas`
  ADD CONSTRAINT `multas_ibfk_1` FOREIGN KEY (`ID_Prestamo`) REFERENCES `prestamos` (`ID_Prestamo`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`ID_Libro`) REFERENCES `libros` (`ID_Libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
