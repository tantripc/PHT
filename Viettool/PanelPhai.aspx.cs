﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class Viettool_PanelPhai : System.Web.UI.Page
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
        SqlDataAdapter da = new SqlDataAdapter("select NEWS_ID, STT, NOIDUNG, TOMTAT, NGAY, USERID from SANPHAM where CHANNEL_ID = 45 order by STT", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataKeyNames = new string[] { "NEWS_ID" };
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        int i = GridView1.SelectedIndex;
        try
        {


            SqlCommand comm = new SqlCommand("select NEWS_ID from TINTUC01 where NEWS_ID ='" + GridView1.Rows[i].Cells[1].Text.ToString() + "' ", con);
            SqlDataAdapter apdapter = new SqlDataAdapter(comm);
            DataSet data = new DataSet("HDDetails");
            apdapter.Fill(data, "HDDetails");


            string nid = GridView1.Rows[i].Cells[0].Text.Trim();
            Response.Redirect("~/Viettool/SuaPanelPhai.aspx?nid=" + nid);

        }
        catch
        {


        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string deletes = "Delete from SANPHAM where NEWS_ID ='" + this.GridView1.DataKeys[e.RowIndex].Value + "'";
            SqlCommand com = new SqlCommand(deletes, con);

            con.Open();

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("PanelPhai.aspx");
        }
        catch (Exception ex)
        {
            //Response.Redirect("~/Viettool/Default.aspx");
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ThemPanelPhai.aspx");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetData();
    }
}