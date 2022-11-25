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
        int idalterar;

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


        private void listaGenero()
        {
            ConectaBanco con = new ConectaBanco(); // instancia o ConectaBanco
            DataTable tabelaDados = new DataTable(); // instancia uma tabela virtual, que vai receber a tabela virtual de outra função
            tabelaDados = con.listaGeneros();
            cbGenero.DataSource = tabelaDados; // especifica a fonte de dados
            cbGenero.DisplayMember = "genero"; // texto que será mostrado
            cbGenero.ValueMember = "idgenero"; // qual valor que será guardado quando selecionado
            //prrenchendo cbAlteraGenero
            cbAlteraGenero.DataSource = tabelaDados;
            cbAlteraGenero.DisplayMember = "genero"; 
            cbAlteraGenero.ValueMember = "idgenero"; 

            lblmsgerro.Text = con.mensagem;
            cbGenero.Text = "";
            cbAlteraGenero.Text = "";
        }

        private void listaBanda()
        {
            ConectaBanco con = new ConectaBanco();
            dgBandas.DataSource = con.listaBandas();
        }

        private void limpaCampos()
        {
            txtnome.Text = "";
            cbGenero.Text = "";
            txtintegrantes.Text = "";
            txtranking.Text = "";
            txtnome.Focus();
        }

        private void Sistema_Load(object sender, EventArgs e)
        {
            listaGenero();
            listaBanda();
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

            listaBanda();
            limpaCampos();
        }

        private void txtBusca_TextChanged(object sender, EventArgs e)
        {
            (dgBandas.DataSource as DataTable).DefaultView.RowFilter = String.Format("nome like'%{0}%'", txtBusca.Text);
        }

        private void btnRemoveBanda_Click(object sender, EventArgs e)
        {
            int linha = dgBandas.CurrentRow.Index; //pega a linha selecionada
            int idremover = Convert.ToInt32(dgBandas.Rows[linha].Cells["idbandas"].Value.ToString());
            DialogResult resp = MessageBox.Show("Confirma exclusão?", "Remove banda", MessageBoxButtons.OKCancel);
            if (resp == DialogResult.OK)
            {
                ConectaBanco conecta = new ConectaBanco();
                bool retorno = conecta.deletaBanda(idremover);
                if (retorno)
                {
                    MessageBox.Show("Banda excluida!");
                }
                else
                {
                    lblmsgerro.Text = conecta.mensagem;
                }
                listaBanda();
            }
            else
            {
                MessageBox.Show("Operação cancelada.");
            }

        }

        private void btnAlterar_Click(object sender, EventArgs e)
        {
            int linha = dgBandas.CurrentRow.Index; //pega a linha selecionada
            idalterar = Convert.ToInt32(dgBandas.Rows[linha].Cells["idbandas"].Value.ToString());
            txtAlteraNome.Text = dgBandas.Rows[linha].Cells["nome"].Value.ToString();
            txtAlteraIntegrantes.Text = dgBandas.Rows[linha].Cells["integrantes"].Value.ToString();
            txtAlteraRanking.Text = dgBandas.Rows[linha].Cells["ranking"].Value.ToString();
            cbAlteraGenero.Text = dgBandas.Rows[linha].Cells["genero"].Value.ToString();

            tabControl1.SelectedTab = tabAlterar; 
        }

         private void btnConfirmaAlteracao_Click(object sender, EventArgs e)
        {
            Banda b = new Banda();
            b.Nome = txtAlteraNome.Text;
            b.Ranking = Convert.ToInt32(txtAlteraRanking.Text);
            b.Integrantes = Convert.ToInt32(txtAlteraIntegrantes.Text);
            b.Genero = Convert.ToInt32(cbAlteraGenero.SelectedValue.ToString());

            ConectaBanco conecta = new ConectaBanco();
            bool retorno = conecta.alteraBanda(b, idalterar);
            if (retorno)
            {
                MessageBox.Show("Dados alterados com sucesso!");
            }
            else
            {
                lblmsgerro.Text = conecta.mensagem;
            }
            listaBanda();
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
