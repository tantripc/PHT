using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set style top link where they stand
            HtmlAnchor a = (HtmlAnchor)Master.FindControl("contact");
            if (a != null)
            {
                a.Attributes.Add("class", "topMenuDVLinkActive");
            }

            SetSitemap();
        }
    }
    private void SetSitemap()
    {
        try
        {
            Label lblSitemap1 = (Label)Master.FindControl("lblSitemap1");
            if (lblSitemap1 != null)
                lblSitemap1.Text = "Liên hệ";
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                data.DoContact(txtName.Text, txtEmail.Text, txtSubject.Text, txtMessage.Text);
            }
            Response.Redirect("Do_contact_successfully.html");
        }
        catch (Exception ex)
        {
            contactErrorDV.Visible = true;
            lblContactErrorMessage.Text = ex.Message;
        }
    }
}