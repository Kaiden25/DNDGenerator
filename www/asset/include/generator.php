<?php
/**
 * Created by PhpStorm.
 * User: Drake
 * Date: 19.10.2017
 * Time: 19:45
 */
@session_start();
include "connectionDatabase.php";
function itemTypeDropDown()
{
    echo '<option value="Random">Random</option>';
    foreach (getItemTypes() as $itemType) {
        echo '<option value="'.$itemType['text'].'">'.$itemType['text'].'</option>';
    }
}
function equipmentTypeDropDown(){
    echo '<option value="Random">Random</option>';
    foreach (getWeaponType() as $weapon) {
        echo '<option value="'.$weapon['weaponName'].'">'.$weapon['weaponName'].'</option>';
    }
    foreach (getArmorType() as $armor) {
        echo '<option value="'.$armor['armorName'].'">'.$armor['armorName'].'</option>';
    }
}
function weaponTypeDropDown(){
    echo '<option value="Random">Random</option>';
    foreach (getWeaponType() as $weapon) {
        echo '<option value="'.$weapon['weaponName'].'">'.$weapon['weaponName'].'</option>';
    }
}
function armorTypeDropDown(){
    echo '<option value="Random">Random</option>';
    foreach (getArmorType() as $armor) {
        echo '<option value="'.$armor['armorName'].'">'.$armor['armorName'].'</option>';
    }
}
function rarityDropDown(){
    echo '<option value="Random">Random</option>';
    foreach (getRarityDropDown() as $rarity) {
        echo '<option value="'.$rarity['rarity'].'">'.$rarity['rarity'].'</option>';
    }
}
function foeDropDown(){
    echo '<option value="Random">Random</option>';
    foreach (getFoeDropDown() as $foe) {
        echo '<option value="'.$foe['foeType'].'">'.$foe['foeType'].'</option>';
    }
}

