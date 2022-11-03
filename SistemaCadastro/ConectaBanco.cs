using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

namespace SistemaCadastro
{
    internal class ConectaBanco
    {
        MySqlConnection conexao = new MySqlConnection("server=localhost;user id=root;password=;database=banco_cadastro");
        public String mensagem;

        public DataTable listaGeneros()
        {
            MySqlCommand cmd = new MySqlCommand("lista_generos", conexao); // atribui para CMD o comando "lista_generos"
            cmd.CommandType = CommandType.StoredProcedure; // define o tipo como Stored Procedure
            try
            {
                conexao.Open(); // abre conexão
                MySqlDataAdapter da = new MySqlDataAdapter(cmd); 
                DataTable tabela = new DataTable(); // cria uma tabela virtual
                da.Fill(tabela); // preencher a tabela, a partir do comando cmd
                return tabela; // retorna a tabela
            }// fim try
            catch (MySqlException e)
            {
                mensagem = "Erro:" + e.Message;
                return null;
            }
            finally
            {
                conexao.Close(); // fecha a conexão
            }

        }// fim lista_generos 
    }

}
