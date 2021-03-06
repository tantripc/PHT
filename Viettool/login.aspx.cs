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
using System.Security;
using System.Security.Authentication;
using System.Security.Cryptography;
using System.Text;

public partial class Viettool_login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUser.Focus();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (check())
        {
            Session["Admin"] = txtUser.Text;
            Response.Redirect("~/Viettool/default.aspx");  
        }
        else
        {
            
            //lblMessage.Visible = true;
            //lblMessage.Text = "Bạn đã nhập sai UserName hoặc Password.";
        }
    }

    public bool check()
    {
        // Ma hoa Password
        MD5 x = new MD5CryptoServiceProvider();
        byte[] lam = Encoding.UTF8.GetBytes(txtpass.Text);
        lam = x.ComputeHash(lam);
        StringBuilder s = new StringBuilder();
        foreach (byte b in lam)
        {
            s.Append(b.ToString("x2").ToLower());
        }
        string strPass = s.ToString();

        con.Open();
        SqlCommand com = new SqlCommand("select count(*) from NGUOIDUNG where ten = '" + txtUser.Text + "' and Password = '" + strPass + "'", con);
        if (com.ExecuteScalar().ToString() == "1")
        {
            Session["Admin"] = "Admin";
            return true;
        }
        txtUser.Focus();
        return false;
        con.Close();
    }
}
