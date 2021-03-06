using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Viettool_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == "")
        {
           
            Response.Redirect("~/Viettool/Login.aspx");
        }
        if (!IsPostBack)
        {
            GetMain();
            GetGroupMenu();

            // kiem tra xem neu co con thi khong duoc xoa
            // va kiem tra grid trong cung neu co san pham thi hien gio hang
            check();
        }
    }
    private void GetMain()
    {
        SqlDataAdapter da = new SqlDataAdapter("select NEWS_ID, USERID, NGAY, TIEUDE, STT FROM TINTUC01 where CHANNEL_ID = 41",con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dl1.DataSource = ds.Tables[0].DefaultView;
        dl1.DataKeyField = "STT";
        dl1.DataBind();
    }
    public DataSet BindChild(int stt)
    {
        SqlDataAdapter da = new SqlDataAdapter("select NEWS_ID, TIEUDE, USERID, CHANNEL_ID, MENU_SUB, NGAY, STT, CAP_ID from TINTUC01 where MENU_SUB = 0 and CHANNEL_ID = "+stt+" order by STT", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet BindGrandChild(int nid)
    {
        SqlDataAdapter da = new SqlDataAdapter("select NEWS_ID, CHANNEL_ID , USERID, TIEUDE, NGAY, STT, CAP_ID from TINTUC01 where MENU_SUB = 1 and NHOM = "+nid+" order by STT", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public void GetGroupMenu()
    {
        SqlDataAdapter da = new SqlDataAdapter("select NEWS_ID, USERID, NGAY, TIEUDE, STT FROM TINTUC01 where CHANNEL_ID = 41 order by STT", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvMainMenu.DataSource = ds.Tables[0].DefaultView;
        gvMainMenu.DataKeyNames = new string[] { "NEWS_ID" };
        gvMainMenu.DataBind();
    }
    protected void GridView7_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        int i = gvTemp.SelectedIndex;

        try
        {


            SqlCommand comm = new SqlCommand("select NEWS_ID,NHOM from TINTUC01 where NEWS_ID ='" + gvTemp.Rows[i].Cells[1].Text.ToString() + "' ", con);
            SqlDataAdapter apdapter = new SqlDataAdapter(comm);
            DataSet data = new DataSet("HDDetails");
            apdapter.Fill(data, "HDDetails");


            Session["NEWS_ID"] = gvTemp.Rows[i].Cells[1].Text.Trim();
            Response.Redirect("~/Viettool/Default2PanelNgang.aspx");



        }
        catch
        {


        }
    }
    protected void GridView7_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        try
        {
            string deletes = "Delete from TINTUC01 where NEWS_ID ='" + gvTemp.DataKeys[e.RowIndex].Value + "'";
            SqlCommand com = new SqlCommand(deletes, con);

            con.Open();

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Viettool/PanelNgang.aspx");
        }
        catch (Exception ex)
        {
            //Response.Redirect("~/Viettool/Default.aspx");
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        try
        {
            string deletes = "Delete from TINTUC01 where NEWS_ID ='" + gvTemp.DataKeys[e.RowIndex].Value + "'";
            SqlCommand com = new SqlCommand(deletes, con);

            con.Open();

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Viettool/PanelNgang.aspx");
        }
        catch (Exception ex)
        {
            //Response.Redirect("~/Viettool/Default.aspx");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView gvTemp = (GridView)sender;
        int i = gvTemp.SelectedIndex;

        try
        {


            SqlCommand comm = new SqlCommand("select NEWS_ID,NHOM from TINTUC01 where NEWS_ID ='" + gvTemp.Rows[i].Cells[1].Text.ToString() + "' ", con);
            SqlDataAdapter apdapter = new SqlDataAdapter(comm);
            DataSet data = new DataSet("HDDetails");
            apdapter.Fill(data, "HDDetails");


            Session["NEWS_ID"] = gvTemp.Rows[i].Cells[1].Text.Trim();
            Response.Redirect("~/Viettool/Default2PanelNgang.aspx");


        }
        catch
        {


        }
    }
    private void check()
    {
        foreach (DataListItem Item in dl1.Items)
        {
            GridView gv7 = (GridView)Item.FindControl("GridView7");
            int k = gv7.Rows.Count;
            if (k == 0)
            {
                // Neu khong co con thi khong hien tieu de cha
                Panel pnl = (Panel)Item.FindControl("pnlChildOfList");
                pnl.Visible = false;
            }
            foreach (GridViewRow row in gv7.Rows)
            {
                // Neu co con thi khong duoc xoa, va co gio hang cua gridview nay
                GridView gv1 = (GridView)row.FindControl("GridView1");
                int i = gv1.Rows.Count;
                if (i > 0)
                {
                    // Neu co con thi khong duoc xoa gridview nay
                    gv7.Rows[row.RowIndex].Cells[8].Text = "";

                    // Neu co con thi khong co gio hang
                    gv7.Rows[row.RowIndex].Cells[10].Text = "";
                }


                // New cap_id != 0 moi co gio hang
                string cpid = gv7.Rows[row.RowIndex].Cells[6].Text;
                int icpid = int.Parse(cpid);
                if (icpid == 0)
                    gv7.Rows[row.RowIndex].Cells[10].Text = "";

                foreach (GridViewRow row1 in gv1.Rows)
                {
                    // Neu ton tai san pham ben bang san pham noi co gio hang
                    //string snid = gv1.DataKeys[row1.RowIndex].Value.ToString();
                    //int inid = int.Parse(snid);
                    //string scid = gv1.Rows[row1.RowIndex].Cells[2].Text;
                    //int icid = int.Parse(scid);
                    //SqlCommand com = new SqlCommand("select count(*) from SANPHAM where NHOMHANG = " + inid + " and CHANNEL_ID = " + icid + "", con);
                    //con.Open();
                    //int spCount = int.Parse(com.ExecuteScalar().ToString());
                    //con.Close();
                    //if (spCount == 0)
                    //    gv1.Rows[row1.RowIndex].Cells[9].Text = "";

                    // Neu cap_id != 0 moi co gio hang
                    string cpid1 = gv1.Rows[row1.RowIndex].Cells[6].Text;
                    int icpid1 = int.Parse(cpid1);
                    if(icpid1 == 0)
                        gv1.Rows[row1.RowIndex].Cells[9].Text = "";
                }
            }
        }
    }
    protected void GridView7_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Add")
        {
            GridView gv7 = (GridView)sender;
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            string nid = gv7.DataKeys[row.RowIndex].Value.ToString();
            Response.Redirect("Default3PanelNgang.aspx?news_id=" + nid);
        }
        if (e.CommandName == "ShowSP")
        {
            GridView gv71 = (GridView)sender;
            GridViewRow row1 = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            string nid1 = gv71.DataKeys[row1.RowIndex].Value.ToString();
            string cid1 = gv71.Rows[row1.RowIndex].Cells[2].Text;
            string tde1 = gv71.Rows[row1.RowIndex].Cells[0].Text;
            string cpid1 = gv71.Rows[row1.RowIndex].Cells[6].Text;
            if (cpid1 == "1")     // Neu la dang hinh anh
                Response.Redirect("ChiTietSP.aspx?nid=" + nid1 + "&cid=" + cid1 + "&tde=" + tde1);
            if (cpid1 == "2")     // Neu la dang tin tuc
                Response.Redirect("ChiTietTT.aspx?nid=" + nid1 + "&cid=" + cid1 + "&tde=" + tde1);
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ShowSP")
        {
            GridView gv1 = (GridView)sender;
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            string nid = gv1.DataKeys[row.RowIndex].Value.ToString();
            string cid = gv1.Rows[row.RowIndex].Cells[2].Text;
            string tde = gv1.Rows[row.RowIndex].Cells[0].Text;
            string cpid = gv1.Rows[row.RowIndex].Cells[6].Text;
            if(cpid == "1")     // Neu la dang hinh anh
                Response.Redirect("ChiTietSP.aspx?nid="+nid+"&cid="+cid+"&tde="+tde);
            if (cpid == "2")     // Neu la dang tin tuc
                Response.Redirect("ChiTietTT.aspx?nid=" + nid + "&cid=" + cid + "&tde=" + tde);
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //GridView gv1 = (GridView)sender;
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    string snid = gv1.DataKeys[e.Row.RowIndex].Value.ToString();
        //    int inid = int.Parse(snid);
        //    string scid = gv1.Rows[e.Row.RowIndex].Cells[2].Text;
        //    int icid = int.Parse(scid);
        //    SqlCommand com = new SqlCommand("select count(*) from SANPHAM where NHOMHANG = " + inid + " and CHANNEL_ID = " + icid + "", con);
        //    con.Open();
        //    int i = int.Parse(com.ExecuteScalar().ToString());
        //    con.Close();
        //    if (i == 0)
        //        gv1.Rows[e.Row.RowIndex].Cells[8].Text = "";
        //}
    }
    protected void gvMainMenu_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string deletes = "Delete from TINTUC01 where NEWS_ID ='" + gvMainMenu.DataKeys[e.RowIndex].Value + "'";
            SqlCommand com = new SqlCommand(deletes, con);

            con.Open();

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Viettool/PanelNgang.aspx");
        }
        catch (Exception ex)
        {
            //Response.Redirect("~/Viettool/Default.aspx");
        }
    }
    protected void gvMainMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = gvMainMenu.SelectedIndex;

        try
        {


            SqlCommand comm = new SqlCommand("select NEWS_ID,NHOM from TINTUC01 where NEWS_ID ='" + gvMainMenu.Rows[i].Cells[1].Text.ToString() + "' ", con);
            SqlDataAdapter apdapter = new SqlDataAdapter(comm);
            DataSet data = new DataSet("HDDetails");
            apdapter.Fill(data, "HDDetails");


            Session["NEWS_ID"] = gvMainMenu.Rows[i].Cells[1].Text.Trim();
            Response.Redirect("~/Viettool/Default2PanelNgang.aspx");



        }
        catch
        {


        }
    }
    protected void gvMainMenu_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddMenu")
        {
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            string stt = gvMainMenu.Rows[row.RowIndex].Cells[2].Text;
            Response.Redirect("~/Viettool/AddMenu2PanelNgang.aspx?stt=" + stt);
        }
    }
}
