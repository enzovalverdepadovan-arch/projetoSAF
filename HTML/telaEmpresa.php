<?php
    namespace SistemaCredito\projeto\html;
    require_once('../CONTROLLER/empresaController.php');
    use SistemaCredito\projeto\controller\EmpresaController;

    $controller = new EmpresaController();
    $mensagem   = "";//Resultado do cadastro

    if(isset($_POST['razao_social'])){
        $mensagem = $controller->cadastrar($_POST);
    }
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#0a033b">
    <title>Cadastro Empresa | Sistema de Crédito</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>

<main class="tela tela-empresa">

    <section class="apresentacao">
        <p class="marca">Sistema de Crédito</p>

        <div class="mensagem">
            <h1>Cadastro de empresa.</h1>
            <p>Preencha os dados ao lado para cadastrar uma nova empresa no sistema.</p>
        </div>

        <p class="rodape">Os campos com * são obrigatórios.</p>
    </section>

    <section class="painel">
        <h2>Dados da empresa</h2>
        <p class="introducao">
            Razão social e CNPJ são obrigatórios. Os outros campos são opcionais.
        </p>

        <form method="POST">
            <label for="razao_social">
                Razão social *
                <input type="text" id="razao_social" name="razao_social" maxlength="150" required>
            </label>

            <label for="nome_fantasia">
                Nome fantasia
                <input type="text" id="nome_fantasia" name="nome_fantasia" maxlength="150">
            </label>

            <div class="linha">
                <label for="cnpj">
                    CNPJ *
                    <input type="text" id="cnpj" name="cnpj" maxlength="18" placeholder="00.000.000/0000-00" required>
                </label>

                <label for="telefone">
                    Telefone
                    <input type="text" id="telefone" name="telefone" maxlength="20">
                </label>
            </div>

            <label for="email">
                E-mail
                <input type="text" id="email" name="email" maxlength="100">
            </label>

            <div class="linha">
                <label for="cidade">
                    Cidade
                    <input type="text" id="cidade" name="cidade" maxlength="100">
                </label>

                <label for="estado">
                    Estado (UF)
                    <input type="text" id="estado" name="estado" maxlength="2" placeholder="SP">
                </label>
            </div>

            <button type="submit">Cadastrar</button>

            <?php if($mensagem != ""){ ?>
                <div class="aviso" role="alert"><?php echo $mensagem; ?></div>
            <?php } ?>
        </form>
    </section>

</main>

</body>
</html>
