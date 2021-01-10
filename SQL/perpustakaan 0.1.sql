-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Des 2020 pada 11.18
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `ID_Anggota` char(8) NOT NULL,
  `Nama_Anggota` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `Kode_Buku` char(8) NOT NULL,
  `Judul_Buku` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_kembali`
--

CREATE TABLE `detail_kembali` (
  `ID_DetailKembali` char(8) NOT NULL,
  `Kode_Kembali` char(8) NOT NULL,
  `Kode_Pinjam` char(8) NOT NULL,
  `Kode_Buku` char(8) NOT NULL,
  `Jumlah` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `ID_DetailPinjam` char(8) NOT NULL,
  `Kode_Pinjam` char(8) NOT NULL,
  `Kode_Buku` char(8) NOT NULL,
  `Jumlah` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `ID_Petugas` char(8) NOT NULL,
  `Nama_Petugas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjam`
--

CREATE TABLE `pinjam` (
  `Kode_Pinjam` char(8) NOT NULL,
  `Tgl_Pinjam` date NOT NULL,
  `Tgl_Balik` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_peminjaman`
--

CREATE TABLE `trans_peminjaman` (
  `Kode_TransPinjam` char(8) NOT NULL,
  `Kode_Pinjam` char(8) NOT NULL,
  `Tgl_Pinjam` date NOT NULL,
  `Tgl_Balik` date NOT NULL,
  `ID_Anggota` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_pengembalian`
--

CREATE TABLE `trans_pengembalian` (
  `Kode_TransKembali` char(8) NOT NULL,
  `Kode_Kembali` char(8) NOT NULL,
  `ID_Petugas` char(8) NOT NULL,
  `ID_Anggota` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_Anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`Kode_Buku`);

--
-- Indeks untuk tabel `detail_kembali`
--
ALTER TABLE `detail_kembali`
  ADD PRIMARY KEY (`ID_DetailKembali`),
  ADD KEY `Kode_Kembali` (`Kode_Kembali`),
  ADD KEY `Kode_Pinjam` (`Kode_Pinjam`),
  ADD KEY `Kode_Buku` (`Kode_Buku`);

--
-- Indeks untuk tabel `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD PRIMARY KEY (`ID_DetailPinjam`),
  ADD KEY `Kode_Pinjam` (`Kode_Pinjam`),
  ADD KEY `Kode_Buku` (`Kode_Buku`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`ID_Petugas`);

--
-- Indeks untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`Kode_Pinjam`);

--
-- Indeks untuk tabel `trans_peminjaman`
--
ALTER TABLE `trans_peminjaman`
  ADD PRIMARY KEY (`Kode_TransPinjam`),
  ADD KEY `Kode_Pinjam` (`Kode_Pinjam`),
  ADD KEY `ID_Anggota` (`ID_Anggota`);

--
-- Indeks untuk tabel `trans_pengembalian`
--
ALTER TABLE `trans_pengembalian`
  ADD PRIMARY KEY (`Kode_TransKembali`),
  ADD KEY `Kode_Kembali` (`Kode_Kembali`),
  ADD KEY `ID_Petugas` (`ID_Petugas`),
  ADD KEY `ID_Anggota` (`ID_Anggota`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`ID_Anggota`) REFERENCES `trans_peminjaman` (`ID_Anggota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`Kode_Buku`) REFERENCES `detail_pinjam` (`Kode_Buku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `petugas_ibfk_1` FOREIGN KEY (`ID_Petugas`) REFERENCES `trans_pengembalian` (`ID_Petugas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`Kode_Pinjam`) REFERENCES `detail_pinjam` (`Kode_Pinjam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `trans_pengembalian`
--
ALTER TABLE `trans_pengembalian`
  ADD CONSTRAINT `trans_pengembalian_ibfk_1` FOREIGN KEY (`Kode_Kembali`) REFERENCES `detail_kembali` (`Kode_Kembali`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
