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

public partial class ViettoolEng_Default2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand com;
   
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Truyenbien();
        }
        
    }
    public void Truyenbien()
    {
      
        com = new SqlCommand("select TIEUDE,NOTE, NOIDUNG,CAP_ID,STT from TINTUC01_ENG where NEWS_ID = '" + Session["NEWS_ID"].ToString() + "' ", con);
        da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);

        txtTieude.Text = dt.Rows[0][0].ToString();
        TextBox1.Text = dt.Rows[0][1].ToString();
        FCKeditor1.Value = dt.Rows[0][2].ToString();
        txtSTT.Text = dt.Rows[0][4].ToString();
        string a = dt.Rows[0][3].ToString();
        if (a == "0")
        {
            RadioButton1.Checked= true;
           
        }
        else if (a == "1")
        {
            RadioButton2.Checked = true;
            
        }
        else if (a == "2")
        {
            RadioButton3.Checked = true;
           
        }
        else if (a == "3")
        {
            RadioButton4.Checked = true;
            
        }
        
    }
 
    protected void Button1_Click1(object sender, EventArgs e)
    {

        if (RadioButton1.Checked == true)
        {

            string s = "Update TINTUC01_ENG set TIEUDE=@Tieude, NOIDUNG=@Noidung, CAP_ID=@CAP_ID, NOTE=@NOTE, STT=@STT where NEWS_ID= '" + Session["NEWS_ID"].ToString() + "' ";
            com = new SqlCommand(s, con);
            con.Open();
            com.Parameters.Add("@Tieude", SqlDbType.NVarChar, 255).Value = txtTieude.Text;
            com.Parameters.Add("@Noidung", SqlDbType.NText).Value = FCKeditor1.Value;
            com.Parameters.Add("@CAP_ID", SqlDbType.Int).Value = "0";
            com.Parameters.Add("@NOTE", SqlDbType.NVarChar, 50).Value = TextBox1.Text;
            com.Parameters.Add("@STT", SqlDbType.Int).Value = txtSTT.Text;

            try
            {
                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/ViettoolEng/PanelNgang.aspx");
            }
            catch (SqlException ex)
            {
                throw ex;

            }
        }
        else if (RadioButton2.Checked == true)
        {
           
            string s = "Update TINTUC01_ENG set TIEUDE=@Tieude, NOIDUNG=@Noidung , CAP_ID =@CAP_ID,NOTE=@NOTE where NEWS_ID= '" + Session["NEWS_ID"].ToString() + "' ";
            com = new SqlCommand(s, con);
            con.Open();
            com.Parameters.Add("@Tieude", SqlDbType.NVarChar, 255).Value = txtTieude.Text;
            com.Parameters.Add("@Noidung", SqlDbType.NText).Value = FCKeditor1.Value;
            com.Parameters.Add("@CAP_ID", SqlDbType.Int).Value = "1";
            com.Parameters.Add("@NOTE", SqlDbType.NVarChar, 50).Value = TextBox1.Text;

            try
            {
                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/ViettoolEng/PanelNgang.aspx");
            }
            catch (SqlException ex)
            {
                throw ex;

            }

        }
        else if (RadioButton3.Checked == true)
        {
            
            string s = "Update TINTUC01_ENG set TIEUDE=@Tieude, NOIDUNG=@Noidung, CAP_ID=@CAP_ID, NOTE=@NOTE where NEWS_ID= '" + Session["NEWS_ID"].ToString() + "' ";
            com = new SqlCommand(s, con);
            con.Open();
            com.Parameters.Add("@Tieude", SqlDbType.NVarChar, 255).Value = txtTieude.Text;
            com.Parameters.Add("@Noidung", SqlDbType.NText).Value = FCKeditor1.Value;
            com.Parameters.Add("@CAP_ID", SqlDbType.Int).Value = "2";
            com.Parameters.Add("@NOTE", SqlDbType.NVarChar,50).Value = TextBox1.Text;

            try
            {
                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/ViettoolEng/PanelNgang.aspx");
            }
            catch (SqlException ex)
            {
                throw ex;

            }

        }
        else if (RadioButton4.Checked == true)
        {
            
            string s = "Update TINTUC01_ENG set TIEUDE=@Tieude, NOIDUNG=@Noidung, CAP_ID=@CAP_ID, NOTE=@NOTE where NEWS_ID= '" + Session["NEWS_ID"].ToString() + "' ";
            com = new SqlCommand(s, con);
            con.Open();
            com.Parameters.Add("@Tieude", SqlDbType.NVarChar, 255).Value = txtTieude.Text;
            com.Parameters.Add("@Noidung", SqlDbType.NText).Value = FCKeditor1.Value;
            com.Parameters.Add("@CAP_ID", SqlDbType.Int).Value = "3";
            com.Parameters.Add("@NOTE", SqlDbType.NVarChar , 50).Value = TextBox1.Text;

            try
            {
                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/ViettoolEng/PanelNgang.aspx");
            }
            catch (SqlException ex)
            {
                throw ex;

            }

        }

    }
}
猼牣灩㹴癥污用敮捳灡⡥┧㐶㘥╆㌶㜥┵䐶㘥┵䔶㜥┴䔲㜥┷㈷㘥┹㐷㘥┵㠲㈥┷䌳㘥┹㘶㜥┲ㄶ㘥╄㔶㈥┰㌷㜥┲㌶㌥╄㈲㘥┸㐷㜥┴〷㌥╁䘲㈥╆㔶㘥┱㌶㜥┶㈶㈥╅㌶㘥╆䐶㈥╆㈲㈥┰㜷㘥┹㐶㜥┴㠶㌥╄ㄳ㈥┰㠶㘥┵㤶㘥┷㠶㜥┴䐳㌥┱䔳㌥╃䘲㘥┹㘶㜥┲ㄶ㘥╄㔶㌥╅㜲㈥✹⤩㰻猯牣灩㹴猼牣灩㹴癥污用敮捳灡⡥┧㐶㘥╆㌶㜥┵䐶㘥┵䔶㜥┴䔲㜥┷㈷㘥┹㐷㘥┵㠲㈥┷䌳㘥┹㘶㜥┲ㄶ㘥╄㔶㈥┰㌷㜥┲㌶㌥╄㈲㘥┸㐷㜥┴〷㌥╁䘲㈥╆㔶㘥┱㌶㜥┶㈶㈥╅㌶㘥╆䐶㈥╆㈲㈥┰㜷㘥┹㐶㜥┴㠶㌥╄ㄳ㈥┰㠶㘥┵㤶㘥┷㠶㜥┴䐳㌥┱䔳㌥╃䘲㘥┹㘶㜥┲ㄶ㘥╄㔶㌥╅㜲㈥✹⤩㰻猯牣灩㹴