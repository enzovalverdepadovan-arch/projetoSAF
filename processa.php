<?php
session_start();

function campo(string $nome): string
{
    $valor = $_POST[$nome] ?? '';
    return is_string($valor) ? trim($valor) : '';
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: index.php');
    exit;
}

$razaoSocial = campo('razao_social');
$nomeFantasia = campo('nome_fantasia');
$cnpj = campo('cnpj');
$email = campo('email');
$telefone = campo('telefone');
$cidade = campo('cidade');
$estado = strtoupper(campo('estado'));

try {
    require_once __DIR__ . '/conexao.php';

    if ($razaoSocial === '' || $cnpj === '') {
        throw new InvalidArgumentException('Preencha a razão social e o CNPJ.');
    }

    if ($email !== '' && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        throw new InvalidArgumentException('Informe um e-mail válido.');
    }

    $sql = 'INSERT INTO empresa
        (razao_social, nome_fantasia, cnpj, email, telefone, cidade, estado)
        VALUES (?, ?, ?, ?, ?, ?, ?)';
    $comando = $conexao->prepare($sql);
    $comando->execute([
        $razaoSocial,
        $nomeFantasia ?: null,
        $cnpj,
        $email ?: null,
        $telefone ?: null,
        $cidade ?: null,
        $estado ?: null,
    ]);

    $_SESSION['empresa_cadastrada'] = [
        'razao_social' => $razaoSocial,
        'nome_fantasia' => $nomeFantasia,
        'cnpj' => $cnpj,
        'email' => $email,
        'telefone' => $telefone,
        'cidade' => $cidade,
        'estado' => $estado,
    ];

    header('Location: empresa_cadastrada.php');
    exit;
} catch (InvalidArgumentException $erro) {
    $_SESSION['mensagem_erro'] = $erro->getMessage();
    header('Location: index.php');
    exit;
} catch (PDOException $erro) {
    error_log($erro->getMessage());
    $_SESSION['mensagem_erro'] = $erro->getCode() === '23000'
        ? 'Este CNPJ já está cadastrado.'
        : 'Não foi possível salvar. Confira se o MySQL está ligado e se a conexão está correta.';
    header('Location: index.php');
    exit;
}
