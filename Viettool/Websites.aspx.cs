using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Viettool_Websites : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetData();
        }
    }
    private void GetData()
    {
        SqlDataAdapter da = new SqlDataAdapter("select ID,TITLE,LINK from WEBSITES order by ID desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvWebsites.DataSource = ds.Tables[0].DefaultView;
        gvWebsites.DataKeyNames = new string[] { "ID" };
        gvWebsites.DataBind();
    }
    protected void gvWebsites_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvWebsites.EditIndex = e.NewEditIndex;
        GetData();
    }
    protected void gvWebsites_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvWebsites.EditIndex = -1;
        GetData();
    }
    protected void gvWebsites_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string id = gvWebsites.DataKeys[e.RowIndex].Value.ToString();
        string deli_mod = ((TextBox)gvWebsites.Rows[e.RowIndex].FindControl("txtTiUp")).Text;
        string ship = ((TextBox)gvWebsites.Rows[e.RowIndex].FindControl("txtLiUp")).Text;

        SqlCommand com = new SqlCommand("update WEBSITES set TITLE = N'" + deli_mod + "', LINK = '" + ship + "' where ID = '" + id + "'", con);
        con.Open();
        try
        {
            com.ExecuteNonQuery();
            gvWebsites.EditIndex = -1;
            GetData();
            errorDV.Visible = false;
        }
        catch (Exception ex)
        {
            errorDV.Visible = true;
            lblErrorMessage.Text = ex.Message;
        }
        con.Close();
    }
    protected void gvWebsites_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvWebsites.DataKeys[e.RowIndex].Value.ToString();
        SqlCommand com = new SqlCommand("delete WEBSITES where ID = '" + id + "'", con);
        con.Open();
        try
        {
            com.ExecuteNonQuery();
            GetData();
            errorDV.Visible = false;
        }
        catch (Exception ex)
        {
            errorDV.Visible = true;
            lblErrorMessage.Text = ex.Message;
        }
        con.Close();
    }
    protected void btnAddSite_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("insert into WEBSITES (TITLE,LINK) values (N'" + txtTiAdd.Text + "','" + txtLiAdd.Text + "')", con);
        con.Open();
        try
        {
            com.ExecuteNonQuery();
            GetData();
            txtTiAdd.Text = "";
            txtLiAdd.Text = "";
            errorDV.Visible = false;
        }
        catch (Exception ex)
        {
            errorDV.Visible = true;
            lblErrorMessage.Text = ex.Message;
        }
        con.Close();
    }
    protected void gvWebsites_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvWebsites.PageIndex = e.NewPageIndex;
        GetData();
    }
}