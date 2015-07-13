using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Service_En : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["nid"] != null)
            {
                GetContent();
            }
        }
    }
    private void GetContent()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var cont = data.GetContent_En(int.Parse(Request.QueryString["nid"])).ToList();
                Label lblSitemap1 = (Label)Master.FindControl("lblSitemap1");
                HtmlAnchor sitemapSplit = (HtmlAnchor)Master.FindControl("sitemapSplit");
                Label lblSitemap2 = (Label)Master.FindControl("lblSitemap2");
                if (lblSitemap1 != null && sitemapSplit != null && lblSitemap2 != null)
                {
                    lblSitemap1.Text = cont[0].FATHER;
                    sitemapSplit.InnerText = "»";
                    lblSitemap2.Text = cont[0].TIEUDE;
                }
                lblContent.Text = cont[0].NOIDUNG;
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
}