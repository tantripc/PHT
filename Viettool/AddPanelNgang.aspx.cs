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
    SqlDataAdapter da2;
    DataSet ds;
    SqlCommand com;
    SqlCommand com2;
    SqlCommand com1;        // Command de xet dieu kien truyen bien STT sau cung
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
        //com = new SqlCommand("select NEWS_ID, CHANNEL_ID,NHOM,LOAI_ID,CAP_ID,MENU_SUB,NOTE,USERID,STT from TINTUC01 where NEWS_ID =" + news_id, con);
        //da = new SqlDataAdapter(com);
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        //TextBox3.Text = dt.Rows[0][1].ToString();
        //TextBox4.Text = dt.Rows[0][2].ToString();
        //TextBox5.Text = dt.Rows[0][3].ToString();
        //TextBox6.Text = dt.Rows[0][4].ToString();
        //TextBox7.Text = dt.Rows[0][6].ToString();
        //TextBox8.Text = dt.Rows[0][7].ToString();
        //TextBox9.Text = dt.Rows[0][8].ToString();
        //TextBox11.Text = dt.Rows[0][0].ToString();

        Int32 channel_id = Int32.Parse(Request.QueryString["CHANNEL_ID"]);

        // Xet dieu kien de truyen bien STT sau cung
        con.Open();
        com1 = new SqlCommand("select count(*) from TINTUC01 where CHANNEL_ID="+ channel_id+"", con);
        if (com1.ExecuteScalar().ToString() != "0")
        {
            com2 = new SqlCommand("select top 1 STT  from TINTUC01 where CHANNEL_ID=" + channel_id + " order by STT desc", con);
            da2 = new SqlDataAdapter(com2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);

            //NHOM= int.Parse(dt2.Rows[0][0].ToString());
            //NHOM++;
            //TextBox11.Text =   NHOM.ToString() ;
            STT = int.Parse(dt2.Rows[0][0].ToString());
        }
        else
            STT = 29;
        STT++;
        txtSTT.Text = STT.ToString();
        con.Close();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string inserts = "Insert into TINTUC01 (CHANNEL_ID,NHOM,LOAI_ID,CAP_ID,MENU_SUB,TIEUDE,TOMTAT,NOIDUNG,USERID,NOTE,STT)values(@CHANNEL_ID,@NHOM,@LOAI_ID,@CAP_ID,@MENU_SUB,@TIEUDE,@TOMTAT,@NOIDUNG,@USERID,@NOTE,@STT)";
        com = new SqlCommand(inserts, con);
        con.Open();
        com.Parameters.AddWithValue("CHANNEL_ID", "41");
        com.Parameters.AddWithValue("NHOM", "0");
        com.Parameters.AddWithValue("LOAI_ID", "0");
        com.Parameters.AddWithValue("CAP_ID", "0");
        com.Parameters.AddWithValue("MENU_SUB", "0");
        com.Parameters.AddWithValue("TIEUDE", TextBox1.Text);
        com.Parameters.AddWithValue("TOMTAT", FCKeditor1.Value);
        com.Parameters.AddWithValue("NOIDUNG", FCKeditor2.Value);
        com.Parameters.AddWithValue("USERID", Session["Admin"].ToString());
        com.Parameters.AddWithValue("NOTE", "");
        com.Parameters.AddWithValue("STT", txtSTT.Text);

        try
        {

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Viettool/PanelNgang.aspx");
        }
        catch (SqlException ex)
        {
            throw ex;
        }
    }
}
