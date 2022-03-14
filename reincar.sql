-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2021 at 08:26 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reincar`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_transaksi`
--

CREATE TABLE `data_transaksi` (
  `id` int(11) NOT NULL,
  `nama_penyewa` varchar(35) DEFAULT NULL,
  `no_telp` varchar(12) DEFAULT NULL,
  `merek_mobil` varchar(250) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `tambahan` int(11) DEFAULT NULL,
  `pemasukan` int(11) DEFAULT NULL,
  `keperluan` varchar(255) DEFAULT NULL,
  `pengeluaran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_transaksi`
--

INSERT INTO `data_transaksi` (`id`, `nama_penyewa`, `no_telp`, `merek_mobil`, `tanggal`, `total_harga`, `tambahan`, `pemasukan`, `keperluan`, `pengeluaran`) VALUES
(15, 'Farrel Amadeo Reinhardt Rahmawan', '081310009235', 'Xpander', '2021-01-31', 600000, 0, 600000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan_inventaris`
--

CREATE TABLE `kendaraan_inventaris` (
  `id` int(11) NOT NULL,
  `merek_mobil` varchar(250) NOT NULL,
  `unit_total` int(11) NOT NULL,
  `unit_tersedia` int(11) NOT NULL,
  `harga_sewa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kendaraan_inventaris`
--

INSERT INTO `kendaraan_inventaris` (`id`, `merek_mobil`, `unit_total`, `unit_tersedia`, `harga_sewa`) VALUES
(5, 'Xpander', 3, 3, 300000),
(6, 'Avanza', 5, 5, 200000),
(7, 'Terrios', 3, 3, 400000),
(8, 'Alphard', 2, 2, 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(35) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `jenis_kelamin` varchar(9) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `nama_lengkap`, `no_telp`, `jenis_kelamin`, `alamat`) VALUES
(6, 'Farrel Amadeo Reinhardt Rahmawan', '081310009235', 'Laki-laki', 'Sentul City');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL,
  `nama_penyewa` varchar(35) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `merek_mobil` varchar(250) NOT NULL,
  `ketepatan_waktu` varchar(50) NOT NULL,
  `kerusakan` int(11) NOT NULL,
  `denda` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id`, `nama_penyewa`, `no_telp`, `merek_mobil`, `ketepatan_waktu`, `kerusakan`, `denda`, `tanggal`) VALUES
(9, 'Farrel Amadeo Reinhardt Rahmawan', '081310009235', 'Xpander', '0', 0, 0, '2021-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_penyewaan`
--

CREATE TABLE `transaksi_penyewaan` (
  `id` int(11) NOT NULL,
  `merek_mobil` varchar(250) NOT NULL,
  `sewa_hari` int(11) NOT NULL,
  `tgl_sewa` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `total_harga` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `role` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `role`) VALUES
(1, 'pemilik', '58399557dae3c60e23c78606771dfa3d', 'Pemilik', 'pemilik'),
(2, 'bendahara', 'c9ccd7f3c1145515a9d3f7415d5bcbea', 'Bendahara', 'bendahara'),
(3, 'kasir', 'c7911af3adbd12a035b289556d96470a', 'Kasir', 'kasir');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kendaraan_inventaris`
--
ALTER TABLE `kendaraan_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_penyewaan`
--
ALTER TABLE `transaksi_penyewaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_stok` (`id_member`),
  ADD KEY `id_kendaraan` (`id_kendaraan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kendaraan_inventaris`
--
ALTER TABLE `kendaraan_inventaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaksi_penyewaan`
--
ALTER TABLE `transaksi_penyewaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi_penyewaan`
--
ALTER TABLE `transaksi_penyewaan`
  ADD CONSTRAINT `transaksi_penyewaan_ibfk_2` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan_inventaris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_penyewaan_ibfk_3` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
