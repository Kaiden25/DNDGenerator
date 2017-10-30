<?php
/**
 * Created by PhpStorm.
 * User: Drake
 * Date: 19.10.2017
 * Time: 19:09
 */

session_start();
include "asset/include/connectionDatabase.php";
include "asset/include/generator.php";

if (!isset($_SESSION['MagicItem'])){
    $_SESSION['creator'] = true;
    $_SESSION['history'] = true;
    $_SESSION['quirk'] = true;
    $_SESSION['minorProperty'] = true;
}

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
                } ?>
                    <br>
                    <input type="checkbox" name="attunment" value="attunment"> Does the item require attunment? <br>
                    What rarity does the item have?
                    <select name="raritySelector" form="itemTypeForm" required>
                        <?php
                        rarityDropDown();
                        ?>
                    </select><br>
                <?php
                if (isset($_POST['sentient'])){
                    $_SESSION['sentient'] = $_POST['sentient'];
                }
                if (isset($_POST['artefact'])){
                    $_SESSION['artefact'] = $_POST['artefact'];
                }
                if (isset($_POST['foe']) && $_POST['itemType'] !== "Armor"){
                    $_SESSION['foe'] = $_POST['foe']; ?>
                    What creature type does the enemy of the item have?
                    <select name="foeSelector" form="itemTypeForm" required>
                        <?php
                        foeDropDown();
                        ?>
                    </select>
                <?php
                } ?>
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
                $_SESSION['MagicItem'] = $_POST['MagicItem'];
                if (isset($_POST['raritySelector'])){
                    $_SESSION['raritySelector'] = $_POST['raritySelector'];
                }
                if (isset($_POST['foeSelector'])){
                    $_SESSION['foeSelector'] = $_POST['foeSelector'];
                }
                if (isset($_POST['weaponType'])){
                    $_SESSION['weaponType'] = $_POST['weaponType'];
                }
                if (isset($_POST['armorType'])){
                    $_SESSION['armorType'] = $_POST['armorType'];
                }
                if (isset($_POST['equipmentType'])) {
                    $_SESSION['equipmentType'] = $_POST['equipmentType'];
                }
                if (isset($_POST['attunment'])) {
                    $_SESSION['attunment'] = $_POST['attunment'];
                }
                header("Location: index.php");
            } elseif (isset($_SESSION['MagicItem'])){
                echo generateMagicItem();
                unsetSession();
            }
            ?>
        </td>
    </tr>
</table>
</body>
</html>