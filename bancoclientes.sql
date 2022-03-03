-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Mar-2022 às 18:39
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bancoclientes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--
CREATE DATABASE bancoclientes;

USE bancoclientes;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(12) NOT NULL,
  `genero` varchar(25) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `data_nascimento` date NOT NULL,
  `dataCadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `email`, `telefone`, `genero`, `endereco`, `data_nascimento`, `dataCadastro`) VALUES
(52, 'Guilherme', 'gg@gg.com', '11 99999999', 'Masculino', 'Cotia', '2004-06-01', '2022-02-25 16:32:04'),
(53, 'biscoito', 'gg@gg.com', '234553', 'Masculino', 'estrada rosa ', '2021-12-28', '2022-02-25 17:02:08'),
(54, 'bolacha', 'gg@gg.com', '234553', 'Masculino', 'estrada rosa ', '2021-12-29', '2022-02-25 17:18:41'),
(55, 'leite', 'gg@gg.com', '11 99999999', 'Feminino', 'estrada rosa ', '2021-12-30', '2022-02-25 17:19:19'),
(56, 'biscoito', 'gg@gg.com', '11 99999999', 'Masculino', 'Cotia', '2004-08-09', '2022-03-03 13:57:35');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
