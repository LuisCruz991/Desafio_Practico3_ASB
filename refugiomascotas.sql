-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2025 a las 22:26:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `refugiomascotas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Adopcion` (IN `p_ID_Mascota` INT, IN `p_ID_Adoptante` INT, IN `p_ID_Empleado` INT, IN `p_Fecha_Adopcion` DATE, IN `p_Observaciones` TEXT)   BEGIN
    -- Insertar la nueva adopción
    INSERT INTO Adopciones (
        ID_Mascota, ID_Adoptante, ID_Empleado, Fecha_Adopcion, Observaciones
    )
    VALUES (
        p_ID_Mascota, p_ID_Adoptante, p_ID_Empleado, p_Fecha_Adopcion, p_Observaciones
    );

    -- Actualizar el estado de adopción de la mascota a "Adoptado" (ID = 3)
    UPDATE Mascotas
    SET ID_Estado_Adopcion = 3
    WHERE ID_Mascota = p_ID_Mascota;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopciones`
--

CREATE TABLE `adopciones` (
  `ID_Adopcion` int(11) NOT NULL,
  `ID_Mascota` int(11) DEFAULT NULL,
  `ID_Adoptante` int(11) DEFAULT NULL,
  `ID_Empleado` int(11) DEFAULT NULL,
  `Fecha_Adopcion` date NOT NULL,
  `Observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `adopciones`
--

INSERT INTO `adopciones` (`ID_Adopcion`, `ID_Mascota`, `ID_Adoptante`, `ID_Empleado`, `Fecha_Adopcion`, `Observaciones`) VALUES
(1, 1, 1, 1, '2024-04-10', 'Entregada con documentos'),
(2, 2, 2, 2, '2024-04-11', 'Adopción rápida'),
(3, 3, 3, 3, '2024-04-12', 'Seguir control médico'),
(4, 4, 4, 4, '2024-05-13', 'Se entregó en buen estado'),
(5, 5, 5, 5, '2024-05-14', 'Adopción con seguimiento psicológico'),
(6, 6, 2, 3, '2025-05-18', 'Adopción gestionada exitosamente');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `adopciones_detalles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `adopciones_detalles` (
`ID_Adopcion` int(11)
,`Nombre_Adoptante` varchar(100)
,`Nombre_Mascota` varchar(50)
,`Edad` int(11)
,`Nombre_Especie` varchar(50)
,`Nombre_Raza` varchar(50)
,`Fecha_Adopcion` date
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adoptantes`
--

