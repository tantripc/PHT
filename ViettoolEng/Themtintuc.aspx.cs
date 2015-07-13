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

public partial class ViettoolEng_Default4 : System.Web.UI.Page
{
    
   

    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    SqlDataAdapter da;
    SqlDataAdapter da2;
    DataSet ds;
    SqlCommand com;
    SqlCommand com2;
    int NHOM = 0;
    int STT = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Truyenbien();
          
        }
        
    }

   
    public void Truyenbien()
    {

        //Int32 news_id = Int32.Parse(Request.QueryString["NEWS_ID"]);
        //Int32 channel_id = Int32.Parse(Request.QueryString["CHANNEL_ID"]);
        com = new SqlCommand("select  top 1 NEWS_ID  from TINTUC01_ENG  order by NEWS_ID desc", con);
        //com2 = new SqlCommand("select top 1 STT  from TINTUC01_ENG where CHANNEL_ID=" + channel_id + " order by NEWS_ID desc", con);
        da = new SqlDataAdapter(com);
        //da2 = new SqlDataAdapter(com2);
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        //da2.Fill(dt2);
        da.Fill(dt);

        STT = int.Parse(dt.Rows[0][0].ToString());
        STT++;
        TextBox12.Text = STT.ToString();
        //TextBox3.Text = cbMenu.SelectedValue.ToString();
        txtUser.Text = Session["Admin"].ToString();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
            string inserts = "Insert into TINTUC01_ENG (CHANNEL_ID,NHOM,LOAI_ID,CAP_ID,MENU_SUB,TIEUDE,TOMTAT,NOIDUNG,USERID,NOTE,STT)values(@CHANNEL_ID,@NHOM,@LOAI_ID,@CAP_ID,@MENU_SUB,@TIEUDE,@TOMTAT,@NOIDUNG,@USERID,@NOTE,@STT)";
            com = new SqlCommand(inserts, con);
            con.Open();
            com.Parameters.AddWithValue("CHANNEL_ID", "85");    
            com.Parameters.AddWithValue("NHOM", TextBox12.Text);
            com.Parameters.AddWithValue("LOAI_ID", '0');
            com.Parameters.AddWithValue("CAP_ID", '2');
            com.Parameters.AddWithValue("MENU_SUB", '0');
            com.Parameters.AddWithValue("TIEUDE", TextBox1.Text);
            com.Parameters.AddWithValue("TOMTAT", FCKeditor1.Value);
            com.Parameters.AddWithValue("NOIDUNG", FCKeditor2.Value);
            com.Parameters.AddWithValue("USERID", txtUser.Text);
            com.Parameters.AddWithValue("NOTE", TextBox2.Text);
            com.Parameters.AddWithValue("STT", '1');

            try
            {

                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/ViettoolEng/Default.aspx");
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        
    }
   
}
