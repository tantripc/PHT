using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Viettool_ThemPanelPhai : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand com;
    SqlCommand com1;        // Command de xet dieu kien truyen bien STT sau cung
    SqlCommand com2;
    SqlDataAdapter da2;
    int STT = 0;
    int a = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Truyenbien();
        }
    }
    public void Truyenbien()
    {

        // Xet dieu kien de truyen bien STT sau cung
        con.Open();
        com1 = new SqlCommand("select count(*) from SANPHAM where CHANNEL_ID=45", con);
        if (com1.ExecuteScalar().ToString() != "0")
        {
            com2 = new SqlCommand("select top 1 STT from SANPHAM where CHANNEL_ID=45 order by STT desc", con);
            da2 = new SqlDataAdapter(com2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);

            //NHOM= int.Parse(dt2.Rows[0][0].ToString());
            //NHOM++;
            //TextBox11.Text =   NHOM.ToString() ;

            STT = int.Parse(dt2.Rows[0][0].ToString());
        }
        else
            STT = -1;
        STT++;
        txtSTT.Text = STT.ToString();
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string s = "Insert into SANPHAM (NHOMHANG,CHANNEL_ID,TENHANG,CAP_ID,TOMTAT,NOIDUNG,USERID,DACTINH,STT,TENSANPHAM)values(@NHOMHANG,@CHANNEL_ID,@TENHANG,@CAP_ID,@TOMTAT,@NOIDUNG,@USERID,@DACTINH,@STT,@TENSANPHAM)";
        com = new SqlCommand(s, con);
        con.Open();
        com.Parameters.AddWithValue("@NHOMHANG", "45");
        com.Parameters.AddWithValue("@CHANNEL_ID", "45");
        com.Parameters.AddWithValue("@TENHANG", txtTieude.Text);
        com.Parameters.AddWithValue("@CAP_ID", '1');
        com.Parameters.AddWithValue("@TOMTAT", FCKeditor2.Value);
        com.Parameters.AddWithValue("@NOIDUNG", FCKeditor3.Value);
        com.Parameters.AddWithValue("@USERID", "Canh");
        com.Parameters.AddWithValue("@DACTINH", FCKeditor3.Value);
        com.Parameters.AddWithValue("@STT", txtSTT.Text);
        com.Parameters.AddWithValue("@TENSANPHAM", txtTieude.Text);

        try
        {
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("PanelPhai.aspx");
        }
        catch (SqlException ex)
        {
            throw ex;

        }
    }
}