using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Database
/// </summary>
public class Coms
{
    Database db = new Database();
   
    public DataSet QLLoaiSanPham_HienThi()
    {
        DataSet ds = new DataSet();
        db.RunProcDS("spLoaiSanPham_HienThi", out ds); return ds;
    }
    public DataSet QLLoaiSanPham_ENG_HienThi()
    {
        DataSet ds = new DataSet();
        db.RunProcDS("spLoaiSanPham_ENG_HienThi", out ds); return ds;
    }


}


