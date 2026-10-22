<?php
    namespace SistemaCredito\projeto\DAO;

    class Conexao{
        function conectar(){
            try{
                $conn = mysqli_connect('localhost', 'root', '', 'sistema_credito');
                if($conn){
                    return $conn;
                }else{
                    echo "Conexão Falhou!";
                }
            }
            catch(\Exception $erro)
            {
                echo "Algo deu errado ".$erro;
            }//fim do catch
        }//fim do conectar
    }//fim da conexao
?>

