using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set style top link where they stand
            HtmlAnchor a = (HtmlAnchor)Master.FindControl("home");
            if (a != null)
            {
                a.Attributes.Add("class", "topMenuDVLinkActive");
            }

            GetContent();
            GetEvents();
        }
    }
    private void GetContent()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var cont = data.GetContent(257).ToList();
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
    private void GetEvents()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var listTraining = data.GetEventsHome().ToList();
                rptEventsList.DataSource = listTraining;
                rptEventsList.DataBind();
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
}