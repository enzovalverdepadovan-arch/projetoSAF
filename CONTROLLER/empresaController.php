<?php
    namespace SistemaCredito\projeto\controller;
    //O ../ é relativo à pasta HTML, de onde as telas são abertas no navegador
    require_once('../DAO/conexao.php');
    require_once('../DAO/inserir.php');
    require_once('../PHP/empresa.php');
    use SistemaCredito\projeto\DAO\Conexao;
    use SistemaCredito\projeto\DAO\Inserir;
    use SistemaCredito\projeto\php\Empresa;

    class EmpresaController{
        //Recebe os dados do formulário e manda salvar no banco
        public function cadastrar(array $dados): string
        {
            $empresa = new Empresa($dados['razao_social'],
                                   $dados['nome_fantasia'],
                                   $dados['cnpj'],
                                   $dados['email'],
                                   $dados['telefone'],
                                   $dados['cidade'],
                                   $dados['estado']);

            $conexao = new Conexao();
            $inserir = new Inserir();

            return $inserir->cadastrarEmpresa($conexao, $empresa);
        }//fim do cadastrar
    }//fim da classe
?>
