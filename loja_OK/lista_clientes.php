<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Lista Clientes</title>
    <style>
        h3{
            text-align: center;
            color: blue;
        }

    </style>
</head>
<body>

    <h3>Lista de Clientes</h3>
    <table class="table table-hover container">
        <thead>
            <tr>
                <th>Id.Nome</th>
                <th>Nome</th>
                <th>CPF/CNPJ</th>
                <th>CEP</th>
                <th>Endereço</th>
                <th>Número</th>
                <th>Complemento</th>
                <th>Bairro</th>
                <th>Cidade</th>
                <th>UF</th>
                <th>Celular</th>
                <th>Email</th>
                <th>Senha</th>
            </tr>
        </thead>
        <tbody>
            <?php

                include 'conexao.php';
                $sql = "SELECT * FROM clientes";
                $busca_cliente = mysqli_query ($conexao, $sql);
                while ($array = mysqli_fetch_array($busca_cliente)){
                    $id_cliente = $array['id_cliente'];
                    $nome_cliente = $array['nome_cliente'];
                    $cpf_cnpj = $array['cpf_cnpj'];
                    $cep = $array['cep'];
                    $logradouro = $array['logradouro'];
                    $numero = $array['numero'];
                    $complemento = $array['complemento'];
                    $bairro = $array['bairro'];
                    $cidade = $array['cidade'];
                    $uf = $array['uf'];
                    $celular = $array['celular'];
                    $email = $array['email'];
                    $password = $array['password'];
            ?>
            <tr>
                <td><?= $id_cliente?></td>
                <td><?= $nome_cliente?></td>
                <td><?= $cpf_cnpj?></td>
                <td><?= $cep?></td>
                <td><?= $logradouro?></td>
                <td><?= $numero?></td>
                <td><?= $complemento?></td>
                <td><?= $bairro?></td>
                <td><?= $cidade?></td>
                <td><?= $uf?></td>
                <td><?= $celular?></td>
                <td><?= $email?></td>
                <td><?= $password?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</body>
</html>