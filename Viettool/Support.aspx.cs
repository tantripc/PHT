using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Viettool_Support : System.Web.UI.Page
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
        try
        {
            SqlDataAdapter da = new SqlDataAdapter("select ID,PHONE,IM from SUPPORT order by ID", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            lblCurrentPhone1.Text = dt.Rows[0]["PHONE"].ToString();
            txtPhone1.Text = dt.Rows[0]["PHONE"].ToString();
            lblCurrentIM1.Text = dt.Rows[0]["IM"].ToString();
            txtIM1.Text = dt.Rows[0]["IM"].ToString();
            lblCurrentPhone2.Text = dt.Rows[1]["PHONE"].ToString();
            txtPhone2.Text = dt.Rows[1]["PHONE"].ToString();
            lblCurrentIM2.Text = dt.Rows[1]["IM"].ToString();
            txtIM2.Text = dt.Rows[1]["IM"].ToString();
            lblCurrentPhone3.Text = dt.Rows[2]["PHONE"].ToString();
            txtPhone3.Text = dt.Rows[2]["PHONE"].ToString();
            lblCurrentIM3.Text = dt.Rows[2]["IM"].ToString();
            txtIM3.Text = dt.Rows[2]["IM"].ToString();
        }
        catch (Exception ex)
        {
            errorDV.Visible = true;
            lblErrorMessage.Text = ex.Message;
        }
    }
    protected void btnEdit1_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("update SUPPORT set PHONE = '" + txtPhone1.Text + "', IM = '"+txtIM1.Text+"' where ID = '1'", con);
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
    protected void btnEdit2_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("update SUPPORT set PHONE = '" + txtPhone2.Text + "', IM = '" + txtIM2.Text + "' where ID = '3'", con);
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
    protected void btnEdit3_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("update SUPPORT set PHONE = '" + txtPhone3.Text + "', IM = '" + txtIM3.Text + "' where ID = '4'", con);
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
}