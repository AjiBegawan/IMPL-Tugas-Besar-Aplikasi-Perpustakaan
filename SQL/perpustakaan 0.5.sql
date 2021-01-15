-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2021 at 03:39 PM
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
  `Password` varchar(30) NOT NULL,
  `Session` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`ID_Anggota`, `Nama`, `Tanggal_Lahir`, `Alamat`, `No_Telp`, `Password`, `Session`) VALUES
('A0001', 'Ade Ridwan Nugraha', '2021-01-10', 'Cimahi', 813, 'pass', 0),
('A0002', 'Adu Du', '1999-12-31', 'Planet Ata Ta Tiga', 851237231, 'adudu', 0),
('A0003', 'Probe', '2018-01-10', 'Planet Ata Ta Tiga', 1234232, 'probe', 0),
('A0004', 'Kapten Separo', '2019-05-02', 'Planet Sphera', 3322445, 'kaptenseparo', 0),
('A0005', 'Jokertu', '2018-09-03', 'Galaxy Nusagima', 44225533, 'jokertu', 0),
('A0006', 'Tok Aba', '2019-02-05', 'Pulau Rintis', 334455511, 'tokaba', 0),
('A0009', 'gina', '2021-01-06', 'Jalan cereh', 89999, 'gina', 0);

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

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`ID_Buku`, `Judul_Buku`, `Penulis`, `Penerbit`, `Kategori`, `Kuantiti`) VALUES
('1001', 'IMPL', 'Fatansyah', 'Penerpit Informatika', 'IT', 10),
('1002', 'Tangan Masa Kecil Yang Merisaukan (CHaD)', 'Roseline D. Davido', 'Humanika', 'Psikologi', 3),
('1003', 'Auditing: Petunjuk Praktis Pemeriksaan Akuntan', 'Sukrisno Agoes', 'Salemba Empat', 'Akuntansi', 5),
('1004', 'Praktikum PPH: Orang Pribadi Dan Badan', 'R. Weddie Andriyanto', 'Salemba Empat', 'Pajak', 2),
('1005', 'Praktikum PPN Dan PPnBM', 'R. Weddie Andriyanto ', 'Salemba Empat', 'Pajak', 1),
('1006', 'Pengadaan Barang Dan Jasa (Government Procurement)', 'Dr. Ade Maman Suherman, S.H., M.Sc', 'PT RajaGrafindo Persada', 'Pemerintahan dan Politik', 5),
('1007', 'Sistem Pemerintahan Indonesia', 'Saldi Isra', 'PT RajaGrafindo Persada', 'Pemerintahan dan Politik', 3),
('1008', 'Manajemen: Kepemimpinan Dan Kerja Sama Dalam Dunia', 'Thomas S. Bateman', 'Penerbit Salemba Empat', 'Manajemen', 2),
('1009', 'Prinsip-Prinsip Manajemen Keuangan', 'James C. Van Horne', 'Penerbit Salemba Empat', 'Manajemen', 3);

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

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`ID_Peminjaman`, `ID_Buku`, `ID_Member`, `Tgl_Peminjaman`, `Deadline_Pinjam`) VALUES
('P0001', '1001', 'A0003', '2020-11-04', '2020-11-18'),
('P0002', '1008', 'A0006', '2021-01-01', '2021-01-08'),
('P0003', '1004', 'A0002', '2021-01-07', '2021-01-14'),
('P0004', '1006', 'A0002', '2021-01-02', '2021-01-09');

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

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`ID_Pengembalian`, `ID_Peminjaman`, `ID_Buku`, `ID_Anggota`, `ID_Petugas`, `Deadline_Pinjam`, `Tgl_Pengembalian`, `Denda`) VALUES
('B0001', 'P0001', '1001', 'A0003', '11', '2020-11-18', '2021-01-17', 0),
('B0002', 'P0002', '1008', 'A0006', '14', '2021-01-08', '2021-01-05', 0),
('B0003', 'P0003', '1004', 'A0002', '12', '2021-01-14', '2021-01-14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `ID_Petugas` varchar(10) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telp` int(12) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Session` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`ID_Petugas`, `Nama`, `Alamat`, `No_Telp`, `Password`, `Session`) VALUES
('11', 'Gopal', 'Pulau Rintis', 442233, 'gopal', 0),
('12', 'Boboiboy', 'Pulau Rintis', 123123, 'boboiboy', 0),
('13', 'IndiartoAjiBegawan', 'Bandung', 813, 'pass', 0),
('14', 'Papa Zola', 'Pulau Rintis', 234234234, 'papazola', 0),
('20', 'test', 'antartika', 88, 'test', 0);

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
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`ID_Member`) REFERENCES `anggota` (`ID_Anggota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`ID_Peminjaman`) REFERENCES `peminjaman` (`ID_Peminjaman`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengembalian_ibfk_4` FOREIGN KEY (`ID_Petugas`) REFERENCES `petugas` (`ID_Petugas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
