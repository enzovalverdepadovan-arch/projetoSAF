<?php
    namespace SistemaCredito\projeto\php;

    class Empresa{
        //Declarar as variáveis
        private string $razaoSocial;
        private string $nomeFantasia;
        private string $cnpj;
        private string $email;
        private string $telefone;
        private string $cidade;
        private string $estado;

        //Método construtor
        public function __construct(string $razaoSocial, string $nomeFantasia,
                                    string $cnpj, string $email, string $telefone,
                                    string $cidade, string $estado){
            $this->razaoSocial  = $razaoSocial;
            $this->nomeFantasia = $nomeFantasia;
            $this->cnpj         = $cnpj;
            $this->email        = $email;
            $this->telefone     = $telefone;
            $this->cidade       = $cidade;
            $this->estado       = $estado;
        }//fim do construtor

        public function __get(string $dados):mixed
        {
            return $this->$dados;
        }//fim do get
    }//fim da classe
?>