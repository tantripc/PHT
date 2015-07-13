using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Configuration;

public partial class ViettoolEng_QuanTri : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetData();
            checkRole();
        }
    }
    private void GetData()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from NGUOIDUNG",con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvQTri.DataSource = ds.Tables[0].DefaultView;
        gvQTri.DataKeyNames = new string[] { "ID" };
        gvQTri.DataBind();
    }
    private void checkRole()
    {
        foreach (GridViewRow row in gvQTri.Rows)
        {
            Label lbl = (Label)row.FindControl("lblRole");
            if (lbl != null && lbl.Text == "1")
            {
                lbl.Text = "Cập nhật";
            }
            if (lbl != null && lbl.Text == "2")
            {
                lbl.Text = "Quản trị";
            }
        }
    }
    protected void gvQTri_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string indexName = ((Label)gvQTri.Rows[e.RowIndex].Cells[1].FindControl("lblUName")).Text;
        string currentName = Session["Admin"].ToString();
        con.Open();
        if (indexName.Trim() != currentName.Trim())
        {
            SqlCommand com = new SqlCommand("delete NGUOIDUNG where ID = '" + gvQTri.DataKeys[e.RowIndex].Value.ToString() + "'", con);
            try
            {
                com.ExecuteNonQuery();
                GetData();
                checkRole();
                lblMessage.Visible = false;
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = ex.ToString();
            }
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "User này đang đăng nhập nên không thể xoá được.";
        }
        con.Close();
    }
    protected void gvQTri_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvQTri.PageIndex = e.NewPageIndex;
        GetData();
        checkRole();
    }
}
