<?php

/**
 * Created by PhpStorm.
 * User: Drake
 * Date: 19.10.2017
 * Time: 19:09
 */

session_start();
//$i = 0;
//if (isset($_COOKIE['i'])) {
//    $i++;
//}
//
//if ((isset($_SESSION['sentient']) || isset($_SESSION['artefact']) || isset($_SESSION['foe'])) && $i <= 0){
//    session_unset();
//    $i++;
//    $_COOKIE['i'] = $i;
//}
include "asset/include/connectionDatabase.php";
include "asset/include/generator.php";

?>
<html>
<head>
    <title>DNDGenerator</title>
</head>
<body>
<h1>D&D Generator</h1>
<h2>Magic Item Generator</h2>
<p>Fill out the forms to generate a magic item</p>
<table align="top">
    <tr>
        <td style="vertical-align:top">
            <?php if (!isset($_POST['itemPredefine'])) { ?>
                <form action="index.php" method="POST" id="itemCategoryForm">
                    What item type do you want to create?
                    <select name="itemType" form="itemCategoryForm" required>
                        <?php
                        itemTypeDropDown();
                        ?>
                    </select>
                    <br>
                    <input type="checkbox" name="sentient" value="sentient"> Is the item sentient?<br>
                    <br>
                    <input type="checkbox" name="artefact" value="artefact"> Is the item an artefact?<br>
                    <br>
                    <input type="checkbox" name="foe" value="foe"> Does the item have a foe<br>
                    <br>
                    <input type="submit" name="itemPredefine" value="Next">
                    <input type="reset" value="Reset">
                </form>
                <?php
            }
            if (isset($_POST['itemPredefine'])) {
                $_SESSION['itemType'] = $_POST['itemType']; ?>
                <form action="index.php" method="POST" id="itemTypeForm">
                <?php
                if($_POST['itemType'] === 'Weapon') { ?>
                What weapon type do you want to create?
                <select name="weaponType" form="itemTypeForm" required>
                <?php weaponTypeDropDown(); ?>
                </select>
                <?php
                } elseif ($_POST['itemType'] === 'Armor'){ ?>
                What armor type do you want to create?
                <select name="armorType" form="itemTypeForm" required>
                <?php armorTypeDropDown(); ?>
                </select>
                <?php
                } elseif ($_POST['itemType'] === 'Random'){ ?>
                What equipment type do you want to create?
                <select name="equipmentType" form="itemTypeForm" required>
                <?php equipmentTypeDropDown(); ?>
                </select>
                <?php
                }
                if (isset($_POST['sentient'])){
                    $_SESSION['sentient'] = $_POST['sentient'];
                }
                if (isset($_POST['artefact'])){
                    $_SESSION['artefact'] = $_POST['artefact'];
                }
                if (isset($_POST['foe']) && $_POST['itemType'] !== "Armor"){
                    $_SESSION['foe'] = $_POST['foe'];
                }
                ?>
                <br>
                <input type="submit" name="MagicItem" value="Generate the Magic Item">
                <input type="reset" value="Reset"></form>
            <?php
            } ?>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <?php
            if (isset($_POST['MagicItem'])){
                echo generateMagicItem();
            }
            ?>
        </td>
    </tr>
</table>
</body>
</html>