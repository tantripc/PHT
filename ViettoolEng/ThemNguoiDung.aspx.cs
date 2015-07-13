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

public partial class ViettoolEng_ThemNguoiDung : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnDangky_Click(object sender, EventArgs e)
    {
        // Ma hoa Password
        MD5 x = new MD5CryptoServiceProvider();
        byte[] lam = Encoding.UTF8.GetBytes(txtPassword.Text);
        lam = x.ComputeHash(lam);
        StringBuilder s = new StringBuilder();
        foreach (byte b in lam)
        {
            s.Append(b.ToString("x2").ToLower());
        }
        string strPass = s.ToString();

        if (raUpdate.Checked == true)
            InsertND(txtUsername.Text, strPass, txtEmail.Text, txtName.Text, "1");
        else
            InsertND(txtUsername.Text, strPass, txtEmail.Text, txtName.Text, "2");
    }
    private void InsertND(string strUName, string strPassword, string strEmail, string strName, string strRole)
    {
        // Xet dk khong insert trung Username
        SqlCommand com1 = new SqlCommand("select count(*) from NGUOIDUNG where ten = '"+txtUsername.Text+"'",con);
        con.Open();
        if (com1.ExecuteScalar().ToString() != "1")
        {
            SqlCommand com = new SqlCommand("Insert into NGUOIDUNG(ten,password,email,hoten,aclevel) values('" + strUName + "','" + strPassword + "','" + strEmail + "',N'" + strName + "','" + strRole + "')", con);
            try
            {
                com.ExecuteNonQuery();
                Response.Redirect("QuanTri.aspx");
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Username này đã tồn tại.";
        }
        con.Close();
    }
}
