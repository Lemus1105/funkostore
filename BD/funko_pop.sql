-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2022 a las 17:04:35
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `funko_pop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adress`
--

CREATE TABLE `adress` (
  `AdressID` int(10) NOT NULL,
  `Town` varchar(20) NOT NULL,
  `PostalCode` int(5) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `Number` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `card`
--

CREATE TABLE `card` (
  `CardID` int(10) NOT NULL,
  `CardNumber` int(16) NOT NULL,
  `ExpirationDate` int(4) NOT NULL,
  `CVV` int(4) NOT NULL,
  `UserID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `CategoryID` int(10) NOT NULL,
  `NameCategory` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoryfunkopop`
--

CREATE TABLE `categoryfunkopop` (
  `FunkoPopID` int(10) NOT NULL,
  `CategoryID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funkopop`
--

CREATE TABLE `funkopop` (
  `FunkoPopID` int(10) NOT NULL,
  `NameFunkoPop` varchar(50) NOT NULL,
  `Price` int(4) NOT NULL,
  `Description` int(150) NOT NULL,
  `Photo1` blob NOT NULL,
  `Photo2` blob NOT NULL,
  `Photo3` blob NOT NULL,
  `Stock` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `review`
--

CREATE TABLE `review` (
  `ReviwID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `FunkoPopID` int(10) NOT NULL,
  `Review` text NOT NULL,
  `Rate` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shop`
--

CREATE TABLE `shop` (
  `ShopID` int(10) NOT NULL,
  `FunkoPopID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Amount` int(3) NOT NULL,
  `SubTotal` int(5) NOT NULL,
  `Shipping` int(5) NOT NULL,
  `Status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `UserID` int(10) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `LastName1` varchar(20) DEFAULT NULL,
  `LastName2` varchar(20) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `Type` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `useradress`
--

CREATE TABLE `useradress` (
  `UserID` int(10) NOT NULL,
  `AdressID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wishlist`
--

CREATE TABLE `wishlist` (
  `WishListID` int(10) NOT NULL,
  `FunkoPopID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`AdressID`);

--
-- Indices de la tabla `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`CardID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indices de la tabla `categoryfunkopop`
--
ALTER TABLE `categoryfunkopop`
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `FunkoPopID` (`FunkoPopID`);

--
-- Indices de la tabla `funkopop`
--
ALTER TABLE `funkopop`
  ADD PRIMARY KEY (`FunkoPopID`);

--
-- Indices de la tabla `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviwID`),
  ADD KEY `FunkoPopID` (`FunkoPopID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indices de la tabla `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`ShopID`),
  ADD KEY `FunkoPopID` (`FunkoPopID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indices de la tabla `useradress`
--
ALTER TABLE `useradress`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `AdressID` (`AdressID`);

--
-- Indices de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`WishListID`),
  ADD KEY `FunkoPopID` (`FunkoPopID`),
  ADD KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adress`
--
ALTER TABLE `adress`
  MODIFY `AdressID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `card`
--
ALTER TABLE `card`
  MODIFY `CardID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funkopop`
--
ALTER TABLE `funkopop`
  MODIFY `FunkoPopID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `review`
--
ALTER TABLE `review`
  MODIFY `ReviwID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `shop`
--
ALTER TABLE `shop`
  MODIFY `ShopID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `WishListID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Filtros para la tabla `categoryfunkopop`
--
ALTER TABLE `categoryfunkopop`
  ADD CONSTRAINT `categoryfunkopop_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  ADD CONSTRAINT `categoryfunkopop_ibfk_2` FOREIGN KEY (`FunkoPopID`) REFERENCES `funkopop` (`FunkoPopID`);

--
-- Filtros para la tabla `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`FunkoPopID`) REFERENCES `funkopop` (`FunkoPopID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Filtros para la tabla `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`FunkoPopID`) REFERENCES `funkopop` (`FunkoPopID`),
  ADD CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Filtros para la tabla `useradress`
--
ALTER TABLE `useradress`
  ADD CONSTRAINT `useradress_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `useradress_ibfk_2` FOREIGN KEY (`AdressID`) REFERENCES `adress` (`AdressID`);

--
-- Filtros para la tabla `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`FunkoPopID`) REFERENCES `funkopop` (`FunkoPopID`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
