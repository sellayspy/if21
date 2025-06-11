-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2025 pada 07.32
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakultas`
--

CREATE TABLE `fakultas` (
  `id` char(36) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `singkatan` varchar(4) NOT NULL,
  `nama_dekan` varchar(30) NOT NULL,
  `nama_wadek` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fakultas`
--

INSERT INTO `fakultas` (`id`, `nama`, `singkatan`, `nama_dekan`, `nama_wadek`, `created_at`, `updated_at`) VALUES
('01972976-50ab-70c0-a065-2999f9496bd9', 'Fakultas Ilmu Komputer dan Rekayasa', 'FIKR', 'Dr.Abdul Rahman, S.Si, M.T.I', 'Dr.Fransiska Prihatini', '2025-05-31 20:08:29', '2025-05-31 20:10:40'),
('01972978-2419-73c6-a677-0ce721ec9393', 'Fakultas Ekonomi dan Bisnis', 'FEB', 'Sri Megawati Elizabeth', 'Trisnadi Wijaya', '2025-05-31 20:10:28', '2025-05-31 20:10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` char(36) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `kode_smt` enum('Gasal','Genap') NOT NULL DEFAULT 'Gasal',
  `kelas` varchar(50) NOT NULL,
  `sesi_id` char(36) NOT NULL,
  `mata_kuliah_id` char(36) NOT NULL,
  `dosen_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `tahun_akademik`, `kode_smt`, `kelas`, `sesi_id`, `mata_kuliah_id`, `dosen_id`, `created_at`, `updated_at`) VALUES
('01972a42-1189-7027-beea-c348b2529944', '2024/2025', 'Genap', 'IF-21', '01972998-78f9-71b7-a018-bf17a4b3db0d', '019729a2-9acc-7348-973a-333e98a005db', 1, '2025-05-31 23:51:02', '2025-05-31 23:59:32'),
('01973a8f-f2eb-7281-8bc8-92bb56806756', '2025/2026', 'Genap', 'IF-21B', '01972998-edd3-7037-8703-c7edbce670ad', '01973a8e-e25a-738a-b669-a2ad4eb217aa', 1, '2025-06-04 03:50:01', '2025-06-04 03:50:01'),
('01973a91-7501-7383-a668-c19cd8ee6ddd', '2024/2025', 'Gasal', 'IF-21', '01972998-78f9-71b7-a018-bf17a4b3db0d', '019729a4-2e57-715f-9a8c-51ac4c1b595a', 1, '2025-06-04 03:51:40', '2025-06-04 03:51:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` char(36) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `npm` varchar(11) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `asal_sma` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `prodi_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `nama`, `npm`, `jk`, `tanggal_lahir`, `tempat_lahir`, `asal_sma`, `foto`, `prodi_id`, `created_at`, `updated_at`) VALUES
('0197297d-95be-71bc-941a-1037473b8924', 'Riki Fauzia Nurjaman', '2428250061', 'L', '2001-02-19', 'Tasikmalaya', 'SMK YPC TASIKMALAYA', '1748747785.png', '01972979-dc8d-723c-b487-33cd035e7793', '2025-05-31 20:16:25', '2025-05-31 20:16:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` char(36) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kode_mk` varchar(20) NOT NULL,
  `prodi_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `nama`, `kode_mk`, `prodi_id`, `created_at`, `updated_at`) VALUES
