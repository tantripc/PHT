using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Viettool_Default4 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        int i = GridView1.SelectedIndex;
        try
        {


            SqlCommand comm = new SqlCommand("select NEWS_ID, CHANNEL_ID, TIEUDE from TINTUC01 where NEWS_ID ='" + GridView1.Rows[i].Cells[1].Text.ToString() + "' ", con);
            SqlDataAdapter apdapter = new SqlDataAdapter(comm);
            DataSet data = new DataSet("HDDetails");
            apdapter.Fill(data, "HDDetails");


            Session["NEWS_ID"] = GridView1.Rows[i].Cells[1].Text.Trim();
            Session["CHANNEL_ID"] = GridView1.Rows[i].Cells[2].Text.Trim();
            Session["TIEUDE"] = GridView1.Rows[i].Cells[0].Text.Trim();
            Response.Redirect("~/Viettool/ChiTietSP.aspx");

        }
        catch
        {


        }
    }
}
