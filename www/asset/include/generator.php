<?php
/**
 * Created by PhpStorm.
 * User: Drake
 * Date: 19.10.2017
 * Time: 19:45
 */
@session_start();
function itemTypeDropDown()
{
    foreach (getItemTypes() as $itemType) {
        echo '<option value="'.$itemType['text'].'">'.$itemType['text'].'</option>';
    }
    echo '<option value="Random">Random</option>';
}
function weaponTypeDropDown()
{
    foreach (getWeaponType() as $weapon) {
        echo '<option value="'.$weapon['weaponName'].'">'.$weapon['weaponName'].'</option>';
    }
    echo '<option value="Random">Random</option>';
}
function armorTypeDropDown()
{
    foreach (getArmorType() as $armor) {
        echo '<option value="'.$armor['armorName'].'">'.$armor['armorName'].'</option>';
    }
    echo '<option value="Random">Random</option>';
}
function equipmentTypeDropDown()
{
    foreach (getWeaponType() as $weapon) {
        echo '<option value="'.$weapon['weaponName'].'">'.$weapon['weaponName'].'</option>';
    }
    foreach (getArmorType() as $armor) {
        echo '<option value="'.$armor['armorName'].'">'.$armor['armorName'].'</option>';
    }
    echo '<option value="Random">';
}
function generateMagicItem(){
    $info = "";
    $attunement = "";
    $aligned = false;
    $postinfo = "";
    foreach (getRarity() as $rarity){
        if ($rarity['rarity'] === "Legendary"){
            $attunement = "Requires Attunemt <br>";
        }
        $rare = $rarity['rarity']."<br>";
        $mod = $rarity['maxBonus']."<br>";
        $mod = intval($mod);
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
    foreach (getCreator() as $creator){
        $postinfo .= "<br>".$creator['creatorType']."<br>";
        $postinfo .= $creator['text']."<br>";
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
        foreach (getMinorProperty() as $minorProperty) {
            if ($minorProperty['title'] === "Harmonious") {
                $attunement = "Requires Attunemt <br>";
            }
            $postinfo .= "<br>" . $minorProperty['title'] . "<br>";
            $postinfo .= $minorProperty['text'] . "<br>";
        }
    }
    foreach (getHistory() as $history){
        $postinfo .= "<br>".$history['theme']."<br>";
        $postinfo .= $history['text']."<br>";
    }
    foreach (getQuirk() as $quirk){
        $postinfo .= "<br>".$quirk['theme']."<br>";
        $postinfo .= $quirk['text']."<br>";
    }
    if (isset($_SESSION['foe'])){
        foreach (getFoe() as $foe) {
            $foe = $foe['foeType'];
            $mod2 = $mod + 1;
            $postinfo .= "<br>" . $foe . "<br>";
            $postinfo .= "This weapon deals additional ". $mod2  ."d6 against creatures of the ".$foe. " type.<br>";
        }
    }
    if (isset($_POST['weaponType'])){
        if ($_POST['weaponType'] !== "Random"){
            $weapon = $_POST['weaponType'];
            $info = getWeapon($weapon);
        } else {
            $weapon = "Random";
            $info = getWeapon($weapon);
        }
        foreach ($info as $i){
            if($mod > 0) {
                $info = "<h3>" . $i['weaponName'] ." + ". $mod . "</h3>";
            } else {
                $info = "<h3>".$i['weaponName']."</h3>";
            }
            $info .= $rare;
            if ($attunement === "Requires Attunemt"){
                $info .= $attunement;
            }
            $info .= $i['damageType']."<br>";
            $info .= $i['damageDice']."<br>";
            $info .= $i['weaponProperty']."<br>";
        }
    } elseif (isset($_POST['armorType'])){
        if ($_POST['armorType'] !== "Random"){
            $armor = $_POST['armorType'];
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
            if ($attunement === "Requires Attunemt"){
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
    } elseif (isset($_POST['equipmentType'])) {
        if ($_POST['equipmentType'] !== "Random") {
            $equipment = $_POST['equipmentType'];
            $info = getEquipment($equipment);
        } else {
            $equipment = "Random";
            $info = getEquipment($equipment);
        }
        if ($_SESSION['itemType'] === "Weapon"){
            foreach ($info as $i){
                if($mod > 0) {
                    $info = "<h3>" . $i['weaponName'] . $mod . "</h3>";
                } else {
                    $info = "<h3>".$i['weaponName']."</h3>";
                }
                $info .= $rare;
                if ($attunement === "Requires Attunemt"){
                    $info .= $attunement;
                }
                $info .= $i['damageType']."<br>";
                $info .= $i['damageDice']."<br>";
                $info .= $i['weaponProperty']."<br>";
            }
        } else {
            foreach ($info as $i){
                if($mod > 0) {
                    $info = $i['armorName'] . $mod . "<br>";
                } else {
                    $info = $i['armorName'] . "<br>";
                }
                $info .= $rare;
                if ($attunement === "Requires Attunemt"){
                    $info .= $attunement;
                }
                if($mod > 0) {
                    $ac = $i['armorclass'] + $mod;
                    $info .= "AC " . $ac . "<br>";
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
    if (isset($_SESSION['sentient'])){
        unset($_SESSION['sentient']);
    }
    if (isset($_SESSION['artefact'])){
        unset($_SESSION['artefact']);
    }
    if (isset($_SESSION['foe'])){
        unset($_SESSION['foe']);
    }
    return $info;
}