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
            com = new SqlCommand("select TOMTAT,NOIDUNG,DACTINH,STT,GIA,BAOHANH,KHUYENMAI,USD_VND,TENSANPHAM,XUATXU,HINH,NGAY,QUANGCAO from SANPHAM where NEWS_ID = '" + Request.QueryString["nid"].ToString() + "' ", con);
            da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);

            txtTieude.Text = dt.Rows[0][8].ToString();
            txtTomTat.Text = dt.Rows[0][0].ToString();
            FCKeditor3.Value = dt.Rows[0][1].ToString();
            hfImage.Value = dt.Rows[0][10].ToString();
            /*if (dt.Rows[0]["ISNEW_NEWS"].ToString() == "True")
                cboNew.Checked = true;
            else
                cboNew.Checked = false;*/
            txtNgay.Text = string.Format("{0:dd/MM/yyyy}",dt.Rows[0]["NGAY"]);
            FCKeditor4.Value = dt.Rows[0]["QUANGCAO"].ToString();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // upload hinh
        string filename = DateTime.Now.Millisecond.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Minute.ToString() + fuImage.FileName;
        string dataFileName = filename;
        if (fuImage.HasFile)
        {
            // xoa hinh cu
            try
            {
                string filenameDel = hfImage.Value;
                filenameDel = "~/images/image/" + filenameDel;      // remember uncheck readonly property for this folder
                FileInfo TheFile = new FileInfo(MapPath(filenameDel));
                if (TheFile.Exists)
                {
                    File.Delete(MapPath(filenameDel));     // this will delete file hfImage.Value in folder 'images/News'
                }
                else
                {
                    throw new FileNotFoundException();
                }
            }

            catch (FileNotFoundException ex)
            {
                
            }
            catch (Exception ex)
            {
                
            }
            // upload hinh moi
            filename = "~/images/image/" + filename;
            fuImage.SaveAs(Server.MapPath(filename));
        }
        // sua du lieu
        string a = Request.QueryString["NEWS_ID"];
        string b = Request.QueryString["CHANNEL_ID"];
        string c = Request.QueryString["TENHANG"];
        if (Request.QueryString["nid"] != null)
        {
            // Thiet lap ngay dang tin
            DateTime dtNgay;
            if (txtNgay.Text.Trim() == "")
                dtNgay = DateTime.Now;
            else
                dtNgay = DateTime.Parse(txtNgay.Text, new CultureInfo("vi-VN", false));
            string s = "Update SANPHAM set TOMTAT=@TOMTAT, NOIDUNG=@NOIDUNG, TENSANPHAM=@TENSANPHAM, HINH=@HINH, NGAY=@NGAY, QUANGCAO = @QUANGCAO where NEWS_ID= '" + Request.QueryString["nid"].ToString() + "' ";
            com = new SqlCommand(s, con);
            con.Open();
            com.Parameters.Add("@TOMTAT", SqlDbType.NText).Value = txtTomTat.Text;
            com.Parameters.Add("@NOIDUNG", SqlDbType.NText).Value = FCKeditor3.Value;
            com.Parameters.Add("@TENSANPHAM", SqlDbType.NVarChar, 255).Value = txtTieude.Text;
            if(fuImage.HasFile)
                com.Parameters.AddWithValue("@HINH", dataFileName);
            else
                com.Parameters.AddWithValue("@HINH", hfImage.Value);
            //com.Parameters.AddWithValue("@ISNEW_NEWS", cboNew.Checked);
            com.Parameters.AddWithValue("@NGAY", dtNgay);
            com.Parameters.Add("@QUANGCAO", SqlDbType.NText).Value = FCKeditor4.Value;
            try
            {
                com.ExecuteNonQuery();
                con.Close();
                //string a = Request.QueryString["nid"];
                //string b = Request.QueryString["cid"];
                //string c = Request.QueryString["tde"];
                Response.Redirect("ChiTietTT.aspx?nid=" + a + "&cid=" + b + "&tde=" + c);
            }
            catch (SqlException ex)
            {
                throw ex;

            }
        }
    }
}

