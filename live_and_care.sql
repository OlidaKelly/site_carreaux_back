-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 08 fév. 2022 à 08:56
-- Version du serveur :  8.0.27-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `live_and_care`
--

-- --------------------------------------------------------

--
-- Structure de la table `about`
--

CREATE TABLE `about` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `about`
--

INSERT INTO `about` (`id`, `name`, `phone`, `email`, `description`, `location`) VALUES
(1, 'Live and care', '0769728230', 'contact@liveandcare.com', 'Lorem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Cameroun, Afrique');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `image`) VALUES
(1, 'Céramique', 'carreaux céramique', 'https://www.bricodepot.fr/images/page_prod_big/116000/116210.jpg'),
(2, 'Ciment', 'carreaux ciment', ''),
(3, 'Lisse', 'carreaux lisses', ''),
(4, 'Antidérapant', 'carreaux antidérapants', ''),
(6, 'Antidérapant', 'carreaux antidérapants', ''),
(25, 'Antidérapant', 'carreaux antidérapants', 'imagedechat');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `firstname`, `lastname`, `email`, `message`, `seen`) VALUES
(1, 'Cécile', 'Ménard', 'cécé@gmail.com', 'Bonjour, je souhaiterais des informations sur .........', 0),
(2, 'Marie', 'Berger', 'Marie@marie.com', 'Bonjour, je souhaiterais des informations sur .........', 0),
(3, 'Juliette', 'Bertrand', 'juju52@gmail.com', 'Bonjour, je souhaiterais des informations sur .........', 1);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `color` varchar(40) NOT NULL,
  `size` varchar(40) NOT NULL,
  `tickness` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `destination` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_category` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `reference`, `color`, `size`, `tickness`, `destination`, `description`, `image`, `id_category`) VALUES
(1, 'Carrelage de sol intérieur terracotta \"Montovi\" 34 x 34 cm', '05059340192208', 'terracotta', '34 x 34 cm', '5mm', 'sol', 'Grès émaillé. 34 x 34 cm. Ép. 6,5 mm. Coloris terracotta. Le carton de 1,70 m². Joint conseillé 5mm. Plinthe 8 x 34 cm.', 'https://www.bricodepot.fr/images/page_prod_big/128000/128003.jpg', 1),
(2, 'Carrelage intérieur sol/mur décor calisson noir & blanc L.20 x l.20 cm', '03663602677697', 'noir/blanc', 'L.20 x l.20 cm', '5mm', 'sol/mur', 'Carrelage intérieur modèle \"Hydrolic\". Longueur: 20 cm x largeur: 20 cm. épaisseur: 10 mm. Grès cérame émaillé. Carrelages aspect carreau de ciment. Décor calisson. Coloris noir et blanc. Finition mat. Carrelage adapté à la pose au sol et mur. Compatible avec le chauffage au sol. Le carton de 1 m² (hors joint).', 'https://www.bricodepot.fr/images/page_prod_big/106500/106645.jpg', 2),
(22, 'Carrelage de sol intérieur terracotta \"Montovi\" 34 x 34 cm', '05059340192208', 'terracotta', '34 x 34 cm', '5mm', 'sol', 'Grès émaillé. 34 x 34 cm. Ép. 6,5 mm. Coloris terracotta. Le carton de 1,70 m². Joint conseillé 5mm. Plinthe 8 x 34 cm.', 'https://www.bricodepot.fr/images/page_prod_big/128000/128003.jpg', 1),
(23, 'Carrelage intérieur sol/mur décor calisson noir & blanc L.20 x l.20 cm', '03663602677697', 'noir/blanc', 'L.20 x l.20 cm', '6mm', 'sol/mur', 'Carrelage intérieur modèle \"Hydrolic\". Longueur: 20 cm x largeur: 20 cm. épaisseur: 10 mm. Grès cérame émaillé. Carrelages aspect carreau de ciment. Décor calisson. Coloris noir et blanc. Finition mat. Carrelage adapté à la pose au sol et mur. Compatible avec le chauffage au sol. Le carton de 1 m² (hors joint).', 'https://www.bricodepot.fr/images/page_prod_big/106500/106645.jpg', 2),
(24, 'Carrelage de sol intérieur terracotta \"Montovi\" 34 x 34 cm', '05059340192208', 'terracotta', '34 x 34 cm', '5mm', 'sol', 'Grès émaillé. 34 x 34 cm. Ép. 6,5 mm. Coloris terracotta. Le carton de 1,70 m². Joint conseillé 5mm. Plinthe 8 x 34 cm.', 'https://www.bricodepot.fr/images/page_prod_big/128000/128003.jpg', 1),
(25, 'Carrelage intérieur sol/mur décor calisson noir & blanc L.20 x l.20 cm', '03663602677697', 'noir/blanc', 'L.20 x l.20 cm', '5mm', 'sol/mur', 'Carrelage intérieur modèle \"Hydrolic\". Longueur: 20 cm x largeur: 20 cm. épaisseur: 10 mm. Grès cérame émaillé. Carrelages aspect carreau de ciment. Décor calisson. Coloris noir et blanc. Finition mat. Carrelage adapté à la pose au sol et mur. Compatible avec le chauffage au sol. Le carton de 1 m² (hors joint).', 'https://www.bricodepot.fr/images/page_prod_big/106500/106645.jpg', 2),
(26, 'Carrelage de sol intérieur terracotta \"Montovi\" 34 x 34 cm', '05059340192208', 'terracotta', '34 x 34 cm', '5mm', 'sol', 'Grès émaillé. 34 x 34 cm. Ép. 6,5 mm. Coloris terracotta. Le carton de 1,70 m². Joint conseillé 5mm. Plinthe 8 x 34 cm.', 'https://www.bricodepot.fr/images/page_prod_big/128000/128003.jpg', 1),
(27, 'Carrelage intérieur sol/mur décor calisson noir & blanc L.20 x l.20 cm', '03663602677697', 'noir/blanc', 'L.20 x l.20 cm', '10mm', 'sol/mur', 'Carrelage intérieur modèle \"Hydrolic\". Longueur: 20 cm x largeur: 20 cm. épaisseur: 10 mm. Grès cérame émaillé. Carrelages aspect carreau de ciment. Décor calisson. Coloris noir et blanc. Finition mat. Carrelage adapté à la pose au sol et mur. Compatible avec le chauffage au sol. Le carton de 1 m² (hors joint).', 'https://www.bricodepot.fr/images/page_prod_big/106500/106645.jpg', 2),
(28, 'Carrelage de sol intérieur terracotta \"Montovi\" 34 x 34 cm', '05059340192208', 'terracotta', '34 x 34 cm', '10mm', 'sol', 'Grès émaillé. 34 x 34 cm. Ép. 6,5 mm. Coloris terracotta. Le carton de 1,70 m². Joint conseillé 5mm. Plinthe 8 x 34 cm.', 'https://www.bricodepot.fr/images/page_prod_big/128000/128003.jpg', 1),
(29, 'Carrelage intérieur sol/mur décor calisson noir & blanc L.20 x l.20 cm', '03663602677697', 'noir/blanc', 'L.20 x l.20 cm', '2mm', 'sol/mur', 'Carrelage intérieur modèle \"Hydrolic\". Longueur: 20 cm x largeur: 20 cm. épaisseur: 10 mm. Grès cérame émaillé. Carrelages aspect carreau de ciment. Décor calisson. Coloris noir et blanc. Finition mat. Carrelage adapté à la pose au sol et mur. Compatible avec le chauffage au sol. Le carton de 1 m² (hors joint).', 'https://www.bricodepot.fr/images/page_prod_big/106500/106645.jpg', 2),
(30, 'Carrelage de sol intérieur terracotta \"Montovi\" 34 x 34 cm', '05059340192208', 'terracotta', '34 x 34 cm', '5mm', 'sol', 'Grès émaillé. 34 x 34 cm. Ép. 6,5 mm. Coloris terracotta. Le carton de 1,70 m². Joint conseillé 5mm. Plinthe 8 x 34 cm.', 'https://www.bricodepot.fr/images/page_prod_big/128000/128003.jpg', 1),
(31, 'Carrelage intérieur sol/mur décor calisson noir & blanc L.20 x l.20 cm', '03663602677697', 'noir/blanc', 'L.20 x l.20 cm', '5mm', 'sol/mur', 'Carrelage intérieur modèle \"Hydrolic\". Longueur: 20 cm x largeur: 20 cm. épaisseur: 10 mm. Grès cérame émaillé. Carrelages aspect carreau de ciment. Décor calisson. Coloris noir et blanc. Finition mat. Carrelage adapté à la pose au sol et mur. Compatible avec le chauffage au sol. Le carton de 1 m² (hors joint).', 'https://www.bricodepot.fr/images/page_prod_big/106500/106645.jpg', 2);

-- --------------------------------------------------------

--
-- Structure de la table `social`
--

CREATE TABLE `social` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `social`
--

INSERT INTO `social` (`id`, `name`, `url`, `icon`) VALUES
(1, 'Linkedin', '', '4'),
(2, 'Instagram', '', '2');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `is_admin`) VALUES
(1, 'liveandcare@plop.com', '$2b$10$92ZrSfrmHDcZzByxsFhUAujPswe6Ktp3Wbnep4WpQSLzy1BH5YYhu', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_category` (`id_category`);

--
-- Index pour la table `social`
--
ALTER TABLE `social`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `about`
--
ALTER TABLE `about`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `social`
--
ALTER TABLE `social`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `service_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
