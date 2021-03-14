-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 10, 2020 at 02:26 PM
-- Server version: 10.4.12-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iut`
--

-- --------------------------------------------------------

--
-- Table structure for table `casUsers`
--

CREATE TABLE `casUsers` (
  `pkey` int(10) UNSIGNED NOT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `passwd` varchar(50) DEFAULT NULL,
  `pwd2` varchar(100) DEFAULT NULL,
  `expired` int(11) NOT NULL DEFAULT 0,
  `disabeled` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `casUsers`
--

INSERT INTO `casUsers` (`pkey`, `prenom`, `nom`, `user`, `passwd`, `pwd2`, `expired`, `disabeled`) VALUES
(1, 'Yoa', 'MARTIN', 'mart1', 'Yo920', NULL, 0, 0),
(13, 'Eloi', 'LEFEBVRE', 'lefe13', 'El669', NULL, 0, 0),
(16, 'Mathis', 'DAVID', 'davi16', 'Ma585', NULL, 0, 0),
(26, 'Frederic', 'VINCENT', 'vinc26', 'Fr918', NULL, 0, 0),
(30, 'Camille', 'ANDRE', 'andr30', 'Ca834', NULL, 0, 0),
(35, 'Elsa', 'GARNIER', 'garn35', 'El417', NULL, 0, 0),
(41, 'Agenor', 'PERRIN', 'perr41', 'Ag584', NULL, 0, 0),
(43, 'Oscar', 'CLEMENT', 'clem43', 'Os668', NULL, 0, 0),
(53, 'Hortense', 'DENIS', 'deni53', 'Ho591', NULL, 0, 0),
(88, 'Gaston', 'OLIVIER', 'oliv88', 'Ga952', NULL, 0, 0),
(98, 'Diogene', 'LECOMTE', 'leco98', 'Di986', NULL, 0, 0),
(1002, 'Ambroisine', 'BOYER', NULL, 'Am74', NULL, 0, 0),
(1007, 'Lauren', 'ROUSSEL', NULL, 'La412', NULL, 0, 0),
(1035, 'Eugene', 'MARTY', NULL, 'Eu840', NULL, 0, 0),
(1046, 'Rebecca', 'LANGLOIS', NULL, 'Re966', NULL, 0, 0),
(1086, 'Alberade', 'DEVAUX', NULL, 'Al308', NULL, 0, 0),
(1109, 'Felicie', 'LECONTE', NULL, 'Fé642', NULL, 0, 0),
(1113, 'Pulcherie', 'CHAUVEAU', NULL, 'Pu288', NULL, 0, 0),
(1116, 'Anastasiane', 'DELAGE', NULL, 'An514', NULL, 0, 0),
(1135, 'Anaelle', 'GRAND', NULL, 'An707', NULL, 0, 0),
(1146, 'Suzon', 'LAVAL', NULL, 'Su993', NULL, 0, 0),
(1152, 'Arolde', 'MARC', NULL, 'Ar846', NULL, 0, 0),
(1154, 'Tonnin', 'LE ROY', NULL, 'To251', NULL, 0, 0),
(1164, 'Audeline', 'CHAMPION', NULL, 'Au715', NULL, 0, 0),
(1172, 'Cyriaque', 'BINET', NULL, 'Cy825', NULL, 0, 0),
(1177, 'Aubry', 'THIEBAUT', NULL, 'Au981', NULL, 0, 0),
(1182, 'Gonzague', 'SARRAZIN', NULL, 'Go431', NULL, 0, 0),
(1184, 'Guilhemine', 'JOUVE', NULL, 'Gu210', NULL, 0, 0),
(1212, 'Jeanne', 'BAUDET', NULL, 'Je759', NULL, 0, 0),
(1244, 'Celia', 'DUBOURG', NULL, 'Ce164', NULL, 0, 0),
(1253, 'Anastase', 'MARTEAU', NULL, 'An542', NULL, 0, 0),
(1290, 'Cassien', 'LOISEL', NULL, 'Ca221', NULL, 0, 0),
(1322, 'Axeline', 'CLAVERIE', NULL, 'Ax481', NULL, 0, 0),
(1330, 'Caroline', 'HILAIRE', NULL, 'Ca740', NULL, 0, 0),
(1332, 'Gonzague', 'PEYRE', NULL, 'Go258', NULL, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `casUsers`
--
ALTER TABLE `casUsers`
  ADD PRIMARY KEY (`pkey`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `casUsers`
--
ALTER TABLE `casUsers`
  MODIFY `pkey` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1391;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
