DROP TABLE IF EXISTS `alignment`;
DROP TABLE IF EXISTS `armor`;
DROP TABLE IF EXISTS `comunication`;
DROP TABLE IF EXISTS `creator`;
DROP TABLE IF EXISTS `creaturetype`;
DROP TABLE IF EXISTS `effect`;
DROP TABLE IF EXISTS `foe`;
DROP TABLE IF EXISTS `history`;
DROP TABLE IF EXISTS `itemtype`;
DROP TABLE IF EXISTS `itemcategory`;
DROP TABLE IF EXISTS `majornegativproperties`;
DROP TABLE IF EXISTS `majorproperties`;
DROP TABLE IF EXISTS `minorartefactproperties`;
DROP TABLE IF EXISTS `minornegativproperties`;
DROP TABLE IF EXISTS `minorproperties`;
DROP TABLE IF EXISTS `purpose`;
DROP TABLE IF EXISTS `quirks`;
DROP TABLE IF EXISTS `rarity`;
DROP TABLE IF EXISTS `senses`;
DROP TABLE IF EXISTS `weapons`;
-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2017 at 01:48 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Database: `dndgenerator`
--
-- --------------------------------------------------------
--
-- Table structure for table `alignment`
--
CREATE TABLE IF NOT EXISTS `alignment` (
  `id`        INT(11) NOT NULL,
  `alignment` VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `alignment`
--
INSERT INTO `alignment` (`id`, `alignment`) VALUES
  (1, 'Lawful Good'),
  (2, 'Neutral Good'),
  (3, 'Chaotic Good'),
  (4, 'Lawful Neutral'),
  (5, 'Neutral'),
  (6, 'Chaotic Neutral'),
  (7, 'Lawful Evil'),
  (8, 'Neutral Evil'),
  (9, 'Chaotic Evil');
-- --------------------------------------------------------
--
-- Table structure for table `armor`
--
CREATE TABLE IF NOT EXISTS `armor` (
  `id`                  INT(11)     NOT NULL,
  `armorName`           VARCHAR(255) DEFAULT NULL,
  `armorclass`          INT(11)      DEFAULT NULL,
  `hasDexMod`           TINYINT(1)  NOT NULL,
  `maxDexMod`           INT(11)      DEFAULT NULL,
  `strengthRequirment`  INT(11)      DEFAULT NULL,
  `stealthDisadvantage` TINYINT(1)  NOT NULL,
  `category`            VARCHAR(6)  NOT NULL,
  `weight`              FLOAT       NOT NULL,
  `price`               FLOAT       NOT NULL,
  `source`              VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `armor`
--
INSERT INTO `armor` (`id`, `armorName`, `armorclass`, `hasDexMod`, `maxDexMod`, `strengthRequirment`, `stealthDisadvantage`, `category`, `weight`, `price`, `source`)
VALUES
  (1, 'Padded Armor', 11, 1, NULL, NULL, 1, 'light', 8, 5, 'PHB'),
  (2, 'Leather Armor', 11, 1, NULL, NULL, 0, 'light', 10, 10, 'PHB'),
  (3, 'Studded Leather Armor', 12, 1, NULL, NULL, 0, 'light', 13, 45, 'PHB'),
  (4, 'Hide Armor', 12, 1, 2, NULL, 0, 'MEDIUM', 12, 10, 'PHB'),
  (5, 'CHAIN Shirt', 13, 1, 2, NULL, 0, 'MEDIUM', 20, 50, 'PHB'),
  (6, 'Scale Mail', 14, 1, 2, NULL, 1, 'MEDIUM', 45, 50, 'PHB'),
  (7, 'Breastplate', 14, 1, 2, NULL, 0, 'MEDIUM', 20, 400, 'PHB'),
  (8, 'Half Plate', 15, 1, 2, NULL, 1, 'MEDIUM', 40, 750, 'PHB'),
  (9, 'Ring Mail', 14, 0, NULL, NULL, 1, 'heavy', 40, 30, 'PHB'),
  (10, 'CHAIN Mail', 16, 0, NULL, 13, 1, 'heavy', 55, 75, 'PHB'),
  (11, 'Splint Armor', 17, 0, NULL, 15, 1, 'heavy', 60, 200, 'PHB'),
  (12, 'Plate Mail', 18, 0, NULL, 15, 1, 'heavy', 65, 1500, 'PHB'),
  (13, 'Shield', 2, 0, NULL, NULL, 0, 'shield', 6, 10, 'PHB'),
  (14, 'Ashigaru Armor', 11, 1, NULL, NULL, 1, 'light', 8, 5, 'HoO'),
  (15, 'Cord Armor', 11, 1, NULL, NULL, 0, 'light', 10, 10, 'HoO'),
  (16, 'Studded Leather Armor', 12, 1, NULL, NULL, 0, 'light', 13, 45, 'HoO'),
  (17, 'Reinforced Shozoku Armor', 13, 1, NULL, NULL, 0, 'light', 2, 3000, 'HoO'),
  (18, 'Dhenuka Armor', 12, 1, 2, NULL, 0, 'MEDIUM', 12, 10, 'HoO'),
  (19, 'Brigandine Shirt', 13, 1, 2, NULL, 0, 'MEDIUM', 20, 50, 'HoO'),
  (20, 'PARTIAL Armor', 14, 1, 2, NULL, 0, 'MEDIUM', 20, 400, 'HoO'),
  (21, 'Lamellar Armor', 15, 1, 2, NULL, 1, 'MEDIUM', 20, 750, 'HoO'),
  (22, 'Great Armor', 18, 0, NULL, 15, 1, 'heavy', 65, 1500, 'HoO'),
  (23, 'Te - DATE ', 2, 0, NULL, NULL, 0, 'shield', 6, 10, 'HoO');
-- --------------------------------------------------------
--
-- Table structure for table `comunication`
--
CREATE TABLE IF NOT EXISTS `comunication` (
  `id`   INT(11) NOT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `comunication`
--
INSERT INTO `comunication` (`id`, `text`) VALUES
  (1, 'The item communicates BY transmitting emotion TO the creature carrying OR wielding it.'),
  (2, 'The item can speak, READ, AND understand ONE OR more languages.'),
  (3, 'The item can speak, READ, AND understand ONE OR more languages.IN addition,
   the item can communicate telepathically WITH ANY CHARACTER that carries OR wields it.');
-- --------------------------------------------------------
--
-- Table structure for table `creator`
--
CREATE TABLE IF NOT EXISTS `creator` (
  `id`          INT(11) NOT NULL,
  `creatorType` VARCHAR(30) DEFAULT NULL,
  `text`        TEXT,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `creator`
--
INSERT INTO `creator` (`id`, `creatorType`, `text`) VALUES
  (1, 'Aberration', 'The item was created BY aberrations IN ancient times,
   possibly FOR the USE of favored humanoid thralls.WHEN seen FROM the corner of the eye,
   the item seems TO be moving.'),
  (2, 'Human', 'The item was created during the heyday of a fallen human kingdom, OR it IS tied TO a human of legend.It might hold writing IN a forgotten tongue OR symbols whose significance IS lost TO the ages.'),
  (3, 'Celestial', 'The weapon IS half the normal weight AND inscribed WITH feathered wings, suns, AND other symbols of good.Fiends find the items presence repulsive.'),
  (4, 'Dragon', 'This item IS made FROM scales AND talons shed BY a dragon.Perhaps it  incorporates precious metals AND gems FROM the dragons hoard.It grows slightly warm WHEN within  120 feet of a dragon.'),
  (5, 'Drow', 'The item IS half the normal weight.It IS black AND inscribed WITH spiders AND webs IN honor of Lolth.It might FUNCTION poorly, OR disintegrate, if exposed TO sunlight FOR 1 MINUTE OR more.'),
  (6, 'Dwarf', 'The item IS durable AND has Dwarven runes worked INTO its design.It might be associated WITH a clan that would LIKE TO see it returned TO their ancestral  halls.'),
  (7, 'Elemental Air', 'The item IS half the normal weight AND feels hollow.IF its made of fabric, it IS
                                                                                                      diaphanous.The
                                                                                                      item could have
                                                                                                           been BY OR
                                                                                                           FOR a djinnni
                                                                                                           .'),
  (8, 'Elemental Earth', 'This item might be crafted FROM stone.ANY cloth OR leather elements are studded WITH finely polished rock.The item could have been BY OR FOR a dao.'),
  (9, 'Elemental Fire', 'This item IS warm TO the touch, AND ANY metal parts are crafted FROM black iron.Sigils of flames cover its surface.Shades of red AND orange are the prominent colors.The item could have been BY OR FOR a efreeti.'),
  (10, 'Elemental Water', 'Lustrous fish scales REPLACE leather OR cloth ON this item, AND metal portions are instead crafted FROM seashells AND worked coral AS hard AS ANY metal.The item could have been BY OR FOR a marid.'),
  (11, 'Elf', 'The item IS half the normal weight.It IS adorned WITH symbols of nature:LEAVES, vines, stars, AND the LIKE.'),
  (12, 'Fey', 'The item IS exquisitely crafted FROM the finest materials AND glows WITH a pale radiance IN moonlight, shedding dim light IN a 5-foot radius ANY metal IN the item IS silver OR mithral, rather THAN iron OR steel.'),
  (13, 'Fiend', 'The item IS made of black iron OR horn inscribed WITH runes, AND ANY cloth OR leather components are crafted FROM the hide of fiends IS warm TO the touch AND features leering faces OR vile runes engraved ON its surface.Celestials find the items presence repulsive.'),
  (14, 'Abyssal Fiend', 'The item was made BY OR FOR a great demon.It IS warm TO the touch AND inscribed WITH demonic runes AND other markings.Celestials ﬁnd the item’s presence repulsive.The bearer IS immune TO the effects of Abyssal Corruption IN the Abyss.'),
  (15, 'Infenal Fiend', 'The item was made BY OR FOR a great devil.It IS warm TO the touch AND inscribed WITH diabolic runes AND other markings.Celestials ﬁnd the item’s presence repulsive.The bearer IS immune TO the effects of Pervasive Evil IN the Nine Hells.'),
  (16, 'Lower Fiend', 'The item was made BY OR FOR a great yugoloth.It IS made of black iron OR horn, AND ANY cloth OR leather components are crafted FROM the hides of ﬁends.The bearer IS immune TO the effects of Vile Transformation IN Hades AND Cruel Hindrance IN Gehenna.'),
  (17, 'Giant', 'The item IS larger THAN normal AND was crafted BY giants FOR USE BY their smaller allies.'),
  (18, 'Gnome', 'The item IS crafted TO appear ordinary AND it might look worn.It could also incorporate gears AND mechanical components, even IF these are NOT essential TO the items FUNCTION '),
  (19, 'Hobgoblin', 'The item was created AS tribute FOR a legendary hobgoblin warlord.Its appearance OR markings are distinctive AND likely TO draw the attention of goblinoids.'),
  (20, 'Orc', 'The item was created AS tribute FOR a legendary orc ruler.Its appearance OR markings are distinctive AND likely TO draw the attention of orcs.'),
  (21, 'OUTER Planes', 'The item was made BY OR FOR a traveler of the wild OUTER planes.It IS inscribed WITH sigils of Pandemonium AND Acheron.The bearer IS immune TO the effects of Mad Winds AND Bloodlust.'),
  (22, 'Undead', 'The item incorporates imagery of death such AS bones AND skulls, AND it might be crafted FROM parts
                                                                                          of corpses.It feels cold TO
   the touch.'),
  (23, 'Yuan - Ti',
   'The item was crafted LONG ago FOR a fallen yuan-ti empire.It IS serpentine AND sinuous IN design, OR inscribed WITH
                                                                                                          serpentine
                                                                                                          markings.Its
                                                                                                          appearance IS
                                                                                                          likely TO draw
   the attention of yuan - ti.'),
  (24, 'Shadowfell', 'The item was made IN OR FOR the Shadowfell.Its coloration IS muted OR shadowy,
   mostly black AND gray.The bearer IS immune TO the effects of Shadowfell Despair.');
-- --------------------------------------------------------
--
-- Table structure for table `creaturetype`
--
CREATE TABLE IF NOT EXISTS `creaturetype` (
  `id`           INT(11)     NOT NULL,
  `creaturetype` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `creaturetype`
--
INSERT INTO `creaturetype` (`id`, `creaturetype`) VALUES
  (1, 'Aberration'),
  (2, 'Beast'),
  (3, 'Celestial'),
  (4, 'Construct'),
  (5, 'Dragon'),
  (6, 'Elemental'),
  (7, 'Fey'),
  (8, 'Fiend'),
  (9, 'Giant'),
  (10, 'Humanoid'),
  (11, 'Monstrosity'),
  (12, 'Ooze'),
  (13, 'Plant'),
  (14, 'Undead'),
  (15, 'Demon'),
  (16, 'Devil'),
  (17, 'Shapechanger'),
  (18, 'Titan'),
  (19, 'Yugoloth');
-- --------------------------------------------------------
--
-- Table structure for table `effect`
--
CREATE TABLE IF NOT EXISTS `effect` (
  `id`         INT(11) NOT NULL,
  `effectType` VARCHAR(30) DEFAULT NULL,
  `text`       TEXT,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
-- --------------------------------------------------------
--
-- Table structure for table `foe`
--
CREATE TABLE IF NOT EXISTS `foe` (
  `id`      INT(11) NOT NULL,
  `foeType` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `foe`
--
INSERT INTO `foe` (`id`, `foeType`) VALUES
  (1, 'Aberration'),
  (2, 'Beast'),
  (3, 'Celestial'),
  (4, 'Construct'),
  (5, 'Dragon'),
  (6, 'Elemental'),
  (7, 'Fey'),
  (8, 'Fiend'),
  (9, 'Giant'),
  (10, 'Humanoid (dwarf)'),
  (11, 'Humanoid (elf)'),
  (12, 'Humanoid (gnome)'),
  (13, 'Humanoid (goblinoid)'),
  (14, 'Humanoid (gnoll)'),
  (15, 'Humanoid (halfling)'),
  (16, 'Humanoid (human)'),
  (17, 'Humanoid (orc)'),
  (18, 'Humanoid (dwarf)'),
  (19, 'Humanoid (dwarf)'),
  (20, 'Humanoid (dwarf)'),
  (21, 'Aquatic Humanoid (bullywugs, kuo-toa, merfolk, AND sahuagin)'),
  (22, 'Avian Humanoid (aarakocra AND kenku)'),
  (23, 'Reptilian humanoids (kobolds, lizardfolk, AND troglodytes)'),
  (24, 'Monstrosity'),
  (25, 'Ooze'),
  (26, 'Plant'),
  (27, 'Undead'),
  (28, 'Demon'),
  (29, 'Devil'),
  (30, 'Shapechanger'),
  (31, 'Titan'),
  (32, 'Yugoloth');
-- --------------------------------------------------------
--
-- Table structure for table `history`
--
CREATE TABLE IF NOT EXISTS `history` (
  `id`    INT(11) NOT NULL,
  `theme` VARCHAR(30) DEFAULT NULL,
  `text`  TEXT,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `history`
--
INSERT INTO `history` (`id`, `theme`, `text`) VALUES
  (1, 'Arcane',
   'This item was created FOR ( OR BY ) an ancient ORDER of spellcasters AND bears the ORDER ’s symbol.'),
  (2, 'Bane', 'This item was created BY the foes of a particular culture OR kind of creature.IF the culture OR cultures are still around, they might recognize the item AND single OUT the bearer AS an enemy.'),
  (3, 'Exotic', 'This item IS FROM a distant FOREIGN land, such AS Kara-Tur IN the Forgotten Realms.WHILE the item functions normally, it has an exotic design AND Wuxia NAME (see Dungeon MASTER ’s Guide, p.41)'),
  (4, 'Heroic', ' A great hero once wielded this item.Anyone who’s familiar WITH the item’s history expects great deeds FROM the new OWNER.'),
  (5, 'Ornament', 'The item was created TO honor a special occasion.Inset gemstones, gold OR platinum
                                                                                        inlays, AND gold OR silver ﬁligree adorn its surface.'),
  (6, 'Prophecy', 'The item features IN a prophecy:its bearer IS destined TO play a KEY role IN future EVENTS.Someone ELSE who wants TO play that role might try TO steal the item, OR someone who wants TO prevent the prophecy FROM being fulﬁlled might try TO KILL the item’s bearer.'),
  (7, 'Religious', 'This item was used IN religious ceremonies dedicated TO a particular deity.It has holy symbols worked INTO it.The god’s followers might try TO persuade its OWNER TO donate it TO a temple, steal the item FOR themselves, OR celebrate its USE BY a cleric OR paladin of the same deity.'),
  (8, 'Sinister', 'This item IS linked TO a deed of great evil, such AS a massacre OR an assassination.It might have a NAME OR be closely associated WITH a villain who used it.Anyone familiar WITH the item’s history IS likely TO treat it AND its OWNER WITH suspicion.'),
  (9, 'Symbol of Justice', 'This item was once used BY famed protectors, OR IN a celebrated defense of a people.Anyone familiar WITH the item’s history might expect the new OWNER TO ﬁght FOR justice too.'),
  (10, 'Symbol of Power', 'This item was once used AS part of royal regalia OR AS a badge of high ofﬁce.Its former OWNER OR that person’s descendants might desire it, OR someone might mistakenly assume its new OWNER IS the item’s legitimate inheritor.'),
  (11, 'Trademark', 'This item was crafted BY a renowned maker AND bears his OR her mark.Possibly it was made FOR a particular individual OR purpose.Anyone familiar WITH the maker’s mark may question how the new OWNER came TO possess it.');
-- --------------------------------------------------------
--
-- Table structure for table `itemcategory`
--
CREATE TABLE IF NOT EXISTS `itemcategory` (
  `id`   INT(11) NOT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `itemcategory`
--
INSERT INTO `itemcategory` (`id`, `text`) VALUES
  (1, 'Weapon'),
  (2, 'Armor'),
  (3, 'Adventuring Gear'),
  (4, 'Potion'),
  (5, 'Ring'),
  (6, 'Rod'),
  (7, 'Scroll'),
  (8, 'Wondrous Item'),
  (9, 'Tools');
-- --------------------------------------------------------
--
-- Table structure for table `itemtype`
--
CREATE TABLE IF NOT EXISTS `itemtype` (
  `id`              INT(11) NOT NULL,
  `itemType`        VARCHAR(30) DEFAULT NULL,
  `FK_itemcategory` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_itemcategory` FOREIGN KEY (`FK_itemcategory`) REFERENCES `itemcategory` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `itemtype`CONSTRAINT `FK_itemcategory` FOREIGN KEY (`FK_itemcategory`) REFERENCES `itemcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
INSERT INTO `itemtype` (`id`, `itemType`, `FK_itemcategory`) VALUES
  (1, 'Light', 2),
  (2, 'MEDIUM', 2),
  (3, 'Heavy', 2),
  (4, 'SIMPLE Melee', 1),
  (5, 'SIMPLE Ranged', 1),
  (6, 'Martial Melee', 1),
  (7, 'Martial Ranged', 1),
  (8, 'GENERAL', 3),
  (9, 'Ammunition', 3),
  (10, 'Arcane Focus', 3),
  (11, 'Druidic Focus', 3),
  (12, 'Holy Symbol', 3),
  (13, 'GENERAL', 9),
  (14, 'Artisans Tools', 9),
  (15, 'Gaming SET ', 9),
  (16, 'Musical Instrument', 9),
  (17, 'GENERAL', 4),
  (18, 'GENERAL', 5),
  (19, 'GENERAL', 6),
  (20, 'GENERAL', 7);
-- --------------------------------------------------------
--
-- Table structure for table `majornegativproperties`
--
CREATE TABLE IF NOT EXISTS `majornegativproperties` (
  `id`   INT(11) NOT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
--
-- Dumping data for table `majornegativproperties`
--
INSERT INTO `majornegativproperties` (`id`, `text`) VALUES
  (1, 'WHILE you are attuned TO the artifact, your body rots over the course of four days,
   after which the rotting stops.You lose your hair BY the END of DAY 1, finger tips AND toe tips BY the END of DAY 2,
   lips AND nose BY the END of DAY 3, AND ears BY the END of DAY 4. A regenerate spell restores lost body parts '),
  (2, 'WHILE you are attuned TO the artifact, you determine your alignment daily AT dawn BY rolling a d6 twice.ON the FIRST roll, a 1 - 2 indicates lawful,
   3 - 4 neutral, AND S - 6 chaotic.ON the SECOND roll, a 1 - 2 indicates good, 3 - 4 neutral, AND S - 6 evil.'),
  (3, 'WHEN you FIRST attune TO the artifact, it gives you a quest determined BY the DM.You must complete this quest AS IF affected BY the geas spell.Once you complete the quest, you are NO longer affected BY this property.'),
  (4, 'The artifact houses a bodiless life FORCE that IS hostile toward you.EACH TIME you USE an ACTION TO USE ONE of the artifacts properties,
   there IS a 50 percent chance that the life FORCE tries TO LEAVE the artifact AND enter your body.IF you fail a DC 20
   Charisma saving
   throw, it succeeds, AND you become an NPC under the DMs control UNTIL the intruding life FORCE IS banished USING magic such AS the dispel evil AND good spell.'),
  (5, 'Creatures WITH a challenge rating of O, AS well AS plants that are NOT creatures, DROP TO 0 hit points WHEN within 10 feet of the artifact.'),
  (6, 'The artifact imprisons a death slaad (see the Monster Manual).EACH TIME you USE ONE of the artifacts properties AS an ACTION, the slaad has a 10 percent chance of escaping, whereupon it appears within 15 feet of you AND attacks you.'),
  (7, 'WHILE you are attuned TO the artifact, creatures of a particular type other THAN humanoid ( AS chosen BY the DM) are ALWAYS hostile toward you.'),
  (8, 'The artifact dilutes magic potions within 10 feet of it, rendering them nonmagical.'),
  (9, 'The artifact erases magic scrolls within 10 feet of it, rendering them nonmagical.'),
  (10, 'BEFORE USING ONE of the artifacts properties AS an ACTION, you must USE a bonus ACTION TO draw blood, either FROM yourself OR FROM a willing OR incapacitated creature within your reach, USING a piercing OR slashing melee weapon.The SUBJECT takes 1d4 damage of the appropriate type.'),
  (11, 'WHEN you become attuned TO the artifact, you gain a form of LONG -term madness (see chapter 8, \"Running the Game\"). '),
  (12, 'You take 4d10 psychic damage WHEN you become attuned TO the artifact.'),
  (13, 'You take 8d10 psychic damage WHEN you become attuned TO th e artifact.'),
  (14, ' BEFORE you can become attuned TO the artifact, you must kil l a creature of your alignment.'),
  (15, ' WHEN you become attuned TO the artifact, ONE of your ability scores IS reduced BY 2 AT random.A greater restoration spell restores the ability TO normal.'),
  (16, ' EACH TIME you become attuned TO the artifact, you age 3d10 years.You must succeed ON a DC 10 Constitution saving throw OR die FROM the shock.IF you die, you are instantly transformed INTO a wight (see the Monster Manual ) un de r the DMs control that IS sworn TO protect the artifact.'),
  (17, ' WHILE attuned TO the artifact, you lose the ability TO speak.'),
  (18, ' WHILE attuned TO the artifact, you have vulnerability TO ALL damage.'),
  (19, ' WHEN you become attuned TO the artifact, there IS a 10 percent chance that you attract the attention of a god that sends an avatar TO wrest the artifact FROM you.The avatar has the same alignment AS its creator AND the statistics of an empyrean (see the Monster Manual).Once it obtains the artifact, the avatar vanishes.');
-- --------------------------------------------------------
--
-- Table structure for table `majorproperties`
--
CREATE TABLE IF NOT EXISTS `majorproperties` (
  `id` INT (11) NOT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
) ENGINE =InnoDB DEFAULT CHARSET =utf8;
--
-- Dumping data for table `majorproperties`
--
INSERT INTO `majorproperties` (`id`, `text`) VALUES
  (1, ' WHILE attuned TO the artifact, ONE of your ability scores (DMs choice) increases BY 2, TO a maximum of 24.'),
  (2, ' WHILE attuned TO the artifact, you regain ld6 hit points AT the START of your turn IF you have AT least l hit POINT.'),
  (3, ' WHEN you hit WITH a weapon attack WHILE attuned TO the artifact, the target takes an extra l d6 damage of the weapons type.'),
  (4, ' WHILE attuned TO the artifact, your walking speed increases BY 10 feet.'),
  (5, ' WHILE attuned TO the artifact, you can USE an ACTION TO cast ONE 4th- LEVEL spell (chosen BY the DM) FROM it.AFTER you cast the spell, roll a d6.ON a roll of l - 5, you can NOT cast it again UNTIL the NEXT dawn.'),
  (6, ' WHILE attuned TO the artifact, you can USE an ACTION TO cast ONE 5th- LEVEL spell (chosen BY the DM) FROM it.AFTER you cast the spell, roll a d6.ON a roll of l - 5, you can NOT cast it again UNTIL the NEXT dawn.'),
  (7, ' WHILE attuned TO the artifact, you can USE an ACTION TO cast ONE 6th- LEVEL spell (chosen BY the DM) FROM it.AFTER you cast the spell, roll a d6.ON a roll of l - 5, you can NOT cast it again UNTIL the NEXT dawn.'),
  (8, ' WHILE attuned TO the artifact, you can USE an ACTION TO cast ONE 7th- LEVEL spell (chosen BY the DM) FROM it.AFTER you cast the spell, roll a d6.ON a roll of l - 5, you can NOT cast it again UNTIL the NEXT dawn.'),
  (9, ' WHILE attun ed TO the artifa ct, you can NOT be blinded, deafened, petrified, OR stunned.');
-- --------------------------------------------------------
--
-- Table structure for table `minorartefactproperties`
--
CREATE TABLE IF NOT EXISTS `minorartefactproperties` (
  `id` INT (11) NOT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
) ENGINE =InnoDB DEFAULT CHARSET =utf8;
--
-- Dumping data for table `minorartefactproperties`
--
INSERT INTO `minorartefactproperties` (`id`, `text`) VALUES
  (1, ' WHILE attuned TO the artifact, you gain proficiency IN ONE skill of the DMs choice.'),
  (2, ' WHILE attuned TO the artifact, you are immune TO disease.'),
  (3, ' WHILE attuned TO the artifact, you can NOT be charmed OR frightened.'),
  (4, ' WHILE attuned TO the artifact, you have resistance against ONE damage type of the DMs choice.'),
  (5, ' WHILE attuned TO the artifact, you can USE an ACTION TO cast ONE cantrip (chosen BY the DM) FROM it.'),
  (6, ' WHILE attuned TO the artifact, you can USE an ACTION TO cast ONE 1st- LEVEL spell (chosen BY the DM) FROM it.AFTER you cast the spell, roll a d6.ON a roll of l -5, you can NOT cast it again UNTIL the NEXT dawn.'),
  (7, ' WHILE attuned TO the artifact, you can USE an ACTION TO cast ONE 2nd- LEVEL spell (chosen BY the DM) FROM it.AFTER you cast the spell, roll a d6.ON a roll of l -5, you can NOT cast it again UNTIL the NEXT dawn.'),
  (8, ' WHILE attuned TO the artifact, you can USE an ACTION TO cast ONE 3rd- LEVEL spell (chosen BY the DM) FROM it.AFTER you cast the spell, roll a d6.ON a roll of l -5, you can NOT cast it again UNTIL the NEXT dawn.'),
  (9, ' WHILE attuned TO the artifact, you gain a +l bonus TO Armor Class.');
-- --------------------------------------------------------
--
-- Table structure for table `minornegativproperties`
--
CREATE TABLE IF NOT EXISTS `minornegativproperties` (
  `id` INT (11) NOT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
) ENGINE =InnoDB DEFAULT CHARSET =utf8;
--
-- Dumping data for table `minornegativproperties`
--
INSERT INTO `minornegativproperties` (`id`, `text`) VALUES
  (1, ' WHILE attuned TO the artifact, you have disadvantage ON saving throws against spells.'),
  (2, 'The FIRST TIME you touch a gem OR piece of jewelry WHILE attuned TO this artifact, the VALUE of the gem OR jewelry IS reduced BY half.'),
  (3, ' WHILE attuned TO the artifact, you are blinded WHEN you are more THAN 10 feet away FROM it.'),
  (4, ' WHILE attuned TO the artifact, you have disadvantage ON saving throws against poison.'),
  (5, ' WHILE attuned TO the artifact, you emit a sour stench noticeable FROM up TO 10 feet away.'),
  (6, ' WHILE attuned TO the artifact, ALL holy water within 10 feet of you IS destroyed.'),
  (7, ' WHILE attuned TO the artifact, you are physically ill AND have disadvantage ON ANY ability CHECK OR saving throw that uses Strength OR Constitution.'),
  (8, ' WHILE attuned TO the artifact, your weight increases BY 1d4 x 10 pounds.'),
  (9, ' WHILE attuned TO the artifact, your appearance changes AS the DM decides.'),
  (10, ' WHILE attuned TO the artifact, you are deafened WHEN you are more THAN 10 feet away FROM it.'),
  (11, ' WHILE attuned TO the artifact, your weight drops BY 1d4 x 5 pounds.'),
  (12, ' WHILE attuned TO the artifact, you can NOT smell.'),
  (13, ' WHILE attuned TO the artifact, non magical flames are extinguished within 30 feet of you.'),
  (14, ' WHILE you are attuned TO the artifact, other creatures can NOT take short OR LONG rests WHILE within 300 feet of you.'),
  (15, ' WHILE attuned TO the artifact, you deal 1d6 necrotic damage TO ANY plant you touch that IS NOT a creature.'),
  (16, ' WHILE you are attuned TO the artifact, animals within 30 feet of you are hostile toward you.'),
  (17, ' WHILE attuned TO the artifact, you must eat AND drink six times the normal amount EACH DAY.'),
  (18, ' WHILE you are attuned TO the artifact, your flaw IS amplified IN a way determined BY the DM.');
-- --------------------------------------------------------
--
-- Table structure for table `minorproperties`
--
CREATE TABLE IF NOT EXISTS `minorproperties` (
  `id` INT (11) NOT NULL,
  `title` VARCHAR (30) DEFAULT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
) ENGINE =InnoDB DEFAULT CHARSET =utf8;
--
-- Dumping data for table `minorproperties`
--
INSERT INTO `minorproperties` (`id`, `title`, `text`) VALUES
  (1, 'Absorbing', 'The item has a mirror- LIKE sheen.WHILE equipped, radiant damage taken BY the bearer IS reduced BY 3.'),
  (2, 'Aquatic', 'This item IS suited FOR aquatic USE AND ignores the restrictions of underwater combat (Player’s Handbook, p.198).Its weight OR bulkiness doesn’t impede swimming.'),
  (3, 'Athletic', 'The item IS especially sturdy.It gives the bearer advantage ON Strength (Athletics) checks.'),
  (4, 'Beacon', 'The bearer can USE a bonus ACTION TO cause the item TO shed bright light IN a 10-foot radius AND dim light FOR an additional 10 feet, OR TO extinguish the light.'),
  (5, 'Beast Friend', 'The item gives the bearer advantage ON Wisdom (Animal Handling) checks.'),
  (6, 'Brave', 'The item gives the bearer advantage ON saving throws against being frightened.'),
  (7, 'Chilling', 'The item IS cool TO the touch.WHILE equipped, ﬁre damage taken BY the bearer IS reduced BY 3.'),
  (8, 'Compass', 'The wielder can USE an ACTION TO learn which way IS north.'),
  (9, 'Curing', 'The item IS engraved WITH a symbol of health. AS a bonus ACTION, the bearer may touch the symbol AND regain 2d4 hit points.Alternatively, AS an ACTION the item may produce a piece of fruit OR a potion that anyone can consume within 1 MINUTE TO regain 2d4 hit points.The symbol vanishes AFTER being used.It RETURNS AND can be used again daily AT dawn.'),
  (10, 'Dampening', 'The item dulls sound made WHEN it touches other objects.WHILE equipped, thunder damage taken BY the bearer IS reduced BY 3.'),
  (11, 'Delver', ' WHILE underground, the bearer ALWAYS knows the item’s depth below the surface AND the direction TO the nearest staircase, ramp, OR other path LEADING upward.'),
  (12, 'Deceptive', 'The item gives the bearer advantage ON Charisma (Deception) checks.'),
  (13, 'Foe Bane', 'Choose ( OR roll randomly) a speciﬁc kind of creature.The item IS +1 higher WHEN attacking OR defending against such creatures.A weapon instead could inﬂict an extra 1d4 damage WHEN it hits such creatures.The item has a rune OR engraving that indicates its foe.'),
  (14, 'Gleaming', 'The item NEVER gets dirty.'),
  (15, 'Grounding', 'The item smells LIKE earthy soil.WHILE equipped, lightning damage taken BY the bearer IS reduced BY 3.'),
  (16, 'Guardian', 'The item whispers WARNINGS TO its bearer, granting a +2 bonus TO initiative IF the bearer isn’t incapacitated.'),
  (17, 'Harmonious', 'Attuning TO this item takes only 1 MINUTE.'),
  (18, 'Healer', 'The item gives the bearer advantage ON Wisdom (Medicine) checks.'),
  (19, 'Hidden Message', 'A message IS hidden somewhere ON the item.It might be visible only AT a certain TIME of the YEAR, under the light of ONE PHASE of the moon, OR IN a speciﬁc location.'),
  (20, 'Insightful', 'The item gives the bearer advantage ON Wisdom (Insight) checks'),
  (21, 'Inspiring', 'This item IS especially glorious IN design.It gives inspiration (Player’s Handbook, p.125) TO the bearer whenever he OR she rolls a 20 ON ONE particular kind of roll (DM’s choice of attack rolls, saving throws, OR skill checks).'),
  (22, 'Intimidating', 'The item IS especially fearsome IN design.It gives the bearer advantage ON Charisma (Intimidation) checks.'),
  (23, 'Investigator', 'The item gives the bearer advantage ON Intelligence (Investigation) checks.'),
  (24, ' KEY ', 'The item IS used TO UNLOCK a container, chamber, vault, OR other entryway.'),
  (25, ' LANGUAGE ', 'The bearer can speak AND understand a LANGUAGE of the DM’s choice WHILE the item IS ON the bearer’s person.'),
  (26, 'Lifesaver', 'This item gives the bearer advantage ON death saving throws.'),
  (27, 'Lore Giver', 'This item IS inscribed WITH lore OR whispers knowledge TO its bearer.It gives the bearer advantage ON checks USING ONE particular Intelligence skill (DM’s choice of Arcana, History, Nature, OR Religion).'),
  (28, 'Mental', 'The item IS outlined BY faint emerald light.WHILE equipped, psychic damage taken BY the bearer IS reduced BY 3.'),
  (29, 'Neutralizing', 'The item appears TO have a glassy sheen.WHILE equipped, acid damage taken BY the bearer IS reduced BY 3.'),
  (30, 'Nimble', 'The item IS surprisingly ﬂexible.It gives the bearer advantage ON checks USING ONE particular Dexterity skill (DM’s choice of Acrobatics, Sleight of Hand, OR Stealth).'),
  (31, 'Perceptive', 'The item gives the bearer advantage ON Wisdom (Perception) checks.'),
  (32, 'Persuasive', 'The item IS exceptionally beautiful IN design.It gives the bearer advantage ON Charisma (Persuasion) checks.'),
  (33, 'Purifying', 'The item smells clean AND antiseptic.WHILE equipped, poison damage taken BY the bearer IS reduced BY 3.'),
  (34, 'Rejuvenating', ' WHEN the bearer spends Hit Dice, the result of the ﬁrst die IS automatically the maximum amount.'),
  (35, 'Resolute', 'The item gives the bearer advantage ON saving throws against being charmed.'),
  (36, 'Revealing', ' An invisible target IN physical contact WITH the item’s bearer becomes visible.AT the END of the bearer’s NEXT turn, the target becomes invisible again ( IF the effect’s duration hasn’t ended).'),
  (37, 'Sentinel', 'Choose ( OR roll randomly) a kind of creature (usually an enemy of the item’s creator).This item glows faintly WHEN such creatures are within 120 feet of it'),
  (38, 'Shielding', 'The item faintly hums WITH unseen FORCE.WHILE equipped, FORCE damage taken BY the bearer IS reduced BY 3.'),
  (39, 'Song Craft', 'Whenever this item IS struck OR IS used TO strike a foe, its bearer hears a fragment of an ancient song'),
  (40, 'Strange Material', 'The item was crafted FROM a material that IS bizarre given its purpose.Its durability IS unaffected.'),
  (41, 'Survivor', 'The item gives the bearer advantage ON Wisdom (Survival) checks.'),
  (42, 'Temperate', 'The bearer suffers NO harm IN temperatures AS cold AS -20 degrees OR AS warm AS 120 degree Fahrenheit.'),
  (43, 'Unbreakable', 'This item can’t be broken.Special means must be used TO destroy it.'),
  (44, 'Vitalizing', 'The item faintly sparkles.WHILE equipped, necrotic damage taken BY the bearer IS reduced BY 3.'),
  (45, 'War Leader', 'The bearer can USE an ACTION TO cause his OR her voice TO be canrry clearly FOR up TO 300 feet UNTIL the END of the bearer’s NEXT turn.'),
  (46, 'Warming', 'The item IS warm TO the touch.WHILE equipped, cold damage taken BY the bearer IS reduced BY 3.'),
  (47, 'Watchful', 'The item IS imbued WITH alertness.The bearer gains advantage ON Dexterity saving throws against traps AND IS automatically awakened FROM NATURAL sleep WHEN threatened WITH harm.'),
  (48, 'Waterborne', 'This item ﬂoats ON water AND other liquids.Its bearer has advantage ON Strength (Athletics) checks TO swim.'),
  (49, 'Illusion', 'The item IS imbued WITH illusion magic, allowing its bearer TO ALTER the items’ appearance IN minor ways.Such alterations don’t CHANGE how the item IS worn, carried, OR wielded, AND they have NO effect ON its other magical properties.FOR example, the wearer could make red robe appear blue, OR make a gold ring look LIKE it’s made of ivory.The item reverts TO its TRUE appearance WHEN NO ONE ’s carrying OR wearing it.');
-- --------------------------------------------------------
--
-- Table structure for table `purpose`
--
CREATE TABLE IF NOT EXISTS `purpose` (
  `id` INT (11) NOT NULL,
  `title` VARCHAR (30) NOT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
) ENGINE =InnoDB DEFAULT CHARSET =utf8;
--
-- Dumping data for table `purpose`
--
INSERT INTO `purpose` (`id`, `title`, `text`) VALUES
  (1, 'Aligned', 'The item seeks TO defeat OR destroy those of a diametrically opposed alignment.(Such an item IS NEVER neutral.) '),
  (2, 'Bane', 'The item seeks TO defeat OR destroy creatures of a particular kind, such AS fiends, shapechangers, trolls, OR wizards.'),
  (3, 'Protector', 'The item seeks TO defend a particular race OR kind of creature, such AS elves OR druids.'),
  (4, 'Crusader', 'The item seeks TO defeat, weaken, OR destroy the servants of a particular deity.'),
  (5, 'Templar', 'The item seeks TO defend the servants AND interests of a particular deity.'),
  (6, 'Destroyer', 'The item craves destruction AND goads its USER TO fight arbitrarily.'),
  (7, 'Glory Seeker', 'The item seeks renown AS the greatest magic item IN the world, BY establishing its USER AS a famous OR notorious figure.'),
  (8, 'Lore Seeker', 'The item craves knowledge OR IS determined TO solve a mystery, learn a secret, OR unravel a cryptic prophecy.'),
  (9, 'Destiny Seeker', 'The item IS convinced that it AND its wielder have KEY roles TO play IN future EVENTS.'),
  (10, 'Creator Seeker', 'The item seeks its creator AND wants TO understand why it was created.');
-- --------------------------------------------------------
--
-- Table structure for table `quirks`
--
CREATE TABLE IF NOT EXISTS `quirks` (
  `id` INT (11) NOT NULL,
  `theme` VARCHAR (30) DEFAULT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
) ENGINE =InnoDB DEFAULT CHARSET =utf8;
--
-- Dumping data for table `quirks`
--
INSERT INTO `quirks` (`id`, `theme`, `text`) VALUES
  (1, 'Blissful', ' WHILE IN possession of the item, the bearer feels fortunate AND optimistic about what the future holds.Butterﬂies AND other harmless creatures might frolic IN the item’s presence'),
  (2, 'Confident', 'The item helps its bearer feel self-assured.'),
  (3, 'Conscientious', ' WHEN the bearer of this item contemplates OR undertakes a malevolent act, the item enhances pangs of conscience.'),
  (4, 'Covetous', 'The item’s bearer becomes obsessed WITH material wealth.'),
  (5, 'Fastidious', 'The item’s bearer becomes obsessed WITH keeping clean, including cleaning the item.'),
  (6, 'Frail', 'The item crumbles, frays, chips, OR cracks slightly WHEN wielded, worn, OR activated.This quirk has NO effect ON its properties, but IF the item has seen much USE, it looks decrepit.'),
  (7, 'Gallant', 'The item’s bearer become obsessed WITH being polite AND helpful TO the other gender.'),
  (8, 'Generous', 'This item’s bearer feels an urge TO SHARE wealth WITH AND give aid TO the poor OR needy.'),
  (9, 'Hungry', 'This item’s magical properties FUNCTION only IF fresh blood FROM a humanoid has been applied TO it within the past 24 hours.It needs only a DROP TO activate.'),
  (10, 'Loud', 'The item makes a loud noise, such AS a clang, a shout, OR a resonating gong, WHEN used.'),
  (11, 'Metamorphic', 'The item periodically AND randomly alters its appearance IN slight ways.The bearer has NO control over these minor alterations, which have NO effect ON the item’s USE.'),
  (12, 'Mournful', ' WHEN the bearer of this item witnesses death, the item enhances feelings of sorrow AND a desire TO treat the dead WITH respect.'),
  (13, 'Muttering', 'The item grumbles AND mutters.A creature who listens carefully TO the item might leam something useful.'),
  (14, 'Painful', 'The bearer experiences a harmless ﬂash of pain WHEN USING the item.'),
  (15, 'Paranoid', 'This item’s bearer becomes suspicious AND feels a sense of being watched OR hunted.'),
  (16, 'Possessive', 'The item demands attunement WHEN ﬁrst wielded OR worn, AND it doesn’t allow its bearer TO attune TO other items.(Other items already attuned TO the bearer remain so UNTIL their attunement ENDS.)'),
  (17, 'Repulsive', 'The bearer feels a sense of distaste WHEN IN contact WITH the item, AND continues TO sense discomfort WHILE bearing it.'),
  (18, 'Slothful', 'The bearer of this item feels slothful AND lethargic.WHILE attuned TO the item, the bearer requires 10 hours TO ﬁnish a LONG rest.'),
  (19, 'Valiant', ' WHEN the bearer of this item IS confronted WITH an opportunity TO act IN a courageous OR heroic way, the item heightens the bearer’s urge TO DO so.'),
  (20, 'Wicked', ' WHEN the bearer IS presented WITH an opportunity TO act IN a selﬁsh OR malevolent way, the item heightens the bearer’s urge TO DO so.');
-- --------------------------------------------------------
--
-- Table structure for table `rarity`
--
CREATE TABLE IF NOT EXISTS `rarity` (
  `id` INT (11) NOT NULL,
  `rarity` VARCHAR (30) DEFAULT NULL,
  `maxSpellLevel` INT (11) DEFAULT NULL,
  `maxBonus` INT (11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE =InnoDB DEFAULT CHARSET =utf8;
--
-- Dumping data for table `rarity`
--
INSERT INTO `rarity` (`id`, `rarity`, `maxSpellLevel`, `maxBonus`) VALUES
  (1, 'Common', 1, 0),
  (2, 'Uncommon', 3, 1),
  (3, 'Rare', 6, 2),
  (4, 'Very Rare', 8, 3),
  (5, 'Legendary', 9, 4);
-- --------------------------------------------------------
--
-- Table structure for table `senses`
--
CREATE TABLE IF NOT EXISTS `senses` (
  `id` INT (11) NOT NULL,
  `text` TEXT,
  PRIMARY KEY (`id`)
) ENGINE =InnoDB DEFAULT CHARSET =utf8;
--
-- Dumping data for table `senses`
--
INSERT INTO `senses` (`id`, `text`) VALUES
  (1, 'Hearing AND normal vision OUT TO 30 feet.'),
  (2, 'Hearing AND normal vision OUT TO 60 feet.'),
  (3, 'Hearing AND normal vision OUT TO 120 feet.'),
  (4, 'Hearing AND dark vision OUT TO 120 feet.');
-- --------------------------------------------------------
--
-- Table structure for table `weapons`
--
CREATE TABLE IF NOT EXISTS `weapons` (
  `id` INT (11) NOT NULL,
  `weaponName` VARCHAR (30) DEFAULT NULL,
  `damageType` VARCHAR (30) DEFAULT NULL,
  `damageDice` VARCHAR (4) DEFAULT NULL,
  `weaponProperty` TEXT,
  `Source` VARCHAR (3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE =InnoDB DEFAULT CHARSET =utf8;
--
-- Dumping data for table `weapons`
--
INSERT INTO `weapons` (`id`, `weaponName`, `damageType`, `damageDice`, `weaponProperty`, `Source`) VALUES
  (1, 'Club', 'bludgeoning', '1d4', 'Light', 'PHB'),
  (2, 'Dagger', 'piercing', '1d4', 'Finesse, light, thrown ( RANGE 20/60)', 'PHB'),
  (3, 'Greatclub', 'bludgeoning', '1d8', 'Two-handed', 'PHB'),
  (4, 'Handaxe', 'slashing', '1d6', 'Light, thrown ( RANGE 20/60)', 'PHB'),
  (5, 'Javelin', 'piercing', '1d6', 'Thrown ( RANGE 30/120)', 'PHB'),
  (6, 'Light Hammer', 'bludgeoning', '1d4', 'Light, thrown ( RANGE 20/60)', 'PHB'),
  (7, 'Mace', 'bludgeoning', '1d6', '', 'PHB'),
  (8, 'Quarterstaff', 'bludgeoning', '1d6', 'Versatile (1d8)', 'PHB'),
  (9, 'Sickle', 'slashing', '1d4', 'Light', 'PHB'),
  (10, 'Spear', 'slashing', '1d6', 'Thrown ( RANGE 20/60), versatile (ld8)', 'PHB'),
  (11, 'Light Crossbow', 'piercing', '1d8', 'Ammunition ( RANGE 80/320), loading, two.handed', 'PHB'),
  (12, 'Dart', 'piercing', '1d4', 'Finesse, thrown ( RANGE 20/60)', 'PHB'),
  (13, 'Shortbow', 'piercing', '1d6', 'Ammunition ( RANGE 80/320), two.handed', 'PHB'),
  (14, 'Sling', 'bludgeoning', '1d4', 'Ammunition ( RANGE 30/120)', 'PHB'),
  (15, 'Battleaxe', 'slashing', '1d8', 'Versatile (ld10)', 'PHB'),
  (16, 'Flail', 'bludgeoning', '1d8', '', 'PHB'),
  (17, 'Glaive', 'slashing', '1d10', 'Heavy, reach, two-handed', 'PHB'),
  (18, 'Greataxe', 'slashing', '1d12', 'Heavy, two-handed', 'PHB'),
  (19, 'Greatsword', 'slashing', '2d6', 'Heavy, two-handed', 'PHB'),
  (20, 'Halberd', 'slashing', '1d10', 'Heavy, reach, two.handed', 'PHB'),
  (21, 'Lance', 'piercing', '1d12', 'Reach, special', 'PHB'),
  (22, 'Longsword', 'slashing', '1d8', 'Versatile (ldl0)', 'PHB'),
  (23, 'Maul', 'bludgeoning', '2d6', 'Heavy, two.handed', 'PHB'),
  (24, 'Morningstar', 'piercing', '1d8', '', 'PHB'),
  (25, 'Pike', 'piercing', '1d10', 'Heavy, reach, two.handed', 'PHB'),
  (26, 'Rapier', 'piercing', '1d8', 'Finesse', 'PHB'),
  (27, 'Scimitar', 'slashing', '1d6', 'Finesse, light', 'PHB'),
  (28, 'Shortsword', 'piercing', '1d6', 'Finesse, light', 'PHB'),
  (29, 'Trident', 'piercing', '1d6', 'Thrown ( RANGE 20/60), versatile (ld8)', 'PHB'),
  (30, 'War Pick', 'piercing', '1d8', '', 'PHB'),
  (31, 'Warhammer', 'bludgeoning', '1d8', 'Versatile (ld10)', 'PHB'),
  (32, 'Whip', 'slashing', '1d4', 'Finesse, reach', 'PHB'),
  (33, 'Blowgun', 'piercing', '1', 'Ammunition ( RANGE 25/100), loading', 'PHB'),
  (34, 'Hand Crossbow', 'piercing', '1d6', 'Ammunition ( RANGE 30/120), light, loading', 'PHB'),
  (35, 'Heavy Crossbow', 'piercing', '1d10', 'Ammunition ( RANGE 100/400), heavy, loading, two.handed', 'PHB'),
  (36, 'Longbow', 'piercing', '1d8', 'Ammunition ( RANGE 150/600), heavy, two-handed', 'PHB'),
  (37, 'Net', '', '1', 'Special, thrown ( RANGE 5/15)', 'PHB'),
  (38, 'Tonfa', 'bludgeoning', '1d4', 'Light', 'HoO'),
  (39, 'Tanto', 'piercing', '1d4', 'Finesse, light, thrown ( RANGE 20/60)', 'HoO'),
  (40, 'Tetsubo', 'bludgeoning', '1d8', 'Two-handed', 'HoO'),
  (41, 'Ono', 'slashing', '1d6', 'Light, thrown ( RANGE 20/60), versatile (1d8)', 'HoO'),
  (42, 'Uchi-ne', 'piercing', '1d6', 'Thrown ( RANGE 30/120)', 'HoO'),
  (43, 'Kanabo', 'bludgeoning', '1d6', '', 'HoO'),
  (44, 'Bo', 'bludgeoning', '1d6', 'Versatile (1d8)', 'HoO'),
  (45, 'Kama', 'slashing', '1d4', 'Light', 'HoO'),
  (46, 'Yari', 'slashing', '1d6', 'Thrown ( RANGE 20/60), versatile (ld8)', 'HoO'),
  (47, 'Shuriken', 'piercing', '1d4', 'Finesse, thrown ( RANGE 20/60)', 'HoO'),
  (48, 'Hankyu', 'piercing', '1d6', 'Ammunition ( RANGE 80/320), two.handed', 'HoO'),
  (49, 'Masakari', 'slashing', '1d8', 'Versatile (ld10)', 'HoO'),
  (50, 'Nunchaku', 'bludgeoning', '1d6', '', 'HoO'),
  (51, 'Naginata', 'slashing', '1d10', 'Heavy, reach, two-handed', 'HoO'),
  (52, 'Nodachi', 'slashing', '2d6', 'Heavy, two-handed, pristine', 'HoO'),
  (53, 'Kamayari', 'slashing', '1d10', 'Heavy, reach, two.handed', 'HoO'),
  (54, 'Umayari', 'piercing', '1d12', 'Reach, special', 'HoO'),
  (55, 'Katana', 'slashing', '1d8', 'Versatile (ldl0)', 'HoO'),
  (56, 'Nagaeyari', 'piercing', '1d10', 'Heavy, reach, two.handed', 'HoO'),
  (57, 'Wakizashi', 'slashing', '1d6', 'Finesse, light, pristine', 'HoO'),
  (58, 'Ninja- TO ', 'piercing / slashing', '1d6', 'Finesse, light, pristine', 'HoO'),
  (59, 'Magariyari', 'piercing', '1d6', 'Thrown ( RANGE 20/60), versatile (ld8)', 'HoO'),
  (60, 'War Fan', 'piercing', '1d6', 'Finesse, light', 'HoO'),
  (61, 'Kuwa', 'piercing', '1d8', '', 'HoO'),
  (62, 'Nagamaki', 'slashing', '1d8', 'Versatile (2d4), reach, pristine', 'HoO'),
  (63, 'Dual Naginata', 'slashing', '1d12', 'Heavy, two-handed, pristine', 'HoO'),
  (64, 'Sai', 'piercing', '1d4', 'Finesse, light, special', 'HoO'),
  (65, 'Daikyu', 'piercing', '1d8', 'Ammunition ( RANGE 150/600), heavy, two-handed', 'HoO');
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;