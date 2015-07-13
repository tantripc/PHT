using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public class Database
{
  
    private SqlConnection con;

    // ham mo ket noi
    private void Open()
    {
        if (con == null)
        {
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
        }
        //Check Connection if close then open
        if(con.State ==ConnectionState.Closed )
        con.Open();
    }
    // ham dong ket noi
    public void Close()
    {
        if (con != null)
            con.Close();
    }
    // ham ngat ket noi khi dong chuong trinh
    public void Dispose()
    {
        if (con != null)
        {
            con.Dispose();
            con = null;
        }
    }
    //tao mot mang chua tham so
    public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, object Value)
    {
        SqlParameter param;

        if (Size > 0)
            param = new SqlParameter(ParamName, DbType, Size);
        else
            param = new SqlParameter(ParamName, DbType);

        param.Direction = Direction;
        if (!(Direction == ParameterDirection.Output && Value == null))
            param.Value = Value;

        return param;
    }
    //nhap cac tham so
    public SqlParameter MakeInParam(string ParamName, SqlDbType DbType, int Size, object Value)
    {
        return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);
    }
    // dau ra cua tham so
    public SqlParameter MakeOutParam(string ParamName, SqlDbType DbType, int Size)
    {
        return MakeParam(ParamName, DbType, Size, ParameterDirection.Output, null);
    }
    // tao command de thuc thi cau lenh tra ve cac tham so
    private SqlCommand CreateCommand(string procName)
    {
        Open();
        SqlCommand cmd = new SqlCommand(procName, con);
        cmd.CommandType = CommandType.StoredProcedure;
        // return param
        cmd.Parameters.Add(
            new SqlParameter("ReturnValue", SqlDbType.Int, 4,
            ParameterDirection.ReturnValue, false, 0, 0,
            string.Empty, DataRowVersion.Default, null));
        return cmd;
    }
    //dung command de truyen tham so vao
    private SqlCommand CreateCommand(string procName, SqlParameter[] prams)
    {
        Open();
        SqlCommand cmd = new SqlCommand(procName, con);
        cmd.CommandType = CommandType.StoredProcedure;
        // add proc parameters
        if (prams != null)
        {
            foreach (SqlParameter parameter in prams)
                cmd.Parameters.Add(parameter);
        }
        // return param
        cmd.Parameters.Add(
            new SqlParameter("ReturnValue", SqlDbType.Int, 4,
            ParameterDirection.ReturnValue, false, 0, 0,
            string.Empty, DataRowVersion.Default, null));
        return cmd;
    }
    //lay du lieu len gridview dung dataset kg tham so
    public int RunProcDS(string procName, out DataSet dataSet)
    {
        SqlCommand cmd = CreateCommand(procName);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
      
        DataSet dst = new DataSet();
        dad.Fill(dst, "CurrentItems");
        dataSet = dst;
        this.Close();
        return (int)cmd.Parameters["ReturnValue"].Value;
    }
    //lay du lieu len gridview dung dataset nhung co tham so truyen vao
    public int RunProcDS(string procName, SqlParameter[] prams, out DataSet dataSet)
    {
        SqlCommand cmd = CreateCommand(procName, prams);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataSet dst = new DataSet();
        dad.Fill(dst, "CurrentItems");
        dataSet = dst;
        this.Close();
        return (int)cmd.Parameters["ReturnValue"].Value;
    }
    public object RunProcScalar(string procName)
    {
        SqlCommand cmd = CreateCommand(procName, null);
        return cmd.ExecuteScalar();
    }

    //lay du lieu len gidview kg tham so
    public void RunProc(string procName, out SqlDataReader dataReader)
    {
        SqlCommand cmd = CreateCommand(procName, null);
        dataReader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
    }
    //lay du lieu len gidview dung datareader co tham so truyen vao
    public void RunProc(string procName, SqlParameter[] prams, out SqlDataReader dataReader)
    {
        SqlCommand cmd = CreateCommand(procName, prams);
        dataReader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
    }
    //hien thi du lieu len gidview
    public int RunProc(string procName)
    {
        SqlCommand cmd = CreateCommand(procName, null);
        cmd.ExecuteNonQuery();
        this.Close();
        return (int)cmd.Parameters["ReturnValue"].Value;
    }
    //them ,xoa,sua du lieu
    public int RunProc(string procName, SqlParameter[] prams)
    {
        SqlCommand cmd = CreateCommand(procName, prams);
        cmd.ExecuteNonQuery();
        this.Close();
        return (int)cmd.Parameters["ReturnValue"].Value;
    }
    public string GetErrorMessage(int errorCode)
    {
        DataSet dst = (DataSet)System.Web.HttpContext.Current.Cache["Messages"];
        if (dst == null)
            CreateErrorMessages();
        dst = (DataSet)System.Web.HttpContext.Current.Cache["Messages"];
        string filterExpr = "ErrorCode = '" + errorCode.ToString() + "'";
        DataTable dtbl = dst.Tables["Messages"];
        DataRow[] drows = dtbl.Select(filterExpr);
        return drows[0]["ErrorMessage"].ToString();
    }
    // Create a dataset object contains all error 
    // messages and push it into application cache.
    private void CreateErrorMessages()
    {
        DataSet dst = new DataSet();
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("spGetAllErrorMessage", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        dad.Fill(dst, "Messages");

        System.Web.HttpContext.Current.Cache.Insert("Messages", dst);
    }

    
}

