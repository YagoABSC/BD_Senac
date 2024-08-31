<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nossa Loja</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        .container{
            margin-top: 100px;
            text-align: center;
        }
    </style>
</head>

<body>
    <?php

    // inserindo categorias
    include 'conexao.php';

    $desc_categoria = $_POST['desc_categoria'];
    $sql = "INSERT INTO categorias (desc_categoria) VALUES ('$desc_categoria')";
    // echo ($sql);
    $inserir = mysqli_query($conexao, $sql);

    ?>

    <div class="container">
        <h3>Categoria cadastrada com sucesso!</h3>
        <a href="lista_categoria.php" class="btn btn-primary">Voltar</a>
    </div>

</body>

</html> 