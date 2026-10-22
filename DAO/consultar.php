<?php
    namespace SistemaCredito\projeto\DAO;
    use SistemaCredito\projeto\DAO\Conexao;

    class Consultar{
        function autenticarFuncionario(Conexao $conexao, string $usuario, string $senha){
            try
            {
                $conn = $conexao->conectar();

                //Evita que digitem comandos SQL no lugar do e-mail/senha
                $usuario = mysqli_real_escape_string($conn, $usuario);
                $senha   = mysqli_real_escape_string($conn, $senha);

                $sql  = "select * from usuario where email = '$usuario' and senha = '$senha'";
                $result = mysqli_query($conn, $sql);
                //Buscar os dados no banco
                while($dados = mysqli_fetch_Array($result)){
                    return $dados['nome'];//Achou o usuário, devolve o nome
                }//fim do while
                return "";//Não achou ninguém com esse e-mail e senha
            }
            catch(\Exception $erro)
            {
                return "";
            }
        }//fim do autenticarFuncionario
    }//fim do consultar
?>
