<?php
session_start();
$erro = $_SESSION['mensagem_erro'] ?? '';
unset($_SESSION['mensagem_erro']);
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de crédito</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js" defer></script>
</head>
<body>
    <main class="container">
        <header class="cabecalho">
            <p class="sobrelinha">Sistema de crédito</p>
            <h1>Cadastro de empresa</h1>
            <p>Preencha os dados abaixo para cadastrar uma empresa.</p>
        </header>

        <?php if ($erro !== ''): ?>
            <div class="aviso erro" role="alert">
                <?= htmlspecialchars($erro, ENT_QUOTES, 'UTF-8') ?>
            </div>
        <?php endif; ?>

        <section class="cartao">
            <h2>Dados da empresa</h2>
            <p class="descricao">A razão social e o CNPJ são obrigatórios. Os outros campos são opcionais.</p>

            <form method="post" action="processa.php">
                <div class="grade">
                    <label>Razão social *</label>
                        <input type="text" name="razao_social" maxlength="150" required>
                    
                    <label>Nome fantasia</label>
                        <input type="text" name="nome_fantasia" maxlength="150">
                    
                    <label>CNPJ *</label>
                        <input type="text" name="cnpj" id="cnpj" maxlength="18" placeholder="00.000.000/0000-00" required>
                    
                    <label>E-mail</label>
                        <input type="email" name="email" maxlength="100">
                    
                    <label>Telefone</label>
                        <input type="text" name="telefone" maxlength="20">
                    
                    <label>Cidade</label>
                        <input type="text" name="cidade" maxlength="100">
                    
                    <label>Estado (UF)</label>
                        <input type="text" name="estado" maxlength="2" placeholder="SP">
                    
                </div>
                <button type="submit">Salvar empresa</button>
            </form>
        </section>

        <footer>
            <p>* Campos obrigatórios. Depois de salvar, você poderá conferir os dados cadastrados.</p>
        </footer>
    </main>
</body>
</html>
