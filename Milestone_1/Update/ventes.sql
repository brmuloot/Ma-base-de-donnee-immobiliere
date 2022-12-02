DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `codreg` varchar(42) NOT NULL,
  `reg_nom` text,
  `aca_nom` text,
  `regrp_nom` text,
  `ptot` int(11) DEFAULT NULL,
  `pcap` int(11) DEFAULT NULL,
  `pmun` int(11) DEFAULT NULL,
  PRIMARY KEY (`codreg`)
) ;

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `dep_code` varchar(42) NOT NULL,
  `dep_nom` text,
  `reg_code` varchar(42) DEFAULT NULL,
  PRIMARY KEY (`dep_code`),
  FOREIGN KEY (`reg_code`) REFERENCES `region` (`codreg`)
) ;

DROP TABLE IF EXISTS `commune`;
CREATE TABLE IF NOT EXISTS `commune` (
  `id_codedep_codecommune` varchar(42) NOT NULL,
  `code_commune` varchar(42) DEFAULT NULL,
  `code_postal` float DEFAULT NULL,
  `nom_commune` text,
  `dep_code` varchar(42) DEFAULT NULL,
  PRIMARY KEY (`id_codedep_codecommune`),
  FOREIGN KEY (`dep_code`) REFERENCES departement (`dep_code`)
) ;

DROP TABLE IF EXISTS `bien`;
CREATE TABLE IF NOT EXISTS `bien` (
  `id_bien` int(11) NOT NULL,
  `no_voie` int(11) DEFAULT NULL,
  `type_voie` text,
  `voie` text,
  `total_piece` int(11) DEFAULT NULL,
  `surface_carrez` float DEFAULT NULL,
  `surface_local` float DEFAULT NULL,
  `type_local` text,
  `id_codedep_codecommune` varchar(42) DEFAULT NULL,
  PRIMARY KEY (`id_bien`),
  FOREIGN KEY (`id_codedep_codecommune`) REFERENCES commune (`id_codedep_codecommune`)
) ;

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `id_vente` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `valeur` float DEFAULT NULL,
  PRIMARY KEY (`id_vente`)
) ;

DROP TABLE IF EXISTS `vendre`;
CREATE TABLE IF NOT EXISTS `vendre` (
  `id_vente` int(11) NOT NULL,
  `id_bien` int(11) NOT NULL,
  PRIMARY KEY (`id_vente`,`id_bien`),
  FOREIGN KEY (`id_bien`) REFERENCES bien (`id_bien`),
  FOREIGN KEY (`id_vente`) REFERENCES vente (`id_vente`)
);
