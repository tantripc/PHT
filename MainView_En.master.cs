using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class MainView_En : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetServices();
            GetAdvertise();
            GetRightPanel();
            GetPicture();
            GetNews();
            GetBranches();

            // Set style of link where they stand
            if (Request.QueryString["status"] != null)
            {
                foreach (RepeaterItem item in rptServices.Items)
                {
                    HiddenField hf = (HiddenField)item.FindControl("hfNid");
                    HtmlAnchor lnk = (HtmlAnchor)item.FindControl("lnkService");
                    if (hf.Value == Request.QueryString["status"])
                        lnk.Attributes.Add("class", "leftmenuLinkActive");
                }
            }
        }
    }
    private void GetAdvertise()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var adver = data.GetAdvertise_En().ToList();
                lblAdvertise.Text = adver[0].NOIDUNG;
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    private void GetServices()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var listServices = data.GetServices_En(88).ToList();
                rptServices.DataSource = listServices;
                rptServices.DataBind();
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    private void GetRightPanel()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var lpTop = data.GetRightPanel_En().ToList();
                lblRPTitle.Text = lpTop[0].TENSANPHAM;
                lblRPContent.Text = lpTop[0].NOIDUNG;
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    private void GetPicture()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var picture = data.GetTop1Picture_En().ToList();
                imgPic.ImageUrl = "~/images/image/" + picture[0].HINH;
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    private void GetNews()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var listNews = data.GetTopNews_En().ToList();
                rptNews.DataSource = listNews;
                rptNews.DataBind();
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    private void GetBranches()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var listBranches = data.GetBranchOffice_En().ToList();
                rptBranches.DataSource = listBranches;
                rptBranches.DataBind();
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
}