function generateMagicItem(){
    $info = "";
    $attunement = "";
    $aligned = false;
    $postinfo = "";
    if (isset($_SESSION['attunment'])){
        $attunement = "Requires Attunemt <br>";
    }
    if (isset($_SESSION['raritySelector'])) {
        if ($_SESSION['raritySelector'] !== "Random") {
            $rarity = $_SESSION['raritySelector'];
            $info = getRarity($rarity);
        } else {
            $rarity = "Random";
            $info = getRarity($rarity);
        }
        foreach ($info as $rarity) {
            if ($rarity['rarity'] === "Legendary") {
                $attunement = "Requires Attunemt <br>";
            }
            $rare = $rarity['rarity'] . "<br>";
            $mod = $rarity['maxBonus'] . "<br>";
            $mod = intval($mod);
        }
    }
    if (isset($_SESSION['sentient'])){
        $postinfo = "<br>";
        $int = mt_rand(10, 18);
        $wis = mt_rand(10, 18);
        $cha = mt_rand(10, 18);
        $postinfo .= "Attributes<br>Int: ".$int."<br>Wis: ".$wis."<br>Cha: ".$cha."<br>";
        foreach (getCommunication() as $communication){
            $postinfo .= $communication['text']."<br>";
        }
        foreach (getSenses() as $sense){
            $postinfo .= $sense['text']."<br>";
        }
        foreach (getPurpose() as $purpose){
            $postinfo .= $purpose['title'] . "<br>";
            if ($purpose['title'] === "Aligned"){
                $aligned = true;
            }
            $postinfo .= $purpose['text']."<br>";
        }
        foreach (getAlignemnt($aligned) as $alignment){
            $postinfo .= $alignment['alignment']."<br>";
        }
    }
    if (isset($_SESSION['creator'])){
        foreach (getCreator() as $creator){
            $postinfo .= "<br>".$creator['creatorType']."<br>";
            $postinfo .= $creator['text']."<br>";
        }
    }
    if (isset($_SESSION['artefact'])){
        foreach (getMajorProperty() as $majorProperty){
            $postinfo .= $majorProperty['text']."<br>";
        }
        foreach (getMajorNegativeProperty() as $majorNegativeProperty){
            $postinfo .= $majorNegativeProperty['text']."<br>";
        }
        foreach (getMinorArtefactProperty() as $minorArtefactProperty){
            $postinfo .= $minorArtefactProperty['text']."<br>";
        }
        foreach (getMinorNegativeProperty() as $majorNegativeProperty){
            $postinfo .= $majorNegativeProperty['text']."<br>";
        }
    } else {
        if (isset($_SESSION['minorProperty'])){
            foreach (getMinorProperty() as $minorProperty) {
                if ($minorProperty['title'] === "Harmonious") {
                    $attunement = "Requires Attunemt <br>";
                }
                $postinfo .= "<br>" . $minorProperty['title'] . "<br>";
                $postinfo .= $minorProperty['text'] . "<br>";
            }
        }
    }
    if (isset($_SESSION['history'])){
        foreach (getHistory() as $history){
            $postinfo .= "<br>".$history['theme']."<br>";
            $postinfo .= $history['text']."<br>";
        }
    }
    if (isset($_SESSION['quirk'])){
        foreach (getQuirk() as $quirk){
            $postinfo .= "<br>".$quirk['theme']."<br>";
            $postinfo .= $quirk['text']."<br>";
        }
    }
    if (isset($_SESSION['foe'])){
        if ($_SESSION['foeSelector'] !== "Random"){
            $foe = $_SESSION['foeSelector'];
            $info = getFoe($foe);
        } else {
            $foe = "Random";
            $info = getFoe($foe);
        }
        foreach ($info as $foe) {
            $foe = $foe['foeType'];
            $mod2 = $mod + 1;
            $postinfo .= "<br>" . $foe . "<br>";
            $postinfo .= "This weapon deals additional ".$mod2."d6 against creatures of the ".$foe." type.<br>";
        }
    }
    if (isset($_SESSION['weaponType'])){
        if ($_SESSION['weaponType'] !== "Random"){
            $weapon = $_SESSION['weaponType'];
            $info = getWeapon($weapon);
        } else {
            $weapon = "Random";
            $info = getWeapon($weapon);
        }
        foreach ($info as $i){
            if($mod > 0) {
                $info = "<h3>".$i['weaponName']." + ".$mod."</h3>";
            } else {
                $info = "<h3>".$i['weaponName']."</h3>";
            }
            $info .= $rare;
            if ($attunement === "Requires Attunemt <br>"){
                $info .= $attunement;
            }
            $info .= $i['damageType']."<br>";
            $info .= $i['damageDice']."<br>";
            $info .= $i['weaponProperty']."<br>";
        }
    } elseif (isset($_SESSION['armorType'])){
        if ($_SESSION['armorType'] !== "Random"){
            $armor = $_SESSION['armorType'];
            $info = getArmor($armor);
        } else {
            $armor = "Random";
            $info = getArmor($armor);
        }
        foreach ($info as $i){
            if($mod > 0) {
                $info = "<h3>" .$i['armorName'] ." + ". $mod . "</h3>";
            } else {
                $info = "<h3>" .$i['armorName'] . "</h3>";
            }
            $info .= $rare;
            if ($attunement === "Requires Attunemt <br>"){
                $info .= $attunement;
            }
            if($mod > 0) {
                $ac = intval($i['armorclass']);
                $info .= "AC " . $ac ." + ". $mod ."<br>";
            } else {
                $info .= $i['armorclass']."<br>";
            }
            if ($i['hasDexMod'] > 0) {
                if ($i['maxDexMod'] != NULL) {
                    $info .= "(Max Dex Bonus +" . $i['maxDexMod'] . ")<br>";
                }
            }
            $info .= $i['category']."<br>";
        }
    } elseif (isset($_SESSION['equipmentType'])) {
        if ($_SESSION['equipmentType'] !== "Random") {
            $equipment = $_SESSION['equipmentType'];
            $info = getEquipment($equipment);
        } else {
            $equipment = "Random";
            $info = getEquipment($equipment);
        }
        if ($_SESSION['equipment'] === "Weapon"){
            foreach ($info as $i){
                if($mod > 0) {
                    $info = "<h3>" . $i['weaponName'] ." + ". $mod . "</h3>";
                } else {
                    $info = "<h3>".$i['weaponName']."</h3>";
                }
                $info .= $rare;
                if ($attunement === "Requires Attunemt <br>"){
                    $info .= $attunement;
                }
                $info .= $i['damageType']."<br>";
                $info .= $i['damageDice']."<br>";
                $info .= $i['weaponProperty']."<br>";
            }
        } elseif ($_SESSION['equipment'] === "Armor") {
            foreach ($info as $i){
                if($mod > 0) {
                    $info = $i['armorName'] ." + ". $mod . "<br>";
                } else {
                    $info = $i['armorName'] . "<br>";
                }
                $info .= $rare;
                if ($attunement === "Requires Attunemt <br>"){
                    $info .= $attunement;
                }
                if($mod > 0) {
                    $ac = $i['armorclass'] + $mod;
                    $info .= "AC " ." + ". $ac . "<br>";
                } else {
                    $info .= $i['armorclass']."<br>";
                }
                if ($i['hasDexMod'] > 0) {
                    if ($i['maxDexMod'] != NULL) {
                        $info .= "(Max Dex Bonus +" . $i['maxDexMod'] . ")<br>";
                    }
                }
                $info .= $i['category']."<br>";
            }
        }
    }
    $info .= $postinfo;

    unsetSessionVariables();
    return $info;
}

function unsetSessionVariables(){
    if (isset($_SESSION['sentient'])) {
        unset($_SESSION['sentient']);
    }
    if (isset($_SESSION['artefact'])) {
        unset($_SESSION['artefact']);
    }
    if (isset($_SESSION['foe'])) {
        unset($_SESSION['foe']);
    }
    if (isset($_SESSION['equipment'])) {
        unset($_SESSION['equipment']);
    }
    if (isset($_SESSION['equipmentType'])) {
        unset($_SESSION['equipmentType']);
    }
    if (isset($_SESSION['armorType'])) {
        unset($_SESSION['armorType']);
    }
    if (isset($_SESSION['weaponType'])) {
        unset($_SESSION['weaponType']);
    }
    if (isset($_SESSION['foeSelector'])) {
        unset($_SESSION['foeSelector']);
    }
    if (isset($_SESSION['raritySelector'])) {
        unset($_SESSION['raritySelector']);
    }
    if (isset($_SESSION['attunment'])) {
        unset($_SESSION['attunment']);
    }
    if (isset($_SESSION['creator'])) {
        unset($_SESSION['creator']);
    }
    if (isset($_SESSION['quirk'])) {
        unset($_SESSION['quirk']);
    }
    if (isset($_SESSION['history'])) {
        unset($_SESSION['history']);
    }
    if (isset($_SESSION['minorProperty'])) {
        unset($_SESSION['minorProperty']);
    }
    if (isset($_SESSION['MagicItem'])) {
        unset($_SESSION['MagicItem']);
    }
}