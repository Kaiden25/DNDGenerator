<?php
/**
 * Created by PhpStorm.
 * User: Drake
 * Date: 19.10.2017
 * Time: 20:55
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
if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') '
        . $mysqli->connect_error);
}
$sql = "SET NAMES utf8;";
$res = $mysqli->query($sql);

function getItemTypes(){
    GLOBAL $mysqli;
    $itemTypes = array();
    $sql = "SELECT * FROM `itemcategory` LIMIT 2;";
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
    $res = $mysqli->query($sql);
    $sql2 = "SELECT `armorName` FROM `armor`;";
    $res2 = $mysqli->query($sql2);
    while ($row = $res->fetch_assoc()){
        array_push($equipmentTypes, $row);
    }
    while ($row = $res2->fetch_assoc()){
        array_push($equipmentTypes, $row);
    }
    return $equipmentTypes;
}
function getWeaponType(){
    GLOBAL $mysqli;
    $weaponTypes = array();
    $sql = "SELECT `weaponName` FROM `weapons`;";
    $res = $mysqli->query($sql);
    while ($row = $res->fetch_assoc()){
        array_push($weaponTypes, $row);
    }
    return $weaponTypes;
}
function getArmorType(){
    GLOBAL $mysqli;
    $armorTypes = array();
    $sql = "SELECT `armorName` FROM `armor`;";
    $res = $mysqli->query($sql);
    while ($row = $res->fetch_assoc()){
        array_push($armorTypes, $row);
    }
    return $armorTypes;
}
function getWeapon($weapon){
    GLOBAL $mysqli;
    $weaponinfo = array();
    if ($weapon !== "Random"){
        $sql = "SELECT * FROM `weapons` WHERE `weaponName` LIKE '".$weapon."';";
                $result = $mysqli->query($sql);
        while ($row = $result->fetch_assoc()){
            array_push($weaponinfo, $row);
        }
    }else{
        $sql = "SELECT * FROM `weapons`;";
        $result = $mysqli->query($sql);
        $weaponMaxId = $result->num_rows;
        $weaponId = mt_rand(1, $weaponMaxId);

        $sql2 = "SELECT * FROM `weapons` WHERE `id` LIKE ".$weaponId.";";
        $result = $mysqli->query($sql2);
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
        $result = $mysqli->query($sql);
        $armorMaxId = $result->num_rows;
        $armorId = mt_rand(1, $armorMaxId);

        $sql2 = "SELECT * FROM `armor` WHERE `id` LIKE ".$armorId.";";
        $res2 = $mysqli->query($sql2);
        while ($row = $res2->fetch_assoc()){
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
    $result = $mysqli->query($sql);
    $creatorMaxId = $result->num_rows;
    $creatorId = mt_rand(1, $creatorMaxId);

    $sql2 = "SELECT `creatorType`, `text` FROM `creator` WHERE `id` LIKE ".$creatorId.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($creatorinfo, $row);
    }
    return $creatorinfo;
}
function getMinorProperty(){
    GLOBAL $mysqli;
    $minorpropertyinfo = array();
    $sql = "SELECT * FROM `minorproperties`;";
    $result = $mysqli->query($sql);
    $minorpropertyMaxId = $result->num_rows;
    $minorpropertyId = mt_rand(1, $minorpropertyMaxId);

    $sql2 = "SELECT `title`, `text` FROM `minorproperties` WHERE `id` LIKE ".$minorpropertyId.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($minorpropertyinfo, $row);
    }
    return $minorpropertyinfo;
}
function getHistory(){
    GLOBAL $mysqli;
    $historyinfo = array();
    $sql = "SELECT * FROM `history`;";
    $result = $mysqli->query($sql);
    $historyMaxId = $result->num_rows;
    $historyId = mt_rand(1, $historyMaxId);

    $sql2 = "SELECT `theme`, `text` FROM `history` WHERE `id` LIKE ".$historyId.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($historyinfo, $row);
    }
    return $historyinfo;
}
function getQuirk(){
    GLOBAL $mysqli;
    $quirkinfo = array();
    $sql = "SELECT * FROM `quirks`;";
    $result = $mysqli->query($sql);
    $quirkMaxId = $result->num_rows;
    $quirkId = mt_rand(1, $quirkMaxId);

    $sql2 = "SELECT `theme`, `text` FROM `quirks` WHERE `id` LIKE ".$quirkId.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($quirkinfo, $row);
    }
    return $quirkinfo;
}
function getRarity(){
    GLOBAL $mysqli;
    $rarityinfo = array();
    $sql = "SELECT * FROM `rarity`;";
    $result = $mysqli->query($sql);
    $rarityMaxId = $result->num_rows;
    $rarityId = mt_rand(1, $rarityMaxId);

    $sql2 = "SELECT `rarity`, `maxSpellLevel`, `maxBonus` FROM `rarity` WHERE `id` LIKE ".$rarityId.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($rarityinfo, $row);
    }
    return $rarityinfo;
}
function getRarityDropDown(){
    GLOBAL $mysqli;
    $rarityInfo = array();
    $sql  = "SELECT `rarity` FROM `rarity`;";
    $result = $mysqli->query($sql);
    while ($row = $result->fetch_assoc()){
        array_push($rarityInfo, $row);
    }
    return $rarityInfo;
}
function getMajorProperty(){
    GLOBAL $mysqli;
    $majorPropertyInfo = array();
    $sql = "SELECT * FROM `majorproperties`;";
    $result = $mysqli->query($sql);
    $majorPropertyMaxId = $result->num_rows;
    $majorPropertyId = mt_rand(1, $majorPropertyMaxId);
    $count = mt_rand(0, 2);

    $sql2 = "SELECT  `text` FROM `majorproperties` WHERE `id` LIKE ".$majorPropertyId." LIMIT ".$count.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($majorPropertyInfo, $row);
    }
    return $majorPropertyInfo;
}
function getMajorNegativeProperty(){
    GLOBAL $mysqli;
    $majorNegativePropertyInfo = array();
    $sql = "SELECT * FROM `majornegativproperties`;";
    $result = $mysqli->query($sql);
    $majorNegativePropertyMaxId = $result->num_rows;
    $majorNegativePropertyId = mt_rand(1, $majorNegativePropertyMaxId);
    $count = mt_rand(0, 2);

    $sql2 = "SELECT `text` FROM `majornegativproperties` WHERE `id` LIKE ".$majorNegativePropertyId." LIMIT ".$count.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($majorNegativePropertyInfo, $row);
    }
    return $majorNegativePropertyInfo;
}
function getMinorArtefactProperty(){
    GLOBAL $mysqli;
    $minorArtefactPropertyInfo = array();
    $sql = "SELECT * FROM `minorartefactproperties`;";
    $result = $mysqli->query($sql);
    $minorArtefactPropertyMaxId = $result->num_rows;
    $minorArtefactPropertyId = mt_rand(1, $minorArtefactPropertyMaxId);
    $count = mt_rand(0, 2);

    $sql2 = "SELECT `text` FROM `minorartefactproperties` WHERE `id` LIKE ".$minorArtefactPropertyId." LIMIT ".$count.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($minorArtefactPropertyInfo, $row);
    }
    return $minorArtefactPropertyInfo;
}
function getMinorNegativeProperty(){
    GLOBAL $mysqli;
    $minorNegativePropertyInfo = array();
    $sql = "SELECT * FROM `minornegativproperties`;";
    $result = $mysqli->query($sql);
    $minorNegativePropertyMaxId = $result->num_rows;
    $minorNegativePropertyId = mt_rand(1, $minorNegativePropertyMaxId);
    $count = mt_rand(0, 2);

    $sql2 = "SELECT `text` FROM `minornegativproperties` WHERE `id` LIKE ".$minorNegativePropertyId." LIMIT ".$count.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($minorNegativePropertyInfo, $row);
    }
    return $minorNegativePropertyInfo;
}
function getCommunication(){
    GLOBAL $mysqli;
    $communicationInfo = array();
    $sql = "SELECT * FROM `comunication`;";
    $result = $mysqli->query($sql);
    $communicationMaxId = $result->num_rows;
    $communicationId = mt_rand(1, $communicationMaxId);

    $sql2 = "SELECT `text` FROM `comunication` WHERE `id` LIKE ".$communicationId.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($communicationInfo, $row);
    }
    return $communicationInfo;
}
function getSenses(){
    GLOBAL $mysqli;
    $sensesInfo = array();
    $sql = "SELECT * FROM `senses`;";
    $result = $mysqli->query($sql);
    $sensesMaxId = $result->num_rows;
    $sensesId = mt_rand(1, $sensesMaxId);

    $sql2 = "SELECT `text` FROM `senses` WHERE `id` LIKE ".$sensesId.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($sensesInfo, $row);
    }
    return $sensesInfo;
}
function getPurpose(){
    GLOBAL $mysqli;
    $purposeInfo = array();
    $sql = "SELECT * FROM `purpose`;";
    $result = $mysqli->query($sql);
    $purposeMaxId = $result->num_rows;
    $purposeId = mt_rand(1, $purposeMaxId);

    $sql2 = "SELECT `title`, `text` FROM `purpose` WHERE `id` LIKE ".$purposeId.";";
    $result = $mysqli->query($sql2);
    while ($row = $result->fetch_assoc()){
        array_push($purposeInfo, $row);
    }
    return $purposeInfo;
}
function getAlignemnt($aligned){
    GLOBAL $mysqli;
    if ($aligned){
        $alignmentInfo = array();
        $sql = "SELECT * FROM `alignment`;";
        $result = $mysqli->query($sql);
        $alignmentMaxId = $result->num_rows;
        $alignmentId = mt_rand(1, $alignmentMaxId);

        $sql2 = "SELECT * FROM `alignment` WHERE `alignment` NOT LIKE '%Neutral';";
        $result = $mysqli->query($sql2);
        while ($row = $result->fetch_assoc()){
            array_push($alignmentInfo, $row);
        }
    } else {
        $alignmentInfo = array();
        $sql = "SELECT * FROM `alignment`";
        $result = $mysqli->query($sql);
        $alignmentMaxId = $result->num_rows;
        $alignmentId = mt_rand(1, $alignmentMaxId);

        $sql2 = "SELECT `alignment` FROM `alignment` WHERE `id` LIKE ".$alignmentId.";";
        $result = $mysqli->query($sql2);
        while ($row = $result->fetch_assoc()){
            array_push($alignmentInfo, $row);
        }
    }
    return $alignmentInfo;
}
function getFoe($foe){
    GLOBAL $mysqli;
    $foeInfo = array();
    if ($foe !== "Random"){
        $sql1 = "SELECT `foeType` FROM `foe` WHERE `foeType` LIKE '".$foe."';";
        $result = $mysqli->query($sql1);
        while ($row = $result->fetch_assoc()) {
            array_push($foeInfo, $row);
        }
    } else {
        $sql = "SELECT * FROM `foe`;";
        $result = $mysqli->query($sql);
        $foeMaxId = $result->num_rows;
        $foeId = mt_rand(1, $foeMaxId);

        $sql2 = "SELECT `foeType` FROM `foe` WHERE `id` LIKE ".$foeId.";";
        $result = $mysqli->query($sql2);
        while ($row = $result->fetch_assoc()) {
            array_push($foeInfo, $row);
        }
    }
    return $foeInfo;
}
function getFoeDropDown(){
    GLOBAL $mysqli;
    $foeInfo = array();
    $sql  = "SELECT `foeType` FROM `foe`;";
    $result = $mysqli->query($sql);
    while ($row = $result->fetch_assoc()){
        array_push($foeInfo, $row);
    }
    return $foeInfo;
}