CREATE TABLE `adoptantes` (
  `ID_Adoptante` int(11) NOT NULL,
  `Nombre_Completo` varchar(100) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `adoptantes`
--

INSERT INTO `adoptantes` (`ID_Adoptante`, `Nombre_Completo`, `Direccion`, `Telefono`, `Correo`) VALUES
(1, 'Juan Pérez', 'Calle Falsa 123', '7555-1234', 'juan.perez@gmail.com'),
(2, 'María López', 'Av. Siempre Viva 742', '8520-5678', 'maria.lopez@gmail.com'),
(3, 'Sofía González', 'Boulevard del Sol 45', '8610-8765', 'sofia.gonzalez@gmail.com'),
(4, 'Miguel Ramos', 'Camino Real 100', '7860-4321', 'miguel.ramos@gmail.com'),
(5, 'Carla Suárez', 'Sendero Verde 88', '7950-2468', 'carla.suarez@gmail.com'),
(6, 'Andrés Herrera', 'Av. Central 101', '7145-1357', 'andres.herrera@gmail.com'),
(7, 'Lucía Mendoza', 'Calle Azul 222', '7463-2468', 'lucia.mendoza@gmail.com'),
(8, 'Javier Peña', 'Camino del Bosque 19', '7894-3698', 'javier.pena@gmail.com'),
(9, 'Elena Castro', 'Pasaje Las Rosas 5', '7002-4789', 'elena.castro@gmail.com'),
(10, 'Diego Fernández', 'Ruta 9 Km 3', '7141-5896', 'diego.fernandez@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `ID_Cargo` int(11) NOT NULL,
  `Nombre_Cargo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`ID_Cargo`, `Nombre_Cargo`) VALUES
(1, 'Director del Refugio'),
(2, 'Veterinario'),
(3, 'Asistente Veterinario'),
(4, 'Encargado de Bienestar Animal'),
(5, 'Recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controles_postadopcion`
--

CREATE TABLE `controles_postadopcion` (
  `ID_Control` int(11) NOT NULL,
  `ID_Adopcion` int(11) DEFAULT NULL,
  `Fecha_Control` date NOT NULL,
  `Observaciones` text DEFAULT NULL,
  `Estado_Mascota` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `controles_postadopcion`
--

INSERT INTO `controles_postadopcion` (`ID_Control`, `ID_Adopcion`, `Fecha_Control`, `Observaciones`, `Estado_Mascota`) VALUES
(1, 1, '2024-06-10', 'Bien adaptado', 'Activa y saludable'),
(2, 2, '2024-06-11', 'Buen estado físico', 'Saludable'),
(3, 3, '2024-06-12', 'Requiere medicación continua', 'Condición estable'),
(4, 4, '2024-06-13', 'Adaptación exitosa', 'Juguetona y sociable'),
(5, 5, '2024-06-14', 'Ligero estrés por adaptación', 'En observación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombre_Completo` varchar(100) NOT NULL,
  `ID_Cargo` int(11) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`ID_Empleado`, `Nombre_Completo`, `ID_Cargo`, `Correo`) VALUES
(1, 'Luis Cruz', 1, 'luiscruz991lol@gmail.com'),
(2, 'Genesis Canizalez', 5, 'geni_canizalez@gmail.com'),
(3, 'Ana Torres', 3, 'ana_torres@gmail.com'),
(4, 'Paula Ruiz', 4, 'paula_ruiz@gmail.com'),
(5, 'Raúl Méndez', 5, 'raul_mendez@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especies`
--

CREATE TABLE `especies` (
  `ID_Especie` int(11) NOT NULL,
  `Nombre_Especie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especies`
--

INSERT INTO `especies` (`ID_Especie`, `Nombre_Especie`) VALUES
(1, 'Perro'),
(2, 'Gato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_adopcion`
--

CREATE TABLE `estados_adopcion` (
  `ID_Estado_Adopcion` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados_adopcion`
--

INSERT INTO `estados_adopcion` (`ID_Estado_Adopcion`, `Descripcion`) VALUES
(1, 'Disponible'),
(2, 'Reservado'),
(3, 'Adoptado'),
(4, 'Reingresado al refugio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_salud`
--

CREATE TABLE `estados_salud` (
  `ID_Estado_Salud` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados_salud`
--

INSERT INTO `estados_salud` (`ID_Estado_Salud`, `Descripcion`) VALUES
(1, 'Saludable'),
(2, 'Enfermo'),
(3, 'Discapacidad física');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `ID_Mascota` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `ID_Raza` int(11) DEFAULT NULL,
  `ID_Estado_Salud` int(11) DEFAULT NULL,
  `ID_Estado_Adopcion` int(11) DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`ID_Mascota`, `Nombre`, `Edad`, `ID_Raza`, `ID_Estado_Salud`, `ID_Estado_Adopcion`, `Fecha_Ingreso`) VALUES
(1, 'Max', 3, 1, 1, 1, '2024-05-01'),
(2, 'Luna', 2, 2, 1, 1, '2024-04-15'),
(3, 'Rocky', 5, 3, 2, 1, '2024-03-20'),
(4, 'Bella', 1, 4, 1, 1, '2024-05-10'),
(5, 'Toby', 4, 5, 3, 1, '2024-02-28'),
(6, 'Simba', 2, 6, 1, 3, '2024-04-12'),
(7, 'Mía', 3, 7, 1, 1, '2024-05-05'),
(8, 'Nala', 2, 8, 1, 1, '2024-04-25'),
(9, 'Coco', 6, 9, 1, 1, '2024-01-30'),
(10, 'Pelusa', 8, 10, 1, 1, '2024-03-10'),
(11, 'Zeus', 2, 1, 1, 1, '2025-05-11'),
(12, 'Lola', 1, 2, 1, 2, '2025-05-12'),
(13, 'Copito', 5, 8, 1, 1, '2025-03-01'),
(14, 'Milo', 3, 4, 1, 2, '2025-05-14'),
(15, 'Chispa', 2, 1, 2, 2, '2025-01-05'),
(16, 'Manchas', 3, 3, 1, 2, '2025-02-10'),
(17, 'Jerry', 2, 7, 1, 2, '2025-05-17'),
(18, 'Sol', 1, 6, 1, 1, '2025-02-18'),
(19, 'Felix', 4, 9, 3, 2, '2025-05-19'),
(20, 'Garfield', 5, 10, 1, 1, '2025-05-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE `razas` (
  `ID_Raza` int(11) NOT NULL,
  `Nombre_Raza` varchar(50) NOT NULL,
  `ID_Especie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` (`ID_Raza`, `Nombre_Raza`, `ID_Especie`) VALUES
(1, 'Labrador Retriever', 1),
(2, 'Bulldog Francés', 1),
(3, 'Pastor Alemán', 1),
(4, 'Beagle', 1),
(5, 'Golden Retriever', 1),
(6, 'Siames', 2),
(7, 'Persa', 2),
(8, 'Maine Coon', 2),
(9, 'Bengala', 2),
(10, 'Esfinge', 2);

-- --------------------------------------------------------

--
-- Estructura para la vista `adopciones_detalles`
--
DROP TABLE IF EXISTS `adopciones_detalles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adopciones_detalles`  AS SELECT `ado`.`ID_Adopcion` AS `ID_Adopcion`, `adop`.`Nombre_Completo` AS `Nombre_Adoptante`, `m`.`Nombre` AS `Nombre_Mascota`, `m`.`Edad` AS `Edad`, `e`.`Nombre_Especie` AS `Nombre_Especie`, `r`.`Nombre_Raza` AS `Nombre_Raza`, `ado`.`Fecha_Adopcion` AS `Fecha_Adopcion` FROM ((((`adopciones` `ado` join `adoptantes` `adop` on(`ado`.`ID_Adoptante` = `adop`.`ID_Adoptante`)) join `mascotas` `m` on(`ado`.`ID_Mascota` = `m`.`ID_Mascota`)) join `razas` `r` on(`m`.`ID_Raza` = `r`.`ID_Raza`)) join `especies` `e` on(`r`.`ID_Especie` = `e`.`ID_Especie`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adopciones`
--
ALTER TABLE `adopciones`
  ADD PRIMARY KEY (`ID_Adopcion`),
  ADD KEY `ID_Mascota` (`ID_Mascota`),
  ADD KEY `ID_Adoptante` (`ID_Adoptante`),
  ADD KEY `ID_Empleado` (`ID_Empleado`);

--
-- Indices de la tabla `adoptantes`
--
ALTER TABLE `adoptantes`
  ADD PRIMARY KEY (`ID_Adoptante`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`ID_Cargo`);

--
-- Indices de la tabla `controles_postadopcion`
--
ALTER TABLE `controles_postadopcion`
  ADD PRIMARY KEY (`ID_Control`),
  ADD KEY `ID_Adopcion` (`ID_Adopcion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD KEY `ID_Cargo` (`ID_Cargo`);

--
-- Indices de la tabla `especies`
--
ALTER TABLE `especies`
  ADD PRIMARY KEY (`ID_Especie`);

--
-- Indices de la tabla `estados_adopcion`
--
ALTER TABLE `estados_adopcion`
  ADD PRIMARY KEY (`ID_Estado_Adopcion`);

--
-- Indices de la tabla `estados_salud`
--
ALTER TABLE `estados_salud`
  ADD PRIMARY KEY (`ID_Estado_Salud`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`ID_Mascota`),
  ADD KEY `ID_Raza` (`ID_Raza`),
  ADD KEY `ID_Estado_Salud` (`ID_Estado_Salud`),
  ADD KEY `ID_Estado_Adopcion` (`ID_Estado_Adopcion`);

--
-- Indices de la tabla `razas`
--
ALTER TABLE `razas`
  ADD PRIMARY KEY (`ID_Raza`),
  ADD KEY `ID_Especie` (`ID_Especie`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adopciones`
--
ALTER TABLE `adopciones`
  MODIFY `ID_Adopcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `adoptantes`
--
ALTER TABLE `adoptantes`
  MODIFY `ID_Adoptante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `ID_Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `controles_postadopcion`
--
ALTER TABLE `controles_postadopcion`
  MODIFY `ID_Control` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `especies`
--
ALTER TABLE `especies`
  MODIFY `ID_Especie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados_adopcion`
--
ALTER TABLE `estados_adopcion`
  MODIFY `ID_Estado_Adopcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estados_salud`
--
ALTER TABLE `estados_salud`
  MODIFY `ID_Estado_Salud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `ID_Mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `razas`
--
ALTER TABLE `razas`
  MODIFY `ID_Raza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adopciones`
--
ALTER TABLE `adopciones`
  ADD CONSTRAINT `adopciones_ibfk_1` FOREIGN KEY (`ID_Mascota`) REFERENCES `mascotas` (`ID_Mascota`),
  ADD CONSTRAINT `adopciones_ibfk_2` FOREIGN KEY (`ID_Adoptante`) REFERENCES `adoptantes` (`ID_Adoptante`),
  ADD CONSTRAINT `adopciones_ibfk_3` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`);

--
-- Filtros para la tabla `controles_postadopcion`
--
ALTER TABLE `controles_postadopcion`
  ADD CONSTRAINT `controles_postadopcion_ibfk_1` FOREIGN KEY (`ID_Adopcion`) REFERENCES `adopciones` (`ID_Adopcion`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`ID_Cargo`) REFERENCES `cargos` (`ID_Cargo`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`ID_Raza`) REFERENCES `razas` (`ID_Raza`),
  ADD CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`ID_Estado_Salud`) REFERENCES `estados_salud` (`ID_Estado_Salud`),
  ADD CONSTRAINT `mascotas_ibfk_3` FOREIGN KEY (`ID_Estado_Adopcion`) REFERENCES `estados_adopcion` (`ID_Estado_Adopcion`);

--
-- Filtros para la tabla `razas`
--
ALTER TABLE `razas`
  ADD CONSTRAINT `razas_ibfk_1` FOREIGN KEY (`ID_Especie`) REFERENCES `especies` (`ID_Especie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
