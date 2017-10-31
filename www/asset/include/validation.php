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
    if (!isset($_GET['randomSentient'])){
        if (isset($_GET['int'])) {
            $_SESSION['int'] = $_GET['int'];
        }
        if (isset($_GET['wis'])) {
            $_SESSION['wis'] = $_GET['wis'];
        }
        if (isset($_GET['cha'])) {
            $_SESSION['cha'] = $_GET['cha'];
        }
        if (isset($_GET['communicationSelector'])) {
            $_SESSION['communicationSelector'] = $_GET['communicationSelector'];
        }
        if (isset($_GET['senseSelector'])) {
            $_SESSION['senseSelector'] = $_GET['senseSelector'];
        }
        if (isset($_GET['purposeSelector'])) {
            $_SESSION['purposeSelector'] = $_GET['purposeSelector'];
        }
        if (isset($_GET['alignmentSelector'])) {
            $_SESSION['alignmentSelector'] = $_GET['alignmentSelector'];
        }
    }
    if (isset($_GET['randomSentient'])) {
        $_SESSION['randomSentient'] = $_GET['randomSentient'];
    }
    $_SESSION['MagicItem'] = generateMagicItem();
    $_SESSION['magicItemPost'] = "Redirect";
}
if ($_SESSION['magicItemPost'] === "Redirect"){
    header("Location: index.php");
    $_SESSION['magicItemPost'] = "";
    exit();
}