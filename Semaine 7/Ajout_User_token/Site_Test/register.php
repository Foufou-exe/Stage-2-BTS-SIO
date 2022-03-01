<?php

require_once "modelePDO.class.php";

// Création du token
$tokenUser = uniqid("data_",true);

// Récupère les valeurs dans le formulaire et exécute la méthode pour insérer en BDD.
ModelePDO::insertUtilisateur(
    $_POST["register_pseudo"], 
    $_POST["register_email"], 
    $_POST["register_nom"], 
    $_POST["register_prenom"], 
    $_POST["register_tel"], 
    $_POST["register_adresse"],
    $_POST["register_cp"], 
    $_POST["register_ville"],
    $_POST["register_mdp"],
    $tokenUser
);

// Appel de la fonction en bash.
$command = escapeshellcmd("script_user.sh --addtoken" + $tokenUser);
// Execution de la commande
$output = shell_exec($command);

?>
