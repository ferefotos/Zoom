-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3306
-- Létrehozás ideje: 2019. Sze 25. 06:22
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

--
-- A tábla adatainak kiíratása `foto`
--

INSERT INTO `foto` (`file`, `artist`, `katid`, `cim`, `story`, `blende`, `zarido`, `iso`, `focus`, `kamera`, `obi`, `date`, `class`, `public`) VALUES
('1549747044811.jpg', 'fercsivox', 17, 'Fagyos virág', '', 'f/2.2', '1/160', 50, 5, 'Huawei EVA-L19', '', '2018-02-18', 'landscape', 1),
('1549747115596.jpg', 'fercsivox', 3, 'Téli etető', '', 'f/4', '1/1000', 800, 280, 'Canon EOS 70D', 'EF200mm f/2.8L USM', '2016-01-25', 'landscape', 1),
('1549747217266.jpg', 'fercsivox', 3, 'Lovak', '', 'f/8', '1/200', 100, 40, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2011-06-25', 'landscape', 1),
('1549747299792.jpg', 'fercsivox', 10, 'Lovasi', '', 'f/3.5', '1/80', NULL, 55, 'Canon PowerShot S2 IS', '', '2006-07-06', 'landscape', 1),
('1549747485106.jpg', 'fercsivox', 10, 'DM Zágráb', '', 'f/4', '1/160', 1600, 96, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-07-18', 'landscape', 1),
('1549747812750.jpg', 'fercsivox', 16, 'Bálák', '', 'f/11', '1/125', 100, 24, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2011-06-25', 'landscape', 1),
('1549747865280.jpg', 'fercsivox', 16, 'Spartacus ösvény', '', 'f/9', '1/250', 200, 10, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-05-21', 'landscape', 1),
('1549747886255.jpg', 'fercsivox', 16, '', '', 'f/9', '1/200', 200, 12, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-05-21', 'landscape', 1),
('1549747947139.jpg', 'fercsivox', 18, 'Ostia', '', 'f/9', '1/250', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-07-14', 'landscape', 1),
('1549748017956.jpg', 'fercsivox', 18, 'Ostia', '', 'f/9', '1/250', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-07-14', 'landscape', 1),
('1549748137936.jpg', 'fercsivox', 18, 'Milano, Navigli', '', 'f/7.1', '1/320', 100, 18, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2018-09-20', 'landscape', 1),
('1549748206855.jpg', 'fercsivox', 18, 'Róma', '', 'f/6.3', '1/50', 200, 73, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-07-19', 'portrait', 1),
('1549748270437.jpg', 'fercsivox', 18, 'Appia Antica', 'Begyalogoltunk rajta Rómába a Ciampino reptérről. Kb. 10 km, de egy élmény!', 'f/8', '1/320', 200, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2016-07-01', 'landscape', 1),
('1549748587573.jpg', 'fercsivox', 18, 'Basilica di Santa Croce', 'Róma', 'f/7.1', '1/200', 400, 28, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-06-25', 'landscape', 1),
('1549748613840.jpg', 'fercsivox', 18, 'Róma, Trastevere', '', 'f/6.3', '1/250', 320, 60, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-06-07', 'landscape', 1),
('1549748782847.jpg', 'tesztelek', 11, 'Varenna', 'A Garda-tó partján', 'f/7.1', '1/160', 200, 67, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-07-18', 'landscape', 1),
('1549748913566.jpg', 'tesztelek', 18, 'Nógrádi vár', '', 'f/11', '1/160', 100, 15, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2012-07-28', 'landscape', 1),
('1549748984787.jpg', 'tesztelek', 11, 'Kilátás', 'Nógrádi vár', 'f/11', '1/125', 100, 11, 'Canon EOS 600D', 'EF-S10-22mm f/3.5-4.5 USM', '2012-07-28', 'landscape', 1),
('1549749049757.jpg', 'tesztelek', 17, 'Árvalányhaj', '', 'f/5', '1/125', 200, 73, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2011-06-04', 'landscape', 1),
('1549749091849.jpg', 'tesztelek', 17, 'virág', '', 'f/4', '1/1000', 200, 60, 'Canon EOS 70D', 'EF-S60mm f/2.8 Macro USM', '2017-05-21', 'portrait', 1),
('1549749227716.jpg', 'tesztelek', 16, 'Száraz faág a hegyoldalban', 'Spartacus-ösvény', 'f/9', '1/250', 200, 22, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-05-21', 'landscape', 1),
('1549749453393.jpg', 'tesztelek', 16, 'Nagy-Sas-hegy', 'Börzsöny', 'f/7.1', '1/160', 200, 28, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-10-22', 'landscape', 1),
('1549749507643.jpg', 'tesztelek', 16, 'Őszi patakvölgy', 'Börzsöny', 'f/11', '1/8', 200, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-11-04', 'landscape', 1),
('1549749714346.jpg', 'tesztelek', 11, 'Róma látkép', '', 'f/7.1', '1/500', 100, 82, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2016-07-03', 'landscape', 1),
('1549749814285.jpg', 'tesztelek', 18, 'Colosseum', 'Róma', 'f/10', '1/200', 100, 10, 'Canon EOS 600D', 'EF-S10-22mm f/3.5-4.5 USM', '2012-10-06', 'landscape', 1),
('1549749883310.jpg', 'tesztelek', 18, 'Forum Romanum', 'Róma', 'f/8', '1/200', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-07-15', 'landscape', 1),
('1549750054531.jpg', 'tesztelek', 18, 'Károly-híd', 'Prága', 'f/10', '1/640', 200, 22, 'Canon EOS 600D', 'EF-S10-22mm f/3.5-4.5 USM', '2012-09-15', 'landscape', 1),
('1549750237876.jpg', 'tesztelek', 18, 'Verona', '', 'f/7.1', '1/250', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2016-07-13', 'landscape', 1),
('1549753135718.jpg', 'fercsivox', 6, 'Verona Aréna', 'Kék órában', 'f/5', '1', 100, 12, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2016-07-09', 'landscape', 1),
('1549753179611.jpg', 'fercsivox', 18, 'Perugia', '', 'f/8', '1/80', 500, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-28', 'portrait', 1),
('1549753300165.jpg', 'fercsivox', 6, 'Szent Péter Bazilika', '', 'f/4', '4/10', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-24', 'landscape', 1),
('1549753439673.jpg', 'fercsivox', 16, 'Gráciák bérce', 'Vértes', 'f/9', '1/160', 200, 12, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-04-14', 'landscape', 1),
('1549753492751.jpg', 'fercsivox', 17, 'Tulipánok', '', 'f/5.6', '1/320', 100, 200, 'Canon EOS 70D', 'EF200mm f/2.8L USM', '2017-04-04', 'landscape', 1),
('1549753522672.jpg', 'fercsivox', 17, 'Gomba', '', 'f/2.8', '1/1600', 100, 200, 'Canon EOS 70D', 'EF200mm f/2.8L USM', '2016-10-28', 'portrait', 1),
('1549753626598.jpg', 'fercsivox', 3, 'Cinegék', '', 'f/2.2', '1/50', 65, 5, 'Huawei EVA-L19', '', '2018-05-18', 'wide', 1),
('1549753698592.jpg', 'fercsivox', 16, 'Őszi fények', 'Börzsöny', 'f/8', '1/50', 200, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-10-14', 'landscape', 1),
('1549753765546.jpg', 'fercsivox', 16, 'Elmosott sínek', 'A 90-es években a Csarna-patak áradása elmosta a kisvasút sínjeit.', 'f/11', '1/40', 100, 35, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-10-14', 'landscape', 1),
('1549753805342.jpg', 'fercsivox', 16, 'Patak', '', 'f/4', '1/80', 200, 84, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-10-26', 'landscape', 1),
('1549753970845.jpg', 'fercsivox', 4, 'Virágos Veronában', '', 'f/5.6', '1/80', 200, 73, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2016-07-09', 'landscape', 1),
('1549754137145.jpg', 'fercsivox', 5, 'Villám', 'Sűrűn villámlott, 10 mp záridővel könnyű volt elkapni.', 'f/4', '10', 100, 24, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2011-05-21', 'landscape', 1),
('1549754258128.jpg', 'fercsivox', 16, 'Szigetcsúcs', 'Tass, Csepel-sziget déli szigetcsúcs', 'f/7.1', '1/250', 100, 67, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-10-07', 'landscape', 1),
('1549789330452.jpg', 'fercsivox', 18, 'Városkép Orvietoból', 'Orvieto, Olaszország', 'f/8', '1/250', 100, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-27', 'landscape', 1),
('1549789437348.jpg', 'fercsivox', 18, 'Alkonyat hangulat', 'Velence', 'f/8', '1/640', 200, 47, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-06-29', 'landscape', 1),
('1549789579438.jpg', 'fercsivox', 17, 'Leánykökörcsin', '', 'f/5.6', '1/100', 100, 147, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-04-15', 'landscape', 1),
('1549789671569.jpg', 'fercsivox', 16, 'Olasz táj', 'Kilátás Bagnoregioból', 'f/7.1', '1/500', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-27', 'landscape', 1),
('1549789776928.jpg', 'fercsivox', 18, 'Kolostor', 'Basilica dei Santi Quattro Coronati', 'f/8', '1/320', 800, 13, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2018-06-25', 'portrait', 1),
('1549789876566.jpg', 'fercsivox', 6, 'Verona éjszaka', 'Ponte di Castelvecchio', 'f/5.6', '4', 100, 55, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2016-07-12', 'landscape', 1),
('1549789995845.jpg', 'fercsivox', 18, 'Vár Sirmioneban', '', '', '', NULL, NULL, '', '', '0000-00-00', 'landscape', 1),
('1549790324891.jpg', 'tesztelek', 11, 'Tavasz Brisighellában', 'Brisighella, Olaszország', 'f/9', '1/30', 100, 24, 'Canon EOS 450D', '', '2011-03-13', 'landscape', 1),
('1549790386919.jpg', 'tesztelek', 4, 'Piac', 'Barcelona', 'f/8', '1/60', 400, 40, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2014-01-15', 'landscape', 1),
('1549790700726.jpg', 'tesztelek', 18, '', 'Ravenna', 'f/6.3', '1/400', 200, 35, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-30', 'landscape', 1),
('1549790835450.jpg', 'tesztelek', 18, '', 'Verona', 'f/5.6', '1/800', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-09-15', 'landscape', 1),
('1549790926877.jpg', 'tesztelek', 18, '', 'Padova', 'f/9', '1/80', 800, 40, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-06-28', 'landscape', 1),
('1549790985835.jpg', 'tesztelek', 18, '', 'London', 'f/5', '1/50', 250, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-02-11', 'portrait', 1),
('1549791115122.jpg', 'tesztelek', 16, '', 'Börzsöny', 'f/4', '1/250', 100, 28, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-10-15', 'landscape', 1),
('1549791215454.jpg', 'fercsivox', 18, '', 'Róma, Trastevere', 'f/5', '1/100', 400, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-06-07', 'landscape', 1),
('1549791282253.jpg', 'fercsivox', 18, '', 'Róma, Appia Antica', 'f/8', '1/800', 200, 95, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2016-07-01', 'landscape', 1),
('1549904760367.jpg', 'fercsivox', 10, 'David Gilmour koncerten', 'Verona Arena', 'f/4', '1/320', 1600, 67, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-09-14', 'landscape', 1),
('1549904863369.jpg', 'fercsivox', 10, 'Billy Idol', 'Rock in Roma', 'f/4', '1/250', 8000, 105, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-06-09', 'portrait', 1),
('1549904994857.jpg', 'fercsivox', 4, 'Kisautók', 'Valahol Róma utcáin', 'f/4.5', '1/160', 200, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-06-25', 'landscape', 1),
('1549905053121.jpg', 'fercsivox', 6, 'Angyalvár éjszaka', 'Róma', 'f/4', '8/10', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-24', 'landscape', 1),
('1549905249380.jpg', 'fercsivox', 18, 'Velence', '', 'f/8', '1/640', 200, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-06-29', 'portrait', 1),
('1549905351728.jpg', 'fercsivox', 17, 'Őszi levelek', '', 'f/2.8', '1/400', 200, 60, 'Canon EOS 70D', 'EF-S60mm f/2.8 Macro USM', '2018-11-04', 'landscape', 1),
('1549906312669.jpg', 'tesztelek', 16, 'Alkonyat a Dunán', 'Ráckeve', 'f/2.2', '1/160', 50, 5, 'Huawei EVA-L19', '', '2018-10-07', 'landscape', 1),
('1549906375631.jpg', 'tesztelek', 16, 'Kisvasút a Csarna-patak völgyébe', '', 'f/8', '1/30', 100, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-10-14', 'portrait', 1),
('1549906457340.jpg', 'tesztelek', 18, 'Orvieto', '', 'f/7.1', '1/250', 100, 10, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-06-27', 'landscape', 1),
('1549906533769.jpg', 'fercsivox', 18, 'Ciprusok a magasból', 'Orvieto, Olaszország', 'f/5.6', '1/200', 200, 10, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-06-26', 'landscape', 1),
('1549906615848.jpg', 'fercsivox', 18, 'Bagnoregio', 'Bagnoregio, Olaszország', 'f/9', '1/320', 100, 58, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-27', 'landscape', 1),
('1549906691958.jpg', 'fercsivox', 18, 'Palermo', '', 'f/6.3', '1/640', 200, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-07-14', 'landscape', 1),
('1549906812263.jpg', 'fercsivox', 16, 'Ősz a horgásztónál', 'Sződliget', 'f/7.1', '1/100', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-10-16', 'landscape', 1),
('1549906875668.jpg', 'fercsivox', 16, 'Horgászbódék', 'Sződliget', 'f/6.3', '1/60', 100, 55, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-10-16', 'landscape', 1),
('1549906908975.jpg', 'fercsivox', 16, 'Szakadékban', 'Holdvilág-árok', 'f/9', '1/40', 100, 10, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-11-05', 'landscape', 1),
('1549906960416.jpg', 'fercsivox', 16, 'Ragyogás', '', 'f/10', '1/60', 200, 92, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-11-04', 'portrait', 1),
('1549907082309.jpg', 'fercsivox', 18, '', 'Róma', 'f/7.1', '1/500', 200, 55, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-06-09', 'portrait', 1),
('1549907219662.jpg', 'fercsivox', 18, '', 'London', 'f/10', '1/200', 200, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-03-30', 'landscape', 1),
('1549984879625.jpg', 'S2R1000', 16, 'Naplemente Orvieto felett', '', 'f/10', '1/250', 200, 47, 'Canon EOS 1100D', 'EF24-105mm f/4L IS USM', '2017-06-26', 'landscape', 1),
('1549984966202.jpg', 'S2R1000', 16, 'Vertigo', 'Civita di Bagnoreggio', 'f/10', '1/500', 200, 10, 'Canon EOS 1100D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-06-27', 'landscape', 1),
('1549985173223.jpg', 'S2R1000', 18, 'Eltűnt idők tanúi', 'Valle dei Templi, Agrigento', 'f/9', '1/400', 200, 40, 'Canon EOS 1100D', 'EF-S17-55mm f/2.8 IS USM', '2016-07-22', 'landscape', 1),
('1550501359407.jpg', 'sanyig', 12, 'TejesKV', '', 'f/8', '1/100', 100, 50, 'Olympus E-3', '', '2012-02-18', 'square', 1),
('1550501412658.jpg', 'sanyig', 18, 'TetőAblak', '', 'f/5.6', '1/320', 100, 42, 'Olympus E-3', '', '2012-05-23', 'portrait', 1),
('1550501806149.jpg', 'sanyig', 1, 'füstös', '', 'f/19', '1/90', 100, 50, 'Olympus E-510', '', '2010-05-01', 'square', 1),
('1550501879764.jpg', 'sanyig', 17, 'Áztető', 'Bugyi', 'f/3.2', '1/160', 50, 23, 'Olympus C8080WZ', '', '2007-08-11', 'landscape', 1),
('1550502046574.jpg', 'sanyig', 19, 'rántott', '', 'f/3.5', '1/90', 100, 54, 'Olympus E-510', '', '2009-03-12', 'landscape', 1),
('1550502109397.jpg', 'sanyig', 19, 'muffin', 'Ez Edy muffinja. Eléggé barna és sportszelet volt a közepén... :)', 'f/4', '1/45', 400, 54, 'Olympus E-510', '', '2009-05-30', 'square', 1),
('1550502338335.jpg', 'sanyig', 16, 'TóPart', 'Velence, tópart', 'f/8', '1/180', 100, 14, 'Olympus E-510', '', '2009-05-30', 'landscape', 1),
('1550502571867.jpg', 'sanyig', 16, 'Tihany', 'Balaton, Tihany', 'f/9', '1/60', 125, 14, 'Olympus E-3', '', '2016-03-07', 'portrait', 1),
('1550502632516.jpg', 'sanyig', 16, 'moló', 'Tihany', 'f/6.3', '1/320', 100, 52, 'Olympus E-3', '', '2016-03-06', 'portrait', 1),
('1550502678462.jpg', 'sanyig', 19, 'Komp', 'Pihen a komp...', 'f/6.3', '1/320', 100, 29, 'Olympus E-3', '', '2016-03-06', 'landscape', 1),
('1550601878269.jpg', 'Bettuska', 17, 'TéliBalaton', '', 'f/1.7', '1/100', 40, 4, 'Samsung SM-J530F', '', '2018-12-20', 'landscape', 1),
('1550612929953.jpg', 'Mónika', 8, 'Korzika', '', 'f/1.7', '1/3104', 40, 4, 'Samsung SM-G930F', '', '2017-09-13', 'landscape', 1),
('1550613081526.jpg', 'Mónika', 16, 'Korzika', '', 'f/1.7', '1/210', 40, 4, 'Samsung SM-G930F', '', '2017-09-10', 'landscape', 1),
('1550613221577.jpg', 'Mónika', 3, 'Korzikai őrszemek', '', 'f/4', '1/200', 100, 25, 'Canon EOS 700D', '', '2015-09-15', 'landscape', 1),
('1550613448300.jpg', 'Mónika', 16, 'kikötő Korzikán', '', 'f/1.7', '1/1488', 40, 4, 'Samsung SM-G930F', '', '2017-09-15', 'wide', 1),
('1550833798201.jpg', 'sanyig', 4, 'Családi fotó', 'Ha erre nem kapok legalább 10 szivecskét, akkor megsértődök!', '', '16667000/1', 250, 4, 'Huawei CLT-L29', '', '2018-12-06', 'landscape', 1),
('1554487143387.jpg', 'fercsivox', 5, 'Lóg az eső lába', 'Bringázás közben kicsit elkapott az eső, de mikor elvonult ilyen csodás képeket tudtam lőni. :)', 'f/2.2', '1/50', 160, 5, 'Huawei EVA-L19', '', '2018-07-29', 'landscape', 1),
('1554487906785.jpg', 'fercsivox', 18, 'Károly-híd', 'Prága', 'f/8', '1/250', 400, 65, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-01-31', 'landscape', 1),
('1554488295365.jpg', 'fercsivox', 18, 'Kerengő', 'Basilica di San Zeno, Verona', 'f/9', '1/80', 100, 16, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2016-07-13', 'landscape', 1),
('1554488463681.jpg', 'fercsivox', 3, 'Római macskák', '', 'f/4', '1/200', 400, 105, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-06-25', 'landscape', 1),
('1554488723569.jpg', 'fercsivox', 18, 'A Colosseum alkonyatkor', 'Róma', 'f/7.1', '1/125', 400, 10, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2018-06-25', 'landscape', 1),
('1554489478858.jpg', 'fercsivox', 18, 'Teatro Antico és az Etna', 'Taormina', 'f/9', '1/160', 200, 13, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2015-07-18', 'landscape', 1),
('1554489553669.jpg', 'fercsivox', 18, 'Taormina', '', 'f/6.3', '1/200', 200, 40, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-07-18', 'landscape', 1),
('1554489861132.jpg', 'fercsivox', 18, 'Cefalù strand', 'Sicilia', 'f/9', '1/1000', 200, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-07-15', 'landscape', 1),
('1554490363980.jpg', 'fercsivox', 18, 'Csiga', 'Melk', 'f/7.1', '1/60', 3200, 10, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2012-06-25', 'portrait', 1),
('1554490657477.jpg', 'fercsivox', 16, 'Sínek a levegőben', 'Csarna-patak völgye, Börzsöny', 'f/11', '1/5', 200, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-10-14', 'portrait', 1),
('1554490712950.jpg', 'fercsivox', 16, 'Kisvasút a Börzsönyben', '', 'f/7.1', '1/50', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-10-22', 'landscape', 1),
('1554490897389.jpg', 'fercsivox', 16, 'Vitányvár', 'Vértes', 'f/10', '1/640', 200, 10, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-04-14', 'landscape', 1),
('1554491034955.jpg', 'fercsivox', 16, 'Gráciák bérce', 'Vértes', 'f/9', '1/250', 200, 16, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-04-14', 'landscape', 1),
('1554491208137.jpg', 'fercsivox', 3, 'Pillangók', '', 'f/5.6', '1/80', 100, 60, 'Canon EOS 600D', 'EF-S60mm f/2.8 Macro USM', '2011-05-14', 'landscape', 1),
('1554491411866.jpg', 'tesztelek', 3, 'Mú', 'Salföld', 'f/7.1', '1/400', 200, 187, 'Canon EOS 600D', 'EF-S55-250mm f/4-5.6 IS', '2011-06-25', 'landscape', 1),
('1554491520370.jpg', 'tesztelek', 17, 'Tavasz', 'Vácrátóti arborétum', 'f/6.3', '1/40', 100, 67, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2011-04-16', 'landscape', 1),
('1554491611745.jpg', 'tesztelek', 4, 'Virágos Veronában', '', 'f/4.5', '1/250', 200, 40, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2016-07-09', 'landscape', 1),
('1554491875409.jpg', 'tesztelek', 10, 'U2, 360° stage', '', 'f/6.3', '1/5', 800, 24, 'Canon EOS 450D', 'EF24-105mm f/4L IS USM', '2010-09-03', 'landscape', 1),
('1554492135802.jpg', 'tesztelek', 16, 'Felhők és kövek', 'Káli-medence', 'f/11', '1/125', 100, 24, 'Canon EOS 600D', '', '2011-06-25', 'landscape', 1),
('1554492240970.jpg', 'tesztelek', 16, 'Patak', 'Dera-patak völgye', 'f/8', '1/100', 800, 47, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-05-01', 'portrait', 1),
('1554492365724.jpg', 'tesztelek', 16, 'Őszi séta', '', 'f/9', '1/6', 100, 40, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-11-05', 'landscape', 1),
('1554492507848.jpg', 'tesztelek', 16, 'Fények', '', 'f/8', '1/80', 400, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-10-20', 'landscape', 1),
('1554492615331.jpg', 'tesztelek', 16, 'Szamaragolás', 'Salföld', 'f/7.1', '1/320', 100, 105, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2011-06-25', 'landscape', 1),
('1554492755602.jpg', 'tesztelek', 3, 'Smile', '', 'f/7.1', '1/20', 100, 60, 'Canon EOS 450D', 'EF-S60mm f/2.8 Macro USM', '2010-07-17', 'landscape', 1),
('1554492836625.jpg', 'tesztelek', 16, 'Ősz Milánóban', '', 'f/8', '1/125', 200, 50, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-11-22', 'portrait', 1),
('1554492969867.jpg', 'tesztelek', 4, 'Ciderek', '', 'f/4.5', '1/60', 1600, 80, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-09-22', 'landscape', 1),
('1554493096667.jpg', 'tesztelek', 18, 'Golden Eagle', 'London', 'f/5.6', '1/100', 200, 40, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-03-31', 'portrait', 1),
('1554493197952.jpg', 'tesztelek', 20, 'Február Londonban', '', 'f/9', '1/80', 400, 40, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-02-11', 'portrait', 1),
('1554493279996.jpg', 'tesztelek', 4, '', '', 'f/5', '1/1600', 200, 67, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-03-29', 'landscape', 1),
('1554493466381.jpg', 'tesztelek', 9, 'Köki', '', 'f/2.2', '1/250', 50, 5, 'Huawei EVA-L19', '', '2017-08-13', 'portrait', 1),
('1554493931376.jpg', 'tesztelek', 6, 'Brandenburgi kapu', 'Berlin', 'f/7.1', '1/15', 3200, 10, 'Canon EOS 600D', 'EF-S10-22mm f/3.5-4.5 USM', '2011-08-05', 'landscape', 1),
('1554494190841.jpg', 'tesztelek', 18, '', 'Ravenna', 'f/8', '1/400', 200, 16, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-06-30', 'landscape', 1),
('1554494417620.jpg', 'tesztelek', 18, '', 'Róma', 'f/9', '1/400', 100, 80, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-25', 'wide', 1),
('1554494467568.jpg', 'tesztelek', 9, '', 'Róma', 'f/4', '1/30', 3200, 40, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-07-21', 'portrait', 1),
('1554494636474.jpg', 'tesztelek', 20, '', 'Barcelona', 'f/5.6', '1/250', 200, 24, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2014-01-16', 'portrait', 1),
('1554494766566.jpg', 'tesztelek', 16, 'Fátyol', '', 'f/9', '1.6', 100, 45, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-05-01', 'landscape', 1),
('1554494900793.jpg', 'tesztelek', 10, 'High hopes', 'David Gilmour Veronában', 'f/4.5', '1/320', 1600, 65, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-09-14', 'landscape', 1),
('1554495007868.jpg', 'tesztelek', 17, 'Tavasz', 'Vácrátóti arborétum', 'f/7.1', '1/80', 100, 82, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2011-04-16', 'portrait', 1),
('1554495152187.jpg', 'tesztelek', 16, 'Őszi fények', '', 'f/6.3', '1/80', 200, 28, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-10-14', 'landscape', 1),
('1554495253192.jpg', 'tesztelek', 20, '', '', 'f/5', '1/400', 200, 85, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-05-23', 'portrait', 1),
('1554495304627.jpg', 'tesztelek', 4, '', '', 'f/4.5', '1/1600', 200, 65, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-05-23', 'landscape', 1),
('1554495412887.jpg', 'tesztelek', 18, 'Verona', '', 'f/5.6', '1/80', 200, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2016-07-09', 'landscape', 1),
('1554495490392.jpg', 'tesztelek', 18, 'Gondolák', 'Valence', 'f/5.6', '1/800', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-06-29', 'landscape', 1),
('1554495670257.jpg', 'tesztelek', 18, '', 'London', 'f/7.1', '1/160', 500, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-02-10', 'portrait', 1),
('1554495751534.jpg', 'fercsivox', 18, 'Tipikus London', '', 'f/6.3', '1/500', 320, 50, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-03-29', 'portrait', 1),
('1554495968454.jpg', 'fercsivox', 3, 'Csigaszerelem', '', 'f/8', '3/10', 800, 60, 'Canon EOS 450D', 'EF-S60mm f/2.8 Macro USM', '2010-07-31', 'landscape', 1),
('1554496112190.jpg', 'fercsivox', 3, '', '', 'f/4', '1/1000', 800, 280, 'Canon EOS 70D', 'EF200mm f/2.8L USM', '2016-01-25', 'landscape', 1),
('1554496208907.jpg', 'fercsivox', 16, 'Börzsöny', '', 'f/10', '1/100', 100, 73, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2016-10-28', 'landscape', 1),
('1554496717779.jpg', 'fercsivox', 16, '', '', 'f/5.6', '1/800', 400, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-10-14', 'portrait', 1),
('1554496885656.jpg', 'fercsivox', 20, 'Monreale', 'Szicília', 'f/9', '1/160', 100, 28, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-07-16', 'landscape', 1),
('1554497007526.jpg', 'fercsivox', 18, 'Cefalù', '', 'f/7.1', '1/500', 100, 35, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-07-15', 'portrait', 1),
('1554497047265.jpg', 'fercsivox', 20, '', 'Cefalù', 'f/7.1', '1/125', 100, 16, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2015-07-15', 'landscape', 1),
('1554497345453.jpg', 'fercsivox', 18, 'Ferdetornyok Bolognában', 'Ennyire persze nem ferdék, mint ahogy a nagylátószögű objektív perspektívájától. De valóban ferde mind a kettő!', 'f/8', '1/250', 100, 10, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-06-29', 'portrait', 1),
('1554497428238.jpg', 'fercsivox', 4, '', 'Orvieto', 'f/6.3', '1/160', 200, 17, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2017-06-27', 'landscape', 1),
('1554497546451.jpg', 'fercsivox', 4, '', '', 'f/5', '1/250', 100, 45, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2012-09-15', 'landscape', 1),
('1554497713162.jpg', 'fercsivox', 6, '', 'Brescia', 'f/4', '1/80', 3200, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-07-11', 'landscape', 1),
('1554497967590.jpg', 'fercsivox', 16, 'Holdvilág-árok', '', 'f/9', '1/10', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-11-05', 'landscape', 1),
('1554498092215.jpg', 'fercsivox', 17, 'Fasor', 'London', 'f/13', '1/80', 400, 75, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-03-31', 'portrait', 1),
('1554498173833.jpg', 'fercsivox', 3, 'Mókus', 'London', 'f/4.5', '1/200', 400, 105, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-09-23', 'landscape', 1),
('1554498367446.jpg', 'fercsivox', 4, '', 'Róma', 'f/5', '1/400', 400, 65, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-06-08', 'landscape', 1),
('1554498540704.jpg', 'fercsivox', 6, 'Pantheon', 'Piazza Della Rotonda, Roma', 'f/4.5', '1/50', 3200, 24, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2012-10-07', 'landscape', 1),
('1554498798303.jpg', 'fercsivox', 18, 'Perugia', '', 'f/8', '1/60', 1000, 102, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-28', 'portrait', 1),
('1554498950138.jpg', 'fercsivox', 9, 'Róma, szerelem', 'Kedvenc városom.', 'f/4.5', '1/125', 800, 105, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2014-06-08', 'wide', 1),
('1554499300153.jpg', 'fercsivox', 16, 'Látkép Taorminából', '', 'f/10', '1/100', 200, 32, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-07-18', 'landscape', 1),
('1554499623347.jpg', 'fercsivox', 20, '', '', 'f/8', '1/250', 200, 24, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-11-16', 'landscape', 1),
('1554500051971.jpg', 'fercsivox', 12, '', '', 'f/10', '1/6', 100, 60, 'Canon EOS 600D', 'EF-S60mm f/2.8 Macro USM', '2011-04-16', 'portrait', 1),
('1554500236678.jpg', 'fercsivox', 18, 'Viterbo', 'Olaszország', 'f/8', '1/200', 100, 96, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2018-06-27', 'portrait', 1),
('1554500422160.jpg', 'fercsivox', 16, 'Cefalù', '', 'f/8', '1/80', 100, 22, 'Canon EOS 70D', 'EF-S10-22mm f/3.5-4.5 USM', '2015-07-15', 'landscape', 1),
('1554500850214.jpg', 'fercsivox', 9, 'Alkonyat Cefalùban', '', 'f/5', '1/250', 200, 105, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2015-07-15', 'portrait', 1),
('1554501079280.jpg', 'fercsivox', 16, 'Sződligeti horgásztó', '', 'f/6.3', '1/100', 100, 50, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-10-16', 'landscape', 1),
('1554567513715.jpg', 'fercsivox', 17, '', '', 'f/13', '3/10', 200, 60, 'Canon EOS 600D', 'EF-S60mm f/2.8 Macro USM', '2011-05-12', 'portrait', 1),
('1554568352858.jpg', 'fercsivox', 18, 'Civita di Bagnoregio', '', 'f/7.1', '1/400', 100, 24, 'Canon EOS 70D', 'EF24-105mm f/4L IS USM', '2017-06-27', 'landscape', 1),
('1554569449923.jpg', 'fercsivox', 17, 'Ellenfény', '', 'f/5', '1/125', 200, 105, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-10-12', 'landscape', 1),
('1554569982266.jpg', 'fercsivox', 3, 'Breki', '', 'f/3.5', '1/25', NULL, 6, 'Canon PowerShot S2 IS', '', '2007-07-19', 'landscape', 1),
('1554570628503.jpg', 'fercsivox', 17, 'Gomba', '', 'f/5.6', '1/250', 100, 98, 'Canon EOS 600D', 'EF24-105mm f/4L IS USM', '2013-10-26', 'portrait', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

DROP TABLE IF EXISTS `kategoria`;
CREATE TABLE IF NOT EXISTS `kategoria` (
  `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kategoria` varchar(64) COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoria`
--

INSERT INTO `kategoria` (`id`, `kategoria`) VALUES
(1, 'Absztrakt'),
(2, 'Akt'),
(3, 'Állatfotó'),
(4, 'Csendélet'),
(5, 'Égbolt'),
(6, 'Éjszakai'),
(7, 'Életképek'),
(8, 'Elkapott pillanat'),
(9, 'Hangulatképek'),
(10, 'Koncert'),
(11, 'Madártávlat'),
(12, 'Makró'),
(13, 'Portré'),
(14, 'Sport'),
(15, 'Szociofotók'),
(16, 'Tájkép'),
(17, 'Természet'),
(18, 'Város, építészet'),
(19, 'egyéb'),
(20, 'Fekete-fehér');

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

--
-- A tábla adatainak kiíratása `kedvelesek`
--

INSERT INTO `kedvelesek` (`kedvelo`, `foto`) VALUES
('Bettuska', '1549753492751.jpg'),
('Bettuska', '1549790324891.jpg'),
('Bettuska', '1549790386919.jpg'),
('Bettuska', '1549791215454.jpg'),
('Bettuska', '1549906375631.jpg'),
('Bettuska', '1549906960416.jpg'),
('Bettuska', '1550501359407.jpg'),
('Bettuska', '1550501412658.jpg'),
('Bettuska', '1550501806149.jpg'),
('Bettuska', '1550501879764.jpg'),
('Bettuska', '1550502338335.jpg'),
('Bettuska', '1550502632516.jpg'),
('Bettuska', '1550502678462.jpg'),
('Bettuska', '1550613221577.jpg'),
('Bettuska', '1550613448300.jpg'),
('fercsivox', '1549747217266.jpg'),
('fercsivox', '1549748613840.jpg'),
('fercsivox', '1549753135718.jpg'),
('fercsivox', '1549753300165.jpg'),
('fercsivox', '1549754137145.jpg'),
('fercsivox', '1549789876566.jpg'),
('fercsivox', '1549790324891.jpg'),
('fercsivox', '1549790386919.jpg'),
('fercsivox', '1549790926877.jpg'),
('fercsivox', '1549791215454.jpg'),
('fercsivox', '1549904760367.jpg'),
('fercsivox', '1549904994857.jpg'),
('fercsivox', '1549906312669.jpg'),
('fercsivox', '1549906457340.jpg'),
('fercsivox', '1549906533769.jpg'),
('fercsivox', '1549906615848.jpg'),
('fercsivox', '1549906691958.jpg'),
('fercsivox', '1549906812263.jpg'),
('fercsivox', '1549906875668.jpg'),
('fercsivox', '1549906908975.jpg'),
('fercsivox', '1549907082309.jpg'),
('fercsivox', '1550501412658.jpg'),
('fercsivox', '1550501806149.jpg'),
('fercsivox', '1550502338335.jpg'),
('fercsivox', '1550502632516.jpg'),
('fercsivox', '1550601878269.jpg'),
('fercsivox', '1550833798201.jpg'),
('fercsivox', '1554487906785.jpg'),
('fercsivox', '1554488463681.jpg'),
('fercsivox', '1554488723569.jpg'),
('fercsivox', '1554490657477.jpg'),
('fercsivox', '1554491208137.jpg'),
('fercsivox', '1554491411866.jpg'),
('fercsivox', '1554491875409.jpg'),
('fercsivox', '1554492365724.jpg'),
('fercsivox', '1554492969867.jpg'),
('fercsivox', '1554493197952.jpg'),
('fercsivox', '1554493279996.jpg'),
('fercsivox', '1554494467568.jpg'),
('fercsivox', '1554494636474.jpg'),
('fercsivox', '1554494766566.jpg'),
('fercsivox', '1554494900793.jpg'),
('fercsivox', '1554496885656.jpg'),
('fercsivox', '1554497047265.jpg'),
('fercsivox', '1554498367446.jpg'),
('fercsivox', '1554498798303.jpg'),
('fercsivox', '1554498950138.jpg'),
('fercsivox', '1554499300153.jpg'),
('fercsivox', '1554500850214.jpg'),
('lajkololajos', '1549747044811.jpg'),
('lajkololajos', '1549747217266.jpg'),
('lajkololajos', '1549747299792.jpg'),
('lajkololajos', '1549747485106.jpg'),
('lajkololajos', '1549747865280.jpg'),
('lajkololajos', '1549748137936.jpg'),
('lajkololajos', '1549748270437.jpg'),
('lajkololajos', '1549748587573.jpg'),
('lajkololajos', '1549748613840.jpg'),
('lajkololajos', '1549749227716.jpg'),
('lajkololajos', '1549749453393.jpg'),
('lajkololajos', '1549749714346.jpg'),
('lajkololajos', '1549749883310.jpg'),
('lajkololajos', '1549750054531.jpg'),
('lajkololajos', '1549750237876.jpg'),
('lajkololajos', '1549753135718.jpg'),
('lajkololajos', '1549753179611.jpg'),
('lajkololajos', '1549753300165.jpg'),
('lajkololajos', '1549753439673.jpg'),
('lajkololajos', '1549753626598.jpg'),
('lajkololajos', '1549753698592.jpg'),
('lajkololajos', '1549753765546.jpg'),
('lajkololajos', '1549753970845.jpg'),
('lajkololajos', '1549754137145.jpg'),
('lajkololajos', '1549789330452.jpg'),
('lajkololajos', '1549789579438.jpg'),
('lajkololajos', '1549789876566.jpg'),
('lajkololajos', '1549790324891.jpg'),
('lajkololajos', '1549790835450.jpg'),
('lajkololajos', '1549791115122.jpg'),
('lajkololajos', '1549791215454.jpg'),
('lajkololajos', '1549791282253.jpg'),
('lajkololajos', '1549904760367.jpg'),
('lajkololajos', '1549904863369.jpg'),
('lajkololajos', '1549904994857.jpg'),
('lajkololajos', '1549905053121.jpg'),
('lajkololajos', '1549905249380.jpg'),
('lajkololajos', '1549906375631.jpg'),
('lajkololajos', '1549906533769.jpg'),
('lajkololajos', '1549906615848.jpg'),
('lajkololajos', '1549906691958.jpg'),
('lajkololajos', '1549906875668.jpg'),
('lajkololajos', '1549906908975.jpg'),
('lajkololajos', '1549906960416.jpg'),
('lajkololajos', '1549907219662.jpg'),
('lajkololajos', '1554487143387.jpg'),
('lajkololajos', '1554487906785.jpg'),
('lajkololajos', '1554488463681.jpg'),
('lajkololajos', '1554488723569.jpg'),
('lajkololajos', '1554489861132.jpg'),
('lajkololajos', '1554490657477.jpg'),
('lajkololajos', '1554490712950.jpg'),
('lajkololajos', '1554491208137.jpg'),
('lajkololajos', '1554491875409.jpg'),
('lajkololajos', '1554492135802.jpg'),
('lajkololajos', '1554492365724.jpg'),
('lajkololajos', '1554492507848.jpg'),
('lajkololajos', '1554492615331.jpg'),
('lajkololajos', '1554492836625.jpg'),
('lajkololajos', '1554492969867.jpg'),
('lajkololajos', '1554493096667.jpg'),
('lajkololajos', '1554493197952.jpg'),
('lajkololajos', '1554493279996.jpg'),
('lajkololajos', '1554493466381.jpg'),
('lajkololajos', '1554494190841.jpg'),
('lajkololajos', '1554494417620.jpg'),
('lajkololajos', '1554494467568.jpg'),
('lajkololajos', '1554494636474.jpg'),
('lajkololajos', '1554494766566.jpg'),
('lajkololajos', '1554494900793.jpg'),
('lajkololajos', '1554495007868.jpg'),
('lajkololajos', '1554495152187.jpg'),
('lajkololajos', '1554495412887.jpg'),
('lajkololajos', '1554495490392.jpg'),
('lajkololajos', '1554495670257.jpg'),
('lajkololajos', '1554496208907.jpg'),
('lajkololajos', '1554496717779.jpg'),
('lajkololajos', '1554496885656.jpg'),
('lajkololajos', '1554497007526.jpg'),
('lajkololajos', '1554497047265.jpg'),
('lajkololajos', '1554497428238.jpg'),
('lajkololajos', '1554497546451.jpg'),
('lajkololajos', '1554497967590.jpg'),
('lajkololajos', '1554498367446.jpg'),
('lajkololajos', '1554498798303.jpg'),
('lajkololajos', '1554498950138.jpg'),
('lajkololajos', '1554499300153.jpg'),
('lajkololajos', '1554499623347.jpg'),
('lajkololajos', '1554500422160.jpg'),
('lajkololajos', '1554500850214.jpg'),
('lajkololajos', '1554501079280.jpg'),
('lajkololajos', '1554568352858.jpg'),
('lajkololajos', '1554569449923.jpg'),
('lajkololajos', '1554570628503.jpg'),
('Mónika', '1549790386919.jpg'),
('Mónika', '1549791215454.jpg'),
('Mónika', '1549904994857.jpg'),
('Mónika', '1549905053121.jpg'),
('Mónika', '1549984879625.jpg'),
('Mónika', '1550501806149.jpg'),
('Mónika', '1550501879764.jpg'),
('sanyig', '1549753765546.jpg'),
('sanyig', '1549907219662.jpg'),
('sanyig', '1549984966202.jpg'),
('sanyig', '1550601878269.jpg'),
('sanyig', '1550612929953.jpg'),
('sanyig', '1550613081526.jpg'),
('tesztelek', '1549747812750.jpg'),
('tesztelek', '1549748587573.jpg'),
('tesztelek', '1549753135718.jpg'),
('tesztelek', '1549753179611.jpg'),
('tesztelek', '1549753300165.jpg'),
('tesztelek', '1549753626598.jpg'),
('tesztelek', '1549753970845.jpg'),
('tesztelek', '1549754137145.jpg'),
('tesztelek', '1549789437348.jpg'),
('tesztelek', '1549789579438.jpg'),
('tesztelek', '1549789776928.jpg'),
('tesztelek', '1549789876566.jpg'),
('tesztelek', '1549791115122.jpg'),
('tesztelek', '1549791215454.jpg'),
('tesztelek', '1549904994857.jpg'),
('tesztelek', '1549905053121.jpg'),
('tesztelek', '1549905249380.jpg'),
('tesztelek', '1549906375631.jpg'),
('tesztelek', '1549906533769.jpg'),
('tesztelek', '1549906615848.jpg'),
('tesztelek', '1549906691958.jpg'),
('tesztelek', '1549906875668.jpg'),
('tesztelek', '1549906908975.jpg'),
('tesztelek', '1549906960416.jpg'),
('tesztelek', '1549907082309.jpg'),
('tesztelek', '1549907219662.jpg'),
('tesztelek', '1549984966202.jpg'),
('tesztelek', '1550833798201.jpg'),
('tesztelek', '1554487143387.jpg'),
('tesztelek', '1554487906785.jpg'),
('tesztelek', '1554488295365.jpg'),
('tesztelek', '1554488463681.jpg'),
('tesztelek', '1554488723569.jpg'),
('tesztelek', '1554489478858.jpg'),
('tesztelek', '1554489861132.jpg'),
('tesztelek', '1554490363980.jpg'),
('tesztelek', '1554490657477.jpg'),
('tesztelek', '1554490712950.jpg'),
('tesztelek', '1554490897389.jpg'),
('tesztelek', '1554491208137.jpg'),
('tesztelek', '1554495751534.jpg'),
('tesztelek', '1554496112190.jpg'),
('tesztelek', '1554496208907.jpg'),
('tesztelek', '1554496717779.jpg'),
('tesztelek', '1554496885656.jpg'),
('tesztelek', '1554497047265.jpg'),
('tesztelek', '1554497345453.jpg'),
('tesztelek', '1554497428238.jpg'),
('tesztelek', '1554497713162.jpg'),
('tesztelek', '1554497967590.jpg'),
('tesztelek', '1554498092215.jpg'),
('tesztelek', '1554498173833.jpg'),
('tesztelek', '1554498367446.jpg'),
('tesztelek', '1554498540704.jpg'),
('tesztelek', '1554498798303.jpg'),
('tesztelek', '1554498950138.jpg'),
('tesztelek', '1554499300153.jpg'),
('tesztelek', '1554500051971.jpg'),
('tesztelek', '1554500850214.jpg'),
('tesztelek', '1554501079280.jpg'),
('tesztelek', '1554567513715.jpg'),
('tesztelek', '1554568352858.jpg'),
('tesztelek', '1554569449923.jpg'),
('tesztelek', '1554569982266.jpg'),
('tesztelek', '1554570628503.jpg');

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

--
-- A tábla adatainak kiíratása `kedvencek`
--

INSERT INTO `kedvencek` (`jelolo`, `filename`) VALUES
('fercsivox', '1549789876566.jpg'),
('fercsivox', '1549790386919.jpg'),
('fercsivox', '1549790700726.jpg'),
('fercsivox', '1549790835450.jpg'),
('fercsivox', '1549791115122.jpg'),
('fercsivox', '1549791282253.jpg'),
('fercsivox', '1549904994857.jpg'),
('fercsivox', '1549905249380.jpg'),
('fercsivox', '1549906312669.jpg'),
('fercsivox', '1549906375631.jpg'),
('fercsivox', '1549906533769.jpg'),
('fercsivox', '1549906615848.jpg'),
('fercsivox', '1549906691958.jpg'),
('fercsivox', '1549906875668.jpg'),
('fercsivox', '1549906908975.jpg'),
('fercsivox', '1549907219662.jpg'),
('fercsivox', '1550501359407.jpg'),
('fercsivox', '1550501806149.jpg'),
('fercsivox', '1550501879764.jpg'),
('fercsivox', '1550502678462.jpg'),
('fercsivox', '1550613448300.jpg'),
('fercsivox', '1554490657477.jpg'),
('fercsivox', '1554490712950.jpg'),
('fercsivox', '1554491875409.jpg'),
('fercsivox', '1554493197952.jpg'),
('fercsivox', '1554495152187.jpg'),
('fercsivox', '1554499300153.jpg'),
('lajkololajos', '1549747217266.jpg'),
('lajkololajos', '1549747299792.jpg'),
('lajkololajos', '1549748206855.jpg'),
('lajkololajos', '1549748270437.jpg'),
('lajkololajos', '1549748613840.jpg'),
('lajkololajos', '1549749227716.jpg'),
('lajkololajos', '1549749714346.jpg'),
('lajkololajos', '1549750054531.jpg'),
('lajkololajos', '1549753135718.jpg'),
('lajkololajos', '1549753300165.jpg'),
('lajkololajos', '1549753439673.jpg'),
('lajkololajos', '1549753626598.jpg'),
('lajkololajos', '1549753698592.jpg'),
('lajkololajos', '1549754137145.jpg'),
('lajkololajos', '1549789330452.jpg'),
('lajkololajos', '1549789579438.jpg'),
('lajkololajos', '1549789876566.jpg'),
('lajkololajos', '1549790324891.jpg'),
('lajkololajos', '1549790386919.jpg'),
('lajkololajos', '1549904760367.jpg'),
('lajkololajos', '1549904994857.jpg'),
('lajkololajos', '1549906533769.jpg'),
('lajkololajos', '1549906615848.jpg'),
('lajkololajos', '1549906691958.jpg'),
('lajkololajos', '1549906875668.jpg'),
('lajkololajos', '1549906908975.jpg'),
('lajkololajos', '1549906960416.jpg'),
('lajkololajos', '1554487143387.jpg'),
('lajkololajos', '1554488463681.jpg'),
('lajkololajos', '1554488723569.jpg'),
('lajkololajos', '1554489478858.jpg'),
('lajkololajos', '1554490363980.jpg'),
('lajkololajos', '1554490712950.jpg'),
('lajkololajos', '1554491208137.jpg'),
('lajkololajos', '1554491875409.jpg'),
('lajkololajos', '1554492365724.jpg'),
('lajkololajos', '1554492507848.jpg'),
('lajkololajos', '1554492615331.jpg'),
('lajkololajos', '1554492969867.jpg'),
('lajkololajos', '1554493197952.jpg'),
('lajkololajos', '1554493466381.jpg'),
('lajkololajos', '1554494190841.jpg'),
('lajkololajos', '1554494766566.jpg'),
('lajkololajos', '1554495152187.jpg'),
('lajkololajos', '1554495490392.jpg'),
('lajkololajos', '1554496112190.jpg'),
('lajkololajos', '1554496208907.jpg'),
('lajkololajos', '1554496885656.jpg'),
('lajkololajos', '1554497007526.jpg'),
('lajkololajos', '1554497047265.jpg'),
('lajkololajos', '1554497345453.jpg'),
('lajkololajos', '1554497713162.jpg'),
('lajkololajos', '1554498173833.jpg'),
('lajkololajos', '1554498367446.jpg'),
('lajkololajos', '1554498540704.jpg'),
('lajkololajos', '1554498950138.jpg'),
('lajkololajos', '1554499300153.jpg'),
('lajkololajos', '1554500850214.jpg'),
('lajkololajos', '1554568352858.jpg'),
('lajkololajos', '1554569449923.jpg'),
('lajkololajos', '1554569982266.jpg'),
('Mónika', '1549753765546.jpg'),
('Mónika', '1549753970845.jpg'),
('Mónika', '1549754137145.jpg'),
('Mónika', '1549789579438.jpg'),
('Mónika', '1549791115122.jpg'),
('Mónika', '1549791282253.jpg'),
('Mónika', '1549905249380.jpg'),
('Mónika', '1549905351728.jpg'),
('Mónika', '1549906312669.jpg'),
('Mónika', '1549906375631.jpg'),
('Mónika', '1549906533769.jpg'),
('Mónika', '1549906615848.jpg'),
('Mónika', '1549906691958.jpg'),
('Mónika', '1549906812263.jpg'),
('Mónika', '1549906875668.jpg'),
('Mónika', '1549906908975.jpg'),
('Mónika', '1549906960416.jpg'),
('Mónika', '1549907082309.jpg'),
('Mónika', '1549907219662.jpg'),
('Mónika', '1550501359407.jpg'),
('Mónika', '1550501412658.jpg'),
('Mónika', '1550502338335.jpg'),
('Mónika', '1550601878269.jpg'),
('sanyig', '1550501359407.jpg'),
('sanyig', '1550502338335.jpg'),
('sanyig', '1550502571867.jpg'),
('sanyig', '1550833798201.jpg'),
('tesztelek', '1549754137145.jpg'),
('tesztelek', '1549789330452.jpg'),
('tesztelek', '1549789437348.jpg'),
('tesztelek', '1549789876566.jpg'),
('tesztelek', '1549789995845.jpg'),
('tesztelek', '1549791115122.jpg'),
('tesztelek', '1549904760367.jpg'),
('tesztelek', '1549904994857.jpg'),
('tesztelek', '1549906375631.jpg'),
('tesztelek', '1549906533769.jpg'),
('tesztelek', '1549906875668.jpg'),
('tesztelek', '1549906960416.jpg'),
('tesztelek', '1549907082309.jpg'),
('tesztelek', '1549984966202.jpg'),
('tesztelek', '1554488463681.jpg'),
('tesztelek', '1554488723569.jpg'),
('tesztelek', '1554489478858.jpg'),
('tesztelek', '1554489861132.jpg'),
('tesztelek', '1554490363980.jpg'),
('tesztelek', '1554491208137.jpg'),
('tesztelek', '1554495751534.jpg'),
('tesztelek', '1554496112190.jpg'),
('tesztelek', '1554496885656.jpg'),
('tesztelek', '1554497007526.jpg'),
('tesztelek', '1554497047265.jpg'),
('tesztelek', '1554497967590.jpg'),
('tesztelek', '1554498173833.jpg'),
('tesztelek', '1554498367446.jpg'),
('tesztelek', '1554498798303.jpg'),
('tesztelek', '1554498950138.jpg'),
('tesztelek', '1554499300153.jpg'),
('tesztelek', '1554500850214.jpg'),
('tesztelek', '1554501079280.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kommentek`
--

INSERT INTO `kommentek` (`id`, `ertekelo`, `kep`, `komment`, `datum`) VALUES
(86, 'sanyig', '1550601878269.jpg', 'Fantasztikus ????', '2019-02-19 19:46:18'),
(87, 'sanyig', '1550601878269.jpg', 'Természetesen az!', '2019-02-19 19:47:25'),
(88, 'sanyig', '1549984966202.jpg', 'Micsoda perspektíva!', '2019-02-21 13:59:46'),
(89, 'fercsivox', '1550833798201.jpg', 'Adtam rá! :P', '2019-02-23 15:43:29'),
(96, 'sanyig', '1550833798201.jpg', '...akkor most megsértődtem (1szivecske) :)\r\nAmúgy jó az oldal, úgy tűnik, minden működik. Ügyi vagy!', '2019-03-06 09:27:00'),
(97, 'sanyig', '1550833798201.jpg', 'Hoppá!\r\nEntert nyomva jött egy kis meglepi {rn}', '2019-03-06 09:28:09'),
(100, 'fercsivox', '1550833798201.jpg', 'Milyen meglepi? Mire gondolsz? \r\n1 szivecske, azt is én adtam, a többiek úgy látszik nem nézik... Köszi amúgy! :)', '2019-03-07 09:04:29'),
(101, 'fercsivox', '1550833798201.jpg', 'Ja, azt hiszem tudom mire gondoltál. Megnézem.', '2019-03-07 09:06:13'),
(102, 'fercsivox', '1550833798201.jpg', 'Tesztelem. Most jön egy sortörés<br>Nyomtam egy entert, ez egy másik sor.', '2019-03-07 11:15:08'),
(103, 'tesztelek', '1550833798201.jpg', 'Én is adtam egy szivecskét! :D', '2019-03-07 12:47:20'),
(104, 'tesztelek', '1549984966202.jpg', 'Ja, és innen tovább már nem mert menni aki készítette, csak négykézláb, becsukott szemmel. :P :D', '2019-03-07 12:50:33'),
(105, 'tesztelek', '1554497047265.jpg', 'Ez valami nagyon régi kép lehet. :P', '2019-04-06 17:58:47'),
(106, 'tesztelek', '1554498950138.jpg', 'Hű, micsoda hangulat!', '2019-04-06 18:00:12'),
(107, 'tesztelek', '1549906533769.jpg', 'Szédítő! :)', '2019-04-06 18:01:14'),
(108, 'tesztelek', '1549754137145.jpg', 'Ez \"elkapott pillanat\" is lehetne.', '2019-04-06 18:02:34'),
(109, 'tesztelek', '1549789876566.jpg', 'Jól néz ki!', '2019-04-06 18:04:32'),
(110, 'tesztelek', '1554500850214.jpg', 'Nagyon hangulatos.', '2019-04-06 18:05:39'),
(111, 'tesztelek', '1554501079280.jpg', 'Mesebeli', '2019-04-06 18:05:57');

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
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`userid`, `jelszo`, `email`, `nev`, `pkep`, `rolam`, `cam`, `lens`) VALUES
('Bettuska', 'e9c0f979ddd889573a2dfc305dcab132180a0c3c', 'freezand@gmail.com', 'Bettuska', 'Bettuska.jpg', '', '', ''),
('fercsivox', '10175103924d05533cd5f1057fa95874ec5ae0b3', 'reg@ferefoto.hu', 'Szatmári Ferenc', 'fercsivox.jpg', 'Magamról pár sor', 'Canon EOS 70D', 'Canon 24-105 F4 L'),
('lajkololajos', '10175103924d05533cd5f1057fa95874ec5ae0b3', 'lajos.lajkolo@gmail.com', 'Lájkoló Lajos', 'lajkololajos.jpg', 'Csak lájkolok :)', 'Canon EOS 6D', 'Canon 24-105 F4 L'),
('Mónika', '978c5153d26b6c437f37e8f8bb4205c57fbe3dbf', 'fischermona@gmail.com', 'Fischer Mónika', 'Monika.jpg', '', '', ''),
('S2R1000', 'd7ced50649b1ecba04ca20feaae5cc006dc164d5', 'platinasarkany@freemail.hu', 'Viki', 'S2R1000.jpg', '', '', ''),
('sanyig', 'b7b7619157451c587e1d0e11a9e1b505b021c6fd', 'sanyig@freestart.hu', 'Sanyig', 'avatar.png', '', 'Olympus E-3', ''),
('tesztelek', '10175103924d05533cd5f1057fa95874ec5ae0b3', 'info@ferefoto.hu', 'Teszt Elek', 'tesztelek.jpg', '', 'Canon EOS 800D', 'Canon 24-105 F4 L');

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
