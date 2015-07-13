using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

public partial class ViettoolEng_Default4 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load_Data();
            checkRead();
        }
    }
    public void Load_Data()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT [GOPY_ID], [TIEUDE], [HOTEN], [DIACHI], [DIENTHOAI], [MAIL], [NOIDUNG], [NGAY], [noidungtraloi] FROM [GOPY_D] ORDER BY [NGAY] desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gv1.DataSource = ds.Tables[0].DefaultView;
        gv1.DataKeyNames = new string[] { "GOPY_ID" };
        gv1.DataBind();
    }
    private void checkRead()
    {
        con.Open();
        foreach (GridViewRow row in gv1.Rows)
        {
            string id = gv1.DataKeys[row.RowIndex].Value.ToString();
            SqlCommand com = new SqlCommand("select ktra from GOPY_D where GOPY_ID = '" + id + "'", con);
            string ktra = com.ExecuteScalar().ToString();
            Panel pnlItem = (Panel)row.FindControl("Panel1");
            if (ktra.Trim() == "False")     // Gop y chua xem
                pnlItem.Font.Bold = true;
            if (ktra.Trim() == "True")      // Gop y da xem
                pnlItem.Font.Bold = false;
        }
        con.Close();
    }
    private void ToggleCheckState(bool checkState)
    {
        foreach (GridViewRow row in gv1.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
            if (cb != null)
                cb.Checked = checkState;
        }
    }
    protected void lbtnCheckAll_Click(object sender, EventArgs e)
    {
        ToggleCheckState(true);
    }
    protected void lbtnUnCheckAll_Click(object sender, EventArgs e)
    {
        ToggleCheckState(false);
    }
    protected void lbtnRead_Click(object sender, EventArgs e)
    {
        con.Open();
        foreach (GridViewRow row in gv1.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
            if (cb != null && cb.Checked)
            {
                string id = gv1.DataKeys[row.RowIndex].Value.ToString();
                SqlCommand com = new SqlCommand("update GOPY_D set ktra = 'True' where GOPY_ID = '" + id + "'", con);
                try
                {
                    com.ExecuteNonQuery();
                    lblMessage.Visible = false;
                }
                catch (Exception ex)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = ex.Message;
                }
            }
        }
        con.Close();
        Load_Data();
        checkRead();
    }
    protected void lbtnUnread_Click(object sender, EventArgs e)
    {
        con.Open();
        foreach (GridViewRow row in gv1.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
            if (cb != null && cb.Checked)
            {
                string id = gv1.DataKeys[row.RowIndex].Value.ToString();
                SqlCommand com = new SqlCommand("update GOPY_D set ktra = 'False' where GOPY_ID = '" + id + "'", con);
                try
                {
                    com.ExecuteNonQuery();
                    lblMessage.Visible = false;
                }
                catch (Exception ex)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = ex.Message;
                }
            }
        }
        con.Close();
        Load_Data();
        checkRead();
    }
    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        con.Open();
        foreach (GridViewRow row in gv1.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
            if (cb != null && cb.Checked)
            {
                string id = gv1.DataKeys[row.RowIndex].Value.ToString();
                SqlCommand com = new SqlCommand("delete GOPY_D where GOPY_ID = '" + id + "'", con);
                try
                {
                    com.ExecuteNonQuery();
                    lblMessage.Visible = false;
                }
                catch (Exception ex)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = ex.Message;
                }
            }
        }
        con.Close();
        Load_Data();
        checkRead();
    }
}
