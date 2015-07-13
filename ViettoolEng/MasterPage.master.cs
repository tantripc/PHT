using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

public partial class ViettoolEng_MasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            //FormsAuthentication.RedirectToLoginPage();
            Response.Redirect("~/ViettoolEng/Login.aspx");
        }
        //lblUserName.Text = HttpContext.Current.User.Identity.Name;
        //Session["Admin"] = lblUserName.Text;
        else
        {
            try
            {
                lblUserName.Text = Session["Admin"].ToString();
            }
            catch (Exception ex)
            {
                Response.Redirect("~/ViettoolEng/Login.aspx");
            }
        }

        // kiem tra quyen qtri
        if (Session["Admin"] != null)
        {
            try
            {
                imgQT.Visible = checkRole();
                aQT.Visible = checkRole();
            }
            catch (Exception ex)
            {
                Response.Redirect("~/ViettoolEng/Login.aspx");
            }
        }
        else
        {
            Response.Redirect("~/ViettoolEng/Login.aspx");
        }
    }
  
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["Admin"] = "";
        FormsAuthentication.SignOut();
        Response.Redirect("~/ViettoolEng/Login.aspx");
    }
    public bool checkRole()
    {
        SqlCommand com = new SqlCommand("select aclevel from NGUOIDUNG where ten = '"+Session["Admin"].ToString()+"'", con);
        con.Open();
        string role = com.ExecuteScalar().ToString();
        con.Close();
        if (role == "2")
            return true;
        return false;
    }
}
