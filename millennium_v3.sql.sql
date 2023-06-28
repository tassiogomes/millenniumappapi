-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Jun-2023 às 19:34
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `millennium_v3`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `detalhes_simulacoes`
--

CREATE TABLE `detalhes_simulacoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `montante_pedido` double NOT NULL,
  `prestacao_mensal` double NOT NULL,
  `taxa_de_juros` double NOT NULL,
  `meses_de_pagamento` int(11) NOT NULL,
  `montante_total_a_pagar` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `detalhes_simulacoes`
--

INSERT INTO `detalhes_simulacoes` (`id`, `montante_pedido`, `prestacao_mensal`, `taxa_de_juros`, `meses_de_pagamento`, `montante_total_a_pagar`, `created_at`, `updated_at`) VALUES
(1, 10000, 500, 0.05, 24, 12000, '2023-06-27 16:10:50', '2023-06-27 16:10:50'),
(2, 10000, 500, 0.05, 24, 12000, '2023-06-27 16:11:48', '2023-06-27 16:11:48'),
(3, 10000, 500, 0.05, 24, 12000, '2023-06-27 16:16:11', '2023-06-27 16:16:11'),
(4, 10000, 500, 0.05, 24, 12000, '2023-06-27 16:22:02', '2023-06-27 16:22:02'),
(5, 10000, 500, 0.05, 24, 12000, '2023-06-27 16:22:32', '2023-06-27 16:22:32'),
(6, 500000, 500, 0.03, 72, 700000, '2023-06-28 12:28:36', '2023-06-28 12:28:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
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
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_31_093723_detalhes_simulacoes', 2),
(6, '2023_05_31_093837_simulacoes', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('user1@gmail.com', '$2y$10$D8Jd5.Swu2CU0Ivqtaa5Eutp/tQpQJk3OjfNBJvCO.o2Lp.qJXYCy', '2023-06-01 12:20:56'),
('user15@gmail.com', '$2y$10$S9i5LFw25oXHAN.OrhPwDuKZxu6zCEKGvQaMNWkDzHLazsgKw6O8q', '2023-06-01 10:36:21'),
('user17@gmail.com', '$2y$10$.9l1tLbqUwx9BlvdJWBDLeP7u40evePEH.iKsxp9sypeeDvtQql7u', '2023-06-01 12:21:12'),
('user2@gmail.com', '$2y$10$viYIPEtQo4pieVDmeMaRpO819tGxPaCDEo253SRRvYuPVWzl6/lN6', '2023-06-01 12:32:31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `simulacoes`
--

CREATE TABLE `simulacoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `detalhes_simulacoes_id` bigint(20) UNSIGNED NOT NULL,
  `data_simulacao` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `simulacoes`
--

INSERT INTO `simulacoes` (`id`, `users_id`, `detalhes_simulacoes_id`, `data_simulacao`, `created_at`, `updated_at`) VALUES
(1, 23, 1, '2023-06-27', '2023-06-27 16:10:50', '2023-06-27 16:10:50'),
(2, 22, 2, '2023-06-27', '2023-06-27 16:11:48', '2023-06-27 16:11:48'),
(3, 26, 5, '2023-06-10', '2023-06-27 16:22:32', '2023-06-27 16:22:32'),
(4, 47, 6, '2023-06-06', '2023-06-28 12:28:36', '2023-06-28 12:28:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `id_tipo_user` int(11) NOT NULL DEFAULT 3,
  `isBiometric` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `id_tipo_user`, `isBiometric`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'user1', 'user1@gmail.com', NULL, '$2y$10$9CN2L50t66zhXgv3bdosle2PuzkHH4FEK1XRNokV18Tw2ZVDyQPU2', 1, NULL, NULL, '2023-05-31 12:56:30', '2023-05-31 13:00:47'),
