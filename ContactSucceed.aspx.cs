using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class ContactSucceed : System.Web.UI.Page
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
}