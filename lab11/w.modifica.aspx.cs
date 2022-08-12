using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;


namespace lab11
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        private const int DProdus = 2;
        private const int IdProdus = 1;
        private const int PretVanzare = 5;
        private const int UM = 3;
        private const int CotaTVA = 4;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                GridView1.SelectedIndex = 0;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Enabled = false;
            TxtDProdus.Text = GridView1.SelectedRow.Cells[DProdus].Text;
            TxtIdProdus.Text = GridView1.SelectedRow.Cells[IdProdus].Text;
            TxtPretVanzare.Text = GridView1.SelectedRow.Cells[PretVanzare].Text;
            DdlUM.Text = GridView1.SelectedRow.Cells[UM].Text;
            DdlTVA.Text = GridView1.SelectedRow.Cells[CotaTVA].Text;


        }

        protected void BtnRenunta_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Button1.Enabled = true;

        }

        protected void CV_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = AccessDataSource1.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select IdProdus from Produse where DProdus='" + TxtDProdus.Text +
            "' and IdProdus <> " + TxtIdProdus.Text;
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                args.IsValid = false;
                CV.ErrorMessage = "Produs deja existent";
                con.Close();
            }
            else
            {
                args.IsValid = true;
                con.Close();
                modificaInregistrare();
                Panel1.Visible = false;
                Button1.Enabled = true;
            }
        }

        private void modificaInregistrare()
        {
            AccessDataSource1.UpdateParameters[0].DefaultValue = TxtDProdus.Text;
            AccessDataSource1.UpdateParameters[1].DefaultValue = DdlUM.Text;
            AccessDataSource1.UpdateParameters[2].DefaultValue = DdlTVA.Text;
            AccessDataSource1.UpdateParameters[3].DefaultValue = TxtPretVanzare.Text;
            AccessDataSource1.UpdateParameters[4].DefaultValue = TxtIdProdus.Text;
            AccessDataSource1.Update();
        }

    }
}