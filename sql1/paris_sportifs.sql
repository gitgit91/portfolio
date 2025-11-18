-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 18 nov. 2025 à 11:07
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `paris_sportifs`
--

-- --------------------------------------------------------

--
-- Structure de la table `gain`
--

CREATE TABLE `gain` (
  `id_gain` int NOT NULL,
  `id_pari` int NOT NULL,
  `montant_gain` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gain`
--

INSERT INTO `gain` (`id_gain`, `id_pari`, `montant_gain`) VALUES
(1, 1, 35.00),
(2, 2, 0.00),
(3, 3, 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

CREATE TABLE `match` (
  `id_match` int NOT NULL,
  `equipe_dom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `equipe_ext` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_match` datetime NOT NULL,
  `id_sport` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `match`
--

INSERT INTO `match` (`id_match`, `equipe_dom`, `equipe_ext`, `date_match`, `id_sport`) VALUES
(1, 'PSG ', 'OM', '2025-11-18 10:53:54', 1),
(2, 'Lakers ', 'Bulls', '2025-11-18 10:53:54', 2),
(3, 'Nadal', 'Federer', '2025-11-18 10:53:54', 3);

-- --------------------------------------------------------

--
-- Structure de la table `pari`
--

CREATE TABLE `pari` (
  `id_paris` int NOT NULL,
  `id_user` int NOT NULL,
  `id_match` int NOT NULL,
  `id_typeparis` int NOT NULL,
  `mise` decimal(6,2) NOT NULL,
  `choix` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pari`
--

INSERT INTO `pari` (`id_paris`, `id_user`, `id_match`, `id_typeparis`, `mise`, `choix`) VALUES
(1, 6, 1, 2, 20.00, 'pari 1'),
(2, 7, 2, 3, 15.00, 'pari 2'),
(3, 5, 3, 1, 10.00, 'pari 3');

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

CREATE TABLE `sport` (
  `id_sport` int NOT NULL,
  `nom_sport` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`id_sport`, `nom_sport`) VALUES
(1, 'Football'),
(2, 'Basketball'),
(3, 'Tennis');

-- --------------------------------------------------------

--
-- Structure de la table `typeparis`
--

CREATE TABLE `typeparis` (
  `id_typeparis` int NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `typeparis`
--

INSERT INTO `typeparis` (`id_typeparis`, `description`) VALUES
(1, 'Vainqueur du match'),
(2, 'Nombre de buts/points'),
(3, 'Score exact');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_user` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_user`, `nom`, `prenom`, `email`) VALUES
(5, 'Lopez ', 'Sara', 'lopez@gmail.com'),
(6, 'Dupont ', 'Marc', 'dupont@gmail.com'),
(7, ' Idrissi ', ' Karim', 'idrissi@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `gain`
--
ALTER TABLE `gain`
  ADD PRIMARY KEY (`id_gain`),
  ADD KEY `id_pari` (`id_pari`);

--
-- Index pour la table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`id_match`),
  ADD KEY `id_sport` (`id_sport`);

--
-- Index pour la table `pari`
--
ALTER TABLE `pari`
  ADD PRIMARY KEY (`id_paris`),
  ADD KEY `id_typeparis` (`id_typeparis`),
  ADD KEY `id_match` (`id_match`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id_sport`);

--
-- Index pour la table `typeparis`
--
ALTER TABLE `typeparis`
  ADD PRIMARY KEY (`id_typeparis`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `gain`
--
ALTER TABLE `gain`
  MODIFY `id_gain` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `match`
--
ALTER TABLE `match`
  MODIFY `id_match` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `pari`
--
ALTER TABLE `pari`
  MODIFY `id_paris` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sport`
--
ALTER TABLE `sport`
  MODIFY `id_sport` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `typeparis`
--
ALTER TABLE `typeparis`
  MODIFY `id_typeparis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gain`
--
ALTER TABLE `gain`
  ADD CONSTRAINT `gain_ibfk_1` FOREIGN KEY (`id_pari`) REFERENCES `pari` (`id_paris`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`id_sport`) REFERENCES `sport` (`id_sport`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pari`
--
ALTER TABLE `pari`
  ADD CONSTRAINT `pari_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pari_ibfk_2` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pari_ibfk_3` FOREIGN KEY (`id_typeparis`) REFERENCES `typeparis` (`id_typeparis`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
