using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Configuration;

/// <summary>
/// Summary description for BehindOfBehind
/// </summary>
public class BehindOfBehind
{
	public BehindOfBehind()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    public SqlConnection getConn()
    {
        return con;
    }
    public string getTitle(int nid)
    {
        SqlCommand com = new SqlCommand("select top 1 NOIDUNG from TINTUC01 where NEWS_ID = "+nid+"", con);
        con.Open();
        string str = com.ExecuteScalar().ToString();
        con.Close();
        return str;
    }
    public string getTitleEN(int nid)
    {
        SqlCommand com = new SqlCommand("select top 1 NOIDUNG from TINTUC01_ENG where NEWS_ID = " + nid + "", con);
        con.Open();
        string str = com.ExecuteScalar().ToString();
        con.Close();
        return str;
    }
    public int getChannelID(int nid)
    {
        SqlCommand com = new SqlCommand("select top 1 CHANNEL_ID from TINTUC01 where NEWS_ID = "+nid+"", con);
        con.Open();
        int i = int.Parse(com.ExecuteScalar().ToString());
        con.Close();
        return i;
    }
    public int getChannelIDEN(int nid)
    {
        SqlCommand com = new SqlCommand("select top 1 CHANNEL_ID from TINTUC01_ENG where NEWS_ID = " + nid + "", con);
        con.Open();
        int i = int.Parse(com.ExecuteScalar().ToString());
        con.Close();
        return i;
    }
    public DataSet getSP(int nid, int cid)
    {
        SqlDataAdapter da = new SqlDataAdapter("select top 3 * from SANPHAM where NHOMHANG = "+nid+" and CHANNEL_ID = "+cid+" order by NGAY desc" , con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet getSPEN(int nid, int cid)
    {
        SqlDataAdapter da = new SqlDataAdapter("select top 3 * from SANPHAM_ENG where NHOMHANG = " + nid + " and CHANNEL_ID = " + cid + " order by NGAY desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet getAllSP()
    {
        SqlDataAdapter da = new SqlDataAdapter("select top 3 * from SANPHAM order by NGAY desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet getAllSPEN()
    {
        SqlDataAdapter da = new SqlDataAdapter("select top 3 * from SANPHAM_ENG order by NGAY desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet getTT()
    {
        SqlDataAdapter da = new SqlDataAdapter("select top 1 * from TINTUC01 where CAP_ID = 2 and not CHANNEL_ID = 11 order by NGAY desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet getTTEN()
    {
        SqlDataAdapter da = new SqlDataAdapter("select top 1 * from TINTUC01_ENG where CAP_ID = 2 and not CHANNEL_ID = 11 order by NGAY desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet getAllTT()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from TINTUC01 where CAP_ID = 2 and not CHANNEL_ID = 11 order by NGAY desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet getAllTTEN()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from TINTUC01_ENG where CAP_ID = 2 and not CHANNEL_ID = 11 order by NGAY desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public int getCPID(int nid)
    {
        SqlCommand com = new SqlCommand("select top 1 CAP_ID from TINTUC01 where NEWS_ID = "+nid+"", con);
        con.Open();
        int i = int.Parse(com.ExecuteScalar().ToString());
        con.Close();
        return i;
    }
    public int getCPIDEN(int nid)
    {
        SqlCommand com = new SqlCommand("select top 1 CAP_ID from TINTUC01_ENG where NEWS_ID = " + nid + "", con);
        con.Open();
        int i = int.Parse(com.ExecuteScalar().ToString());
        con.Close();
        return i;
    }
    public SqlCommand insertGopy(string title, string name, string comp, string country, string phone, string fax, string email, string content)
    {
        SqlCommand com = new SqlCommand("insert into GOPY_D(TIEUDE,HOTEN,COMPANY,COUNTRY,DIENTHOAI,FAX,MAIL,NOIDUNG,KTRA) values(N'" + title + "',N'" + name + "',N'" + comp + "',N'" + country + "','" + phone + "','" + fax + "','" + email + "',N'" + content + "',0)", con);
        return com;
    }
    public SqlCommand insertGopyEN(string title, string name, string comp, string country, string phone, string fax, string email, string content)
    {
        SqlCommand com = new SqlCommand("insert into GOPY_D_ENG(TIEUDE,HOTEN,COMPANY,COUNTRY,DIENTHOAI,FAX,MAIL,NOIDUNG,KTRA) values('" + title + "','" + name + "','" + comp + "','" + country + "','" + phone + "','" + fax + "','" + email + "','" + content + "',0)", con);
        return com;
    }
    public string GetFileUpload(int nid)
    {
        SqlCommand com = new SqlCommand("select top 1 NOTE from SANPHAM where NEWS_ID = "+nid+"",con);
        con.Open();
        string strFileUpload = com.ExecuteScalar().ToString();
        con.Close();
        return strFileUpload;
    }
    public string GetFileUploadEN(int nid)
    {
        SqlCommand com = new SqlCommand("select top 1 NOTE from SANPHAM_ENG where NEWS_ID = " + nid + "", con);
        con.Open();
        string strFileUpload = com.ExecuteScalar().ToString();
        con.Close();
        return strFileUpload;
    }
}
