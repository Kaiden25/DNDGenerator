<?php
/**
 * Created by PhpStorm.
 * User: Drake
 * Date: 19.10.2017
 * Time: 20:55
 * getenv("variablename")
 */
@session_start();
GLOBAL $mysqli;

if (getenv('MYSQL_HOST')){
    $db_host = getenv('MYSQL_HOST');
} else {
    $db_host = 'localhost';
}
if (getenv('MYSQL_USER')){
    $db_user = getenv('MYSQL_USER');
} else {
    $db_user = 'root';
}
if (getenv('MYSQL_PASSWORD')){
    $db_pass = getenv('MYSQL_PASSWORD');
} else {
    $db_pass = '';
}
if (getenv('MYSQL_DATABASE')){
    $db_name = getenv('MYSQL_DATABASE');
} else {
    $db_name = 'DNDGenerator';
}

$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);
//$mysqli = new mysqli('localhost', 'root', '', 'magicitemgenerator');
if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') '
        . $mysqli->connect_error);
}
$sql = "SET NAMES utf8;";
$sql = mysqli_query($mysqli, $sql);
//echo 'Success... ' . $mysqli->host_info . "\n";
//$mysqli->close();


function getItemTypes(){
    GLOBAL $mysqli;
    $itemTypes = array();
    $sql = "SELECT * FROM `itemcategory` LIMIT 2;";
    //$sql = mysqli_query($mysqli, $sql);
    $result = $mysqli->query($sql);
    while ($row = $result->fetch_assoc()){
        array_push($itemTypes, $row);
    }
    return $itemTypes;
}

function getEquipmentType(){
    GLOBAL $mysqli;
    $equipmentTypes = array();
    $sql = "SELECT `weaponName` FROM `weapons`;";
    $sql = mysqli_query($mysqli, $sql);
    $sql2 = "SELECT `armorName` FROM `armor`;";
    $sql2 = mysqli_query($mysqli, $sql2);
    while ($row = $sql->fetch_assoc()){
        array_push($equipmentTypes, $row);
    }
    while ($row = $sql2->fetch_assoc()){
        array_push($equipmentTypes, $row);
    }
    return $equipmentTypes;
}

function getWeaponType(){
    GLOBAL $mysqli;
    $weaponTypes = array();
    $sql = "SELECT `weaponName` FROM `weapons`;";
    $sql = mysqli_query($mysqli, $sql);
    while ($row = $sql->fetch_assoc()){
        array_push($weaponTypes, $row);
    }
    return $weaponTypes;
}

function getArmorType(){
    GLOBAL $mysqli;
    $armorTypes = array();
    $sql = "SELECT `armorName` FROM `armor`;";
    $sql = mysqli_query($mysqli, $sql);
    while ($row = $sql->fetch_assoc()){
        array_push($armorTypes, $row);
    }
    return $armorTypes;
}

function getWeapon($weapon){
    GLOBAL $mysqli;
    $weaponinfo = array();
    if ($weapon !== "Random"){
        $sql = "SELECT * FROM `weapons` WHERE `weaponName` LIKE '".$weapon."';";
        $sql = mysqli_query($mysqli, $sql);
        $result = $sql;
        while ($row = $result->fetch_assoc()){
            array_push($weaponinfo, $row);
        }
    }else{
        $sql = "SELECT * FROM `weapons`;";
        $sql = mysqli_query($mysqli, $sql);
        $result = $sql;
        $weaponMaxId = $result->num_rows;
        $weaponId = mt_rand(1, $weaponMaxId);

        $sql2 = "SELECT * FROM `weapons` WHERE `id` LIKE ".$weaponId.";";
        $sql2 = mysqli_query($mysqli, $sql2);
        $result = $sql2;
        while ($row = $result->fetch_assoc()){
            array_push($weaponinfo, $row);
        }
    }
    return $weaponinfo;
}

function getArmor($armor){
    GLOBAL $mysqli;
    $armorinfo = array();
    if ($armor !== "Random"){
        $sql = "SELECT * FROM `armor` WHERE `armorName` LIKE '".$armor."';";
        $sql = mysqli_query($mysqli, $sql);
        $result = $sql;
        while ($row = $result->fetch_assoc()){
            array_push($armorinfo, $row);
        }
    } else {
        $sql = "SELECT * FROM `armor`;";
        $sql = mysqli_query($mysqli, $sql);
        $result = $sql;
        $armorMaxId = $result->num_rows;
        $armorId = mt_rand(1, $armorMaxId);

        $sql2 = "SELECT * FROM `armor` WHERE `id` LIKE ".$armorId.";";
        $sql2 = mysqli_query($mysqli, $sql2);
        while ($row = $sql2->fetch_assoc()){
            array_push($armorinfo, $row);
        }
    }
    return $armorinfo;
}

