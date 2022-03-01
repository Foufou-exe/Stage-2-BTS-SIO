<!DOCTYPE html>
<html lang="en">
<head>
    <!-- META -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Formulaire d'inscription</title>
</head>
<body>
    <div class="container">
        <div class="row mt-5">
            <div class="col-12 text-center">
                <h1>Formulaire d'inscription</h1>
                <hr/>
                <form method="POST" action="register.php">
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Nom d'utilisateur</label>
                        <input type="text" class="form-control" id="register_pseudo" name="register_pseudo" required>
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label">E-mail</label>
                      <input type="email" class="form-control" id="register_email" name="register_email" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Nom</label>
                        <input type="text" class="form-control" id="register_nom" name="register_nom" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Prénom</label>
                        <input type="text" class="form-control" id="register_prenom" name="register_prenom" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Téléphone</label>
                        <input type="tel" class="form-control" id="register_tel" name="register_tel" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Adresse</label>
                        <input type="text" class="form-control" id="register_adresse" name="register_adresse" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Code postal</label>
                        <input type="number" class="form-control" id="register_cp" name="register_cp" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Ville</label>
                        <input type="text" class="form-control" id="register_ville" name="register_ville" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Mot de passe</label>
                        <input type="password" class="form-control" id="register_mdp" name="register_mdp" required>
                    </div>
                    <button type="submit" class="btn btn-primary">S'inscrire</button>
                  </form>
            </div>
        </div>
    </div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>