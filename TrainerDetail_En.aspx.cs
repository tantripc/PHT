using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class TrainerDetail_En : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set style top link where they stand
            HtmlAnchor a = (HtmlAnchor)Master.FindControl("training");
            if (a != null)
            {
                a.Attributes.Add("class", "topMenuDVLinkActive");
            }

            if (Request.QueryString["nid"] != null)
            {
                SetSitemap();

                GetDetail();
            }
        }
    }
    private void SetSitemap()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var cont = data.GetSitemapOfTrainerDetail_En(int.Parse(Request.QueryString["nid"])).ToList();
                Label lblSitemap1 = (Label)Master.FindControl("lblSitemap1");
                HtmlAnchor sitemapSplit = (HtmlAnchor)Master.FindControl("sitemapSplit");
                Label lblSitemap2 = (Label)Master.FindControl("lblSitemap2");
                if (lblSitemap1 != null && sitemapSplit != null && lblSitemap2 != null)
                {
                    lblSitemap1.Text = cont[0].FATHER;
                    sitemapSplit.InnerText = "»";
                    lblSitemap2.Text = cont[0].TENSANPHAM;
                }
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    private void GetDetail()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var detail = data.GetTrainingDetail_En(int.Parse(Request.QueryString["nid"])).ToList();
                lblTitle.Text = detail[0].TENSANPHAM;
                lblDate.Text = string.Format("{0:dd/MM/yyyy}", detail[0].NGAY);
                lblSummary.Text = detail[0].TOMTAT;
                lblContent.Text = detail[0].NOIDUNG;
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
}