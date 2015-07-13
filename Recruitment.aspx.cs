using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Recruitment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set style top link where they stand
            HtmlAnchor a = (HtmlAnchor)Master.FindControl("recruitment");
            if (a != null)
            {
                a.Attributes.Add("class", "topMenuDVLinkActive");
            }

            GetContent();
        }
    }
    private void GetContent()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var cont = data.GetContent(254).ToList();
                Label lblSitemap1 = (Label)Master.FindControl("lblSitemap1");
                if (lblSitemap1 != null)
                    lblSitemap1.Text = cont[0].TIEUDE;
                lblContent.Text = cont[0].NOIDUNG;
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
}