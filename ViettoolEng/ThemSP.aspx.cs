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
        string a = Request.QueryString["NEWS_ID"];
        string b = Request.QueryString["CHANNEL_ID"];
        string c = Request.QueryString["TENHANG"];
        // xet dieu kien neu chon link nao thi trong database hien tuong ung
        int lnkPeriod = 0;
        if (raPast.Checked == true)
            lnkPeriod = 1;
        else if (raPresent.Checked == true)
            lnkPeriod = 2;
        else if (raFuture.Checked == true)
            lnkPeriod = 3;
        // xet dieu kien neu chon link nao thi trong database hien tuong ung hinh thuc
        int lnkForm = 0;
        if (raDauTu.Checked == true)
            lnkForm = 1;
        else if (raNhanThau.Checked == true)
            lnkForm = 2;
        else
            lnkForm = 3;
        // Thiet lap ngay dang tin
        DateTime dtNgay;
        if (txtNgay.Text.Trim() == "")
            dtNgay = DateTime.Now;
        else
            dtNgay = DateTime.Parse(txtNgay.Text, new CultureInfo("vi-VN", false));
        string s = "Insert into SANPHAM_ENG (NHOMHANG,CHANNEL_ID,TENHANG,CAP_ID,TOMTAT,NOIDUNG,USERID,DACTINH,STT,TENSANPHAM,HINH,HINHNHO,Period,Fix,ViTri,DienTich,KinhPhi,HoanThanh,ChuDauTu,ThietKe,ThiCong,GiamSat,TieuBieu,HinhThuc,NGAY)values(@NHOMHANG,@CHANNEL_ID,@TENHANG,@CAP_ID,@TOMTAT,@NOIDUNG,@USERID,@DACTINH,@STT,@TENSANPHAM,@HINH,@HINHNHO,@Period,@Fix,@ViTri,@DienTich,@KinhPhi,@HoanThanh,@ChuDauTu,@ThietKe,@ThiCong,@GiamSat,@TieuBieu,@HinhThuc,@NGAY)";
        com = new SqlCommand(s, con);
        con.Open();
        com.Parameters.AddWithValue("@NHOMHANG", a.ToString());
        com.Parameters.AddWithValue("@CHANNEL_ID", b.ToString());
        com.Parameters.AddWithValue("@TENHANG", c.ToString());
        com.Parameters.AddWithValue("@CAP_ID", '1');
        com.Parameters.AddWithValue("@TOMTAT" , FCKeditor1.Value);
        com.Parameters.AddWithValue("@NOIDUNG", FCKeditor3.Value);
        com.Parameters.AddWithValue("@USERID", Session["Admin"].ToString());
        com.Parameters.AddWithValue("@DACTINH", txtTomTat.Text);
        com.Parameters.AddWithValue("@STT", '2');
        com.Parameters.AddWithValue("@TENSANPHAM", txtTieude.Text);
        //com.Parameters.AddWithValue("@HINH", "~/IMG/image/"+Label1.Text);
        com.Parameters.AddWithValue("@HINH", Label1.Text);
        com.Parameters.AddWithValue("@HINHNHO", "~/IMG/image/thumbnail/Nho/" + Label1.Text);
        com.Parameters.AddWithValue("@Period", lnkPeriod);
        com.Parameters.AddWithValue("@Fix", cboFix.Checked);
        com.Parameters.AddWithValue("@ViTri", txtViTri.Text);
        com.Parameters.AddWithValue("@DienTich", txtDienTich.Text);
        com.Parameters.AddWithValue("@KinhPhi", txtKinhPhi.Text);
        com.Parameters.AddWithValue("@HoanThanh", txtHoanThanh.Text);
        com.Parameters.AddWithValue("@ChuDauTu", txtChuDauTu.Text);
        com.Parameters.AddWithValue("@ThietKe", txtThietKe.Text);
        com.Parameters.AddWithValue("@ThiCong", txtThiCong.Text);
        com.Parameters.AddWithValue("@GiamSat", txtGiamSat.Text);
        com.Parameters.AddWithValue("@TieuBieu", cboTieuBieu.Checked);
        com.Parameters.AddWithValue("@HinhThuc", lnkForm);
        com.Parameters.AddWithValue("@NGAY", dtNgay);
        try
        {
            com.ExecuteNonQuery();
            con.Close();
            //string a = Request.QueryString["nid"];
            //string b = Request.QueryString["cid"];
            //string c = Request.QueryString["tde"];
            Response.Redirect("ChiTietSP.aspx?nid=" + a + "&cid=" + b + "&tde=" + c);
        }
        catch (SqlException ex)
        {
            lblError.Visible = true;
            lblError.Text = ex.Message + "<br />" + ex.ToString();
        }
    }
    protected void Upload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(MapPath("~/IMG/Image/" + FileUpload1.FileName));
            System.Drawing.Image img1 = System.Drawing.Image.FromFile(MapPath("~/IMG/Image/") + FileUpload1.FileName);

            System.Drawing.Image bmp1 = img1.GetThumbnailImage(180, 180, null, IntPtr.Zero);
            bmp1.Save(MapPath("~/IMG/Image/thumbnail/Nho/") + FileUpload1.FileName);

            //System.Drawing.Image bmp2 = img1.GetThumbnailImage(null, null, null, IntPtr.Zero);
            //bmp2.Save(MapPath("~/IMG/Image/") + FileUpload1.FileName);


            Anhnho.ImageUrl = "/IMG/Image/thumbnail/Nho/" + FileUpload1.FileName;
            Anhlon.ImageUrl = "/IMG/Image/" + FileUpload1.FileName;

            FCKeditor1.Value = "<img src="+Anhnho.ImageUrl.ToString()+"></img>";
            FCKeditor3.Value = "<img src=" + Anhlon.ImageUrl.ToString() + "></img>";

            Label1.Text = FileUpload1.FileName;
        }
    }
}
