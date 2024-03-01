<?php 

$pdo = new PDO("sqlite:database/nike.db");
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

$articles = $pdo->query("SELECT * FROM article") -> fetchAll();
$sports = $pdo->query("SELECT * FROM sport") -> fetchAll();

/*echo "<pre>";
var_dump( $articles );
echo "</pre>";*/

function displayArticle($article){
    $src = $article["image"];
    $name = $article["name"];
    $prix = $article["prix"];
    return <<<HTML
    <li class="article">
        <a href="asterion.html"><img src="$src" alt="$name"></a>
        <span><strong>$name</strong></span>
        <span>$prix €</span>
    </li>
HTML;
}

function displaySport( $sport){
    $src = $sport["image"];
    $name = $sport["name"];
    return <<<HTML
    <li class="sport">
    <a href="asterion.html"><img src="$src" alt="$name"></a>
        <span><strong>$name</strong></span>
    </li>
HTML;
}
?>


<?php require_once 'header.php' ?>
<main>
    <a href="asterion.html"><img src="images/acceuil.png" alt="accueil"></a>
    <h2>Nouveau cette semaine</h2>
    <ul>
        <?php foreach ( $articles as $article ) : ?>
            <?= displayArticle($article); ?>
        <?php endforeach ?>
    </ul>
    <h2>Tout pour ton sport</h2>
    <ul>
        <?php foreach ($sports as $sport): ?>
            <?= displaySport($sport) ?>
        <?php endforeach ?>
    </ul>
</main>
<?php require_once 'footer.php' ?>