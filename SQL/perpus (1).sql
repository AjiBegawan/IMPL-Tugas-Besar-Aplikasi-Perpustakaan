-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2021 at 05:26 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `ID_Anggota` varchar(10) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telp` int(12) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `ID_Buku` varchar(5) NOT NULL,
  `Judul_Buku` varchar(50) NOT NULL,
  `Penulis` varchar(50) NOT NULL,
  `Penerbit` varchar(50) NOT NULL,
  `Kategori` varchar(50) NOT NULL,
  `Kuantiti` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_Peminjaman` varchar(5) NOT NULL,
  `ID_Buku` varchar(5) NOT NULL,
  `ID_Member` varchar(8) NOT NULL,
  `Tgl_Peminjaman` date NOT NULL,
  `Deadline_Pinjam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `ID_Pengembalian` varchar(10) NOT NULL,
  `ID_Peminjaman` varchar(5) NOT NULL,
  `ID_Buku` varchar(10) NOT NULL,
  `ID_Anggota` varchar(10) NOT NULL,
  `ID_Petugas` varchar(10) NOT NULL,
  `Deadline_Pinjam` date NOT NULL,
  `Tgl_Pengembalian` date NOT NULL,
  `Denda` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `ID_Petugas` varchar(10) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telp` int(12) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_Anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ID_Buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_Peminjaman`),
  ADD KEY `ID_Buku` (`ID_Buku`),
  ADD KEY `ID_Member` (`ID_Member`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`ID_Pengembalian`),
  ADD KEY `ID_Buku` (`ID_Buku`),
  ADD KEY `ID_Anggota` (`ID_Anggota`),
  ADD KEY `ID_Petugas` (`ID_Petugas`),
  ADD KEY `ID_Peminjaman` (`ID_Peminjaman`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`ID_Petugas`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`ID_Anggota`) REFERENCES `peminjaman` (`ID_Member`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `peminjaman` (`ID_Buku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`ID_Peminjaman`) REFERENCES `peminjaman` (`ID_Peminjaman`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `petugas_ibfk_1` FOREIGN KEY (`ID_Petugas`) REFERENCES `pengembalian` (`ID_Petugas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
