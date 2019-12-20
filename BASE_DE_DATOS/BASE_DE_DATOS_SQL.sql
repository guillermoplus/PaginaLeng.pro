-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: skatebicy
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(14) NOT NULL COMMENT 'cedula del cliente ',
  `Nombres` varchar(60) NOT NULL COMMENT 'nombres del cliente',
  `Apellidos` varchar(60) NOT NULL COMMENT 'apellidos del cliente',
  `Correo` varchar(20) NOT NULL COMMENT 'correo del cliente',
  `Celular` varchar(15) NOT NULL COMMENT 'numero del celular del cliente',
  `Barrio` varchar(30) NOT NULL COMMENT 'barrio donde vive el cliente',
  PRIMARY KEY (`Cedula`),
  UNIQUE KEY `numero` (`numero`),
  KEY `Barrio` (`Barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'1007478930','liliana','rodriguez lopez','lilirodriguez@gmail.','3115466589','la paz'),(2,'1118507508','Dulber Adrian','Garcia Corredor','adri18@gmail.com','3144307065','laureles'),(3,'1118543597','luisa','cardenas holguin','luisa23@gmail.com','3124578680','unidad'),(4,'1118566614','angie bibiana','colina ortiz','bibicolina@gmail.com','3109876543','la 40'),(10,'1118572543','julieth natalia','velandia achagua','juli@gmail.com','3165647890','oasis'),(5,'13437652','luis','bedolla martinez','luisbedolla@gmail.co','3125656565','araguaney'),(6,'47354678','rosalba ','peña pinto','rosita@gmail.com','3107600180','campiña'),(7,'47434903','Marlen','Corredor Siabato','corredormarlen@gmail','3175883508','araguaney'),(8,'47657809','carmen Rosa','Rodriguez Mendoza','carmenro@gmail.com','3143861525','paraiso'),(9,'9653957','daniel','figueron castillo','danielortiz@gmail.co','3182789507','villa horizonte');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallefactura` (
  `Num_Facturacliente` varchar(14) NOT NULL COMMENT 'Numero de la factura',
  `Cantidad_Servicios` int(11) NOT NULL COMMENT 'cantidad de los servicios adquiridos',
  `Precio_Alquiler` double NOT NULL COMMENT 'precio por el alquiler del vehículo',
  KEY `Num_Factura` (`Num_Facturacliente`),
  CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`Num_Facturacliente`) REFERENCES `factura` (`Num_Factura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefactura`
--

LOCK TABLES `detallefactura` WRITE;
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
INSERT INTO `detallefactura` VALUES ('1',2,48000),('2',2,2),('3',1,1000),('4',3,72000),('4',1,1000),('5',1,1000),('7',1,7000),('8',1,50000);
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `Barrio_cliente` varchar(30) NOT NULL COMMENT 'barrio donde vive el cliente',
  `Carrera` varchar(14) NOT NULL COMMENT 'dirección de carrera donde vive el cliente',
  `Calle` varchar(14) NOT NULL COMMENT 'direccion de calle donde vive el cliene',
  `Num_Casa` varchar(10) NOT NULL COMMENT 'número de casa donde vive el cliente',
  PRIMARY KEY (`Barrio_cliente`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`Barrio_cliente`) REFERENCES `clientes` (`Barrio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES ('araguaney','12','24','5'),('campiña','13','12','3'),('la 40','26','15','11'),('la paz','19','24','3'),('laureles','18','22','5'),('oasis','18','22','5'),('paraiso','20','21','9'),('unidad','23','14','4'),('villa horizonte','34','27','6');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `Num_Factura` varchar(14) NOT NULL COMMENT 'Numero de la factura',
  `Num_Servicio` varchar(14) NOT NULL COMMENT 'Numero de servicio alquilado',
  `Cedula_cliente` varchar(14) NOT NULL COMMENT 'cedula del cliente',
  PRIMARY KEY (`Num_Factura`),
  KEY `Num_Servicio` (`Num_Servicio`),
  KEY `Cedula` (`Cedula_cliente`),
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`Num_Servicio`) REFERENCES `servicio` (`Num_Servicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`Cedula_cliente`) REFERENCES `clientes` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES ('1','1','13437652'),('2','2','9653957'),('3','4','47354678'),('4','3','47434903'),('5','3','47657809'),('6','5','1007478930'),('7','8','1118507508'),('8','10','1118543597');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `Num_Servicio` varchar(14) NOT NULL COMMENT 'Numero de servicio alquilado',
  `Codigo_Vehiculo` int(11) NOT NULL COMMENT 'código del vehículo alquilado',
  `Fecha_Alquiler` date NOT NULL COMMENT 'fecha de inicio del alquiler',
  `Fecha_Entrega` date NOT NULL COMMENT 'fecha del fin de alquiler',
  PRIMARY KEY (`Num_Servicio`),
  KEY `Codigo_Vehiculo` (`Codigo_Vehiculo`),
  CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`Codigo_Vehiculo`) REFERENCES `vehiculo` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES ('1',1,'2019-11-01','2019-11-02'),('10',10,'2019-11-17','2019-11-18'),('2',2,'2019-11-04','2019-11-05'),('3',3,'2019-11-05','2019-11-06'),('4',4,'2019-11-07','2019-11-08'),('5',5,'2019-09-04','2019-09-05'),('6',6,'2019-11-14','2019-11-15'),('7',7,'2019-10-16','2019-10-17'),('8',8,'2019-12-03','2019-11-04'),('9',9,'2019-08-01','2019-08-02');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `codigo` int(11) NOT NULL COMMENT 'código de vehículo alquilado',
  `Nombre_Vehiculo` varchar(20) NOT NULL COMMENT 'nombre del vehículo alquilado',
  `Caracteristicas` text NOT NULL COMMENT 'características del vehículo alquilado',
  `Precio_Hora` double NOT NULL COMMENT 'precio por hora del vehículo',
  `Precio_Dia` double NOT NULL COMMENT 'precio por día del vehículo',
  `Disponibilidad` tinyint(1) NOT NULL COMMENT 'disponibilidad del vehículo',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'patineta','Patineta Eléctrica Scooter \r\n-Suspensión: delantera y trasera\r\n-Pendiente Máxima: 10º\r\n-Resistencia al agua: IP54\r\n-Luces led en la parte inferior, permite personalizar el vehículo (puede apagarse);\r\n-Luz delantera y trasera para navegación nocturna;\r\n-Incluye opción de navegacion piloto automático;\r\n-Monitor: Display digital que muestra velocidad, modo de navegación etc;\r\n-Bluetooth;',1000,24000,1),(2,'patineta','Patineta Skate Profesional:\r\n• color negra\r\n• Tabla plana de doble tiro en maple.\r\n• Resistente\r\n• Gráfico y cinta de Lija 80AB de alta calidad para mayor agarre\r\n• chasis en Aluminio de 5 pulgadas.\r\n• Ruedas en goma de poliuretano de 54*36mm.\r\n• Con ABEC -3\r\n• Diseño moderno y juvenil.\r\n• Medidas: 80 x 24 x 12\r\n• Peso del producto : 2400 gr = 2,4 kg\r\n• Peso usuario recomendado hasta 100 kg usuario\r\n• Ideal para rodamiento, saltos y trucos profesionales',1000,24000,1),(3,'patineta','Patineta Electrica Scooter Ninebot Patines Eléctricos:\r\nCHASÍS\r\nDimensiones (LxAxAlt): 319 x 269x 219mm\r\nPeso: aprox. 3.5kg\r\nResistencia al agua: Clasificación IP54 (Lluvia / terreno húmedo, Arena y piedras)\r\nMarco: aleación de calidad aeronáutica\r\nCapacidad de carga: 10Kg - 100 Kg\r\nUsuario: 6 años en adelante\r\ncolo: negro-blanco\r\n\r\nMOTOR\r\nMotor: 37.5W\r\nVelocidad: 12 Km/h\r\nAutonomía: 12 Km/h\r\nMax. Ángulo de escalada: 10 grados\r\nTerreno recomendable: Pavimento, tierra compactada, pendientes <10 °, obstáculos <0.2\"\r\n\r\nBATERÍA\r\nBatería Voltaje nominal: 22.2VDC\r\nMax. Voltaje de carga: 25.2 VDC\r\nCapacidad nominal: 44.4Wh\r\nTemperatura de funcionamiento: 14 - 104 ° F\r\nTemperatura de almacenamiento: -4 - 113 ° F\r\nTiempo de carga 3 horas\r\n\r\n- BMS inteligente Protección contra sobretensión / bajo voltaje / cortocircuito / sobrecalentamiento, auto-suspensión / activación / información detallada de la batería se puede consultar con la aplicación\r\n\r\nAPP MÓVIL- VEHÍCULO INTELIGENTE\r\n- La mini aplicación Ninebot solo es compatible con dispositivos Android con Android 4.3 o superior y dispositivos iOS con iOS 7.0 y superior\r\n- Edad recomendada de uso: 16 - 60 año',2000,50000,1),(4,'patineta','Xiaomi Ninebot Mini - Patineta Electrica:\r\nPOTENCIA Y VELOCIDAD DE RENDIMIENTO\r\n-Velocidad máxima: Aprox. 16km / h\r\n-Torque máximo: Scooter entero, 2 x 35Nm\r\n-Fuerza de motor: 2 x 350W\r\n-Potencia instantánea máxima: 2100W\r\n-Método de control del motor: Control vectorial de motor sinusoidal, algoritmo de control de velocidad actual + de circuito cerrado\r\n\r\nPARÁMETROS\r\n-Pendiente aplicable: Aprox. 15º\r\n-Terreno aplicable: Pavimento, tierra compactada, pendientes <15 °, obstáculos <1 cm, brechas <3 cm de ancho\r\n-Altura del chasis: 80 mm por encima del suelo\r\n-Certificación IP: IP54 (Protegido frente a la ligera entrada de polvo. Puede usarse en días de lluvia, pero se recomienda no meter en los charcos.)\r\n\r\nBATERÍA Y CARGADOR\r\n-Estructura de la batería: Batería de litio de alta capacidad 30 x 18,650\r\n-Rango típico de la batería: Aprox. 22 km (Depende de las condiciones climatológicas, el peso del conductor, la velocidad, el tipo de terreno y el propio nivel de batería en el punto de partida.)\r\n-Potencia nominal: 70W\r\n-Voltaje de entrada nominal: 100-240VAC, 50 / 60Hz\r\n-Voltaje de salida nominal: Aprox. 63VDC\r\n-Tiempo de carga: Aprox. 4 horas\r\n-BMS inteligente: Sobretensión / Subtensión / Cortocircuito / Protección contra sobrecalentamiento, apagado automático / Activación / Se puede encontrar información detallada sobre la batería en la aplicación\r\n-Consumo de energía estándar: El consumo de energía por cada cien kilómetros es 1.1kWh\r\n\r\nFRENOS Y AMORTIGUACIÓN\r\n-Distancia de frenado: 3.4m en superficies secas\r\n-Método de frenado: Sistema de frenado somatosensorial, regenerativo.\r\n-Mecanismo de amortiguación: Marco de aleación de magnesio de alta absorción de impactos + almohadillas amortiguadoras\r\n\r\n-CUADRO\r\n-Material: Bastidor de aleación de magnesio muy elástico.\r\n-Freno: Sistema de frenado somatosensorial, regenerativo, distancia de frenado de aproximadamente 3,4 m.\r\n-Neumáticos: 10.5\", llenos de aire\r\n-Llantas: Llantas de aleación de magnesio de 6\"\r\n\r\nSISTEMA DE ILUMINACIÓN\r\n-Sensación de luz ambiental\r\n-Faros y luces traseras LED\r\n-Luces de señalización\r\n-Luz indicadora de conexión Bluetooth\r\n-Luces indicadoras de encendido\r\nSISTEMA INTELIGENTE\r\n-Capacidades de aprendizaje inteligentes: Optimiza y ajusta automáticamente la potencia de salida, la sensibilidad de la dirección y los parámetros de seguridad de acuerdo con el peso y los hábitos de conducción de los usuarios. Las características de seguridad y protección se adaptarán lentamente al estilo de conducción del usuario.\r\n-Funcionalidades de la aplicación de teléfono inteligente: Incluye navegador, envía automáticamente informes de fallos, actúa como control remoto, actualizaciones de firmware y otras configuraciones personalizables\r\n-Advertencia de seguridad inteligente: Cuando el vehículo experimente sobrecarga, sobrecalentamiento, manejo imprudente o esté pasando por situaciones peligrosas, enviará una alerta\r\n-Interacciones inteligentes: Inteligentemente asiste, enseña y guía a los principiantes a través de un curso de manejo básico\r\n\r\nREQUISITOS DEL CONDUCTOR\r\n-Modo principiante: Sí. (Después del primer kilómetro de viaje, el modo principiante se desactivará de forma automática. El modo principiante se puede activar de nuevo usando la aplicación).\r\n-Edad recomendada: 16 - 50 años\r\n-Altura recomendable: 120-200cm\r\n-Carga máxima: 85kg\r\n\r\nDIMENSIONES Y PESO\r\n-Dimensiones: 59.5 x 54.8 x 26 cm\r\n-Peso: 12.8kg (Batería incluida)',1000,24000,1),(5,'patineta','Nueva!! Patineta Eléctrica Ninebot By Segway Es2 + Silla:\r\nMARCO\r\n-color negra\r\n-Material:Aleación de magnesio y aluminio;\r\n-Plegable (una vez plegado puede rodarse para mayor facilidad);\r\n-Tamaño plegado: 113x43x40 cm\r\n-Tamaño sin plegar: 102x43x113 cm;\r\n-Carga máxima: 100 Kg\r\n-Peso: aprox 12 Kgs;\r\n- Cobertor de manubrio color: Wild\r\n\r\nMOTOR\r\n-Velocidad máxima: aprox. 25km/h\r\n-Autonomía: aprox. 25km/h (varía dependiendo de condiciones de manejo y conductor);\r\n- Modos de manejo: 3 modos de manejo (incluye velocidad limitada, estandar y sport);\r\n-Potencia nominal: 300w\r\n-Máxima Potencia: 700w\r\n\r\nRUEDAS y SUSPENSIÓN\r\n-Diámetro: 8\";\r\n-Sólidas anti-pinchazo (evita el riesgo de pinchazo y la necesidad de cambio);\r\n-Suspensión: delantera y trasera;\r\n-Luz LED trasera de aviso de \"pare\";\r\n\r\nCARACTERÍSTICAS GENERALES\r\n-Suspensión: delantera y trasera\r\n-Pendiente Máxima: 10º\r\n-Resistencia al agua: IP54\r\n- Luces led en la parte inferior, permite personalizar el vehículo (puede apagarse);\r\n- Luz delantera y trasera para navegación nocturna;\r\n- incluye opción de navegacion piloto automático;\r\n- Monitor: Display digital que muestra velocidad, modo de navegación etc;\r\n- Bluetooth;\r\n\r\nSILLA\r\n- Material de la silla, Esponja de espuma\r\n- Formación de silla, Formación de vacío\r\n-Cuenta con aspiración rápida, Asiento de aleación de aluminio de alta calidad\r\n\r\nBATERÍA\r\n-voltaje nominal: 36VDC\r\n-voltaje máximo de carga: 42 VDC\r\n-input: 100-240V- 50-60Hz\r\n-output voltaje: 42 VDC\r\n-corriente: 1.7A\r\n-temperatura de carga: 0-40 grados centígrados\r\n-Sistema de carga inteligente: evita sobre calentamiento, corto circuito etc.;\r\n-Incluye cargador;',2000,50000,1),(6,'bicicleta','Bicicleta Electrica Todo Terreno Accesorios Shimano:\r\nMarco y Tenedor en Acero 1.5 Ultra Liviano.\r\nAltura Uso 160 - 180 Cm.\r\nFrenos V-Brake.\r\nRines 26 D/Pared.\r\nCa¤a en Aluminio.\r\nPalancas Tipo Moto 6 Vel.\r\nTriplato.\r\nPacha 6 Vel.\r\nLlantas 26 x 1.50 Pistera Colores. \r\nEl cual varia según disponibilidad.\r\nSillin Aerodinamico Colores.\r\nIncluye Pedales.\r\nAjuste Automatico de Puntilla en Llantas y Sillin.\r\n95% Armada.',7000,168000,1),(7,'bicicleta','Bicicleta Profesional Ruta En Carbono Grupo Shimano Sora:\r\nBICICLETA EUROBIKE EN CARBONO DE LUJO\r\n\r\nColor: Azul\r\n\r\nGRUPO SHIMADO DE ATO RENDIMIENTO SORA R3000 con freno de seguridad de cambio a cualquier velocidad.\r\n\r\nTija de sillín de carbono T700 de fibra de carbono marco, horquilla de carbono.\r\n\r\nShimano SORA R3000 pinza de freno proporciona gran potencia de frenado.\r\n\r\nLlantas de aluminio de doble pared hace que sea más de LIGERA\r\n\r\nLos pedales y cómodo asiento se incluyen en el paquete.\r\n\r\nPeso de la bicicleta: aprox 9.3 kilos',7000,168000,1),(8,'bicicleta','Bicicleta Urbana Rin 26 18 Cambios Tipo Moto - Negro:\r\nMarco y Tenedor en Acero 1.5 Ultra Liviano.\r\nAltura Uso 160 - 180 Cm.\r\nFrenos V-Brake.\r\nRines 26 D/Pared.\r\nCa¤a en Aluminio.\r\nPalancas Tipo Moto 6 Vel.\r\nTriplato.\r\nPacha 6 Vel.\r\nLlantas 26 x 1.50 Pistera Colores. \r\nEl cual varia según disponibilidad.\r\nSillin Aerodinamico Colores.\r\nIncluye Pedales.\r\nAjuste Automatico de Puntilla en Llantas y Sillin.',2000,50000,1),(9,'bicicleta','Bicicleta Montaña Ontrail Rin 27.5, 18v:\r\nMARCA: ONTRAIL\r\nMODELO VORTEX\r\nRIN: 27.5\" - TALLA M\r\nMARCO: ACERO\r\nFRENO: DISCO ARO CALIPER\r\nVELOCIDADES: 3X6\r\nCOLOR: NEGRO ROJO Y NEGRO NARANJA',2000,50000,1),(10,'bicicleta','Bicicleta MTB Corleone Bikes Rin 26 Mecanica - Aguamarina:\r\nMarco en Aluminio de 17\"                                                    \r\nCambios integrados con los frenos \r\nGrupo Shimano Tourney\r\nBloqueo de suspensión delantera al hombro \r\nFreno de disco delantero y trasero sistema mecánico\r\nRin 26\"\r\nLlanta Chaoyang\r\nPeso 14 Kilos\r\nSilla antiprostatica\r\nCableado Interno.\r\nMedidas: L 165 x Ancho 65 x Alto 95 cm\r\n',2000,50000,1);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-20 12:11:32
