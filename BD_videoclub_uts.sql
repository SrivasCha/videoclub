-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para videoclub_uts
CREATE DATABASE IF NOT EXISTS `videoclub_uts` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `videoclub_uts`;

-- Volcando estructura para tabla videoclub_uts.alquiler
CREATE TABLE IF NOT EXISTS `alquiler` (
  `id_alquiler` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_alquiler` date NOT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'Activo',
  `id_cliente` bigint(20) DEFAULT NULL,
  `id_empleado` bigint(20) DEFAULT NULL,
  `id_copia` bigint(20) DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `fecha_devolucion_esperada` date DEFAULT NULL,
  `importe_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_alquiler`),
  KEY `fk_alquiler_cliente` (`id_cliente`),
  KEY `fk_alquiler_empleado` (`id_empleado`),
  KEY `fk_alquiler_copia` (`id_copia`),
  CONSTRAINT `fk_alquiler_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_alquiler_copia` FOREIGN KEY (`id_copia`) REFERENCES `copia` (`id_copia`) ON UPDATE CASCADE,
  CONSTRAINT `fk_alquiler_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla videoclub_uts.alquiler: ~0 rows (aproximadamente)
INSERT INTO `alquiler` (`id_alquiler`, `fecha_alquiler`, `estado`, `id_cliente`, `id_empleado`, `id_copia`, `fecha_devolucion`, `fecha_devolucion_esperada`, `importe_total`) VALUES
	(11, '2025-10-16', 'Activo', 8, 9, 5, NULL, '2025-10-19', 10.00),
	(12, '2025-10-16', 'Activo', 9, 10, 6, NULL, '2025-10-21', 5.00);

-- Volcando estructura para tabla videoclub_uts.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_registro` date DEFAULT curdate(),
  `fechaNacimiento` date DEFAULT NULL,
  `fotoPerfil` varchar(255) DEFAULT NULL,
  `numero_identificacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `UK6maeuj7wg56d5tndhi1w5ra0y` (`numero_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla videoclub_uts.cliente: ~0 rows (aproximadamente)
INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `fecha_registro`, `fechaNacimiento`, `fotoPerfil`, `numero_identificacion`) VALUES
	(8, 'Santiago', 'RIVAS CHAPON', 'santiagorivascha@gmail.com', '31612', 'Cl 107d 15b3', '2025-10-15', NULL, NULL, '98745765432434321'),
	(9, 'pepita', 'perez', 'n@n.com', '5316125', 'uts', '2025-10-15', NULL, NULL, '12345');

-- Volcando estructura para tabla videoclub_uts.copia
CREATE TABLE IF NOT EXISTS `copia` (
  `id_copia` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo_inventario` varchar(255) NOT NULL,
  `Formato` varchar(255) NOT NULL,
  `estado` varchar(255) DEFAULT 'Disponible',
  `id_pelicula` bigint(20) DEFAULT NULL,
  `Disponible` bit(1) NOT NULL,
  `Numero_Registro` varchar(255) NOT NULL,
  PRIMARY KEY (`id_copia`),
  UNIQUE KEY `codigo_inventario` (`codigo_inventario`),
  UNIQUE KEY `UKjkl2mub7eq394nb0elg9erpwq` (`Numero_Registro`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `copia_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla videoclub_uts.copia: ~0 rows (aproximadamente)
INSERT INTO `copia` (`id_copia`, `codigo_inventario`, `Formato`, `estado`, `id_pelicula`, `Disponible`, `Numero_Registro`) VALUES
	(5, '1245', 'DVD', 'Alquilada', 6, b'0', '10'),
	(6, '1020', 'Blu-ray', 'Alquilada', 8, b'0', '15');

-- Volcando estructura para tabla videoclub_uts.distribuidora
CREATE TABLE IF NOT EXISTS `distribuidora` (
  `id_distribuidora` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_distribuidora`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla videoclub_uts.distribuidora: ~3 rows (aproximadamente)
INSERT INTO `distribuidora` (`id_distribuidora`, `nombre`, `telefono`, `email`, `direccion`, `url`) VALUES
	(1, 'Universal Pictures', '+1 555-111-2222', 'contact@universal.com', NULL, 'https://www.universalpictures.com'),
	(2, 'Universal Studio', '5551234567', 'contacto@universal.com', '100 Universal City Plaza, Universal City, CA', 'http://www.universalpictures.com'),
	(4, 'Sony', '5485234123214651', 'pelsadasis@estudio.com', 'P Chersadasdman 15', 'http://www.bytedasdasdstudio.com');

-- Volcando estructura para tabla videoclub_uts.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `id_empleado` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `numero_identificacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `UKc8woxyruo306lrw4i4ut1yah8` (`numero_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla videoclub_uts.empleado: ~2 rows (aproximadamente)
INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `cargo`, `email`, `telefono`, `fecha_contratacion`, `numero_identificacion`) VALUES
	(9, 'Francisdsadsa', 'Torres', 'Dependiente', 'pedross342dad.gomez@videoclub.com', '1234', NULL, '98745765432434321'),
	(10, 'Santiago', 'RIVAS CHAPON', 'Dependiente', 'santiagorivascha@gmail.com', '3001234567', NULL, '123456');

-- Volcando estructura para tabla videoclub_uts.pelicula
CREATE TABLE IF NOT EXISTS `pelicula` (
  `id_pelicula` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `anio` int(11) NOT NULL,
  `director` varchar(255) DEFAULT NULL,
  `reparto` longtext DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `clasificacion` varchar(255) DEFAULT NULL,
  `portada_url` varchar(255) DEFAULT NULL,
  `id_distribuidora` bigint(20) DEFAULT NULL,
  `id_tarifa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`),
  KEY `id_distribuidora` (`id_distribuidora`),
  KEY `id_tarifa` (`id_tarifa`),
  CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`id_distribuidora`) REFERENCES `distribuidora` (`id_distribuidora`) ON DELETE SET NULL,
  CONSTRAINT `pelicula_ibfk_2` FOREIGN KEY (`id_tarifa`) REFERENCES `tarifa` (`id_tarifa`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla videoclub_uts.pelicula: ~2 rows (aproximadamente)
INSERT INTO `pelicula` (`id_pelicula`, `titulo`, `anio`, `director`, `reparto`, `genero`, `clasificacion`, `portada_url`, `id_distribuidora`, `id_tarifa`) VALUES
	(6, 'batman', 2025, 'Louis Leterrier', 'Vin Diesel, Michelle Rodriguez', NULL, NULL, NULL, 1, 1),
	(7, 'rapidos y furiosos', 2025, 'Louis Leterrier', 'Vin Diesel, Michelle Rodriguez', NULL, NULL, NULL, 4, 2),
	(8, 'la casa del terror', 1999, 'vosotros', 'nosotros', NULL, NULL, NULL, 1, 2);

-- Volcando estructura para tabla videoclub_uts.tarifa
CREATE TABLE IF NOT EXISTS `tarifa` (
  `id_tarifa` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `dias_prestamo` int(11) NOT NULL,
  `penalizacion_diaria` decimal(10,2) NOT NULL DEFAULT 2000.00,
  PRIMARY KEY (`id_tarifa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla videoclub_uts.tarifa: ~4 rows (aproximadamente)
INSERT INTO `tarifa` (`id_tarifa`, `tipo`, `precio`, `dias_prestamo`, `penalizacion_diaria`) VALUES
	(1, 'Estreno', 10.00, 3, 3000.00),
	(2, 'Normal', 5.00, 5, 2000.00),
	(3, 'Preferencial', 23.50, 1, 5000.00),
	(5, 'Promocion', 2.50, 9, 1500.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
