using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Activities_En : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set style top link where they stand
            HtmlAnchor a = (HtmlAnchor)Master.FindControl("activities");
            if (a != null)
            {
                a.Attributes.Add("class", "topMenuDVLinkActive");
            }

            SetSitemap();

            try
            {
                using (DataClassesDataContext data = new DataClassesDataContext())
                {
                    int ItemCount = int.Parse(data.GetActivitiesNewsItemCount_En().ToList()[0].ItemCount);
                    AspNetPager1.RecordCount = ItemCount;
                    GetActivities();
                }
            }
            catch (Exception ex)
            {
                // error message here
            }
        }
    }
    private void SetSitemap()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var cont = data.GetContent(264).ToList();
                Label lblSitemap1 = (Label)Master.FindControl("lblSitemap1");
                if (lblSitemap1 != null)
                    lblSitemap1.Text = cont[0].TIEUDE;
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    private void GetActivities()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var listTraining = data.GetActivitiesNews_En(AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex).ToList();
                rptActivitiesList.DataSource = listTraining;
                rptActivitiesList.DataBind();
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        GetActivities();
    }
}