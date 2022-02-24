-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Fev-2022 às 17:50
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dio_mysql`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `born` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `author`
--

INSERT INTO `author` (`id_author`, `name`, `born`) VALUES
(1, 'MariaDB', '1992-04-19'),
(2, 'MongoDB', '2000-10-17'),
(3, 'Nathally', '1994-05-14'),
(4, 'Flávia', '2005-12-05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `playlist`
--

CREATE TABLE `playlist` (
  `id_playlist` int(11) NOT NULL,
  `name_pl` varchar(30) NOT NULL,
  `fk_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `playlist`
--

INSERT INTO `playlist` (`id_playlist`, `name_pl`, `fk_author`) VALUES
(1, 'HTML + CSS', 4),
(2, 'HTML + PHP + JS', 0),
(3, 'Python + PHP', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `seo`
--

CREATE TABLE `seo` (
  `id_seo` int(11) NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `seo`
--

INSERT INTO `seo` (`id_seo`, `category`) VALUES
(1, 'Frontend'),
(2, 'Backend');

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos`
--

CREATE TABLE `videos` (
  `id_video` int(11) NOT NULL,
  `fk_author` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `fk_seo` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `videos`
--

INSERT INTO `videos` (`id_video`, `fk_author`, `title`, `fk_seo`, `likes`, `dislikes`) VALUES
(1, 1, 'MySQL', 2, 10, 2),
(2, 1, 'HTML', 1, 30, 5),
(3, 1, 'CSS', 1, 18, 3),
(4, 2, 'JavaScript', 1, 15, 8),
(5, 3, 'Python', 2, 20, 0),
(6, 2, 'PHP', 2, 20, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos_playlist`
--

CREATE TABLE `videos_playlist` (
  `id_vp` int(11) NOT NULL,
  `fk_videos` int(11) NOT NULL,
  `fk_playlist` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `videos_playlist`
--

INSERT INTO `videos_playlist` (`id_vp`, `fk_videos`, `fk_playlist`) VALUES
(1, 2, 1),
(2, 3, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Índices para tabela `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id_playlist`);

--
-- Índices para tabela `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id_seo`);

--
-- Índices para tabela `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id_video`),
  ADD KEY `fk_author` (`fk_author`),
  ADD KEY `fk_seo` (`fk_seo`);

--
-- Índices para tabela `videos_playlist`
--
ALTER TABLE `videos_playlist`
  ADD PRIMARY KEY (`id_vp`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id_playlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `seo`
--
ALTER TABLE `seo`
  MODIFY `id_seo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `videos_playlist`
--
ALTER TABLE `videos_playlist`
  MODIFY `id_vp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`fk_author`) REFERENCES `author` (`id_author`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seo` FOREIGN KEY (`fk_seo`) REFERENCES `seo` (`id_seo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
