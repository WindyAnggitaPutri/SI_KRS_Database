-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2025 at 03:07 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_krs`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int NOT NULL,
  `nama_kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`) VALUES
(1, '2A'),
(3, '2B'),
(5, '4D'),
(13, '1C'),
(21, '1A'),
(22, '3C');

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id_krs` int NOT NULL,
  `npm` varchar(30) NOT NULL,
  `kode_matkul` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`id_krs`, `npm`, `kode_matkul`) VALUES
(42, '230102057', '01240'),
(40, '230102057', '04240'),
(51, '230102058', '01240'),
(24, '230102072', '04321'),
(47, '230202059', '04240'),
(50, '230202059', '05240'),
(32, '230302065', '02240'),
(46, '230302065', '2018'),
(48, '230302066', '03240');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` varchar(30) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `id_kelas` int NOT NULL,
  `kode_prodi` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama_mahasiswa`, `id_kelas`, `kode_prodi`) VALUES
('230102057', 'Devi Aryanii', 1, 'D3TI'),
('230102058', 'mona', 3, 'D4RPL'),
('230102072', 'Windy Anggita', 1, 'D3TI'),
('230202059', 'Eka Wulan Yuniarsih', 1, 'D3TI'),
('230302065', 'dimas', 3, 'D3TE'),
('230302066', 'Luthfiana Putri Salsabila', 3, 'D3TI');

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `delete_user_mahasiswa` AFTER DELETE ON `mahasiswa` FOR EACH ROW DELETE FROM User WHERE username = OLD.npm
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_user_mahasiswa` AFTER INSERT ON `mahasiswa` FOR EACH ROW INSERT INTO User (username, password, status)
VALUES (NEW.npm, '1234', 'mahasiswa')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `kode_matkul` char(5) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `sks` varchar(5) NOT NULL,
  `semester` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`kode_matkul`, `nama_matkul`, `sks`, `semester`) VALUES
('01240', 'Struktur Data', '8', '2'),
('02240', 'Statistika', '3', '1'),
('03240', 'Agama', '2', '4'),
('04240', 'Basis Data', '8', '5'),
('04321', 'PPM', '8', '4'),
('05240', 'K3', '2', '4'),
('2018', 'Sistem Operasi', '8', '1');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `kode_prodi` char(8) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`kode_prodi`, `nama_prodi`) VALUES
('D3ET', 'Diploma III Energi Terbarukan'),
('D3TE', 'Diploma III Teknik Elektronika'),
('D3TI', 'Diploma III Teknik Informatika'),
('D3TK', 'Diploma III - Teknik Kimia'),
('D3TL', 'Diploma III Teknik Listrik'),
('D3TM', 'Diploma III Teknik Mesin'),
('D4RKS', 'Sarjana Terapan Rekayasa Keamanan Siber'),
('D4RPL', 'D4-Rekayasa Perangkat Lunak'),
('D4TPPL', 'Sarjana Terapan Teknik Pengendalian Pencemaran Lingkungan');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `status`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, '230102072', '1234', 'mahasiswa'),
(4, '230102058', '1234', 'mahasiswa'),
(5, '230202059', '1234', 'mahasiswa'),
(8, '230302065', '1234', 'mahasiswa'),
(18, '2301020003', '1234', 'mahasiswa'),
(22, '230102057', '1234', 'mahasiswa'),
(23, '230102021', '1234', 'mahasiswa'),
(31, '230202059', '1234', 'mahasiswa'),
(32, '230302066', '1234', 'mahasiswa');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_daftar_mahasiswa`
-- (See below for the actual view)
--
CREATE TABLE `v_daftar_mahasiswa` (
`npm` varchar(30)
,`nama_mahasiswa` varchar(50)
,`nama_kelas` varchar(10)
,`nama_prodi` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_krs`
-- (See below for the actual view)
--
CREATE TABLE `v_krs` (
`id_krs` int
,`npm` varchar(30)
,`nama_mahasiswa` varchar(50)
,`nama_kelas` varchar(10)
,`nama_prodi` varchar(100)
,`nama_matkul` varchar(50)
,`sks` varchar(5)
,`semester` char(1)
);

-- --------------------------------------------------------

--
-- Structure for view `v_daftar_mahasiswa`
--
DROP TABLE IF EXISTS `v_daftar_mahasiswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_daftar_mahasiswa`  AS SELECT `mahasiswa`.`npm` AS `npm`, `mahasiswa`.`nama_mahasiswa` AS `nama_mahasiswa`, `kelas`.`nama_kelas` AS `nama_kelas`, `prodi`.`nama_prodi` AS `nama_prodi` FROM ((`mahasiswa` join `kelas` on((`mahasiswa`.`id_kelas` = `kelas`.`id_kelas`))) join `prodi` on((`mahasiswa`.`kode_prodi` = `prodi`.`kode_prodi`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_krs`
--
DROP TABLE IF EXISTS `v_krs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_krs`  AS SELECT `krs`.`id_krs` AS `id_krs`, `krs`.`npm` AS `npm`, `mahasiswa`.`nama_mahasiswa` AS `nama_mahasiswa`, `kelas`.`nama_kelas` AS `nama_kelas`, `prodi`.`nama_prodi` AS `nama_prodi`, `matkul`.`nama_matkul` AS `nama_matkul`, `matkul`.`sks` AS `sks`, `matkul`.`semester` AS `semester` FROM ((((`krs` join `mahasiswa` on((`krs`.`npm` = `mahasiswa`.`npm`))) join `kelas` on((`mahasiswa`.`id_kelas` = `kelas`.`id_kelas`))) join `matkul` on((`krs`.`kode_matkul` = `matkul`.`kode_matkul`))) join `prodi` on((`mahasiswa`.`kode_prodi` = `prodi`.`kode_prodi`))) ORDER BY `mahasiswa`.`nama_mahasiswa` ASC, `matkul`.`nama_matkul` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id_krs`),
  ADD UNIQUE KEY `unique_krs` (`npm`,`kode_matkul`),
  ADD KEY `kode_matkul` (`kode_matkul`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `kode_prodi` (`kode_prodi`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`kode_matkul`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`kode_prodi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `id_krs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi` (`kode_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
