using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class ViettoolEng_QuanTriUsers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["filterOfThisPage"] = "all";
            GetData();
        }
    }
    private void GetData()
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter("GetRegisterByFilter '" + ViewState["filterOfThisPage"].ToString() + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gvAccount.DataSource = ds.Tables[0];
            gvAccount.DataKeyNames = new string[] { "idRegister" };
            gvAccount.DataBind();
        }
        catch (Exception ex)
        {
            accountErrorDV.Visible = true;
            lblAccountErrorMessage.Text = ex.Message;
        }
    }
    protected void gvAccount_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAccount.PageIndex = e.NewPageIndex;
        GetData();
    }
    protected void cboHead1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox cboHead = (CheckBox)sender;
        ToggleCheckState(cboHead.Checked);
    }
    private void ToggleCheckState(bool checkState)
    {
        foreach (GridViewRow row in gvAccount.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("cbo1");
            if (cb != null)
                cb.Checked = checkState;
        }
    }
    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        con.Open();
        foreach (GridViewRow row in gvAccount.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("cbo1");
            if (cb != null && cb.Checked)
            {
                string id = gvAccount.DataKeys[row.RowIndex].Value.ToString();
                SqlCommand com = new SqlCommand("delete Register where idRegister = '" + id + "'", con);
                try
                {
                    com.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    accountErrorDV.Visible = true;
                    lblAccountErrorMessage.Text = ex.Message;
                }
            }
        }
        con.Close();
        accountErrorDV.Visible = false;
        GetData();
    }
    protected void lbtnLock_Click(object sender, EventArgs e)
    {
        con.Open();
        foreach (GridViewRow row in gvAccount.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("cbo1");
            if (cb != null && cb.Checked)
            {
                string id = gvAccount.DataKeys[row.RowIndex].Value.ToString();
                SqlCommand com = new SqlCommand("update Register set isLock = 'True' where idRegister = '" + id + "'", con);
                try
                {
                    com.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    accountErrorDV.Visible = true;
                    lblAccountErrorMessage.Text = ex.Message;
                }
            }
        }
        con.Close();
        accountErrorDV.Visible = false;
        GetData();
    }
    protected void lbtnUnLock_Click(object sender, EventArgs e)
    {
        con.Open();
        foreach (GridViewRow row in gvAccount.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("cbo1");
            if (cb != null && cb.Checked)
            {
                string id = gvAccount.DataKeys[row.RowIndex].Value.ToString();
                SqlCommand com = new SqlCommand("update Register set isLock = 'False' where idRegister = '" + id + "'", con);
                try
                {
                    com.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    accountErrorDV.Visible = true;
                    lblAccountErrorMessage.Text = ex.Message;
                }
            }
        }
        con.Close();
        accountErrorDV.Visible = false;
        GetData();
    }
    protected void lbtnDoVIP_Click(object sender, EventArgs e)
    {
        con.Open();
        foreach (GridViewRow row in gvAccount.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("cbo1");
            if (cb != null && cb.Checked)
            {
                string id = gvAccount.DataKeys[row.RowIndex].Value.ToString();
                SqlCommand com = new SqlCommand("update Register set isVIP = 'True' where idRegister = '" + id + "'", con);
                try
                {
                    com.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    accountErrorDV.Visible = true;
                    lblAccountErrorMessage.Text = ex.Message;
                }
            }
        }
        con.Close();
        accountErrorDV.Visible = false;
        GetData();
    }
    protected void lbtnDoNoVIP_Click(object sender, EventArgs e)
    {
        con.Open();
        foreach (GridViewRow row in gvAccount.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("cbo1");
            if (cb != null && cb.Checked)
            {
                string id = gvAccount.DataKeys[row.RowIndex].Value.ToString();
                SqlCommand com = new SqlCommand("update Register set isVIP = 'False' where idRegister = '" + id + "'", con);
                try
                {
                    com.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    accountErrorDV.Visible = true;
                    lblAccountErrorMessage.Text = ex.Message;
                }
            }
        }
        con.Close();
        accountErrorDV.Visible = false;
        GetData();
    }
    protected void lbtnLocked_Click(object sender, EventArgs e)
    {
        ViewState["filterOfThisPage"] = "lock";
        GetData();
    }
    protected void lbtnVIP_Click(object sender, EventArgs e)
    {
        ViewState["filterOfThisPage"] = "VIP";
        GetData();
    }
    protected void lbtnNoVIP_Click(object sender, EventArgs e)
    {
        ViewState["filterOfThisPage"] = "noVIP";
        GetData();
    }
    protected void lbtnViewAll_Click(object sender, EventArgs e)
    {
        ViewState["filterOfThisPage"] = "all";
        GetData();
    }
}