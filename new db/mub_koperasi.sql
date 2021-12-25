-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 25, 2021 at 07:55 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mub_koperasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('1c0d064d6b72ae3c129c0318466a4e15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 1640406227, 'a:4:{s:9:"user_data";s:0:"";s:5:"login";b:1;s:6:"u_name";s:5:"admin";s:5:"level";s:5:"admin";}'),
('11f74291737bd9ad0d21dc66ddf9b780', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 1640406227, '');

-- --------------------------------------------------------

--
-- Table structure for table `jns_akun`
--

CREATE TABLE IF NOT EXISTS `jns_akun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kd_aktiva` varchar(5) DEFAULT NULL,
  `jns_trans` varchar(50) NOT NULL,
  `akun` enum('Aktiva','Pasiva') DEFAULT NULL,
  `laba_rugi` enum('','PENDAPATAN','BIAYA') NOT NULL DEFAULT '',
  `pemasukan` enum('Y','N') DEFAULT NULL,
  `pengeluaran` enum('Y','N') DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kd_aktiva` (`kd_aktiva`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `jns_akun`
--

INSERT INTO `jns_akun` (`id`, `kd_aktiva`, `jns_trans`, `akun`, `laba_rugi`, `pemasukan`, `pengeluaran`, `aktif`) VALUES
(5, 'A4', 'Piutang Usaha', 'Aktiva', '', 'Y', 'Y', 'Y'),
(6, 'A5', 'Piutang Karyawan', 'Aktiva', '', 'N', 'Y', 'N'),
(7, 'A6', 'Pinjaman Anggota', 'Aktiva', '', NULL, NULL, 'Y'),
(8, 'A7', 'Piutang Anggota', 'Aktiva', '', 'Y', 'Y', 'N'),
(9, 'A8', 'Persediaan Barang', 'Aktiva', '', 'N', 'Y', 'Y'),
(10, 'A9', 'Biaya Dibayar Dimuka', 'Aktiva', '', 'N', 'Y', 'Y'),
(11, 'A10', 'Perlengkapan Usaha', 'Aktiva', '', 'N', 'Y', 'Y'),
(17, 'C', 'Aktiva Tetap Berwujud', 'Aktiva', '', NULL, NULL, 'Y'),
(18, 'C1', 'Peralatan Kantor', 'Aktiva', '', 'N', 'Y', 'Y'),
(19, 'C2', 'Inventaris Kendaraan', 'Aktiva', '', 'N', 'Y', 'Y'),
(20, 'C3', 'Mesin', 'Aktiva', '', 'N', 'Y', 'Y'),
(21, 'C4', 'Aktiva Tetap Lainnya', 'Aktiva', '', 'Y', 'N', 'Y'),
(26, 'E', 'Modal Pribadi', 'Aktiva', '', NULL, NULL, 'N'),
(27, 'E1', 'Prive', 'Aktiva', '', 'Y', 'Y', 'N'),
(28, 'F', 'Utang', 'Pasiva', '', NULL, NULL, 'Y'),
(29, 'F1', 'Utang Usaha', 'Pasiva', '', 'Y', 'Y', 'Y'),
(31, 'K3', 'Pengeluaran Lainnya', 'Aktiva', '', 'N', 'Y', 'N'),
(32, 'F4', 'Simpanan Sukarela', 'Pasiva', '', NULL, NULL, 'Y'),
(33, 'F5', 'Utang Pajak', 'Pasiva', '', 'Y', 'Y', 'Y'),
(36, 'H', 'Utang Jangka Panjang', 'Pasiva', '', NULL, NULL, 'Y'),
(37, 'H1', 'Utang Bank', 'Pasiva', '', 'Y', 'Y', 'Y'),
(38, 'H2', 'Obligasi', 'Pasiva', '', 'Y', 'Y', 'N'),
(39, 'I', 'Modal', 'Pasiva', '', NULL, NULL, 'Y'),
(40, 'I1', 'Simpanan Pokok', 'Pasiva', '', NULL, NULL, 'Y'),
(41, 'I2', 'Simpanan Wajib', 'Pasiva', '', NULL, NULL, 'Y'),
(42, 'I3', 'Modal Awal', 'Pasiva', '', 'Y', 'Y', 'Y'),
(43, 'I4', 'Modal Penyertaan', 'Pasiva', '', 'Y', 'Y', 'N'),
(44, 'I5', 'Modal Sumbangan', 'Pasiva', '', 'Y', 'Y', 'Y'),
(45, 'I6', 'Modal Cadangan', 'Pasiva', '', 'Y', 'Y', 'Y'),
(47, 'J', 'Pendapatan', 'Pasiva', 'PENDAPATAN', NULL, NULL, 'Y'),
(48, 'J1', 'Pembayaran Angsuran', 'Pasiva', '', NULL, NULL, 'Y'),
(49, 'J2', 'Pendapatan Lainnya', 'Pasiva', 'PENDAPATAN', 'Y', 'N', 'Y'),
(50, 'K', 'Beban', 'Aktiva', '', NULL, NULL, 'Y'),
(52, 'K2', 'Beban Gaji Karyawan', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(53, 'K3', 'Biaya Listrik dan Air', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(54, 'K4', 'Biaya Transportasi', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(60, 'K10', 'Biaya Lainnya', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(110, 'TRF', 'Transfer Antar Kas', NULL, '', NULL, NULL, 'N'),
(111, 'A11', 'Permisalan', 'Aktiva', '', 'Y', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `jns_angsuran`
--

CREATE TABLE IF NOT EXISTS `jns_angsuran` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ket` int(11) NOT NULL,
  `aktif` enum('Y','T','','') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `jns_angsuran`
--

INSERT INTO `jns_angsuran` (`id`, `ket`, `aktif`) VALUES
(1, 3, 'Y'),
(2, 6, 'Y'),
(3, 18, 'Y'),
(11, 24, 'Y'),
(12, 36, 'Y'),
(13, 5, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `jns_simpan`
--

CREATE TABLE IF NOT EXISTS `jns_simpan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jns_simpan` varchar(30) NOT NULL,
  `jumlah` double NOT NULL,
  `tampil` enum('Y','T') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `jns_simpan`
--

INSERT INTO `jns_simpan` (`id`, `jns_simpan`, `jumlah`, `tampil`) VALUES
(32, 'Simpanan Sukarela', 0, 'Y'),
(40, 'Simpanan Pokok', 100000, 'Y'),
(41, 'Simpanan Wajib', 50000, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `nama_kas_tbl`
--

CREATE TABLE IF NOT EXISTS `nama_kas_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(225) CHARACTER SET latin1 NOT NULL,
  `aktif` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_simpan` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_penarikan` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_pinjaman` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_bayar` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_pemasukan` enum('Y','T') NOT NULL,
  `tmpl_pengeluaran` enum('Y','T') NOT NULL,
  `tmpl_transfer` enum('Y','T') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `nama_kas_tbl`
--

INSERT INTO `nama_kas_tbl` (`id`, `nama`, `aktif`, `tmpl_simpan`, `tmpl_penarikan`, `tmpl_pinjaman`, `tmpl_bayar`, `tmpl_pemasukan`, `tmpl_pengeluaran`, `tmpl_transfer`) VALUES
(1, 'Kas Tunai', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'Kas Besar', 'Y', 'T', 'T', 'Y', 'T', 'Y', 'Y', 'Y'),
(3, 'Bank BNI', 'Y', 'T', 'T', 'T', 'T', 'Y', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE IF NOT EXISTS `pekerjaan` (
  `id_kerja` varchar(5) NOT NULL,
  `jenis_kerja` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pekerjaan`
--

INSERT INTO `pekerjaan` (`id_kerja`, `jenis_kerja`) VALUES
('1', 'TNI'),
('2', 'PNS'),
('3', 'Karyawan Swasta'),
('4', 'Guru'),
('5', 'Buruh'),
('6', 'Tani'),
('7', 'Pedagang'),
('8', 'Wiraswasta'),
('9', 'Mengurus Rumah Tangga'),
('99', 'Lainnya'),
('98', 'Pensiunan'),
('97', 'Penjahit');

-- --------------------------------------------------------

--
-- Table structure for table `suku_bunga`
--

CREATE TABLE IF NOT EXISTS `suku_bunga` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `opsi_key` varchar(20) NOT NULL,
  `opsi_val` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `suku_bunga`
--

INSERT INTO `suku_bunga` (`id`, `opsi_key`, `opsi_val`) VALUES
(1, 'bg_tab', '0'),
(2, 'bg_pinjam', '2'),
(3, 'biaya_adm', '1500'),
(4, 'denda', '1000'),
(5, 'denda_hari', '15'),
(6, 'dana_cadangan', '40'),
(7, 'jasa_anggota', '40'),
(8, 'dana_pengurus', '5'),
(9, 'dana_karyawan', '5'),
(10, 'dana_pend', '5'),
(11, 'dana_sosial', '5'),
(12, 'jasa_usaha', '70'),
(13, 'jasa_modal', '30'),
(14, 'pjk_pph', '5'),
(15, 'pinjaman_bunga_tipe', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anggota`
--

CREATE TABLE IF NOT EXISTS `tbl_anggota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 NOT NULL,
  `identitas` varchar(255) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `tmp_lahir` varchar(225) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `agama` varchar(30) NOT NULL,
  `departement` varchar(255) NOT NULL,
  `pekerjaan` varchar(30) NOT NULL,
  `alamat` text CHARACTER SET latin1 NOT NULL,
  `kota` varchar(255) NOT NULL,
  `notelp` varchar(12) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `jabatan_id` int(10) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `pass_word` varchar(225) NOT NULL,
  `file_pic` varchar(225) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identitas` (`identitas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_anggota`
--

INSERT INTO `tbl_anggota` (`id`, `nama`, `identitas`, `jk`, `tmp_lahir`, `tgl_lahir`, `status`, `agama`, `departement`, `pekerjaan`, `alamat`, `kota`, `notelp`, `tgl_daftar`, `jabatan_id`, `aktif`, `pass_word`, `file_pic`) VALUES
(1, 'vald', 'vald', 'L', 'jakarta', '2011-12-01', 'Belum Kawin', 'Islam', 'Produksi BOPP', 'Wiraswasta', 'cibubur', 'jakarta timur', '089797787878', '2021-12-08', 2, 'Y', '8ef74032faf83d0c2caf3022418196a1e0527972', ''),
(2, 'sali', 'sali', 'L', 'Jakarta', '2021-12-01', 'Belum Kawin', 'Islam', 'HRD', 'Wiraswasta', 'cibubur', 'jakarta timur', '0883248293', '2021-12-08', 2, 'Y', '8ef74032faf83d0c2caf3022418196a1e0527972', ''),
(3, 'Leya', 'leya', 'P', 'jakarta', '1993-12-09', 'Belum Kawin', 'Islam', 'HRD', 'Wiraswasta', 'cipete', 'Jakarta', '087672173123', '2021-12-15', 2, 'Y', '8ef74032faf83d0c2caf3022418196a1e0527972', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE IF NOT EXISTS `tbl_barang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nm_barang` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `harga` double NOT NULL,
  `jml_brg` int(11) NOT NULL,
  `ket` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id`, `nm_barang`, `type`, `merk`, `harga`, `jml_brg`, `ket`) VALUES
(1, 'Lemari Es', 'Elektronik', 'Toshiba', 500000, 4, ''),
(2, 'Komputer', 'K300 Corei3', 'Asus', 5000000, 1, ''),
(3, 'Kompor Gas', 'Tr675000', 'Rinai', 100000, 6, ''),
(4, 'Pinjaman Uang', 'Uang', '-', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengajuan`
--

CREATE TABLE IF NOT EXISTS `tbl_pengajuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no_ajuan` int(11) NOT NULL,
  `ajuan_id` varchar(255) NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `nominal` bigint(20) NOT NULL,
  `lama_ags` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `tgl_cair` date NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`anggota_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_pengajuan`
--

INSERT INTO `tbl_pengajuan` (`id`, `no_ajuan`, `ajuan_id`, `anggota_id`, `tgl_input`, `jenis`, `nominal`, `lama_ags`, `keterangan`, `status`, `alasan`, `tgl_cair`, `tgl_update`) VALUES
(1, 1, 'B.21.12.001', 1, '2021-12-08 16:25:37', 'Biasa', 10000000000, 3, 'coba', 1, '', '2021-12-08', '2021-12-08 16:34:00'),
(2, 2, 'B.21.12.002', 2, '2021-12-09 13:24:30', 'Biasa', 100000000000, 3, 'coba', 1, 'yes', '2021-12-09', '2021-12-09 13:42:00'),
(3, 3, 'B.21.12.003', 1, '2021-12-15 09:57:13', 'Biasa', 10000000000, 3, 'coba', 1, 'approve', '2021-12-15', '2021-12-15 09:58:00'),
(4, 4, 'B.21.12.004', 1, '2021-12-15 10:04:04', 'Biasa', 10000000, 3, 'coba', 1, 'yes', '2021-12-15', '2021-12-15 10:04:00'),
(5, 5, 'B.21.12.005', 2, '2021-12-15 10:05:20', 'Biasa', 10000000, 3, 'coba', 1, 'yes', '2021-12-15', '2021-12-15 10:07:00'),
(6, 6, 'B.21.12.006', 3, '2021-12-15 10:09:22', 'Biasa', 1000000, 3, 'coba', 1, 'yes', '2021-12-15', '2021-12-15 10:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjaman_d`
--

CREATE TABLE IF NOT EXISTS `tbl_pinjaman_d` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tgl_bayar` datetime NOT NULL,
  `pinjam_id` bigint(20) NOT NULL,
  `angsuran_ke` bigint(20) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `denda_rp` int(11) NOT NULL,
  `terlambat` int(11) NOT NULL,
  `ket_bayar` enum('Angsuran','Pelunasan','Bayar Denda') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `jns_trans` bigint(20) NOT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kas_id` (`kas_id`),
  KEY `user_name` (`user_name`),
  KEY `pinjam_id` (`pinjam_id`),
  KEY `jns_trans` (`jns_trans`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `tbl_pinjaman_d`
--

INSERT INTO `tbl_pinjaman_d` (`id`, `tgl_bayar`, `pinjam_id`, `angsuran_ke`, `jumlah_bayar`, `denda_rp`, `terlambat`, `ket_bayar`, `dk`, `kas_id`, `jns_trans`, `update_data`, `user_name`, `keterangan`) VALUES
(1, '2021-12-08 09:30:00', 64, 1, 21900, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', 'coba'),
(2, '2021-12-08 09:31:00', 64, 2, 21900, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(3, '2021-12-08 09:31:00', 64, 3, 21900, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(4, '2021-12-08 09:32:00', 64, 4, 21900, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(5, '2021-12-08 09:33:00', 64, 5, 21900, 0, 0, 'Pelunasan', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(6, '2021-12-08 13:36:00', 65, 1, 1701500, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(7, '2021-12-08 13:37:00', 65, 2, 1701500, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(8, '2021-12-08 13:37:00', 65, 3, 1701500, 0, 0, 'Pelunasan', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(9, '2021-12-08 15:46:00', 66, 1, 34001500, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(10, '2021-12-08 15:46:00', 66, 2, 34001500, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(11, '2021-12-08 15:46:00', 66, 3, 34001500, 0, 0, 'Pelunasan', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(12, '2021-12-15 10:11:00', 67, 1, 1701500, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', 'coba'),
(13, '2021-12-15 10:12:00', 67, 2, 1701500, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', 'coba'),
(14, '2021-12-15 10:13:00', 67, 3, 1701500, 0, 0, 'Pelunasan', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', ''),
(15, '2021-12-21 09:46:00', 69, 1, 2530200, 0, 0, 'Angsuran', 'D', 1, 48, '0000-00-00 00:00:00', 'admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjaman_h`
--

CREATE TABLE IF NOT EXISTS `tbl_pinjaman_h` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tgl_pinjam` datetime NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `lama_angsuran` bigint(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bunga` float(10,2) NOT NULL,
  `biaya_adm` int(11) NOT NULL,
  `lunas` enum('Belum','Lunas') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `jns_trans` bigint(20) NOT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `contoh` int(23) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `anggota_id` (`anggota_id`),
  KEY `kas_id` (`kas_id`),
  KEY `user_name` (`user_name`),
  KEY `jns_trans` (`jns_trans`),
  KEY `barang_id` (`barang_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `tbl_pinjaman_h`
--

INSERT INTO `tbl_pinjaman_h` (`id`, `tgl_pinjam`, `anggota_id`, `barang_id`, `lama_angsuran`, `jumlah`, `bunga`, `biaya_adm`, `lunas`, `dk`, `kas_id`, `jns_trans`, `update_data`, `user_name`, `keterangan`, `contoh`) VALUES
(64, '2021-12-08 09:29:00', 1, 3, 5, 100000, 2.00, 1500, 'Lunas', 'K', 1, 7, '0000-00-00 00:00:00', 'admin', 'coba', 0),
(65, '2021-12-08 13:24:00', 2, 2, 3, 5000000, 2.00, 1500, 'Lunas', 'K', 1, 7, '0000-00-00 00:00:00', 'admin', '', 0),
(66, '2021-12-08 15:45:00', 2, 4, 3, 100000000, 2.00, 1500, 'Lunas', 'K', 1, 7, '0000-00-00 00:00:00', 'admin', '', 0),
(67, '2021-12-15 10:11:00', 3, 2, 3, 5000000, 2.00, 1500, 'Lunas', 'K', 1, 7, '0000-00-00 00:00:00', 'admin', 'coba', 0),
(68, '2021-12-15 15:02:00', 2, 2, 5, 5000000, 2.00, 1500, 'Belum', 'K', 1, 7, '0000-00-00 00:00:00', 'admin', '', 0),
(69, '2021-12-21 09:29:00', 2, 4, 3, 7437346, 2.00, 1500, 'Belum', 'K', 1, 7, '0000-00-00 00:00:00', 'admin', '', 0),
(70, '2021-12-21 16:44:00', 2, 4, 3, 42423424, 2.00, 1500, 'Belum', 'K', 1, 7, '0000-00-00 00:00:00', 'admin', '', 0),
(71, '2021-12-21 16:44:00', 2, 4, 3, 32432422, 2.00, 1500, 'Belum', 'K', 1, 7, '0000-00-00 00:00:00', 'admin', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE IF NOT EXISTS `tbl_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opsi_key` varchar(255) NOT NULL,
  `opsi_val` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`id`, `opsi_key`, `opsi_val`) VALUES
(1, 'nama_lembaga', 'KOPERASI MITRA USAHA BERDIKARI'),
(2, 'nama_ketua', 'BAMBANG '),
(3, 'hp_ketua', '08123235468'),
(4, 'alamat', 'Jl. Jati Padang Raya '),
(5, 'telepon', '021-123456789'),
(6, 'kota', 'DKI Jakarta'),
(7, 'email', 'mub_koperasi@gmail.com'),
(8, 'web', 'mub-koperasi.blogspot.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_kas`
--

CREATE TABLE IF NOT EXISTS `tbl_trans_kas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tgl_catat` datetime NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `akun` enum('Pemasukan','Pengeluaran','Transfer') NOT NULL,
  `dari_kas_id` bigint(20) DEFAULT NULL,
  `untuk_kas_id` bigint(20) DEFAULT NULL,
  `jns_trans` bigint(20) DEFAULT NULL,
  `dk` enum('D','K') DEFAULT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  KEY `dari_kas_id` (`dari_kas_id`,`untuk_kas_id`),
  KEY `untuk_kas_id` (`untuk_kas_id`),
  KEY `jns_trans` (`jns_trans`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_trans_kas`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_sp`
--

CREATE TABLE IF NOT EXISTS `tbl_trans_sp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tgl_transaksi` datetime NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `jenis_id` int(5) NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `akun` enum('Setoran','Penarikan') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `nama_penyetor` varchar(255) NOT NULL,
  `no_identitas` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `anggota_id` (`anggota_id`),
  KEY `jenis_id` (`jenis_id`),
  KEY `kas_id` (`kas_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tbl_trans_sp`
--

INSERT INTO `tbl_trans_sp` (`id`, `tgl_transaksi`, `anggota_id`, `jenis_id`, `jumlah`, `keterangan`, `akun`, `dk`, `kas_id`, `update_data`, `user_name`, `nama_penyetor`, `no_identitas`, `alamat`) VALUES
(1, '2021-12-08 10:14:00', 1, 40, 100000, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', 'cibubur'),
(2, '2021-12-08 13:24:00', 2, 40, 10000000, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', 'cibubur'),
(3, '2021-12-15 09:12:00', 2, 40, 10000000, 'coba', 'Penarikan', 'K', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', '123'),
(4, '2021-12-15 10:13:00', 3, 40, 100000, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'Leya', '1234', 'jakarta'),
(5, '2021-12-15 10:15:00', 3, 40, 100000, 'coba', 'Penarikan', 'K', 1, '0000-00-00 00:00:00', 'admin', 'Leya', '1234', '61351823'),
(6, '2021-12-21 10:48:00', 2, 41, 81237812, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', 'cea'),
(7, '2021-12-21 10:48:00', 2, 40, 12312341, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', 'dsa'),
(8, '2021-12-21 10:48:00', 2, 32, 12341241, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', '123'),
(9, '2021-12-21 10:52:00', 3, 40, 12938923, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', '123'),
(10, '2021-12-21 10:52:00', 3, 41, 71637163, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', '123'),
(11, '2021-12-21 10:52:00', 3, 32, 1234456, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', 'qwe'),
(12, '2021-12-21 10:52:00', 1, 41, 12134124, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', 'qwe'),
(13, '2021-12-21 10:52:00', 1, 40, 123561312, 'coba', 'Setoran', 'D', 1, '0000-00-00 00:00:00', 'admin', 'salimi', '1234', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `level` enum('admin','operator','pinjaman') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_name` (`u_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `u_name`, `pass_word`, `aktif`, `level`) VALUES
(1, 'admin', '224bec3dd08832bc6a69873f15a50df406045f40', 'Y', 'admin'),
(4, 'user', 'e22b7d59cb35d199ab7e54ed0f2ef58f5da5347b', 'Y', 'operator'),
(5, 'pinjaman', 'efd2770f6782f7218be595baf2fc16bc7cf45143', 'Y', 'pinjaman');

-- --------------------------------------------------------

--
-- Table structure for table `v_hitung_pinjaman`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mub_koperasi`.`v_hitung_pinjaman` AS select `mub_koperasi`.`tbl_pinjaman_h`.`id` AS `id`,`mub_koperasi`.`tbl_pinjaman_h`.`tgl_pinjam` AS `tgl_pinjam`,`mub_koperasi`.`tbl_pinjaman_h`.`anggota_id` AS `anggota_id`,`mub_koperasi`.`tbl_pinjaman_h`.`lama_angsuran` AS `lama_angsuran`,`mub_koperasi`.`tbl_pinjaman_h`.`jumlah` AS `jumlah`,`mub_koperasi`.`tbl_pinjaman_h`.`bunga` AS `bunga`,`mub_koperasi`.`tbl_pinjaman_h`.`biaya_adm` AS `biaya_adm`,`mub_koperasi`.`tbl_pinjaman_h`.`lunas` AS `lunas`,`mub_koperasi`.`tbl_pinjaman_h`.`dk` AS `dk`,`mub_koperasi`.`tbl_pinjaman_h`.`kas_id` AS `kas_id`,`mub_koperasi`.`tbl_pinjaman_h`.`user_name` AS `user_name`,(`mub_koperasi`.`tbl_pinjaman_h`.`jumlah` / `mub_koperasi`.`tbl_pinjaman_h`.`lama_angsuran`) AS `pokok_angsuran`,round(ceiling((((`mub_koperasi`.`tbl_pinjaman_h`.`jumlah` / `mub_koperasi`.`tbl_pinjaman_h`.`lama_angsuran`) * `mub_koperasi`.`tbl_pinjaman_h`.`bunga`) / 100)),-(2)) AS `bunga_pinjaman`,round(ceiling((((((((`mub_koperasi`.`tbl_pinjaman_h`.`jumlah` / `mub_koperasi`.`tbl_pinjaman_h`.`lama_angsuran`) * `mub_koperasi`.`tbl_pinjaman_h`.`bunga`) / 100) + (`mub_koperasi`.`tbl_pinjaman_h`.`jumlah` / `mub_koperasi`.`tbl_pinjaman_h`.`lama_angsuran`)) + `mub_koperasi`.`tbl_pinjaman_h`.`biaya_adm`) * 100) / 100)),-(2)) AS `ags_per_bulan`,(`mub_koperasi`.`tbl_pinjaman_h`.`tgl_pinjam` + interval `mub_koperasi`.`tbl_pinjaman_h`.`lama_angsuran` month) AS `tempo`,(round(ceiling((((((((`mub_koperasi`.`tbl_pinjaman_h`.`jumlah` / `mub_koperasi`.`tbl_pinjaman_h`.`lama_angsuran`) * `mub_koperasi`.`tbl_pinjaman_h`.`bunga`) / 100) + (`mub_koperasi`.`tbl_pinjaman_h`.`jumlah` / `mub_koperasi`.`tbl_pinjaman_h`.`lama_angsuran`)) + `mub_koperasi`.`tbl_pinjaman_h`.`biaya_adm`) * 100) / 100)),-(2)) * `mub_koperasi`.`tbl_pinjaman_h`.`lama_angsuran`) AS `tagihan`,`mub_koperasi`.`tbl_pinjaman_h`.`keterangan` AS `keterangan`,`mub_koperasi`.`tbl_pinjaman_h`.`barang_id` AS `barang_id`,ifnull(max(`mub_koperasi`.`tbl_pinjaman_d`.`angsuran_ke`),0) AS `bln_sudah_angsur` from (`mub_koperasi`.`tbl_pinjaman_h` left join `mub_koperasi`.`tbl_pinjaman_d` on((`mub_koperasi`.`tbl_pinjaman_h`.`id` = `mub_koperasi`.`tbl_pinjaman_d`.`pinjam_id`))) group by `mub_koperasi`.`tbl_pinjaman_h`.`id`;

--
-- Dumping data for table `v_hitung_pinjaman`
--

INSERT INTO `v_hitung_pinjaman` (`id`, `tgl_pinjam`, `anggota_id`, `lama_angsuran`, `jumlah`, `bunga`, `biaya_adm`, `lunas`, `dk`, `kas_id`, `user_name`, `pokok_angsuran`, `bunga_pinjaman`, `ags_per_bulan`, `tempo`, `tagihan`, `keterangan`, `barang_id`, `bln_sudah_angsur`) VALUES
(64, '2021-12-08 09:29:00', 1, 5, 100000, 2.00, 1500, 'Lunas', 'K', 1, 'admin', '20000.0000', 400, 21900, '2022-05-08 09:29:00', 109500, 'coba', 3, 5),
(65, '2021-12-08 13:24:00', 2, 3, 5000000, 2.00, 1500, 'Lunas', 'K', 1, 'admin', '1666666.6667', 33300, 1701500, '2022-03-08 13:24:00', 5104500, '', 2, 3),
(66, '2021-12-08 15:45:00', 2, 3, 100000000, 2.00, 1500, 'Lunas', 'K', 1, 'admin', '33333333.3333', 666700, 34001500, '2022-03-08 15:45:00', 102004500, '', 4, 3),
(67, '2021-12-15 10:11:00', 3, 3, 5000000, 2.00, 1500, 'Lunas', 'K', 1, 'admin', '1666666.6667', 33300, 1701500, '2022-03-15 10:11:00', 5104500, 'coba', 2, 3),
(68, '2021-12-15 15:02:00', 2, 5, 5000000, 2.00, 1500, 'Belum', 'K', 1, 'admin', '1000000.0000', 20000, 1021500, '2022-05-15 15:02:00', 5107500, '', 2, 0),
(69, '2021-12-21 09:29:00', 2, 3, 7437346, 2.00, 1500, 'Belum', 'K', 1, 'admin', '2479115.3333', 49600, 2530200, '2022-03-21 09:29:00', 7590600, '', 4, 1),
(70, '2021-12-21 16:44:00', 2, 3, 42423424, 2.00, 1500, 'Belum', 'K', 1, 'admin', '14141141.3333', 282800, 14425500, '2022-03-21 16:44:00', 43276500, '', 4, 0),
(71, '2021-12-21 16:44:00', 2, 3, 32432422, 2.00, 1500, 'Belum', 'K', 1, 'admin', '10810807.3333', 216200, 11028500, '2022-03-21 16:44:00', 33085500, '', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `v_transaksi`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mub_koperasi`.`v_transaksi` AS select 'A' AS `tbl`,`mub_koperasi`.`tbl_pinjaman_h`.`id` AS `id`,`mub_koperasi`.`tbl_pinjaman_h`.`tgl_pinjam` AS `tgl`,`mub_koperasi`.`tbl_pinjaman_h`.`jumlah` AS `kredit`,0 AS `debet`,`mub_koperasi`.`tbl_pinjaman_h`.`kas_id` AS `dari_kas`,NULL AS `untuk_kas`,`mub_koperasi`.`tbl_pinjaman_h`.`jns_trans` AS `transaksi`,`mub_koperasi`.`tbl_pinjaman_h`.`keterangan` AS `ket`,`mub_koperasi`.`tbl_pinjaman_h`.`user_name` AS `user` from `mub_koperasi`.`tbl_pinjaman_h` union select 'B' AS `tbl`,`mub_koperasi`.`tbl_pinjaman_d`.`id` AS `id`,`mub_koperasi`.`tbl_pinjaman_d`.`tgl_bayar` AS `tgl`,0 AS `kredit`,`mub_koperasi`.`tbl_pinjaman_d`.`jumlah_bayar` AS `debet`,NULL AS `dari_kas`,`mub_koperasi`.`tbl_pinjaman_d`.`kas_id` AS `untuk_kas`,`mub_koperasi`.`tbl_pinjaman_d`.`jns_trans` AS `transaksi`,`mub_koperasi`.`tbl_pinjaman_d`.`keterangan` AS `ket`,`mub_koperasi`.`tbl_pinjaman_d`.`user_name` AS `user` from `mub_koperasi`.`tbl_pinjaman_d` union select 'C' AS `tbl`,`mub_koperasi`.`tbl_trans_sp`.`id` AS `id`,`mub_koperasi`.`tbl_trans_sp`.`tgl_transaksi` AS `tgl`,if((`mub_koperasi`.`tbl_trans_sp`.`dk` = 'K'),`mub_koperasi`.`tbl_trans_sp`.`jumlah`,0) AS `kredit`,if((`mub_koperasi`.`tbl_trans_sp`.`dk` = 'D'),`mub_koperasi`.`tbl_trans_sp`.`jumlah`,0) AS `debet`,if((`mub_koperasi`.`tbl_trans_sp`.`dk` = 'K'),`mub_koperasi`.`tbl_trans_sp`.`kas_id`,NULL) AS `dari_kas`,if((`mub_koperasi`.`tbl_trans_sp`.`dk` = 'D'),`mub_koperasi`.`tbl_trans_sp`.`kas_id`,NULL) AS `untuk_kas`,`mub_koperasi`.`tbl_trans_sp`.`jenis_id` AS `transaksi`,`mub_koperasi`.`tbl_trans_sp`.`keterangan` AS `ket`,`mub_koperasi`.`tbl_trans_sp`.`user_name` AS `user` from `mub_koperasi`.`tbl_trans_sp` union select 'D' AS `tbl`,`mub_koperasi`.`tbl_trans_kas`.`id` AS `id`,`mub_koperasi`.`tbl_trans_kas`.`tgl_catat` AS `tgl`,if((`mub_koperasi`.`tbl_trans_kas`.`dk` = 'K'),`mub_koperasi`.`tbl_trans_kas`.`jumlah`,if(isnull(`mub_koperasi`.`tbl_trans_kas`.`dk`),`mub_koperasi`.`tbl_trans_kas`.`jumlah`,0)) AS `kredit`,if((`mub_koperasi`.`tbl_trans_kas`.`dk` = 'D'),`mub_koperasi`.`tbl_trans_kas`.`jumlah`,if(isnull(`mub_koperasi`.`tbl_trans_kas`.`dk`),`mub_koperasi`.`tbl_trans_kas`.`jumlah`,0)) AS `debet`,`mub_koperasi`.`tbl_trans_kas`.`dari_kas_id` AS `dari_kas`,`mub_koperasi`.`tbl_trans_kas`.`untuk_kas_id` AS `untuk_kas`,`mub_koperasi`.`tbl_trans_kas`.`jns_trans` AS `transaksi`,`mub_koperasi`.`tbl_trans_kas`.`keterangan` AS `ket`,`mub_koperasi`.`tbl_trans_kas`.`user_name` AS `user` from `mub_koperasi`.`tbl_trans_kas` order by `tgl`;

--
-- Dumping data for table `v_transaksi`
--

INSERT INTO `v_transaksi` (`tbl`, `id`, `tgl`, `kredit`, `debet`, `dari_kas`, `untuk_kas`, `transaksi`, `ket`, `user`) VALUES
('A', 64, '2021-12-08 09:29:00', 100000, 0, 1, NULL, 7, 'coba', 'admin'),
('B', 1, '2021-12-08 09:30:00', 0, 21900, NULL, 1, 48, 'coba', 'admin'),
('B', 2, '2021-12-08 09:31:00', 0, 21900, NULL, 1, 48, '', 'admin'),
('B', 3, '2021-12-08 09:31:00', 0, 21900, NULL, 1, 48, '', 'admin'),
('B', 4, '2021-12-08 09:32:00', 0, 21900, NULL, 1, 48, '', 'admin'),
('B', 5, '2021-12-08 09:33:00', 0, 21900, NULL, 1, 48, '', 'admin'),
('C', 1, '2021-12-08 10:14:00', 0, 100000, NULL, 1, 40, 'coba', 'admin'),
('A', 65, '2021-12-08 13:24:00', 5000000, 0, 1, NULL, 7, '', 'admin'),
('C', 2, '2021-12-08 13:24:00', 0, 10000000, NULL, 1, 40, 'coba', 'admin'),
('B', 6, '2021-12-08 13:36:00', 0, 1701500, NULL, 1, 48, '', 'admin'),
('B', 7, '2021-12-08 13:37:00', 0, 1701500, NULL, 1, 48, '', 'admin'),
('B', 8, '2021-12-08 13:37:00', 0, 1701500, NULL, 1, 48, '', 'admin'),
('A', 66, '2021-12-08 15:45:00', 100000000, 0, 1, NULL, 7, '', 'admin'),
('B', 10, '2021-12-08 15:46:00', 0, 34001500, NULL, 1, 48, '', 'admin'),
('B', 11, '2021-12-08 15:46:00', 0, 34001500, NULL, 1, 48, '', 'admin'),
('B', 9, '2021-12-08 15:46:00', 0, 34001500, NULL, 1, 48, '', 'admin'),
('C', 3, '2021-12-15 09:12:00', 10000000, 0, 1, NULL, 40, 'coba', 'admin'),
('B', 12, '2021-12-15 10:11:00', 0, 1701500, NULL, 1, 48, 'coba', 'admin'),
('A', 67, '2021-12-15 10:11:00', 5000000, 0, 1, NULL, 7, 'coba', 'admin'),
('B', 13, '2021-12-15 10:12:00', 0, 1701500, NULL, 1, 48, 'coba', 'admin'),
('C', 4, '2021-12-15 10:13:00', 0, 100000, NULL, 1, 40, 'coba', 'admin'),
('B', 14, '2021-12-15 10:13:00', 0, 1701500, NULL, 1, 48, '', 'admin'),
('C', 5, '2021-12-15 10:15:00', 100000, 0, 1, NULL, 40, 'coba', 'admin'),
('A', 68, '2021-12-15 15:02:00', 5000000, 0, 1, NULL, 7, '', 'admin'),
('A', 69, '2021-12-21 09:29:00', 7437346, 0, 1, NULL, 7, '', 'admin'),
('B', 15, '2021-12-21 09:46:00', 0, 2530200, NULL, 1, 48, '', 'admin'),
('C', 8, '2021-12-21 10:48:00', 0, 12341241, NULL, 1, 32, 'coba', 'admin'),
('C', 6, '2021-12-21 10:48:00', 0, 81237812, NULL, 1, 41, 'coba', 'admin'),
('C', 7, '2021-12-21 10:48:00', 0, 12312341, NULL, 1, 40, 'coba', 'admin'),
('C', 12, '2021-12-21 10:52:00', 0, 12134124, NULL, 1, 41, 'coba', 'admin'),
('C', 13, '2021-12-21 10:52:00', 0, 123561312, NULL, 1, 40, 'coba', 'admin'),
('C', 9, '2021-12-21 10:52:00', 0, 12938923, NULL, 1, 40, 'coba', 'admin'),
('C', 10, '2021-12-21 10:52:00', 0, 71637163, NULL, 1, 41, 'coba', 'admin'),
('C', 11, '2021-12-21 10:52:00', 0, 1234456, NULL, 1, 32, 'coba', 'admin'),
('A', 70, '2021-12-21 16:44:00', 42423424, 0, 1, NULL, 7, '', 'admin'),
('A', 71, '2021-12-21 16:44:00', 32432422, 0, 1, NULL, 7, '', 'admin');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_pengajuan`
--
ALTER TABLE `tbl_pengajuan`
  ADD CONSTRAINT `tbl_pengajuan_ibfk_1` FOREIGN KEY (`anggota_id`) REFERENCES `tbl_anggota` (`id`);

--
-- Constraints for table `tbl_pinjaman_d`
--
ALTER TABLE `tbl_pinjaman_d`
  ADD CONSTRAINT `tbl_pinjaman_d_ibfk_1` FOREIGN KEY (`pinjam_id`) REFERENCES `tbl_pinjaman_h` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_d_ibfk_2` FOREIGN KEY (`kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_d_ibfk_3` FOREIGN KEY (`user_name`) REFERENCES `tbl_user` (`u_name`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_d_ibfk_4` FOREIGN KEY (`jns_trans`) REFERENCES `jns_akun` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pinjaman_h`
--
ALTER TABLE `tbl_pinjaman_h`
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_1` FOREIGN KEY (`anggota_id`) REFERENCES `tbl_anggota` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_2` FOREIGN KEY (`kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_3` FOREIGN KEY (`user_name`) REFERENCES `tbl_user` (`u_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_4` FOREIGN KEY (`jns_trans`) REFERENCES `jns_akun` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pinjaman_h_ibfk_5` FOREIGN KEY (`barang_id`) REFERENCES `tbl_barang` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_trans_kas`
--
ALTER TABLE `tbl_trans_kas`
  ADD CONSTRAINT `tbl_trans_kas_ibfk_2` FOREIGN KEY (`user_name`) REFERENCES `tbl_user` (`u_name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_kas_ibfk_3` FOREIGN KEY (`dari_kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_kas_ibfk_4` FOREIGN KEY (`untuk_kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_kas_ibfk_5` FOREIGN KEY (`jns_trans`) REFERENCES `jns_akun` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_trans_sp`
--
ALTER TABLE `tbl_trans_sp`
  ADD CONSTRAINT `tbl_trans_sp_ibfk_1` FOREIGN KEY (`anggota_id`) REFERENCES `tbl_anggota` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_sp_ibfk_2` FOREIGN KEY (`kas_id`) REFERENCES `nama_kas_tbl` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_sp_ibfk_4` FOREIGN KEY (`jenis_id`) REFERENCES `jns_simpan` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_trans_sp_ibfk_5` FOREIGN KEY (`user_name`) REFERENCES `tbl_user` (`u_name`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