function getEquipment($equipment){
    $equipmentinfo = array();
    if ($equipment !== "Random"){
        $weapon = $equipment;
        if (getWeapon($weapon)){
            $equipmentinfo = getWeapon($weapon);
        } else {
            $armor = $equipment;
            $equipmentinfo = getArmor($armor);
        }
    } else {
        $selct = mt_rand(0, 1);
        if ($selct == 0){
            $weapon = "Random";
            $equipmentinfo = getWeapon($weapon);
        } else {
            $armor = "Random";
            $equipmentinfo = getArmor($armor);
        }
    }
    return $equipmentinfo;
}

function getCreator(){
    GLOBAL $mysqli;
    $creatorinfo = array();
    $sql = "SELECT * FROM `creator`;";
    $sql = mysqli_query($mysqli, $sql);
    $result = $sql;
    $creatorMaxId = $result->num_rows;
    $creatorId = mt_rand(1, $creatorMaxId);

    $sql2 = "SELECT `creatorType`, `text` FROM `creator` WHERE `id` LIKE ".$creatorId.";";
    $sql2 = mysqli_query($mysqli, $sql2);
    $result = $sql2;
    while ($row = $result->fetch_assoc()){
        array_push($creatorinfo, $row);
    }
    return $creatorinfo;
}

function getMinorProperty(){
    GLOBAL $mysqli;
    $minorpropertyinfo = array();
    $sql = "SELECT * FROM `minorproperties`;";
    $sql = mysqli_query($mysqli, $sql);
    $result = $sql;
    $minorpropertyMaxId = $result->num_rows;
    $minorpropertyId = mt_rand(1, $minorpropertyMaxId);

    $sql2 = "SELECT `title`, `text` FROM `minorproperties` WHERE `id` LIKE ".$minorpropertyId.";";
    $sql2 = mysqli_query($mysqli, $sql2);
    $result = $sql2;
    while ($row = $result->fetch_assoc()){
        array_push($minorpropertyinfo, $row);
    }
    return $minorpropertyinfo;
}

function getHistory(){
    GLOBAL $mysqli;
    $historyinfo = array();
    $sql = "SELECT * FROM `history`;";
    $sql = mysqli_query($mysqli, $sql);
    $result = $sql;
    $historyMaxId = $result->num_rows;
    $historyId = mt_rand(1, $historyMaxId);

    $sql2 = "SELECT `theme`, `text` FROM `history` WHERE `id` LIKE ".$historyId.";";
    $sql2 = mysqli_query($mysqli, $sql2);
    $result = $sql2;
    while ($row = $result->fetch_assoc()){
        array_push($historyinfo, $row);
    }
    return $historyinfo;
}

function getQuirk(){
    GLOBAL $mysqli;
    $quirkinfo = array();
    $sql = "SELECT * FROM `quirks`;";
    $sql = mysqli_query($mysqli, $sql);
    $result = $sql;
    $quirkMaxId = $result->num_rows;
    $quirkId = mt_rand(1, $quirkMaxId);

    $sql2 = "SELECT `theme`, `text` FROM `quirks` WHERE `id` LIKE ".$quirkId.";";
    $sql2 = mysqli_query($mysqli, $sql2);
    $result = $sql2;
    while ($row = $result->fetch_assoc()){
        array_push($quirkinfo, $row);
    }
    return $quirkinfo;
}

function getRarity(){
    GLOBAL $mysqli;
    $rarityinfo = array();
    $sql = "SELECT * FROM `rarity`;";
    $sql = mysqli_query($mysqli, $sql);
    $result = $sql;
    $rarityMaxId = $result->num_rows;
    $rarityId = mt_rand(1, $rarityMaxId);

    $sql2 = "SELECT `rarity`, `maxSpellLevel`, `maxBonus` FROM `rarity` WHERE `id` LIKE ".$rarityId.";";
    $sql2 = mysqli_query($mysqli, $sql2);
    $result = $sql2;
    while ($row = $result->fetch_assoc()){
        array_push($rarityinfo, $row);
    }
    return $rarityinfo;
}