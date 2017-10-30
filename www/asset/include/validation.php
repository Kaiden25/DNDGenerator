<?php
/**
 * Created by PhpStorm.
 * User: Drake
 * Date: 30.10.2017
 * Time: 16:42
 */
include_once "generator.php";
if (isset($_GET['MagicItem']) && !isset($_SESSION['MagicItem'])){
    if (isset($_GET['raritySelector'])){
        $_SESSION['raritySelector'] = $_GET['raritySelector'];
    }
    if (isset($_GET['foeSelector'])){
        $_SESSION['foeSelector'] = $_GET['foeSelector'];
    }
    if (isset($_GET['weaponType'])){
        $_SESSION['weaponType'] = $_GET['weaponType'];
    }
    if (isset($_GET['armorType'])){
        $_SESSION['armorType'] = $_GET['armorType'];
    }
    if (isset($_GET['equipmentType'])) {
        $_SESSION['equipmentType'] = $_GET['equipmentType'];
    }
    if (isset($_GET['attunment'])) {
        $_SESSION['attunment'] = $_GET['attunment'];
    }
    $_SESSION['MagicItem'] = generateMagicItem();
    //header("Location: index.php");
    $_SESSION['magicItemPost'] = "Redirect";
}
if ($_SESSION['magicItemPost'] === "Redirect"){
    header("Location: index.php");
    $_SESSION['magicItemPost'] = "";
    exit();
}