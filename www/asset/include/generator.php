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
        echo "<option value=".$itemType['text'].">";
    }
    echo '<option value="Random">';
}

function weaponTypeDropDown()
{
    foreach (getWeaponType() as $weapon) {
        echo '<option value="'.$weapon['weaponName'].'">';
    }
    echo '<option value="Random">';
}

function armorTypeDropDown()
{
    foreach (getArmorType() as $armor) {
        echo '<option value="'.$armor['armorName'].'">';
    }
    echo '<option value="Random">';
}
function equipmentTypeDropDown()
{
    foreach (getWeaponType() as $weapon) {
        echo '<option value="'.$weapon['weaponName'].'">';
    }
    foreach (getArmorType() as $armor) {
        echo '<option value="'.$armor['armorName'].'">';
    }
    echo '<option value="Random">';
}

function generateMagicItem(){
    $info = "";
    $attunement = "";
    foreach (getRarity() as $rarity){
        if ($rarity['rarity'] === "Legendary"){
            $attunement = "Requires Attunemt <br>";
        }
        $rare = $rarity['rarity']."<br>";
        $mod = " +".$rarity['maxBonus']."<br>";
    }
    foreach (getCreator() as $creator){
        $postinfo = "<br>".$creator['creatorType']."<br>";
        $postinfo .= $creator['text']."<br>";
    }
    foreach (getMinorProperty() as $minorProperty){
        if ($minorProperty['title'] === "Harmonious"){
            $attunement = "Requires Attunemt <br>";
        }
        $postinfo .= "<br>".$minorProperty['title']."<br>";
        $postinfo .= $minorProperty['text']."<br>";
    }
    foreach (getHistory() as $history){
        $postinfo .= "<br>".$history['theme']."<br>";
        $postinfo .= $history['text']."<br>";
    }
    foreach (getQuirk() as $quirk){
        $postinfo .= "<br>".$quirk['theme']."<br>";
        $postinfo .= $quirk['text']."<br>";
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
                $info = "<h3>" .$i['armorName'] . $mod . "</h3>";
            } else {
                $info = "<h3>" .$i['armorName'] . "</h3>";
            }
            $info .= $rare;
            if ($attunement === "Requires Attunemt"){
                $info .= $attunement;
            }
            if($mod > 0) {
                $ac = intval($i['armorclass']);
                $mod = intval($mod);
                $ac = $ac + $mod;
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
    return $info;
}