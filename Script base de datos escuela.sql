

CREATE TABLE `tipo_usuario` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `administrador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `primer_apellido` varchar(255) DEFAULT NULL,
  `contrasegna` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tipo_usuario` int DEFAULT NULL,
  `segundo_apellido` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_administrador_tipo_usuario` (`tipo_usuario`),
  CONSTRAINT `fk_administrador_tipo_usuario` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `profesor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `primer_apellido` varchar(255) DEFAULT NULL,
  `contrasegna` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tipo_usuario` int DEFAULT NULL,
  `segundo_apellido` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profesor_tipo_usuario` (`tipo_usuario`),
  CONSTRAINT `fk_profesor_tipo_usuario` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `grupo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `curso` varchar(50) NOT NULL,
  `letra` varchar(50) NOT NULL,
  `tutor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grupo_ibfk_1` (`tutor_id`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`tutor_id`) REFERENCES `profesor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alumno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grupo_id` int DEFAULT NULL,
  `tipo_usuario` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `primer_apellido` varchar(255) DEFAULT NULL,
  `contrasegna` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `segundo_apellido` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grupo_id` (`grupo_id`),
  KEY `fk_alumno_tipo_usuario` (`tipo_usuario`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_alumno_tipo_usuario` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `asignatura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha` varchar(50) DEFAULT NULL,
  `asignatura_id` int NOT NULL,
  `grupo_id` int DEFAULT NULL,
  `porcentaje` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asignatura_id` (`asignatura_id`),
  KEY `grupo_id` (`grupo_id`),
  CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`asignatura_id`) REFERENCES `asignatura` (`id`),
  CONSTRAINT `examen_ibfk_3` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tarea_evaluable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `porcentaje` int DEFAULT NULL,
  `asignatura_id` int DEFAULT NULL,
  `grupo_id` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asignatura_id` (`asignatura_id`),
  KEY `grupo_id` (`grupo_id`),
  CONSTRAINT `tarea_evaluable_ibfk_1` FOREIGN KEY (`asignatura_id`) REFERENCES `asignatura` (`id`),
  CONSTRAINT `tarea_evaluable_ibfk_2` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `profesor_asignatura` (
  `id_profesor` int NOT NULL,
  `id_asignatura` int NOT NULL,
  `agno_academico` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`,`id_asignatura`),
  KEY `id_asignatura` (`id_asignatura`),
  CONSTRAINT `profesor_asignatura_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`),
  CONSTRAINT `profesor_asignatura_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `asignatura_grupo` (
  `asignatura_id` int NOT NULL,
  `grupo_id` int NOT NULL,
  PRIMARY KEY (`asignatura_id`,`grupo_id`),
  KEY `grupo_id` (`grupo_id`),
  CONSTRAINT `asignatura_grupo_ibfk_1` FOREIGN KEY (`asignatura_id`) REFERENCES `asignatura` (`id`),
  CONSTRAINT `asignatura_grupo_ibfk_2` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cuaderno_profesor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_insercion` varchar(255) NOT NULL,
  `alumno_id` int NOT NULL,
  `tareas_casa` varchar(255) DEFAULT NULL,
  `participacion` varchar(255) DEFAULT NULL,
  `atencion` varchar(255) DEFAULT NULL,
  `tareas_clase` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno_id` (`alumno_id`),
  CONSTRAINT `cuaderno_profesor_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nota_tarea_evaluable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `puntuacion` double DEFAULT NULL,
  `tarea_evaluable_id` int DEFAULT NULL,
  `alumno_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tarea_evaluable_id` (`tarea_evaluable_id`),
  KEY `alumno_id` (`alumno_id`),
  CONSTRAINT `nota_tarea_evaluable_alumno_fk` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`),
  CONSTRAINT `nota_tarea_evaluable_tarea_evaluable_fk` FOREIGN KEY (`tarea_evaluable_id`) REFERENCES `tarea_evaluable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nota_examen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `puntuacion` double DEFAULT NULL,
  `examen_id` int DEFAULT NULL,
  `alumno_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examen_id` (`examen_id`),
  KEY `alumno_id` (`alumno_id`),
  CONSTRAINT `nota_examen_alumno_fk` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`),
  CONSTRAINT `nota_examen_examen_fk` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;









