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
    
    Coms obj = new Coms();

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
            Load_Data();
        }
        
    }

    public void Load_Data()
    {
        if (Request.QueryString["stt"] != null)
        {
            TextBox4.Text = Request.QueryString["stt"].ToString();
        }
    }

    public void Truyenbien()
    {

        //Int32 news_id = Int32.Parse(Request.QueryString["NEWS_ID"]);
        //Int32 channel_id = Int32.Parse(Request.QueryString["CHANNEL_ID"]);
        com = new SqlCommand("select  top 1 NEWS_ID  from TINTUC01  order by NEWS_ID desc",con);
        da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);

        // Xet dieu kien de truyen bien STT sau cung
        con.Open();
        com1 = new SqlCommand("select count(*) from TINTUC01 where CHANNEL_ID='" + Request.QueryString["stt"].ToString() + "' and MENU_SUB = 0", con);
        if (com1.ExecuteScalar().ToString() != "0")
        {
            com2 = new SqlCommand("select top 1 STT  from TINTUC01 where CHANNEL_ID='" + Request.QueryString["stt"].ToString() + "' and MENU_SUB = 0 order by STT desc", con);
            da2 = new SqlDataAdapter(com2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            STT = int.Parse(dt2.Rows[0][0].ToString());
        }
        else
            STT = -1;
        STT++;
        txtSTT.Text = STT.ToString();
        con.Close();
        //TextBox3.Text = cbMenu.SelectedValue.ToString();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RadioButton1.Checked == true)
        {
            string inserts = "Insert into TINTUC01 (CHANNEL_ID,NHOM,LOAI_ID,CAP_ID,MENU_SUB,TIEUDE,TOMTAT,NOIDUNG,USERID,NOTE,STT)values(@CHANNEL_ID,@NHOM,@LOAI_ID,@CAP_ID,@MENU_SUB,@TIEUDE,@TOMTAT,@NOIDUNG,@USERID,@NOTE,@STT)";
            com = new SqlCommand(inserts, con);
            con.Open();
            com.Parameters.AddWithValue("CHANNEL_ID", TextBox4.Text);
            com.Parameters.AddWithValue("NHOM", txtSTT.Text);
            com.Parameters.AddWithValue("LOAI_ID", '0');
            com.Parameters.AddWithValue("CAP_ID", '0');
            com.Parameters.AddWithValue("MENU_SUB", '0');
            com.Parameters.AddWithValue("TIEUDE", TextBox1.Text);
            com.Parameters.AddWithValue("TOMTAT", FCKeditor1.Value);
            com.Parameters.AddWithValue("NOIDUNG", FCKeditor2.Value);
            com.Parameters.AddWithValue("USERID", Session["Admin"].ToString());
            com.Parameters.AddWithValue("NOTE", TextBox2.Text);
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

        if (RadioButton2.Checked == true)
        {
            string inserts = "Insert into TINTUC01 (CHANNEL_ID,NHOM,LOAI_ID,CAP_ID,MENU_SUB,TIEUDE,TOMTAT,NOIDUNG,USERID,NOTE,STT)values(@CHANNEL_ID,@NHOM,@LOAI_ID,@CAP_ID,@MENU_SUB,@TIEUDE,@TOMTAT,@NOIDUNG,@USERID,@NOTE,@STT)";
            com = new SqlCommand(inserts, con);
            con.Open();
            com.Parameters.AddWithValue("CHANNEL_ID", TextBox4.Text);
            com.Parameters.AddWithValue("NHOM", txtSTT.Text);
            com.Parameters.AddWithValue("LOAI_ID", '0');
            com.Parameters.AddWithValue("CAP_ID", '1');
            com.Parameters.AddWithValue("MENU_SUB", '0');
            com.Parameters.AddWithValue("TIEUDE", TextBox1.Text);
            com.Parameters.AddWithValue("TOMTAT", FCKeditor1.Value);
            com.Parameters.AddWithValue("NOIDUNG", FCKeditor2.Value);
            com.Parameters.AddWithValue("USERID", Session["Admin"].ToString());
            com.Parameters.AddWithValue("NOTE", TextBox2.Text);
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

        if (RadioButton3.Checked == true)
        {
            string inserts = "Insert into TINTUC01 (CHANNEL_ID,NHOM,LOAI_ID,CAP_ID,MENU_SUB,TIEUDE,TOMTAT,NOIDUNG,USERID,NOTE,STT)values(@CHANNEL_ID,@NHOM,@LOAI_ID,@CAP_ID,@MENU_SUB,@TIEUDE,@TOMTAT,@NOIDUNG,@USERID,@NOTE,@STT)";
            com = new SqlCommand(inserts, con);
            con.Open();
            com.Parameters.AddWithValue("CHANNEL_ID", TextBox4.Text);
            com.Parameters.AddWithValue("NHOM", txtSTT.Text);
            com.Parameters.AddWithValue("LOAI_ID", '0');
            com.Parameters.AddWithValue("CAP_ID", '2');
            com.Parameters.AddWithValue("MENU_SUB", '0');
            com.Parameters.AddWithValue("TIEUDE", TextBox1.Text);
            com.Parameters.AddWithValue("TOMTAT", FCKeditor1.Value);
            com.Parameters.AddWithValue("NOIDUNG", FCKeditor2.Value);
            com.Parameters.AddWithValue("USERID", Session["Admin"].ToString());
            com.Parameters.AddWithValue("NOTE", TextBox2.Text);
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

        if (RadioButton4.Checked == true)
        {
            string inserts = "Insert into TINTUC01 (CHANNEL_ID,NHOM,LOAI_ID,CAP_ID,MENU_SUB,TIEUDE,TOMTAT,NOIDUNG,USERID,NOTE,STT)values(@CHANNEL_ID,@NHOM,@LOAI_ID,@CAP_ID,@MENU_SUB,@TIEUDE,@TOMTAT,@NOIDUNG,@USERID,@NOTE,@STT)";
            com = new SqlCommand(inserts, con);
            con.Open();
            com.Parameters.AddWithValue("CHANNEL_ID", TextBox4.Text);
            com.Parameters.AddWithValue("NHOM", txtSTT.Text);
            com.Parameters.AddWithValue("LOAI_ID", '0');
            com.Parameters.AddWithValue("CAP_ID", '3');
            com.Parameters.AddWithValue("MENU_SUB", '0');
            com.Parameters.AddWithValue("TIEUDE", TextBox1.Text);
            com.Parameters.AddWithValue("TOMTAT", FCKeditor1.Value);
            com.Parameters.AddWithValue("NOIDUNG", FCKeditor2.Value);
            com.Parameters.AddWithValue("USERID", Session["Admin"].ToString());
            com.Parameters.AddWithValue("NOTE", TextBox2.Text);
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
}
