using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pictures_En : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetSitemap();

            try
            {
                using (DataClassesDataContext data = new DataClassesDataContext())
                {
                    int ItemCount = int.Parse(data.GetPicturesItemCount_En().ToList()[0].ItemCount);
                    AspNetPager1.RecordCount = ItemCount;
                    GetPictures();
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
                var cont = data.GetContent(266).ToList();
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
    private void GetPictures()
    {
        try
        {
            using (DataClassesDataContext data = new DataClassesDataContext())
            {
                var listTraining = data.GetPictures_En(AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex).ToList();
                rptPicturesList.DataSource = listTraining;
                rptPicturesList.DataBind();
            }
        }
        catch (Exception ex)
        {
            // error message here
        }
    }
    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        GetPictures();
    }
}