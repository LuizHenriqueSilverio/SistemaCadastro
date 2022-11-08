using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace SistemaCadastro
{
    public partial class Sistema : Form
    {

        public Sistema()
        {
            InitializeComponent();
            
        }
        
        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnCadastra_Click(object sender, EventArgs e)
        {
            marcador.Height = btnCadastra.Height;
            marcador.Top = btnCadastra.Top;
            tabControl1.SelectedTab = tabControl1.TabPages[0];
        }
        

        private void btnBusca_Click(object sender, EventArgs e)
        {
            marcador.Height = btnBusca.Height;
            marcador.Top = btnBusca.Top;
            tabControl1.SelectedTab = tabControl1.TabPages[1];
        }







        private void Sistema_Load(object sender, EventArgs e)
        {
            ConectaBanco con = new ConectaBanco(); // instancia o ConectaBanco
            DataTable tabelaDados = new DataTable(); // instancia uma tabela virtual, que vai receber a tabela virtual de outra função
            tabelaDados = con.listaGeneros(); 
            cbGenero.DataSource = tabelaDados; // especifica a fonte de dados
            cbGenero.DisplayMember = "genero"; // texto que será mostrado
            cbGenero.ValueMember = "idgenero"; // qual valor que será guardado quando selecionado
            lblmsgerro.Text = con.mensagem;
            cbGenero.Text = "";
        }


        private void BtnConfirmaCadastro_Click_1(object sender, EventArgs e)
        {
            Banda b = new Banda();
            b.Nome = txtnome.Text;
            b.Genero = Convert.ToInt32(cbGenero.SelectedValue.ToString());
            b.Integrantes = Convert.ToInt32(txtintegrantes.Text);
            b.Ranking = Convert.ToInt32(txtranking.Text);

            ConectaBanco conecta = new ConectaBanco();
            bool retorno = conecta.insereBanda(b);
            if(retorno)
            {
                MessageBox.Show("Dados inseridos com sucesso!");
            }
            else
            {
                lblmsgerro.Text = conecta.mensagem;
            }
        }

        private void txtBusca_TextChanged(object sender, EventArgs e)
        {
  
        }

        private void btnRemoveBanda_Click(object sender, EventArgs e)
        {
           
        }

        private void btnAlterar_Click(object sender, EventArgs e)
        {
            
        }

         private void btnConfirmaAlteracao_Click(object sender, EventArgs e)
        {
            


        }

        private void bntAddGenero_Click(object sender, EventArgs e)
        {
          
        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void cbGenero_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