(12, 'user2', 'user2@gmail.com', NULL, '$2y$10$LvxIhTk7VeZjllLog2bu6.DuVOayI0Bzaz6bAYgOy/6T5CAByMjyG', 2, NULL, NULL, '2023-06-01 10:23:28', '2023-06-07 08:20:30'),
(13, 'user3', 'user3@gmail.com', NULL, '123', 1, NULL, NULL, NULL, '2023-06-07 08:28:34'),
(14, 'user4', 'user4@gmail.com', NULL, '123', 3, NULL, NULL, NULL, NULL),
(15, 'user5', 'user5@gmail.com', NULL, '123', 2, NULL, NULL, NULL, '2023-06-07 09:45:14'),
(16, 'user6', 'user6@gmail.com', NULL, '123', 3, NULL, NULL, NULL, NULL),
(17, 'user7', 'user7@gmail.com', NULL, '123', 3, NULL, NULL, NULL, NULL),
(18, 'user8', 'user8@gmail.com', NULL, '123', 3, NULL, NULL, NULL, NULL),
(19, 'user9', 'user9@gmail.com', NULL, '123', 3, NULL, NULL, NULL, NULL),
(20, 'user10', 'user10@gmail.com', NULL, '123', 1, NULL, NULL, NULL, '2023-06-26 16:15:13'),
(22, 'user12', 'user12@gmail.com', NULL, '123', 3, NULL, NULL, NULL, NULL),
(23, 'user13', 'user13@gmail.com', NULL, '123', 3, NULL, NULL, NULL, NULL),
(26, 'user16', 'user16@gmail.com', NULL, '123', 3, NULL, NULL, NULL, NULL),
(27, 'user17', 'user17@gmail.com', NULL, '123', 3, NULL, NULL, NULL, NULL),
(29, 'Tomas2', 'tomas22@tomas.com', NULL, '$2y$10$AkuqtYRWtsbik0yCtbJiPeOWJF0fSJAGMtme7bfMx1dUUpC6z.c4i', 3, NULL, NULL, '2023-06-07 08:29:32', '2023-06-07 08:29:32'),
(31, 'api1', 'api1@gmail.com', NULL, '$2y$10$H.jNeAtBpSf0V/w1U3/EzuFSkDf38PHLKeekpPdkjTD9Aj5gJYSDW', 3, NULL, NULL, '2023-06-26 15:44:09', '2023-06-26 15:44:09'),
(35, 'api2', 'api2@gmail.com', NULL, '$2y$10$j9ZwBC.S65uqxmAgUIPYrOVzBZ0HoyVLGoE/kjDH0EMbXuz7zplHe', 3, NULL, NULL, '2023-06-26 15:49:35', '2023-06-26 15:49:35'),
(41, 'Ze', 'ze@gmail.com', NULL, '$2y$10$f6rP44K5Ok.ldUHANoiygu60VRj1leRErnvP1K0zviLoGjCKwPNiG', 3, NULL, NULL, '2023-06-26 19:31:53', '2023-06-26 19:31:53'),
(45, 'Tassio Dev', 'tassiodev@gmail.com', NULL, '$2y$10$uEYIPJvVO.RFBwMwQ3UmXOWH986T322TV7kEIalJGCUYm4dRFlOGK', 3, NULL, NULL, '2023-06-27 08:46:43', '2023-06-27 08:46:43'),
(46, 'API100', 'api100@gmail.com', NULL, '$2y$10$her5b83oM2P/WgkIfnF0SeEYPTZpAdDm5wLrnWvNW7KZJOgCUnY3.', 3, NULL, NULL, '2023-06-27 13:31:02', '2023-06-27 13:31:02'),
(47, 'User api 1', 'userapi1@gmail.com', NULL, '$2y$10$No/3zfpWNBJYuoKiZz1gUerN7GUe8phfFh53H2L/PUBHNbxgwrD4y', 3, NULL, NULL, '2023-06-28 12:26:42', '2023-06-28 12:26:42');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `detalhes_simulacoes`
--
ALTER TABLE `detalhes_simulacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `simulacoes`
--
ALTER TABLE `simulacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simulacoes_users_id_foreign` (`users_id`),
  ADD KEY `simulacoes_detalhes_simulacoes_id_foreign` (`detalhes_simulacoes_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `detalhes_simulacoes`
--
ALTER TABLE `detalhes_simulacoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `simulacoes`
--
ALTER TABLE `simulacoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `simulacoes`
--
ALTER TABLE `simulacoes`
  ADD CONSTRAINT `simulacoes_detalhes_simulacoes_id_foreign` FOREIGN KEY (`detalhes_simulacoes_id`) REFERENCES `detalhes_simulacoes` (`id`),
  ADD CONSTRAINT `simulacoes_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
