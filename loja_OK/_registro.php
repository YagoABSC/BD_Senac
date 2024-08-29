<!DOCTYPE html>
<html lang="pt_br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nossa Loja</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        div{
            text-align: center;
        }
    </style>
</head>
<body>
    <?php
    
        include 'conexao.php';
        $nome_cliente = $_POST['nome_cliente'];
        $cpf_cnpj = $_POST['cpf_cnpj'];
        $cep = $_POST['cep'];
        $logradouro = $_POST['logradouro'];
        $numero = $_POST['numero'];
        $complemento = $_POST['complemento'];
        $bairro = $_POST['bairro'];
        $cidade = $_POST['cidade'];
        $uf = $_POST['uf'];
        $celular = $_POST['celular'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        // $password2 = $_POST['password2'];

        $sql = "INSERT INTO clientes (nome_cliente, cpf_cnpj, cep, logradouro, numero, complemento, bairro, cidade, uf, celular, email, password) VALUES ('$nome_cliente', '$cpf_cnpj', '$cep', '$logradouro', '$numero', '$complemento', '$bairro', '$cidade', '$uf', '$celular', '$email', '$password')";

        // echo $sql;

        $inserir = mysqli_query($conexao, $sql);

    ?>
    <div class="container">
        <h3>Obrigado por se cadastrar</h3>
        <a href="index.php" class="btn btn-primary">Voltar</a>
    </div>
    
</body>
</html>