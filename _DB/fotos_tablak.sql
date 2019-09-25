-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3306
-- Létrehozás ideje: 2019. Sze 25. 06:18
-- Kiszolgáló verziója: 5.7.23
-- PHP verzió: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fotos`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `foto`
--

DROP TABLE IF EXISTS `foto`;
CREATE TABLE IF NOT EXISTS `foto` (
  `file` varchar(32) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `artist` varchar(16) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `katid` tinyint(2) UNSIGNED NOT NULL,
  `cim` varchar(32) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `story` varchar(500) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `blende` varchar(10) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `zarido` varchar(10) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `iso` int(10) DEFAULT NULL,
  `focus` smallint(5) DEFAULT NULL,
  `kamera` varchar(64) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `obi` varchar(64) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `class` varchar(16) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  PRIMARY KEY (`file`),
  KEY `artist` (`artist`),
  KEY `katid` (`katid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

DROP TABLE IF EXISTS `kategoria`;
CREATE TABLE IF NOT EXISTS `kategoria` (
  `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kategoria` varchar(64) COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kedvelesek`
--

DROP TABLE IF EXISTS `kedvelesek`;
CREATE TABLE IF NOT EXISTS `kedvelesek` (
  `kedvelo` varchar(16) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `foto` varchar(25) COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`kedvelo`,`foto`),
  KEY `ertekelo` (`kedvelo`),
  KEY `foto` (`foto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kedvencek`
--

DROP TABLE IF EXISTS `kedvencek`;
CREATE TABLE IF NOT EXISTS `kedvencek` (
  `jelolo` varchar(16) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `filename` varchar(25) COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`jelolo`,`filename`),
  KEY `jelolo` (`jelolo`),
  KEY `filename` (`filename`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kommentek`
--

DROP TABLE IF EXISTS `kommentek`;
CREATE TABLE IF NOT EXISTS `kommentek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ertekelo` varchar(16) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `kep` varchar(32) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `komment` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ertekelo` (`ertekelo`),
  KEY `kep` (`kep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userid` varchar(16) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `jelszo` char(40) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `nev` varchar(64) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `pkep` varchar(20) COLLATE utf8mb4_hungarian_ci DEFAULT 'avatar.png',
  `rolam` text COLLATE utf8mb4_hungarian_ci,
  `cam` varchar(64) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `lens` varchar(64) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`artist`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foto_ibfk_2` FOREIGN KEY (`katid`) REFERENCES `kategoria` (`id`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `kedvelesek`
--
ALTER TABLE `kedvelesek`
  ADD CONSTRAINT `kedvelesek_ibfk_1` FOREIGN KEY (`foto`) REFERENCES `foto` (`file`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kedvelesek_ibfk_2` FOREIGN KEY (`kedvelo`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `kedvencek`
--
ALTER TABLE `kedvencek`
  ADD CONSTRAINT `kedvencek_ibfk_1` FOREIGN KEY (`filename`) REFERENCES `foto` (`file`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kedvencek_ibfk_2` FOREIGN KEY (`jelolo`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `kommentek`
--
ALTER TABLE `kommentek`
  ADD CONSTRAINT `kommentek_ibfk_1` FOREIGN KEY (`ertekelo`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kommentek_ibfk_2` FOREIGN KEY (`kep`) REFERENCES `foto` (`file`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
