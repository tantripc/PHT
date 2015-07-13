using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.IO;

public partial class Viettool_MauHS : System.Web.UI.Page
{
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
            ArrayList arrFiles = new ArrayList();
            string FolderPath = Server.MapPath("~/Apply");
            FileInfo[] fit = new DirectoryInfo(FolderPath).GetFiles();
            foreach (FileInfo fi in fit)
                arrFiles.Add(fi);
            lvFiles.DataSource = arrFiles;
            lvFiles.DataKeyNames = new string[] { "Name" };
            lvFiles.DataBind();
        }
        catch (Exception ex)
        {
            errMSS.Visible = true;
            lblMessage.Text = ex.Message;
        }
    }
    protected void lvFiles_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteOld")
        {
            ListViewDataItem currentItem = (ListViewDataItem)e.Item;
            string filename = lvFiles.DataKeys[currentItem.DataItemIndex].Value.ToString();
            try
            {
                filename = "~/Apply/" + filename;
                FileInfo TheFile = new FileInfo(MapPath(filename));
                if (TheFile.Exists)
                {
                    File.Delete(MapPath(filename));

                    GetData();
                    errMSS.Visible = false;
                    succeed.Visible = false;
                }
                else
                {
                    throw new FileNotFoundException();
                }
            }

            catch (FileNotFoundException ex)
            {
                errMSS.Visible = true;
                lblMessage.Text += ex.Message;
            }
            catch (Exception ex)
            {
                errMSS.Visible = true;
                lblMessage.Text += ex.Message;
            }
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            // Get the HttpFileCollection
            HttpFileCollection hfc = Request.Files;
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    hpf.SaveAs(Server.MapPath("~/Apply") + "\\" +
                      System.IO.Path.GetFileName(hpf.FileName));

                    succeed.Visible = true;
                    lblSucceed.Text = lblSucceed.Text + "<b>File: </b>" + hpf.FileName + "  <b>Size:</b> " +
                        hpf.ContentLength + "  <b>Type:</b> " + hpf.ContentType + " Uploaded Successfully <br/>";
                    GetData();
                }
            }

            errMSS.Visible = false;
        }
        catch (Exception ex)
        {
            succeed.Visible = false;
            errMSS.Visible = true;
            lblMessage.Text = ex.Message;
        }
    }
}