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
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Globalization;

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
            
            // thiet lap ngay dang tin la ngay hien tai mac dinh
            txtNgay.Text = string.Format("{0:dd/MM/yyyy}",DateTime.Now);
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
        // upload hinh
        string filename = DateTime.Now.Millisecond.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Minute.ToString() + fuImage.FileName;
        string dataFileName = filename;
        if (fuImage.HasFile)
        {
            filename = "~/images/image/" + filename;
            fuImage.SaveAs(Server.MapPath(filename));
        }
        // them du lieu
        string a = Request.QueryString["NEWS_ID"];
        string b = Request.QueryString["CHANNEL_ID"];
        string c = Request.QueryString["TENHANG"];
        // Thiet lap ngay dang tin
        DateTime dtNgay;
        if (txtNgay.Text.Trim() == "")
            dtNgay = DateTime.Now;
        else
            dtNgay = DateTime.Parse(txtNgay.Text, new CultureInfo("vi-VN", false));
        string s = "Insert into SANPHAM_ENG (NHOMHANG,CHANNEL_ID,TENHANG,CAP_ID,TOMTAT,NOIDUNG,USERID,STT,TENSANPHAM,HINH,NGAY,QUANGCAO)values(@NHOMHANG,@CHANNEL_ID,@TENHANG,@CAP_ID,@TOMTAT,@NOIDUNG,@USERID,@STT,@TENSANPHAM,@HINH,@NGAY,@QUANGCAO)";
        com = new SqlCommand(s, con);
        con.Open();
        com.Parameters.AddWithValue("@NHOMHANG", a.ToString());
        com.Parameters.AddWithValue("@CHANNEL_ID",b.ToString());
        com.Parameters.AddWithValue("@TENHANG", c.ToString());
        com.Parameters.AddWithValue("@CAP_ID", '1');
        com.Parameters.AddWithValue("@TOMTAT" , txtTomTat.Text);
        com.Parameters.AddWithValue("@NOIDUNG", FCKeditor3.Value);
        com.Parameters.AddWithValue("@USERID", "Canh");
        //com.Parameters.AddWithValue("@DACTINH", FCKeditor3.Value);
        com.Parameters.AddWithValue("@STT", '2');
        com.Parameters.AddWithValue("@TENSANPHAM", txtTieude.Text);
        if(fuImage.HasFile)
            com.Parameters.AddWithValue("@HINH", dataFileName);
        else
            com.Parameters.AddWithValue("@HINH", "");
        //com.Parameters.AddWithValue("@ISNEW_NEWS", cboNew.Checked);
        com.Parameters.AddWithValue("@NGAY", dtNgay);
        com.Parameters.AddWithValue("@QUANGCAO", FCKeditor4.Value);
        try
        {
            com.ExecuteNonQuery();

            con.Close();
           // string a = Request.QueryString["nid"];
           //string b = Request.QueryString["cid"];
           // string c = Request.QueryString["tde"];
            Response.Redirect("ChiTietTT.aspx?nid=" + a + "&cid=" + b + "&tde=" + c);
        }
        catch (SqlException ex)
        {
            throw ex;

        }
    }
}
