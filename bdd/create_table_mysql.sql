-- Table des utilisateurs
-- DROP TABLE IF EXISTS `T_USER_USR`;
CREATE TABLE T_USER_USR (
  USR_ID bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  USR_LOGIN varchar(255) NOT NULL,
  USR_MAIL varchar(255) NOT NULL,
  USR_NAME varchar(255) NOT NULL,
  USR_FIRSTNAME varchar(255) NOT NULL,
  USR_PASS varchar(40) NOT NULL,
  USR_LEVEL tinyint(20) NOT NULL DEFAULT 2,
  USR_AVATAR varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (USR_ID),
  UNIQUE (USR_LOGIN),
  UNIQUE (USR_MAIL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- Table des unités
-- DROP TABLE IF EXISTS T_UNIT_UNT;
CREATE TABLE T_UNIT_UNT (
  UNT_ID bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  UNT_LABEL varchar(30) NOT NULL,
  UNT_SHORT_LABEL varchar(15) NOT NULL,
  USR_ID bigint(20) unsigned NOT NULL,
  PRIMARY KEY (UNT_ID),
  UNIQUE (UNT_LABEL),
  UNIQUE (UNT_SHORT_LABEL),
  FOREIGN KEY (USR_ID) REFERENCES T_USER_USR(USR_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- Table des recettes
-- DROP TABLE IF EXISTS T_RECIPE_RCP;
CREATE TABLE T_RECIPE_RCP (
  RCP_ID bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  RCP_DATE_CREATE timestamp NOT NULL DEFAULT NOW(),
  RCP_DATE_MODIF timestamp NOT NULL DEFAULT NOW(),
  RCP_DATE_VALIDATION timestamp NOT NULL DEFAULT NOW(),
  RCP_TITLE varchar(80) NOT NULL,
  RCP_DESCRIPTION longtext NOT NULL,
  RCP_EXPLANATION longtext NOT NULL,
  RCP_TIME_PREPARATION time NOT NULL DEFAULT '00:00:00',
  RCP_TIME_COOKING time NULL DEFAULT '00:00:00',
  RCP_TIME_REST time NULL DEFAULT '00:00:00',
  RCP_DIFFICULTY ENUM("easy","average","hard") NOT NULL DEFAULT 'easy',
  RCP_COST ENUM("low","average","high") NOT NULL DEFAULT 'low',
  RCP_REVIEWED boolean NOT NULL DEFAULT FALSE,
  RCP_ILLUSTRATION varchar(80) NOT NULL,
  USR_ID bigint(20) unsigned NOT NULL,
  RCP_RESULT_TYPE ENUM("person","unit") NOT NULL DEFAULT 'person',
  RCP_RESULT_AMOUNT int NOT NULL,
  PRIMARY KEY (RCP_ID),
  FOREIGN KEY (USR_ID) REFERENCES T_USER_USR(USR_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- Table des catégories
-- DROP TABLE IF EXISTS T_CATEGORY_CAT;
CREATE TABLE T_CATEGORY_CAT (
  CAT_ID bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  CAT_LABEL varchar(255) NOT NULL,
  CAT_DESCRIPTION mediumtext NOT NULL,
  CAT_ILLUSTRATION varchar(80) NOT NULL,
  PRIMARY KEY (CAT_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- Table d'association entre recettes et  catégories
-- DROP TABLE IF EXISTS TJ_CAT_RCP;
CREATE TABLE TJ_CAT_RCP (
  CAT_ID bigint(20) unsigned NOT NULL,
  RCP_ID bigint(20) unsigned NOT NULL,
  FOREIGN KEY (CAT_ID) REFERENCES T_CATEGORY_CAT(CAT_ID),
  FOREIGN KEY (RCP_ID) REFERENCES T_RECIPE_RCP(RCP_ID),
  PRIMARY KEY (CAT_ID,RCP_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- Table des ingrédients
-- DROP TABLE IF EXISTS T_INGREDIENT_IGD;
CREATE TABLE T_INGREDIENT_IGD (
  IGD_ID bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  IGD_LABEL varchar(255) NOT NULL,
  IGD_DESCRIPTION mediumtext NOT NULL,
  IGD_ILLUSTRATION varchar(80) NULL DEFAULT NULL,
  USR_ID bigint(20) unsigned NULL DEFAULT NULL,
  PRIMARY KEY (IGD_ID),
  UNIQUE (IGD_LABEL),
  FOREIGN KEY (USR_ID) REFERENCES T_USER_USR(USR_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


-- Table d'association (composed) des recettes, ingédients et UNTtés
-- DROP TABLE IF EXISTS TJ_IGD_RCP_UNT;
CREATE TABLE TJ_IGD_RCP_UNT (
  RCP_ID bigint(20) unsigned NOT NULL,
  IGD_ID bigint(20) unsigned NOT NULL,
  UNT_ID bigint(20) unsigned NOT NULL,
  IGD_RCP_UNT_QUANTITY int(11) NOT NULL,
  FOREIGN KEY (RCP_ID) REFERENCES T_RECIPE_RCP(RCP_ID),
  FOREIGN KEY (IGD_ID) REFERENCES T_INGREDIENT_IGD(IGD_ID),
  FOREIGN KEY (UNT_ID) REFERENCES T_UNIT_UNT(UNT_ID),
  PRIMARY KEY (RCP_ID, IGD_ID, UNT_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- Table de commentaires
-- DROP TABLE IF EXISTS T_COMMENT_COM;
CREATE TABLE T_COMMENT_COM (
  COM_ID bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  COM_TEXT mediumtext NOT NULL,
  COM_DATE timestamp NOT NULL DEFAULT NOW(),
  USR_ID bigint(20) unsigned NULL,
  RCP_ID bigint(20) unsigned NOT NULL,
  PRIMARY KEY (COM_ID),
  FOREIGN KEY (USR_ID) REFERENCES T_USER_USR(USR_ID),
  FOREIGN KEY (RCP_ID) REFERENCES T_RECIPE_RCP(RCP_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


insert into T_USER_USR values(1,'napoleon789','laurentdoiteau@free.fr','Laurent','DOITEAU',sha1('pwdtest'),default,default);
insert into T_USER_USR values(2,'super_loic','superloic@lalaland.lalaland','Loïc','Escales',sha1('super mot de passe'),default,default);
insert into T_USER_USR values(3,'test','test@test.test','Test','TEST',sha1('test'),default,default);

insert into T_CATEGORY_CAT values(1,'Entrées','Pour commencer avec le sourire !','starter.jpg');
insert into T_CATEGORY_CAT values(2,'Plats','Pour avoir le ventre bien plein !','main_course.jpg');
insert into T_CATEGORY_CAT values(3,'Desserts','Pour finir en beauté !','dessert.jpg');

insert into T_RECIPE_RCP (RCP_ID, RCP_TITLE, RCP_DESCRIPTION, RCP_ILLUSTRATION, USR_ID, RCP_RESULT_AMOUNT) values (1, 'Salade', 'Pour commencer avec le sourire !', 'starter.jpg', 3, 0), (2, 'Fromage & salade', 'Pour commencer avec le sourire !', 'starter.jpg', 1, 0), (3, 'Cake olive', 'Pour commencer avec le sourire !', 'starter.jpg', 2, 0), (4, 'Ratatouille', 'Pour avoir le ventre bien plein !', 'main_course.jpg', 1, 0),(5, 'Frite & steak', 'Pour avoir le ventre bien plein !', 'main_course.jpg', 1, 0),(6, 'Pizza', 'Pour avoir le ventre bien plein !', 'main_course.jpg', 1, 0),(7,'Mugcake', 'Pour finir en beauté !', 'dessert.jpg', 2, 0),(8, 'Crème aux oeufs', 'Pour finir en beauté !', 'dessert.jpg', 1, 0),(9,'Chococo', 'Pour finir en beauté !', 'dessert.jpg', 3, 0);

insert into TJ_CAT_RCP values(1, 1);
insert into TJ_CAT_RCP values(1, 2);
insert into TJ_CAT_RCP values(1, 3);
insert into TJ_CAT_RCP values(2, 4);
insert into TJ_CAT_RCP values(2, 5);
insert into TJ_CAT_RCP values(2, 6);
insert into TJ_CAT_RCP values(3, 7);
insert into TJ_CAT_RCP values(3, 8);
insert into TJ_CAT_RCP values(3, 9);
