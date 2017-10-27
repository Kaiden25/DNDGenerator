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
  `id` INT(11) NOT NULL,
  `alignment` VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
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
  `id` INT(11) NOT NULL,
  `armorName` VARCHAR(255) DEFAULT NULL,
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
  (3, 'The item can speak, READ, AND understand ONE OR more languages.IN addition, the item can communicate telepathically WITH ANY CHARACTER that carries OR wields it.');
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
  (1, 'Aberration', 'The item was created BY aberrations IN ancient times, possibly FOR the USE of favored humanoid thralls.WHEN seen FROM the corner of the eye, the item seems TO be moving.'),
  (2, 'Human', 'The item was created during the heyday of a fallen human kingdom, OR it IS tied TO a human of legend.It might hold writing IN a forgotten tongue OR symbols whose significance IS lost TO the ages.'),
  (3, 'Celestial', 'The weapon IS half the normal weight AND inscribed WITH feathered wings, suns, AND other symbols of good.Fiends find the items presence repulsive.'),
  (4, 'Dragon', 'This item IS made FROM scales AND talons shed BY a dragon.Perhaps it  incorporates precious metals AND gems FROM the dragons hoard.It grows slightly warm WHEN within  120 feet of a dragon.'),
  (5, 'Drow', 'The item IS half the normal weight.It IS black AND inscribed WITH spiders AND webs IN honor of Lolth.It might FUNCTION poorly, OR disintegrate, if exposed TO sunlight FOR 1 MINUTE OR more.'),
  (6, 'Dwarf', 'The item IS durable AND has Dwarven runes worked INTO its design.It might be associated WITH a clan that would LIKE TO see it returned TO their ancestral  halls.'),
  (7, 'Elemental Air', 'The item IS half the normal weight AND feels hollow.IF its made of fabric, it IS diaphanous. The item could have been BY OR FOR a djinnni .'),
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
  (22, 'Undead', 'The item incorporates imagery of death such AS bones AND skulls, AND it might be crafted FROM parts of corpses.It feels cold TO the touch.'),
  (23, 'Yuan - Ti', 'The item was crafted LONG ago FOR a fallen yuan-ti empire.It IS serpentine AND sinuous IN design, OR inscribed WITH serpentine markings. Its appearance IS likely TO draw the attention of yuan-ti.'),
  (24, 'Shadowfell', 'The item was made IN OR FOR the Shadowfell.Its coloration IS muted OR shadowy, mostly black AND gray.The bearer IS immune TO the effects of Shadowfell Despair.');
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
  (1, 'Arcane', 'This item was created FOR ( OR BY ) an ancient ORDER of spellcasters AND bears the ORDER ’s symbol.'),
  (2, 'Bane', 'This item was created BY the foes of a particular culture OR kind of creature.IF the culture OR cultures are still around, they might recognize the item AND single OUT the bearer AS an enemy.'),
  (3, 'Exotic', 'This item IS FROM a distant FOREIGN land, such AS Kara-Tur IN the Forgotten Realms.WHILE the item functions normally, it has an exotic design AND Wuxia NAME (see Dungeon MASTER ’s Guide, p.41)'),
  (4, 'Heroic', ' A great hero once wielded this item.Anyone who’s familiar WITH the item’s history expects great deeds FROM the new OWNER.'),
  (5, 'Ornament', 'The item was created TO honor a special occasion.Inset gemstones, gold OR platinum inlays, AND gold OR silver ﬁligree adorn its surface.'),
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
  (1, 'While you are attuned to the artifact, your body rots over the course of four days, after which the rotting stops.You lose your hair by the end of day 1, finger tips and toe tips by the end of day 2, lips and nose by the end of day 3, and ears by the end of day 4. A regenerate spell restores lost body parts '),
  (2, 'While you are attuned to the artifact, you determine your alignment daily at dawn by rolling a d6 twice. On the first roll, a 1-2 indicates lawful, 3-4 neutral, and S-6 chaotic. On the . second roll, a 1-2 indicates good, 3-4 neutral, and 5-6 evil.'),
  (3, 'When you first attune to the artifact, it gives you a quest determined by the DM. You must complete this quest as if affected by the geas spell.Once you complete the quest, you are no longer affected by this property.'),
  (4, 'The artifact houses a bodiless life force that is hostile toward you.each time you use an action to use ONE of the artifacts properties, there is a 50 percent chance that the life force tries to leave the artifact and enter your body.if you fail a DC 20 Charisma saving throw, it succeeds, and you become an NPC under the DMs control until the intruding life force is banished using magic such as the dispel evil and good spell.'),
  (5, 'Creatures WITH a challenge rating of O, as well as plants that are not creatures, drop to 0 hit points when within 10 feet of the artifact.'),
  (6, 'The artifact imprisons a death slaad (see the Monster Manual).each time you use ONE of the artifacts properties as an action, the slaad has a 10 percent chance of escaping, whereupon it appears within 15 feet of you and attacks you.'),
  (7, 'While you are attuned to the artifact, creatures of a particular type other than humanoid ( as chosen by the DM) are ALWAYS hostile toward you.'),
  (8, 'The artifact dilutes magic potions within 10 feet of it, rendering them nonmagical.'),
  (9, 'The artifact erases magic scrolls within 10 feet of it, rendering them nonmagical.'),
  (10, 'Before using ONE of the artifacts properties as an action, you must use a bonus action to draw blood, either from yourself or from a willing or incapacitated creature within your reach, using a piercing or slashing melee weapon.The subject takes 1d4 damage of the appropriate type.'),
  (11, 'When you become attuned to the artifact, you gain a form of long-term madness (see chapter 8, "Running the Game"). '),
  (12, 'You take 4d10 psychic damage when you become attuned to the artifact.'),
  (13, 'You take 8d10 psychic damage when you become attuned to th e artifact.'),
  (14, 'Before you can become attuned to the artifact, you must kil l a creature of your alignment.'),
  (15, 'When you become attuned to the artifact, ONE of your ability scores is reduced by 2 at random.A greater restoration spell restores the ability to normal.'),
  (16, 'Each time you become attuned to the artifact, you age 3d10 years.You must succeed on a DC 10 Constitution saving throw or die from the shock.if you die, you are instantly transformed into a wight (see the Monster Manual ) under the DMs control that is sworn to protect the artifact.'),
  (17, 'While attuned to the artifact, you lose the ability to speak.'),
  (18, 'While attuned to the artifact, you have vulnerability to all damage.'),
  (19, 'When you become attuned to the artifact, there is a 10 percent chance that you attract the attention of a god that sends an avatar to wrest the artifact from you.The avatar has the same alignment as its creator and the statistics of an empyrean (see the Monster Manual).Once it obtains the artifact, the avatar vanishes.');
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
  (1, 'While attuned to the artifact, one of your ability scores (DMs choice) increases by 2, to a maximum of 24.'),
  (2, 'While attuned to the artifact, you regain ld6 hit points at the start of your turn if you have at least l hit point.'),
  (3, 'When you hit with a weapon attack while attuned to the artifact, the target takes an extra l d6 damage of the weapons type.'),
  (4, 'While attuned to the artifact, your walking speed increases by 10 feet.'),
  (5, 'While attuned to the artifact, you can use an action to cast one 4th-Level spell (chosen by the DM) from it. After you cast the spell, roll a d6. On a roll of l-5, you can not cast it again until the next dawn.'),
  (6, 'While attuned to the artifact, you can use an action to cast one 5th-Level spell (chosen by the DM) from it. After you cast the spell, roll a d6. On a roll of l-5, you can not cast it again until the next dawn.'),
  (7, 'While attuned to the artifact, you can use an action to cast one 6th-Level spell (chosen by the DM) from it. After you cast the spell, roll a d6. On a roll of l-5, you can not cast it again until the next dawn.'),
  (8, 'While attuned to the artifact, you can use an action to cast one 7th-Level spell (chosen by the DM) from it. After you cast the spell, roll a d6. On a roll of l-5, you can not cast it again until the next dawn.'),
  (9, 'While attuned to the artifact, you can not be blinded, deafened, petrified, or stunned.');
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
  (1, ' While attuned to the artifact, you gain proficiency in one skill of the DMs choice.'),
  (2, ' While attuned to the artifact, you are immune to disease.'),
  (3, ' While attuned to the artifact, you can not be charmed or frightened.'),
  (4, ' While attuned to the artifact, you have resistance against one damage type of the DMs choice.'),
  (5, ' While attuned to the artifact, you can use an action to cast one cantrip (chosen by the DM) from it.'),
  (6, ' While attuned to the artifact, you can use an action to cast one 1st-Level spell (chosen by the DM) from it. After you cast the spell, roll a d6. On a roll of l-5, you can not cast it again until the next dawn.'),
  (7, ' While attuned to the artifact, you can use an action to cast one 2nd-Level spell (chosen by the DM) from it. After you cast the spell, roll a d6. On a roll of l-5, you can not cast it again until the next dawn.'),
  (8, ' While attuned to the artifact, you can use an action to cast one 3rd-Level spell (chosen by the DM) from it. After you cast the spell, roll a d6. On a roll of l-5, you can not cast it again until the next dawn.'),
  (9, ' While attuned to the artifact, you gain a +l bonus to Armor Class.');
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
  (1, 'While attuned to the artifact, you have disadvantage on saving throws against spells.'),
  (2, 'The first time you touch a gem or piece of jewelry while attuned to this artifact, the value of the gem or jewelry is reduced by half.'),
  (3, 'While attuned to the artifact, you are blinded when you are more than 10 feet away from it.'),
  (4, 'While attuned to the artifact, you have disadvantage on saving throws against poison.'),
  (5, 'While attuned to the artifact, you emit a sour stench noticeable from up to 10 feet away.'),
  (6, 'While attuned to the artifact, all holy water within 10 feet of you is destroyed.'),
  (7, 'While attuned to the artifact, you are physically ill and have disadvantage on any ability check or saving throw that uses Strength or Constitution.'),
  (8, 'While attuned to the artifact, your weight increases by 1d4 x 10 pounds.'),
  (9, 'While attuned to the artifact, your appearance changes as the DM decides.'),
  (10, 'While attuned to the artifact, you are deafened when you are more than 10 feet away from it.'),
  (11, 'While attuned to the artifact, your weight drops by 1d4 x 5 pounds.'),
  (12, 'While attuned to the artifact, you can not smell.'),
  (13, 'While attuned to the artifact, non magical flames are extinguished within 30 feet of you.'),
  (14, 'While you are attuned to the artifact, other creatures can not take short or long rests while within 300 feet of you.'),
  (15, 'While attuned to the artifact, you deal 1d6 necrotic damage to any plant you touch that is not a creature.'),
  (16, 'While you are attuned to the artifact, animals within 30 feet of you are hostile toward you.'),
  (17, 'While attuned to the artifact, you must eat and drink six times the normal amount each day.'),
  (18, 'While you are attuned to the artifact, your flaw is amplified in a way determined by the DM.');
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
  (1, 'Absorbing', 'The item has a mirror-like sheen. While equipped, radiant damage taken by the bearer is reduced by 3.'),
  (2, 'Aquatic', 'This item is suited  for aquatic  use  and ignores the restrictions of underwater combat (Player’s Handbook, p.198). Its weight  or bulkiness doesn’t impede swimming.'),
  (3, 'Athletic', 'The item is especially sturdy. It gives the bearer advantage  on Strength (Athletics) checks.'),
  (4, 'Beacon', 'The bearer can  use a bonus  action on  to cause the item  to shed bright light  in a 10-foot radius  and dim light  for an additional 10 feet,  or  to extinguish the light.'),
  (5, 'Beast Friend', 'The item gives the bearer advantage  on Wisdom (Animal Handling) checks.'),
  (6, 'Brave', 'The item gives the bearer advantage  on saving throws against being frightened.'),
  (7, 'Chilling', 'The item is cool  to the touch. While equipped, ﬁre damage taken by the bearer is reduced by 3.'),
  (8, 'Compass', 'The wielder can  use an  action on  to learn which way is north.'),
  (9, 'Curing', 'The item is engraved  with a symbol of health. As a bonus  action on, the bearer may touch the symbol  and regain 2d4 hit points. Alternatively,  as an  action on the item may produce a piece of fruit  or a potion that anyone can consume within 1 minute  to regain 2d4 hit points. The symbol vanishes after being used. It returns  and can be used again daily at dawn.'),
  (10, 'Dampening', 'The item dulls sound made  when it touches other objects. While equipped, thunder damage taken by the bearer is reduced by 3.'),
  (11, 'Delver', '  While underground, the bearer always knows the item’s depth below the surface  and the direction  to the nearest staircase, ramp,  or other path leading upward.'),
  (12, 'Deceptive', 'The item gives the bearer advantage  on Charisma (Deception) checks.'),
  (13, 'Foe Bane', 'Choose (  or roll randomly) a speciﬁc kind of creature.The item is +1 higher  when attacking  or defending against such creatures.A weapon instead could inﬂict an extra 1d4 damage  when it hits such creatures.The item has a rune  or engraving that indicates its foe.'),
  (14, 'Gleaming', 'The item never gets dirty.'),
  (15, 'Grounding', 'The item smells like earthy soil. While equipped, lightning damage taken by the bearer is reduced by 3.'),
  (16, 'Guardian', 'The item whispers warnings to its bearer, granting a +2 bonus  to initiative if the bearer isn’t incapacitated.'),
  (17, 'Harmonious', 'Attuning  to this item takes only 1 minute.'),
  (18, 'Healer', 'The item gives the bearer advantage  on Wisdom (Medicine) checks.'),
  (19, 'Hidden Message', 'A message is hidden somewhere  on the item.It might be visible only at a certain time of the year, under the light of  one phase of the moon,  or  in a speciﬁc location.'),
  (20, 'Insightful', 'The item gives the bearer advantage  on Wisdom (Insight) checks'),
  (21, 'Inspiring', 'This item is especially glorious  in design.It gives inspiration (Player’s Handbook, p.125)  to the bearer whenever he  or she rolls a 20  on  onE particular kind of roll (DM’s choice of attack rolls, saving throws,  or skill checks).'),
  (22, 'Intimidating', 'The item is especially fearsome  in design.It gives the bearer advantage  on Charisma (Intimidation) checks.'),
  (23, 'Investigator', 'The item gives the bearer advantage  on Intelligence (Investigation) checks.'),
  (24, ' KEY ', 'The item is used  to unlock a container, chamber, vault,  or other entryway.'),
  (25, ' LANGUAGE ', 'The bearer can speak  and understand a language of the DM’s choice  While the item is  on the bearer’s person.'),
  (26, 'Lifesaver', 'This item gives the bearer advantage  on death saving throws.'),
  (27, 'Lore Giver', 'This item is inscribed  with lore  or whispers knowledge  to its bearer.It gives the bearer advantage  on checks using  one particular Intelligence skill (DM’s choice of Arcana, History, Nature,  or Religion).'),
  (28, 'Mental', 'The item is outlined by faint emerald light. While equipped, psychic damage taken by the bearer is reduced by 3.'),
  (29, 'Neutralizing', 'The item appears  to have a glassy sheen. While equipped, acid damage taken by the bearer is reduced by 3.'),
  (30, 'Nimble', 'The item is surprisingly ﬂexible.It gives the bearer advantage  on checks US inG  onE particular Dexterity skill (DM’s choice of Acrobatics, Sleight of Hand,  or Stealth).'),
  (31, 'Perceptive', 'The item gives the bearer advantage  on Wisdom (Perception) checks.'),
  (32, 'Persuasive', 'The item is exceptionally beautiful  in design.It gives the bearer advantage  on Charisma (Persuasion) checks.'),
  (33, 'Purifying', 'The item smells clean  and antiseptic. While equipped, poison damage taken by the bearer is reduced by 3.'),
  (34, 'Rejuvenating', '  when the bearer spends Hit Dice, the result of the ﬁrst die is automatically the maximum amount.'),
  (35, 'Resolute', 'The item gives the bearer advantage  on saving throws against being charmed.'),
  (36, 'Revealing', ' An invisible target  in physical contact  with the item’s bearer becomes visible.at the END of the bearer’s NEXT turn, the target becomes invisible again ( if the effect’s duration hasn’t ended).'),
  (37, 'Sentinel', 'Choose (  or roll randomly) a kind of creature (usually an enemy of the item’s creator).This item glows faintly  when such creatures are within 120 feet of it'),
  (38, 'Shielding', 'The item faintly hums  with unseen  force. While equipped, the force damage taken by the bearer is reduced by 3.'),
  (39, 'Song Craft', 'Whenever this item is struck  or is used  to strike a foe, its bearer hears a fragment of an ancient song'),
  (40, 'Strange Material', 'The item was crafted FROM a material that is bizarre given its purpose.Its durability is unaffected.'),
  (41, 'Survivor', 'The item gives the bearer advantage  on Wisdom (Survival) checks.'),
  (42, 'Temperate', 'The bearer suffers NO harm  in temperatures  as cold  as -20 degrees  or  as warm  as 120 degree Fahrenheit.'),
  (43, 'Unbreakable', 'This item can’t be broken.Special means must be used  to destroy it.'),
  (44, 'Vitalizing', 'The item faintly sparkles. While equipped, necrotic damage taken by the bearer is reduced by 3.'),
  (45, 'War Leader', 'The bearer can  use an  action on  to cause his  or her voice  to be carry clearly  for up  to 300 feet until the end of the bearer’s next turn.'),
  (46, 'Warming', 'The item is warm  to the touch. While equipped, cold damage taken by the bearer is reduced by 3.'),
  (47, 'Watchful', 'The item is imbued  with alertness.The bearer gains advantage  on Dexterity saving throws against traps  and is automatically awakened from natural sleep  when threatened  with harm.'),
  (48, 'Waterborne', 'This item ﬂoats  on water  and other liquids.Its bearer has advantage  on Strength (Athletics) checks  to swim.'),
  (49, 'Illusion', 'The item is imbued  with illusion magic, allowing its bearer  to alter the items’ appearance  in minor ways. Such alterations don’t change how the item is worn, carried,  or wielded,  and they have no effect  on its other magical properties. for example, the wearer could make red robe appear blue,  or make a gold ring look like it’s made of ivory.The item reverts  to its true appearance  when no one’s carrying  or wearing it.');
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
  (1, 'Aligned', 'The item seeks to defeat or destroy those of a diametrically opposed alignment.(Such an item is never neutral.) '),
  (2, 'Bane', 'The item seeks to defeat or destroy creatures of a particular kind, such as fiends, shapechangers, trolls, or wizards.'),
  (3, 'Protector', 'The item seeks to defend a particular race or kind of creature, such as elves or druids.'),
  (4, 'Crusader', 'The item seeks to defeat, weaken, or destroy the servants of a particular deity.'),
  (5, 'Templar', 'The item seeks to defend the servants and interests of a particular deity.'),
  (6, 'Destroyer', 'The item craves destruction and goads its user to fight arbitrarily.'),
  (7, 'Glory Seeker', 'The item seeks renown as the greatest magic item in the world, by establishing its user as a famous or notorious figure.'),
  (8, 'Lore Seeker', 'The item craves knowledge or is determined to solve a mystery, learn a secret, or unravel a cryptic prophecy.'),
  (9, 'Destiny Seeker', 'The item is convinced that it and its wielder have key roles to play in future events.'),
  (10, 'Creator Seeker', 'The item seeks its creator and wants to understand why it was created.');
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
  (1, 'Blissful', 'While inpossession of the item, the bearer feels fortunate and optimistic about what the future holds.Butterﬂies and other harmless creatures might frolic in the item’s presence'),
  (2, 'Confident', 'The item helps its bearer feel self-assured.'),
  (3, 'Conscientious', ' when the bearer of this item contemplates or undertakes a malevolent act, the item enhances pangs of conscience.'),
  (4, 'Covetous', 'The item’s bearer becomes obsessed with material wealth.'),
  (5, 'Fastidious', 'The item’s bearer becomes obsessed with keeping clean, including cleaning the item.'),
  (6, 'Frail', 'The item crumbles, frays, chips, or cracks slightly when wielded, worn, or activated.This quirk has no effect on its properties, but if the item has seen much use, it looks decrepit.'),
  (7, 'Gallant', 'The item’s bearer become obsessed with being polite and helpful to the other gender.'),
  (8, 'Generous', 'This item’s bearer feels an urge to share wealth with and give aid to the poor or needy.'),
  (9, 'Hungry', 'This item’s magical properties functions only if fresh blood from a humanoid has been applied to it within the past 24 hours.It needs only a drop to activate.'),
  (10, 'Loud', 'The item makes a loud noise, such as a clang, a shout, or a resonating gong, when used.'),
  (11, 'Metamorphic', 'The item periodically and randomly alters its appearance in slight ways.The bearer has no control over these minor alterations, which have no effect on the item’s use.'),
  (12, 'Mournful', ' when the bearer of this item witnesses death, the item enhances feelings of sorrow and a desire to treat the dead with respect.'),
  (13, 'Muttering', 'The item grumbles and mutters.A creature who listens carefully to the item might glean something useful.'),
  (14, 'Painful', 'The bearer experiences a harmless ﬂash of pain when using the item.'),
  (15, 'Paranoid', 'This item’s bearer becomes suspicious and feels a sense of being watched or hunted.'),
  (16, 'Possessive', 'The item demands attunement when ﬁrst wielded or worn, and it doesn’t allow its bearer to attune to other items.(Other items already attuned to the bearer remain so until their attunement ends.)'),
  (17, 'Repulsive', 'The bearer feels a sense of distaste when in contact with the item, and continues to sense discomfort while bearing it.'),
  (18, 'Slothful', 'The bearer of this item feels slothful and lethargic.while attuned to the item, the bearer requires 10 hours to ﬁnish a long rest.'),
  (19, 'Valiant', ' when the bearer of this item is confronted with an opportunity to act in a courageous or heroic way, the item heightens the bearer’s urge to do so.'),
  (20, 'Wicked', ' when the bearer is presented with an opportunity to act in a selﬁsh or malevolent way, the item heightens the bearer’s urge to do so.');
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
  (1, 'Hearing and normal vision out to 30 feet.'),
  (2, 'Hearing and normal vision out to 60 feet.'),
  (3, 'Hearing and normal vision out to 120 feet.'),
  (4, 'Hearing and dark vision out to 120 feet.');
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
INSERT INTO `weapons`(`id`, `weaponName`, `damageType`, `damageDice`, `weaponProperty`, `Source`) VALUES
  (1, 'Club'              , 'bludgeoning'         , '1d4' , 'Light'                                                 , 'PHB'),
  (2, 'Dagger'            , 'piercing'            , '1d4' , 'Finesse, light, thrown (Range 20/60)'                  , 'PHB'),
  (3, 'Greatclub'         , 'bludgeoning'         , '1d8' , 'Two-handed'                                            , 'PHB'),
  (4, 'Handaxe'           , 'slashing'            , '1d6' , 'Light, thrown (Range 20/60)'                           , 'PHB'),
  (5, 'Javelin'           , 'piercing'            , '1d6' , 'Thrown (Range 30/120)'                                 , 'PHB'),
  (6, 'Light Hammer'      , 'bludgeoning'         , '1d4' , 'Light, thrown (Range 20/60)'                           , 'PHB'),
  (7, 'Mace'              , 'bludgeoning'         , '1d6' , ''                                                      , 'PHB'),
  (8, 'Quarterstaff'      , 'bludgeoning'         , '1d6' , 'Versatile (1d8)'                                       , 'PHB'),
  (9, 'Sickle'            , 'slashing'            , '1d4' , 'Light'                                                 , 'PHB'),
  (10, 'Spear'            , 'slashing'            , '1d6' , 'Thrown (Range 20/60), versatile (ld8)'                 , 'PHB'),
  (11, 'Light Crossbow'   , 'piercing'            , '1d8' , 'Ammunition (Range 80/320), loading, two.handed'        , 'PHB'),
  (12, 'Dart'             , 'piercing'            , '1d4' , 'Finesse, thrown (Range 20/60)'                         , 'PHB'),
  (13, 'Shortbow'         , 'piercing'            , '1d6' , 'Ammunition (Range 80/320), two.handed'                 , 'PHB'),
  (14, 'Sling'            , 'bludgeoning'         , '1d4' , 'Ammunition (Range 30/120)'                             , 'PHB'),
  (15, 'Battleaxe'        , 'slashing'            , '1d8' , 'Versatile (ld10)'                                      , 'PHB'),
  (16, 'Flail'            , 'bludgeoning'         , '1d8' , ''                                                      , 'PHB'),
  (17, 'Glaive'           , 'slashing'            , '1d10', 'Heavy, reach, two-handed'                              , 'PHB'),
  (18, 'Greataxe'         , 'slashing'            , '1d12', 'Heavy, two-handed'                                     , 'PHB'),
  (19, 'Greatsword'       , 'slashing'            , '2d6' , 'Heavy, two-handed'                                     , 'PHB'),
  (20, 'Halberd'          , 'slashing'            , '1d10', 'Heavy, reach, two.handed'                              , 'PHB'),
  (21, 'Lance'            , 'piercing'            , '1d12', 'Reach, special'                                        , 'PHB'),
  (22, 'Longsword'        , 'slashing'            , '1d8' , 'Versatile (ldl0)'                                      , 'PHB'),
  (23, 'Maul'             , 'bludgeoning'         , '2d6' , 'Heavy, two-handed'                                     , 'PHB'),
  (24, 'Morningstar'      , 'piercing'            , '1d8' , ''                                                      , 'PHB'),
  (25, 'Pike'             , 'piercing'            , '1d10', 'Heavy, reach, two-handed'                              , 'PHB'),
  (26, 'Rapier'           , 'piercing'            , '1d8' , 'Finesse'                                               , 'PHB'),
  (27, 'Scimitar'         , 'slashing'            , '1d6' , 'Finesse, light'                                        , 'PHB'),
  (28, 'Shortsword'       , 'piercing'            , '1d6' , 'Finesse, light'                                        , 'PHB'),
  (29, 'Trident'          , 'piercing'            , '1d6' , 'Thrown (Range 20/60), versatile (ld8)'                 , 'PHB'),
  (30, 'War Pick'         , 'piercing'            , '1d8' , ''                                                      , 'PHB'),
  (31, 'Warhammer'        , 'bludgeoning'         , '1d8' , 'Versatile (ld10)'                                      , 'PHB'),
  (32, 'Whip'             , 'slashing'            , '1d4' , 'Finesse, reach'                                        , 'PHB'),
  (33, 'Blowgun'          , 'piercing'            , '1'   , 'Ammunition (Range 25/100), loading'                    , 'PHB'),
  (34, 'Hand Crossbow'    , 'piercing'            , '1d6' , 'Ammunition (Range 30/120), light, loading'             , 'PHB'),
  (35, 'Heavy Crossbow'   , 'piercing'            , '1d10', 'Ammunition (Range 100/400), heavy, loading, two.handed', 'PHB'),
  (36, 'Longbow'          , 'piercing'            , '1d8' , 'Ammunition (Range 150/600), heavy, two-handed'         , 'PHB'),
  (37, 'Net'              , ''                    , '1'   , 'Special, thrown (Range 5/15)'                          , 'PHB'),
  (38, 'Tonfa'            , 'bludgeoning'         , '1d4' , 'Light'                                                 , 'HoO'),
  (39, 'Tanto'            , 'piercing'            , '1d4' , 'Finesse, light, thrown (Range 20/60)'                  , 'HoO'),
  (40, 'Tetsubo'          , 'bludgeoning'         , '1d8' , 'Two-handed'                                            , 'HoO'),
  (41, 'Ono'              , 'slashing'            , '1d6' , 'Light, thrown (Range 20/60), versatile (1d8)'          , 'HoO'),
  (42, 'Uchi-ne'          , 'piercing'            , '1d6' , 'Thrown (Range 30/120)'                                 , 'HoO'),
  (43, 'Kanabo'           , 'bludgeoning'         , '1d6' , ''                                                      , 'HoO'),
  (44, 'Bo'               , 'bludgeoning'         , '1d6' , 'Versatile (1d8)'                                       , 'HoO'),
  (45, 'Kama'             , 'slashing'            , '1d4' , 'Light'                                                 , 'HoO'),
  (46, 'Yari'             , 'slashing'            , '1d6' , 'Thrown (Range 20/60), versatile (ld8)'                 , 'HoO'),
  (47, 'Shuriken'         , 'piercing'            , '1d4' , 'Finesse, thrown (Range 20/60)'                         , 'HoO'),
  (48, 'Hankyu'           , 'piercing'            , '1d6' , 'Ammunition (Range 80/320), two.handed'                 , 'HoO'),
  (49, 'Masakari'         , 'slashing'            , '1d8' , 'Versatile (ld10)'                                      , 'HoO'),
  (50, 'Nunchaku'         , 'bludgeoning'         , '1d6' , ''                                                      , 'HoO'),
  (51, 'Naginata'         , 'slashing'            , '1d10', 'Heavy, reach, two-handed'                              , 'HoO'),
  (52, 'Nodachi'          , 'slashing'            , '2d6' , 'Heavy, two-handed, pristine'                           , 'HoO'),
  (53, 'Kamayari'         , 'slashing'            , '1d10', 'Heavy, reach, two.handed'                              , 'HoO'),
  (54, 'Umayari'          , 'piercing'            , '1d12', 'Reach, special'                                        , 'HoO'),
  (55, 'Katana'           , 'slashing'            , '1d8' , 'Versatile (ldl0)'                                      , 'HoO'),
  (56, 'Nagaeyari'        , 'piercing'            , '1d10', 'Heavy, reach, two.handed'                              , 'HoO'),
  (57, 'Wakizashi'        , 'slashing'            , '1d6' , 'Finesse, light, pristine'                              , 'HoO'),
  (58, 'Ninja-To'         , 'piercing / slashing' , '1d6' , 'Finesse, light, pristine'                              , 'HoO'),
  (59, 'Magariyari'       , 'piercing'            , '1d6' , 'Thrown (Range 20/60), versatile (ld8)'                 , 'HoO'),
  (60, 'War Fan'          , 'piercing'            , '1d6' , 'Finesse, light'                                        , 'HoO'),
  (61, 'Kuwa'             , 'piercing'            , '1d8' , ''                                                      , 'HoO'),
  (62, 'Nagamaki'         , 'slashing'            , '1d8' , 'Versatile (2d4), reach, pristine'                      , 'HoO'),
  (63, 'Dual Naginata'    , 'slashing'            , '1d12', 'Heavy, two-handed, pristine'                           , 'HoO'),
  (64, 'Sai'              , 'piercing'            , '1d4' , 'Finesse, light, special'                               , 'HoO'),
  (65, 'Daikyu'           , 'piercing'            , '1d8' , 'Ammunition (Range 150/600), heavy, two-handed'         , 'HoO');
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
COMMIT;