-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 22 Bulan Mei 2026 pada 07.43
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penggajian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `golongan`
--

CREATE TABLE `golongan` (
  `id_golongan` varchar(10) NOT NULL,
  `nama_golongan` varchar(50) DEFAULT NULL,
  `gaji_pokok` double DEFAULT NULL,
  `uang_transport` double DEFAULT NULL,
  `uang_makan` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `golongan`
--

INSERT INTO `golongan` (`id_golongan`, `nama_golongan`, `gaji_pokok`, `uang_transport`, `uang_makan`) VALUES
('G01', 'Manager', 700000, 300000, 400000),
('G02', 'Supervisor', 6000000, 250000, 350000),
('G03', 'Staff', 5000000, 200000, 300000),
('G04', 'Superman', 100000, 100000, 100000),
('G05', 'Maling', 80000, 50000, 12000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(10) NOT NULL,
  `nama_karyawan` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `id_golongan` varchar(10) DEFAULT NULL,
  `jumlah_anak` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `status`, `alamat`, `id_golongan`, `jumlah_anak`) VALUES
('K01', 'Adinda', 'Perempuan', 'Bogor', '2026-05-09', 'Menikah', 'Jalan Buntu 3', 'G01', 1),
('K02', 'Fatih', 'Perempuan', 'Bogor', '2026-05-08', 'Tidak Menikah', 'PID', 'G01', 0),
('K03', 'Dudung', 'Laki-Laki', 'Bogor', '2026-05-01', 'Menikah', 'Bogor', 'G01', 0),
('K05', 'Haevira', 'Perempuan', 'Bogor', '2026-05-22', 'Menikah', 'infokom', 'G03', 0),
('K06', 'Rafi', 'Laki-Laki', 'Bogor', '2026-05-06', 'Menikah', 'Jln adie Ibrahim', 'G01', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lembur`
--

CREATE TABLE `lembur` (
  `id_lembur` varchar(10) NOT NULL,
  `id_karyawan` varchar(10) DEFAULT NULL,
  `nama_karyawan` varchar(100) DEFAULT NULL,
  `tanggal_dari` date DEFAULT NULL,
  `tanggal_sampai` date DEFAULT NULL,
  `jumlah_jam` int(11) DEFAULT NULL,
  `rupiah_per_jam` int(11) DEFAULT NULL,
  `total_lembur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lembur`
--

INSERT INTO `lembur` (`id_lembur`, `id_karyawan`, `nama_karyawan`, `tanggal_dari`, `tanggal_sampai`, `jumlah_jam`, `rupiah_per_jam`, `total_lembur`) VALUES
('L01', 'K01', 'Adinda', '2026-05-01', '2026-05-08', 2, 2000, 4000),
('L02', 'K02', 'Fatih', '2026-05-02', '2026-05-09', 3, 12000, 36000),
('L04', 'K05', 'Haevira', '2026-05-02', '2026-05-09', 12, 10000, 120000),
('L05', 'K06', 'Rafi', '2026-05-08', '2026-05-15', 2, 50000, 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('fatih', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penggajian`
--

CREATE TABLE `penggajian` (
  `id_penggajian` varchar(10) NOT NULL,
  `id_karyawan` varchar(10) DEFAULT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `golongan` varchar(50) DEFAULT NULL,
  `tanggal_gaji` date DEFAULT NULL,
  `jumlah_gaji` double DEFAULT NULL,
  `jumlah_lembur` double DEFAULT NULL,
  `potongan` double DEFAULT NULL,
  `total_gaji` double DEFAULT NULL,
  `tunjangan_istri` double DEFAULT NULL,
  `tunjangan_anak` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penggajian`
--

INSERT INTO `penggajian` (`id_penggajian`, `id_karyawan`, `nama_karyawan`, `golongan`, `tanggal_gaji`, `jumlah_gaji`, `jumlah_lembur`, `potongan`, `total_gaji`, `tunjangan_istri`, `tunjangan_anak`) VALUES
('PG01', 'K05', 'Haevira', 'Staff', '2026-05-08', 5000000, 120000, 1200000, 4540000, 120000, 0),
('PG02', 'K06', 'Rafi', 'Manager', '2026-05-22', 700000, 100000, 100000, 1650000, 200000, 50000),
('PG03', 'K03', 'Dudung', 'Manager', '2026-05-29', 700000, 0, 100000, 1420000, 120000, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_golongan` (`id_golongan`);

--
-- Indeks untuk tabel `lembur`
--
ALTER TABLE `lembur`
  ADD PRIMARY KEY (`id_lembur`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_golongan`) REFERENCES `golongan` (`id_golongan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
