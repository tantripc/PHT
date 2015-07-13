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
            com = new SqlCommand("select TOMTAT,NOIDUNG,DACTINH,STT,GIA,BAOHANH,KHUYENMAI,USD_VND,TENSANPHAM,XUATXU,HINH from SANPHAM_ENG where NEWS_ID = '" + Request.QueryString["nid"].ToString() + "' ", con);
            da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);

            txtTieude.Text = dt.Rows[0][8].ToString();
            FCKeditor2.Value = dt.Rows[0][0].ToString();
            FCKeditor3.Value = dt.Rows[0][1].ToString();
            FCKeditor4.Value = dt.Rows[0][10].ToString();
            
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["nid"] != null)
        {
            string s = "Update SANPHAM_ENG set TOMTAT=@TOMTAT, NOIDUNG=@NOIDUNG, TENSANPHAM=@TENSANPHAM, HINH=@HINH where NEWS_ID= '" + Request.QueryString["nid"].ToString() + "' ";
            com = new SqlCommand(s, con);
            con.Open();
            com.Parameters.Add("@TOMTAT", SqlDbType.NText).Value = FCKeditor2.Value;
            com.Parameters.Add("@NOIDUNG", SqlDbType.NText).Value = FCKeditor3.Value;
            com.Parameters.Add("@TENSANPHAM", SqlDbType.NVarChar, 255).Value = txtTieude.Text;
            com.Parameters.Add("@HINH", SqlDbType.NText).Value = FCKeditor4.Value;
            
            
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
}

