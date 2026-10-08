<?php
session_start();
$empresa = $_SESSION['empresa_cadastrada'] ?? null;

function mostrar(string $valor): string
{
    return htmlspecialchars($valor, ENT_QUOTES, 'UTF-8');
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empresa cadastrada</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <main class="container">
        <h1>Cadastro concluído</h1>

        <?php if ($empresa): ?>
            <p class="aviso sucesso">Empresa cadastrada com sucesso.</p>
            <section class="cartao dados-cadastrados">
                <p><strong>Razão social:</strong> <?= mostrar($empresa['razao_social']) ?></p>
                <p><strong>Nome fantasia:</strong> <?= mostrar($empresa['nome_fantasia'] ?: 'Não informado') ?></p>
                <p><strong>CNPJ:</strong> <?= mostrar($empresa['cnpj']) ?></p>
                <p><strong>E-mail:</strong> <?= mostrar($empresa['email'] ?: 'Não informado') ?></p>
                <p><strong>Telefone:</strong> <?= mostrar($empresa['telefone'] ?: 'Não informado') ?></p>
                <p><strong>Cidade:</strong> <?= mostrar($empresa['cidade'] ?: 'Não informada') ?></p>
                <p><strong>Estado:</strong> <?= mostrar($empresa['estado'] ?: 'Não informado') ?></p>
            </section>
        <?php else: ?>
            <p class="aviso informacao">Nenhum cadastro recente para mostrar.</p>
        <?php endif; ?>

        <a class="botao" href="index.php">Voltar ao cadastro</a>
    </main>
</body>
</html>
