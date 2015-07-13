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
using System.IO;

public partial class Viettool_Default4 : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["TINTUCMOI"] = "False";
            GetData();
            SetVariables();
        }
    }
    private void GetData()
    {
        if (Request.QueryString["nid"] != null && Request.QueryString["cid"] != null)
        {
            string query = "";
            if(ViewState["TINTUCMOI"].ToString() == "True")
                query = "select NEWS_ID, STT, NOIDUNG, TOMTAT, NGAY, USERID,TENSANPHAM from SANPHAM where NHOMHANG = " + int.Parse(Request.QueryString["nid"].ToString()) + " and CHANNEL_ID = " + int.Parse(Request.QueryString["cid"].ToString()) + " and ISNEW_NEWS = 'True' order by NGAY desc";
            else
                query = "select NEWS_ID, STT, NOIDUNG, TOMTAT, NGAY, USERID,TENSANPHAM from SANPHAM where NHOMHANG = " + int.Parse(Request.QueryString["nid"].ToString()) + " and CHANNEL_ID = " + int.Parse(Request.QueryString["cid"].ToString()) + " order by NGAY desc";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataKeyNames = new string[] { "NEWS_ID" };
            GridView1.DataBind();
        }
    }
    private void SetVariables()
    {
        if (Request.QueryString["nid"] != null && Request.QueryString["cid"] != null && Request.QueryString["tde"] != null)
        {
            Session["NEWS_ID"] = Request.QueryString["nid"];
            Session["CHANNEL_ID"] = Request.QueryString["cid"];
            Session["TIEUDE"] = Request.QueryString["tde"];
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string a = Request.QueryString["nid"];
        string b = Request.QueryString["cid"];
        string c = Request.QueryString["tde"];
        int i = GridView1.SelectedIndex;
        try
        {


            SqlCommand comm = new SqlCommand("select NEWS_ID from TINTUC01 where NEWS_ID ='" + GridView1.Rows[i].Cells[1].Text.ToString() + "' ", con);
            SqlDataAdapter apdapter = new SqlDataAdapter(comm);
            DataSet data = new DataSet("HDDetails");
            apdapter.Fill(data, "HDDetails");


            string nid = GridView1.Rows[i].Cells[0].Text.Trim();
            Response.Redirect("~/Viettool/Suatintuc.aspx?nid="+nid+"&NEWS_ID="+ a +"&CHANNEL_ID="+b+"&TENHANG="+c);

        }
        catch
        {


        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // delete hinh
        SqlDataAdapter da = new SqlDataAdapter("select top 1 HINH from SANPHAM where NEWS_ID = '" + this.GridView1.DataKeys[e.RowIndex].Value + "'",con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        try
        {
            string filenameDel = dt.Rows[0]["HINH"].ToString();
            filenameDel = "~/images/image/" + filenameDel;      // remember uncheck readonly property for this folder
            FileInfo TheFile = new FileInfo(MapPath(filenameDel));
            if (TheFile.Exists)
            {
                File.Delete(MapPath(filenameDel));     // this will delete file hfImage.Value in folder 'images/News'
            }
            else
            {
                throw new FileNotFoundException();
            }
        }

        catch (FileNotFoundException ex)
        {

        }
        catch (Exception ex)
        {

        }
        // delete tin tuc
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.Transaction = myTrans;
        try
        {
            com.CommandText = "Delete from SANPHAM where NEWS_ID ='" + this.GridView1.DataKeys[e.RowIndex].Value + "'";
            com.ExecuteNonQuery();
            myTrans.Commit();
        }
        catch (Exception ex)
        {
            //Response.Redirect("~/Viettool/Default.aspx");
            myTrans.Rollback();
        }
        finally
        {
            con.Close();
            string a = Request.QueryString["nid"];
            string b = Request.QueryString["cid"];
            string c = Request.QueryString["tde"];
            Response.Redirect("ChiTietTT.aspx?nid=" + a + "&cid=" + b + "&tde=" + c);
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string a = Request.QueryString["nid"];
        string b = Request.QueryString["cid"];
        string c = Request.QueryString["tde"];
        Response.Redirect("~/Viettool/ThemTT.aspx?NEWS_ID="+ a +"&CHANNEL_ID="+b+"&TENHANG="+c);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetData();
    }
    protected void lbtnNew_Click(object sender, EventArgs e)
    {
        ViewState["TINTUCMOI"] = "True";
        GetData();
    }
    protected void lbtnAll_Click(object sender, EventArgs e)
    {
        ViewState["TINTUCMOI"] = "False";
        GetData();
    }
}
