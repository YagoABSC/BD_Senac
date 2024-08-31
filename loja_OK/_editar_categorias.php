<!-- _editar_categorias.php -->
<html>
<head>
    <title>Editar Categorias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        div {
            text-align: center;
            margin: 5%;
        }
    </style>
</head>
<body> 
    <?php
    include 'conexao.php';
    $id_categoria = $_POST['id_categoria'];
    $desc_categoria = $_POST['desc_categoria'];

    $sql = "update categorias set desc_categoria = '$desc_categoria' 
    where id_categoria = '$id_categoria'";
    //echo($sql);

    $editar = mysqli_query($conexao, $sql);
     ?>
  <div class="container">
        <h4> Categoria Alterada com Sucesso!</h4>
        <a href="lista_categoria.php" class="btn btn-primary">Voltar</a>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>     
</body>
</html>