('019729a2-9acc-7348-973a-333e98a005db', 'Pemograman Web 1', 'IF1001', '01972979-dc8d-723c-b487-33cd035e7793', '2025-05-31 20:56:51', '2025-05-31 20:56:51'),
('019729a3-b77f-73da-961d-e204fb5a1acc', 'Basis Data II', 'IF1002', '01972979-dc8d-723c-b487-33cd035e7793', '2025-05-31 20:58:04', '2025-05-31 20:58:04'),
('019729a4-2e57-715f-9a8c-51ac4c1b595a', 'Pemograman Berbasis Objek', 'IF1003', '01972979-dc8d-723c-b487-33cd035e7793', '2025-05-31 20:58:35', '2025-05-31 20:58:35'),
('019729a4-d93b-739b-83f0-8c5999e1efae', 'Algoritma dan Struktur Data', 'IF1004', '01972979-dc8d-723c-b487-33cd035e7793', '2025-05-31 20:59:18', '2025-05-31 21:07:25'),
('019729a5-3df8-7031-8320-30fad0bb29fe', 'Kalkulus II', 'IF1005', '01972979-dc8d-723c-b487-33cd035e7793', '2025-05-31 20:59:44', '2025-05-31 20:59:44'),
('019729a5-862e-73d2-9f66-b0614332959b', 'Matematika Diskrit', 'IF1006', '01972979-dc8d-723c-b487-33cd035e7793', '2025-05-31 21:00:03', '2025-05-31 21:00:03'),
('01973a8e-e25a-738a-b669-a2ad4eb217aa', 'Kalkulus II', 'IF2001', '0197297a-9cb1-7380-90b8-364d2ed6a948', '2025-06-04 03:48:52', '2025-06-04 03:48:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id` char(36) NOT NULL,
  `mata_kuliah_id` char(36) NOT NULL,
  `dosen_id` bigint(20) UNSIGNED NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `pokok_bahasan` varchar(100) NOT NULL,
  `file_materi` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id`, `mata_kuliah_id`, `dosen_id`, `pertemuan`, `pokok_bahasan`, `file_materi`, `created_at`, `updated_at`) VALUES
('01975d50-480e-7357-9014-6979e18f76a5', '019729a3-b77f-73da-961d-e204fb5a1acc', 1, 1, 'Membuat Laravel', '1749617229_14  Tutorial Praktikum Doubly Linked List.pdf', '2025-06-10 21:47:11', '2025-06-10 21:53:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_29_102902_create_fakultas_table', 1),
(5, '2025_05_02_122548_create_prodis_table', 1),
(6, '2025_05_06_101354_create_mahasiswas_table', 1),
(7, '2025_06_01_025149_create_sesi_table', 1),
(8, '2025_06_01_025210_create_mata_kuliah_table', 1),
(9, '2025_06_01_025222_create_jadwal_table', 1),
(10, '2025_06_01_032223_create_mata_kuliah_table', 2),
(12, '2025_06_01_055636_add_kolom_role_users_tabel', 3),
(13, '2025_06_01_032230_create_jadwal_table', 4),
(16, '2025_06_11_013029_create_materi_table', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `id` char(36) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `singkatan` char(2) NOT NULL,
  `kaprodi` varchar(30) NOT NULL,
  `sekretaris` varchar(30) NOT NULL,
  `fakultas_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id`, `nama`, `singkatan`, `kaprodi`, `sekretaris`, `fakultas_id`, `created_at`, `updated_at`) VALUES
('01972979-dc8d-723c-b487-33cd035e7793', 'Informatika', 'IF', 'Dr. M Rizky Pribadi,M.Kom', 'Hafidz Irsyad, M.Kom', '01972976-50ab-70c0-a065-2999f9496bd9', '2025-05-31 20:12:21', '2025-05-31 20:12:21'),
('0197297a-9cb1-7380-90b8-364d2ed6a948', 'Sistem Informasi', 'SI', 'Ahmad Farizi,M.Kom', 'Orrisa Octaria', '01972976-50ab-70c0-a065-2999f9496bd9', '2025-05-31 20:13:10', '2025-05-31 20:13:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sesi`
--

CREATE TABLE `sesi` (
  `id` char(36) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sesi`
--

INSERT INTO `sesi` (`id`, `nama`, `created_at`, `updated_at`) VALUES
('01972998-0263-7374-937c-8c8839e77d22', '07.50-9.30', '2025-05-31 20:45:17', '2025-05-31 20:45:17'),
('01972998-78f9-71b7-a018-bf17a4b3db0d', '09.40-11.20', '2025-05-31 20:45:47', '2025-05-31 20:45:47'),
('01972998-edd3-7037-8703-c7edbce670ad', '11.30-13.10', '2025-05-31 20:46:17', '2025-05-31 20:47:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AfhGeiuZ2EcS6Kda52WaeVBRwJ9FFbnWVX40CJEa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmJoNnJQZHVmZmRadkpPMDlscE5MVmhCS0ZNU1U5N01kTWpCcXJOSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tYXRlcmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749606467),
('m67bQtBWGCzifcFTD9BoOfuulhNhqvC2Qwi7TUDU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGw1azhvQ0VDV2dNQUVEUjNRcm9JcUZnRTZ0cUYyZ0h3ZGlDZkRvRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tYXRlcmkvMDE5NzVkNTAtNDgwZS03MzU3LTkwMTQtNjk3OWUxOGY3NmE1L2VkaXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749618260),
('V7T3B5BKgZ0YAgNBdinKuBOrdyRPxkIonN94dR0H', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU5RcG1EVVJUclQwblpNVUU4QWU0S3FCdHJBT3o0azlGd2dGR3FlSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749034303),
('XN9YeOta1x6VTXBspR5ZTN01jxIK12SKw3K34rSM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0NLT29XUnBYbzBOaHdBbDJEMk51MlRHR3ZFQlo0RkVTaEVPU0wzNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1748779326),
('XRIggjZk8yM6yo6BxQ1SKnpxtG4WlhHwJEECzlqB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2pFOUhuRFZnRVpqbHRrWmhIdVlvaTZYYll6YzF0MmtncFdvbjEyOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1748761206);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nur Racmat, M.Kom', 'nurrachmat@gmail.com', NULL, '$2y$12$McIpdPky5spHQ1oEloq6cuqSSjMYWmAKzAdnIUFlR4QZg7J2AjrpO', NULL, '2025-05-31 23:22:39', '2025-05-31 23:22:39');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_sesi_id_foreign` (`sesi_id`),
  ADD KEY `jadwal_mata_kuliah_id_foreign` (`mata_kuliah_id`),
  ADD KEY `jadwal_dosen_id_foreign` (`dosen_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mahasiswas_prodi_id_foreign` (`prodi_id`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mata_kuliah_kode_mk_unique` (`kode_mk`),
  ADD KEY `mata_kuliah_prodi_id_foreign` (`prodi_id`);

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodi_fakultas_id_foreign` (`fakultas_id`);

--
-- Indeks untuk tabel `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwal_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwal_sesi_id_foreign` FOREIGN KEY (`sesi_id`) REFERENCES `sesi` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD CONSTRAINT `mahasiswas_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`);

--
-- Ketidakleluasaan untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
