<?php
/**
 * Created by PhpStorm.
 * User: Drake
 * Date: 19.10.2017
 * Time: 19:09
 */

session_start();
//include_once "asset/include/connectionDatabase.php";
include_once "asset/include/generator.php";
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
            <?php if (!isset($_GET['itemPredefine'])) { ?>
                <form action="index.php" method="GET" id="itemCategoryForm">
                    What item type do you want to create?
                    <select name="itemType" form="itemCategoryForm" required>
                        <?php
                        itemTypeDropDown();
                        ?>
                    </select>
                    <br>
                    <label><input type="checkbox" name="sentient" value="sentient"> Is the item sentient?</label><br>
                    <br>
                    <label><input type="checkbox" name="artefact" value="artefact"> Is the item an artefact?</label><br>
                    <br>
                    <label><input type="checkbox" name="foe" value="foe"> Does the item have a foe?</label><br>
                    <br>
                    <input type="submit" name="itemPredefine" value="Next">
                </form>
                <?php
            }
            if (isset($_GET['itemPredefine'])) {
                $_SESSION['itemType'] = $_GET['itemType']; ?>
                <form action="asset/include/validation.php" method="GET" id="itemTypeForm">
                <?php
                if($_GET['itemType'] === 'Weapon') { ?>
                    What weapon type do you want to create?
                    <select name="weaponType" form="itemTypeForm" required>
                    <?php weaponTypeDropDown(); ?>
                    </select>
                    <?php
                } elseif ($_GET['itemType'] === 'Armor'){ ?>
                    What armor type do you want to create?
                    <select name="armorType" form="itemTypeForm" required>
                    <?php armorTypeDropDown(); ?>
                    </select>
                    <?php
                } elseif ($_GET['itemType'] === 'Random'){ ?>
                    What equipment type do you want to create?
                    <select name="equipmentType" form="itemTypeForm" required>
                    <?php equipmentTypeDropDown(); ?>
                    </select>
                    <?php
                } ?>
                    <br>
                    <label><input type="checkbox" name="attunment" value="attunment"> Does the item require attunment?</label><br>
                    What rarity does the item have?
                    <select name="raritySelector" form="itemTypeForm" required>
                        <?php
                        rarityDropDown();
                        ?>
                    </select><br>
                <?php
                if (isset($_GET['sentient'])){
                    $_SESSION['sentient'] = $_GET['sentient'];
                }
                if (isset($_GET['artefact'])){
                    $_SESSION['artefact'] = $_GET['artefact'];
                }
                if (isset($_GET['foe']) && $_GET['itemType'] !== "Armor"){
                    $_SESSION['foe'] = $_GET['foe']; ?>
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
            if (isset($_SESSION['MagicItem'])){
                echo $_SESSION['MagicItem'];
                unsetSessionVariables();
            }
            ?>
        </td>
    </tr>
</table>
</body>
</html>