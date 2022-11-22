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

        public bool insereBanda(Banda b)
        {
            MySqlCommand cmd = new MySqlCommand("insere_banda", conexao);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("nome", b.Nome);
            cmd.Parameters.AddWithValue("genero", b.Genero);
            cmd.Parameters.AddWithValue("integrantes", b.Integrantes);
            cmd.Parameters.AddWithValue("ranking", b.Ranking);
            try
            {
                conexao.Open();
                cmd.ExecuteNonQuery(); // executa o comando
                return true;
            }
            catch (MySqlException e)
            {
                mensagem = "Erro:" + e.Message;
                return false;
            }
            finally
            {
                conexao.Close();
            }
        }// fim insereBanda

        public bool deletaBanda(int idbanda)
        {
            MySqlCommand cmd = new MySqlCommand("deleta_banda", conexao);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("idbanda", idbanda);
            try
            {
                conexao.Open();
                cmd.ExecuteNonQuery(); // executa o comando
                return true;
            }
            catch (MySqlException e)
            {
                mensagem = "Erro:" + e.Message;
                return false;
            }
            finally
            {
                conexao.Close();
            }
        }// fim deletaBanda



        public DataTable listaBandas()
        {
            MySqlCommand cmd = new MySqlCommand("lista_bandas", conexao);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                conexao.Open();
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable tabela = new DataTable();
                da.Fill(tabela);
                return tabela;
            }// fim try
            catch (MySqlException e)
            {
                mensagem = "Erro:" + e.Message;
                return null;
            }
            finally
            {
                conexao.Close();
            }

        }// fim lista_bandas


    }

}
