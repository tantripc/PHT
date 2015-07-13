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
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Truyenbien();
        }
    }
    public void Truyenbien()
    {
        Int32 gopy_id = Int32.Parse(Request.QueryString["GOPY_ID"]);
        com = new SqlCommand("select TIEUDE, NOIDUNG, noidungtraloi from GOPY_D where GOPY_ID ="+ gopy_id, con);
        da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);

        TextBox1.Text = dt.Rows[0][0].ToString();
        FCKeditor1.Value = dt.Rows[0][1].ToString();
        FCKeditor2.Value = dt.Rows[0][2].ToString();
       

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FCKeditor2.Value.Trim() == "")
        {
            lblError.Visible = true;
        }
        else
        {

            Int32 gopy_id = Int32.Parse(Request.QueryString["GOPY_ID"]);
            string s = "Update GOPY_D set noidungtraloi=@NOIDUNG,traloi =@traloi,ktra=@ktra where GOPY_ID =" + gopy_id;
            com = new SqlCommand(s, con);
            con.Open();

            com.Parameters.Add("@NOIDUNG", SqlDbType.NText).Value = FCKeditor2.Value;
            com.Parameters.Add("@traloi", SqlDbType.Char).Value = '1';
            com.Parameters.AddWithValue("@ktra", true);

            try
            {
                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/Viettool/gopy.aspx");
            }
            catch (SqlException ex)
            {
                throw ex;

            }
        }
    }
}
