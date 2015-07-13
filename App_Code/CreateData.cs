using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

/// <summary>
/// Summary description for CreateData
/// </summary>
public class CreateData
{
	public CreateData()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    public string GetChannelID(string nid)
    {
        SqlCommand com = new SqlCommand("select top 1 CHANNEL_ID from TINTUC01 where NEWS_ID = '"+nid+"'",con);
        con.Open();
        string cid = com.ExecuteScalar().ToString();
        con.Close();
        return cid;
    }
}
