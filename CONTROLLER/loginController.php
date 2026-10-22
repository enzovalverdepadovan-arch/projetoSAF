<?php
    namespace SistemaCredito\projeto\controller;
    //O ../ é relativo à pasta HTML, de onde as telas são abertas no navegador
    require_once('../DAO/conexao.php');
    require_once('../DAO/consultar.php');
    use SistemaCredito\projeto\DAO\Conexao;
    use SistemaCredito\projeto\DAO\Consultar;

    class LoginController{
        //Recebe e-mail e senha do formulário e devolve o nome (ou vazio)
        public function entrar(array $dados): string
        {
            $conexao   = new Conexao();
            $consultar = new Consultar();

            return $consultar->autenticarFuncionario($conexao,
                                                     $dados['usuario'],
                                                     $dados['senha']);
        }//fim do entrar
    }//fim da classe
?>
