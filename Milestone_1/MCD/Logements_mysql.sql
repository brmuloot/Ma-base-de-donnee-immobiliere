CREATE DATABASE IF NOT EXISTS `LOGEMENTS` DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8_general_ci;
USE `LOGEMENTS`;

CREATE TABLE `ADRESSE_LOGEMENT` (
  `id_adresse` INTEGER(42) NOT NULL,
  `no_voie` INTEGER(42),
  `b/t/q` TEXTE,
  `code_voie` INTEGER,
  `code_id_commune` INTEGER,
  `voie` TEXTE,
  `type_de_voie` TEXTE,
  `prefixe_de_section` TEXTE,
  `section` INTEGER,
  `no_plan` INTEGER,
  `nombre_de_lot` INTEGER,
  `surface_terrain` FLOAT,
  PRIMARY KEY (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `COMMUNE` (
  `code_id_commune` INTEGER NOT NULL,
  `code_commune` INTEGER,
  `commune` TEXTE,
  `code_postal` FLOAT,
  `code_departement` TEXTE,
  PRIMARY KEY (`code_id_commune`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `LOGEMENT` (
  `id_logement` INTEGER NOT NULL,
  `type_local` TEXTE,
  `surface_reel_batie` FLOAT,
  `nombre_pieces_principales` INTEGER,
  PRIMARY KEY (`id_logement`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `LOT` (
  `id_lot` INTEGER NOT NULL,
  `1er_lot` FLOAT,
  `surface_carrez_du_1er_lot` FLOAT,
  `2eme_lot` FLOAT,
  `surface_carrez_du_2eme_lot` FLOAT,
  `3eme_lot` FLOAT,
  `surface_carrez_du_3eme_lot` FLOAT,
  `4eme_lot` FLOAT,
  `surface_carrez_du_4eme_lot` FLOAT,
  `5eme_lot` FLOAT,
  `surface_carrez_du_5eme_lot` FLOAT,
  PRIMARY KEY (`id_lot`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `MUTATION` (
  `id_mutation` INTEGER NOT NULL,
  `valeur_fonciere` FLOAT,
  `nature_mutation` TEXTE,
  `date_mutation` DATE,
  `no_dispositon` INTEGER,
  PRIMARY KEY (`id_mutation`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `APPARTIENT` (
  `id_lot` VARCHAR(42),
  `id_logement` VARCHAR(42),
  `id_logement_1` VARCHAR(42),
  `id_lot_1` VARCHAR(42),
  PRIMARY KEY (`id_lot`, `id_logement`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `POSSEDE` (
  `id_logement` VARCHAR(42),
  `id_adresse` VARCHAR(42),
  `id_logement_1` VARCHAR(42),
  `id_adresse_1` VARCHAR(42),
  PRIMARY KEY (`id_logement`, `id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `SUBIT` (
  `id_mutation` VARCHAR(42),
  `id_logement` VARCHAR(42),
  `id_logement_1` VARCHAR(42),
  `id_mutation_1` VARCHAR(42),
  PRIMARY KEY (`id_mutation`, `id_logement`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

ALTER TABLE `ADRESSE_LOGEMENT` ADD FOREIGN KEY (`code_id_commune`) REFERENCES `COMMUNE` (`code_id_commune`);
ALTER TABLE `APPARTIENT` ADD FOREIGN KEY (`id_logement`) REFERENCES `LOGEMENT` (`id_logement`);
ALTER TABLE `APPARTIENT` ADD FOREIGN KEY (`id_lot`) REFERENCES `LOT` (`id_lot`);
ALTER TABLE `POSSEDE` ADD FOREIGN KEY (`id_adresse`) REFERENCES `ADRESSE_LOGEMENT` (`id_adresse`);
ALTER TABLE `POSSEDE` ADD FOREIGN KEY (`id_logement`) REFERENCES `LOGEMENT` (`id_logement`);
ALTER TABLE `SUBIT` ADD FOREIGN KEY (`id_logement`) REFERENCES `LOGEMENT` (`id_logement`);
ALTER TABLE `SUBIT` ADD FOREIGN KEY (`id_mutation`) REFERENCES `MUTATION` (`id_mutation`);