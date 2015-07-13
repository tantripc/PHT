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
    DataSet ds;
    SqlCommand com;
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
        
        //com = new SqlCommand("select top 1 STT from SANPHAM_ENG  where NHOMHANG='" + Session["NEWS_ID"].ToString() + "' and CHANNEL_ID='" + Session["CHANNEL_ID"].ToString() + "'order by STT desc", con);
        //da = new SqlDataAdapter(com);
        //DataTable dt = new DataTable();
        //da.Fill(dt);

        //int a = Int32.Parse(dt.Rows[0][0].ToString());
       
        //    a = 1;
    
        //txtma.Text = a.ToString();
        //txtTieude.Text = dt.Rows[0][8].ToString();
        //txtXuaxu.Text = dt.Rows[0][9].ToString();
        //txtKhuyenmai.Text = dt.Rows[0][6].ToString();
        //txtBaohanh.Text = dt.Rows[0][5].ToString();
        //txtGia.Text = dt.Rows[0][4].ToString();
        //FCKeditor1.Value = dt.Rows[0][0].ToString();
        //FCKeditor2.Value = dt.Rows[0][2].ToString();
        //FCKeditor3.Value = dt.Rows[0][1].ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string s = "Insert into SANPHAM_ENG (CHANNEL_ID,CAP_ID,TOMTAT,NOIDUNG,USERID,STT,TENSANPHAM,HINH)values(@CHANNEL_ID,@CAP_ID,@TOMTAT,@NOIDUNG,@USERID,@STT,@TENSANPHAM,@HINH)";
        com = new SqlCommand(s, con);
        con.Open();
        //com.Parameters.AddWithValue("@NHOMHANG", Session["NEWS_ID"].ToString());
        com.Parameters.AddWithValue("@CHANNEL_ID", "20");
        //com.Parameters.AddWithValue("@TENHANG", "Thông tin");
        com.Parameters.AddWithValue("@CAP_ID", '1');
        com.Parameters.AddWithValue("@TOMTAT" , FCKeditor2.Value);
        com.Parameters.AddWithValue("@NOIDUNG", FCKeditor3.Value);
        com.Parameters.AddWithValue("@USERID", "Canh");
        //com.Parameters.AddWithValue("@DACTINH", FCKeditor3.Value);
        com.Parameters.AddWithValue("@STT", '2');
        com.Parameters.AddWithValue("@TENSANPHAM", txtTieude.Text);
        com.Parameters.AddWithValue("@HINH", FCKeditor4.Value);
        
        try
        {
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("ChiTietTTin.aspx");
        }
        catch (SqlException ex)
        {
            throw ex;

        }
    }
}
