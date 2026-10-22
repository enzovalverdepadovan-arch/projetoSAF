<?php
    namespace SistemaCredito\projeto\html;
    require_once('../CONTROLLER/loginController.php');
    use SistemaCredito\projeto\controller\LoginController;

    $controller = new LoginController();
    $nome       = "";//Nome do funcionário, se o login der certo
    $tentou     = false;//Só vira true depois que clicam em Entrar

    if(isset($_POST['usuario'])){
        $tentou = true;
        $nome   = $controller->entrar($_POST);
    }
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#0a033b">
    <title>Login Funcionário | Sistema de Crédito</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>

<main class="tela">

    <section class="apresentacao">
        <p class="marca">Sistema de Crédito</p>

        <div class="mensagem">
            <h1>Bem-vindo de volta.</h1>
            <p>
                Acesse o ambiente do funcionário para consultar
                informações e continuar suas atividades com segurança.
            </p>
        </div>

        <p class="rodape">Acesso restrito aos funcionários autorizados.</p>
    </section>

    <section class="painel">
        <h2>Login do funcionário</h2>
        <p class="introducao">Informe seu e-mail e sua senha para entrar.</p>

        <?php if($tentou && $nome == ""){ ?>
            <p class="erro" role="alert">
                E-mail ou senha inválidos. Confira os dados e tente novamente.
            </p>
        <?php } ?>

        <?php if($nome != ""){ ?>
            <p class="sucesso" role="alert">
                Login realizado! Bem-vindo, <?php echo $nome; ?>.
            </p>
        <?php } ?>

        <form method="POST">
            <label for="usuario">
                E-mail
                <input type="text" id="usuario" name="usuario" placeholder="Digite seu e-mail"
                       maxlength="100" autocomplete="username" required>
            </label>

            <label for="senha">
                Senha
                <input type="password" id="senha" name="senha" placeholder="Digite sua senha"
                       autocomplete="current-password" required>
            </label>

            <button type="submit">Entrar</button>
        </form>

        <p class="ajuda">Problemas para acessar? Entre em contato com o administrador.</p>
    </section>

</main>

</body>
</html>
