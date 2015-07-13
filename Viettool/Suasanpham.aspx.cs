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
        if (Request.QueryString["nid"] != null)
        {
            com = new SqlCommand("select TOMTAT,NOIDUNG,DACTINH,STT,GIA,BAOHANH,KHUYENMAI,USD_VND,TENSANPHAM,XUATXU,HINH,HINHNHO,Period,Fix,ViTri,DienTich,KinhPhi,HoanThanh,ChuDauTu,ThietKe,ThiCong,GiamSat,TieuBieu,HinhThuc,NGAY from SANPHAM where NEWS_ID = '" + Request.QueryString["nid"].ToString() + "' ", con);
            da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);

            txtTieude.Text = dt.Rows[0][8].ToString();
            txtViTri.Text = dt.Rows[0]["ViTri"].ToString();
            txtDienTich.Text = dt.Rows[0]["DienTich"].ToString();
            txtKinhPhi.Text = dt.Rows[0]["KinhPhi"].ToString();
            txtHoanThanh.Text = dt.Rows[0]["HoanThanh"].ToString();
            txtChuDauTu.Text = dt.Rows[0]["ChuDauTu"].ToString();
            txtThietKe.Text = dt.Rows[0]["ThietKe"].ToString();
            txtThiCong.Text = dt.Rows[0]["ThiCong"].ToString();
            FCKeditor1.Value = dt.Rows[0][0].ToString();
            txtTomTat.Text = dt.Rows[0][2].ToString();
            FCKeditor3.Value = dt.Rows[0][1].ToString();

            /*string[] str = dt.Rows[0][10].ToString().Split('/');

            try
            {
                Label2.Text = str[3];
            }
            catch (IndexOutOfRangeException iorex)
            {

            }*/
			
			Label2.Text = dt.Rows[0][10].ToString();

            if (dt.Rows[0]["Period"].ToString().Trim() == "1")
                raPast.Checked = true;
            else if (dt.Rows[0]["Period"].ToString().Trim() == "2")
                raPresent.Checked = true;
            else if (dt.Rows[0]["Period"].ToString().Trim() == "3")
                raFuture.Checked = true;
            cboFix.Checked = bool.Parse(dt.Rows[0]["Fix"].ToString());
            txtGiamSat.Text = dt.Rows[0]["GiamSat"].ToString();
            cboTieuBieu.Checked = bool.Parse(dt.Rows[0]["TieuBieu"].ToString());
            if (dt.Rows[0]["HinhThuc"].ToString().Trim() == "1")
                raDauTu.Checked = true;
            else if (dt.Rows[0]["HinhThuc"].ToString().Trim() == "2")
                raNhanThau.Checked = true;
            else
                raTuVan.Checked = true;
            txtNgay.Text = string.Format("{0:dd/MM/yyyy}", dt.Rows[0]["NGAY"]);
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["nid"] != null)
        {
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
            string s = "Update SANPHAM set TOMTAT=@TOMTAT, NOIDUNG=@NOIDUNG, DACTINH=@DACTINH, TENSANPHAM=@TENSANPHAM,HINH=@HINH,HINHNHO=@HINHNHO,Period=@Period,Fix=@Fix,ViTri=@ViTri,DienTich=@DienTich,KinhPhi=@KinhPhi,HoanThanh=@HoanThanh,ChuDauTu=@ChuDauTu,ThietKe=@ThietKe,ThiCong=@ThiCong,GiamSat=@GiamSat,TieuBieu=@TieuBieu,HinhThuc=@HinhThuc,NGAY=@NGAY where NEWS_ID= '" + Request.QueryString["nid"].ToString() + "' ";
            com = new SqlCommand(s, con);
            con.Open();
            com.Parameters.Add("@TOMTAT", SqlDbType.NText).Value = FCKeditor1.Value;
            com.Parameters.Add("@NOIDUNG", SqlDbType.NText).Value = FCKeditor3.Value;
            com.Parameters.Add("@DACTINH", SqlDbType.NText).Value = txtTomTat.Text;
            com.Parameters.Add("@TENSANPHAM", SqlDbType.NVarChar, 255).Value = txtTieude.Text;
            com.Parameters.AddWithValue("@ViTri", txtViTri.Text);
            com.Parameters.AddWithValue("@DienTich", txtDienTich.Text);
            com.Parameters.AddWithValue("@KinhPhi", txtKinhPhi.Text);
            com.Parameters.AddWithValue("@HoanThanh", txtHoanThanh.Text);
            com.Parameters.AddWithValue("@ChuDauTu", txtChuDauTu.Text);
            com.Parameters.AddWithValue("@ThietKe", txtThietKe.Text);
            com.Parameters.AddWithValue("@ThiCong", txtThiCong.Text);
            //com.Parameters.Add("@HINH", SqlDbType.NVarChar, 255).Value = "~/IMG/image/" + Label2.Text;
            com.Parameters.Add("@HINH", SqlDbType.NVarChar, 255).Value = Label2.Text;
            com.Parameters.Add("@HINHNHO", SqlDbType.NVarChar, 255).Value = "~/IMG/image/thumbnail/Nho/" + Label2.Text;
            com.Parameters.Add("@Period", SqlDbType.Int, 4).Value = lnkPeriod;
            com.Parameters.AddWithValue("@Fix", cboFix.Checked);
            com.Parameters.AddWithValue("@GiamSat", txtGiamSat.Text);
            com.Parameters.AddWithValue("@TieuBieu", cboTieuBieu.Checked);
            com.Parameters.AddWithValue("@HinhThuc", lnkForm);
            com.Parameters.AddWithValue("@NGAY", dtNgay);
            try
            {
                com.ExecuteNonQuery();
                con.Close();
                string a = Request.QueryString["a"];
                string b = Request.QueryString["b"];
                string c = Request.QueryString["c"];
                Response.Redirect("ChiTietSP.aspx?nid=" + a + "&cid=" + b + "&tde=" + c);
            }
            catch (SqlException ex)
            {
                lblError.Visible = true;
                lblError.Text = ex.Message + "<br />" + ex.ToString();
            }
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

           // FCKeditor1.Value = "<img src=" + Anhnho.ImageUrl.ToString() + "></img>";
           // FCKeditor3.Value = "<img src=" + Anhlon.ImageUrl.ToString() + "></img>";

            Label2.Text = FileUpload1.FileName;
        }
    }
}

