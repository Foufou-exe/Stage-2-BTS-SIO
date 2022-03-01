<?php

require_once 'mysql_config.class.php';


class ModelePDO {
    
   
    // Attributs utiles pour la connexion.
    protected static $server = MySqlConfig::SERVER;
    protected static $base = MySqlConfig::BASE;
    protected static $user = MySqlConfig::USER;
    protected static $password = MySqlConfig::PASSWORD;
    
    // Attributs utiles pour la manipulation PDO de la BD.
    protected static $pdoCnxBase = null;
    protected static $pdoStResults = null;
    protected static $query = "";
    protected static $result = null;
    

    /**
     * Méthode permettant de se connecter à la base de données.
     */
    public static function logIn() {
        if (!isset(self::$pdoCnxBase)) { //S'il n'y a pas encore eu de connexion
            try {
                self::$pdoCnxBase = new PDO('mysql:host=' . self::$server . ';dbname=' . self::$base, self::$user, self::$password);
                self::$pdoCnxBase->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                self::$pdoCnxBase->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
                self::$pdoCnxBase->query("SET CHARACTER SET utf8"); //méthode de la classe PDO
            } catch (Exception $e) {
                echo 'Erreur : ' . $e->getMessage() . '<br />'; // méthode de la classe Exception
                echo 'Code : ' . $e->getCode(); // méthode de la classe Exception
            }
        }
    }

    /**
     * Méthode permettant d'insérer un utilisateur en base de données.
     *
     * @return void
     */
    public static function insertUtilisateur($pseudo, $email, $nom, $prenom, $tel, $adresse, $cp, $ville, $mdp, $token) {
        // Connection à la base de données.
        self::logIn();
        // Requête
        self::$query = "INSERT INTO utilisateur (pseudoUtilisateur, emailUtilisateur, nomUtilisateur, prenomUtilisateur, telUtilisateur, adresseUtilisateur, codePostalUtilisateur, villeUtilisateur, mdpUtilisateur, tokenUtilisateur)
        VALUES (:pseudoUtilisateur, :emailUtilisateur, :nomUtilisateur, :prenomUtilisateur, :telUtilisateur, :adresseUtilisateur, :codePostalUtilisateur, :villeUtilisateur, :mdpUtilisateur, :tokenUtilisateur)";
        // Prépare requête (PDO) permet d'éviter les injections SQL.
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$query);
        // Associe les valeurs aux paramètres de la requête.
        self::$pdoStResults->bindValue(":pseudoUtilisateur", $pseudo);
        self::$pdoStResults->bindValue(":emailUtilisateur", $email);
        self::$pdoStResults->bindValue(":nomUtilisateur", $nom);
        self::$pdoStResults->bindValue(":prenomUtilisateur", $prenom);
        self::$pdoStResults->bindValue(":telUtilisateur", $tel);
        self::$pdoStResults->bindValue(":adresseUtilisateur", $adresse);
        self::$pdoStResults->bindValue(":codePostalUtilisateur", $cp);
        self::$pdoStResults->bindValue(":villeUtilisateur", $ville);
        self::$pdoStResults->bindValue(":mdpUtilisateur", sha1($mdp));
        self::$pdoStResults->bindValue(":tokenUtilisateur", $token);
        // Exécution requête.
        self::$pdoStResults->execute();
        self::$pdoStResults->closeCursor();
    }

    /**
     * Fonction permettant de générer une clé aléatoire.
     *
     * @return string Clé aléatoire.
     */
    public static function getRandomKey() {
        $key = "";
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $size = strlen($chars);
        for ($i = 0; $i < 20; $i++) {
            $key .= $chars[rand(0, $size - 1)];
        }
        return $key;
    }

}

?>