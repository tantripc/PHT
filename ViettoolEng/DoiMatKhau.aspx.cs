using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Configuration;
using System.Security;
using System.Security.Authentication;
using System.Security.Cryptography;
using System.Text;

public partial class ViettoolEng_DoiMatKhau : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        txtOldPass.Focus();
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        // Ma hoa Password moi de doi
        MD5 x = new MD5CryptoServiceProvider();
        byte[] lam = Encoding.UTF8.GetBytes(txtNewPass1.Text);
        lam = x.ComputeHash(lam);
        StringBuilder s = new StringBuilder();
        foreach (byte b in lam)
        {
            s.Append(b.ToString("x2").ToLower());
        }
        string strPass = s.ToString();

        // Ma hoa Password cu de so sanh voi password cu trong Database
        MD5 x1 = new MD5CryptoServiceProvider();
        byte[] lam1 = Encoding.UTF8.GetBytes(txtOldPass.Text);
        lam1 = x1.ComputeHash(lam1);
        StringBuilder s1 = new StringBuilder();
        foreach (byte b1 in lam1)
        {
            s1.Append(b1.ToString("x2").ToLower());
        }
        string strOldPass = s1.ToString();

        SqlDataAdapter da = new SqlDataAdapter("select password from NGUOIDUNG where ten = '"+Session["Admin"].ToString()+"'",con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        string currentPass = dt.Rows[0][0].ToString();
        con.Open();
        if (strOldPass.Trim() == currentPass.Trim())
        {
            SqlCommand com = new SqlCommand("Update NGUOIDUNG set password = '"+strPass+"' where ten = '"+Session["Admin"].ToString()+"'",con);
            try
            {
                com.ExecuteNonQuery();
                Response.Redirect("QuanTri.aspx");
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = ex.ToString();
            }
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Mật khẩu cũ không hợp lệ.";
        }
        con.Close();
    }
}
