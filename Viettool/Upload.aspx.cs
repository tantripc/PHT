using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Viettool_Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (fu1.HasFile)
        {
            string filename = fu1.FileName;
            filename = "~/FileUpload/" + filename;
            fu1.SaveAs(Server.MapPath(filename));
            lblMessage.Visible = false;
            Response.Redirect("~/Viettool/Default.aspx");
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Chưa có file.";
        }
    }
}
