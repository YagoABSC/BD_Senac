
<html>
    <!-- incluir_categorias.php -->
   <head>
       <title>Inclusão de Categorias</title>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
       <style>
        h3{
            text-align: center;
           color: blue;
           
        }
     
    </style>
   </head>

   <body>
      <?php
        include 'menu.php';
      ?>
<div class="container">
      <h3>Inclusão de Categorias</h3>
      <!-- tag form = formulário do html, action vai enviar os dados para outra página  -->
      <form action="_incluir_categorias.php" method="post" >
          <label>Descrição</label>
          <input type="text" name="desc_categoria" required>
          <!-- input é entrada de dados. required, torna obrigatória a digitação -->
          <button type="submit" id="botao">Cadastrar</button>
      </form>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>     
   </body>
</html>
