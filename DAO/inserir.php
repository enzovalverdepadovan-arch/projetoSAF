<?php
    namespace SistemaCredito\projeto\DAO;
    use SistemaCredito\projeto\DAO\Conexao;
    use SistemaCredito\projeto\php\Empresa;

    class Inserir{
        public function cadastrarEmpresa(Conexao $conexao, Empresa $empresa)
        {
            try
            {
                $conn = $conexao->conectar();//Abre a conexão com o banco

                $sql  = "Insert into empresa(razao_social, nome_fantasia, cnpj,
                email, telefone, cidade, estado) values('{$empresa->razaoSocial}',
                '{$empresa->nomeFantasia}','{$empresa->cnpj}','{$empresa->email}',
                '{$empresa->telefone}','{$empresa->cidade}',
                '{$empresa->estado}')";//Preparando o comando

                $result = mysqli_query($conn,$sql);//Executar o comando no bd
                //Verifico se executou ou não

                if($result){
                    return "Inserido com sucesso!";
                }
                return "Não inserido!";

            }
            catch(Exception $erro)
            {
                return "Impossível cadastrar empresa <br><br> $erro";
            }
        }//fim do método cadastrar
    }//fim da classe
?>
