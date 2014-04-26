using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;

public partial class SurveyCreate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    static public string MD5_Hash(string str_md5_in)
    {
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] bytes_md5_in = UTF8Encoding.Default.GetBytes(str_md5_in);
        byte[] bytes_md5_out = md5.ComputeHash(bytes_md5_in);
        string str_md5_out = BitConverter.ToString(bytes_md5_out);
        //str_md5_out = str_md5_out.Replace("-", "");
        return str_md5_out;
    }
    protected void Create_Click(object sender, EventArgs e)
    {
        const string connString=@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\mysurveydb.mdf; Integrated Security=True";
        try
        {
            if (Survey_title.Text != "")
            {
                created.Value = DateTime.Now.ToString("g");
                //created.Text = DateTime.Now.ToShortDateString().ToString();
                url.Value = MD5_Hash(created.Value);
                survey_creator_ID.Value = "5";
                int iddd = Convert.ToInt32(survey_creator_ID.Value);
                SqlConnection conn = new SqlConnection(connString);
                //SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SurveyConnectionString"].ConnectionString);
                //SqlCommand cmd=new SqlCommand("SELECT * from survey", conn);
                conn.Open();
                String insert ="insert into survey(url,created,survey_creator_ID,title)" +
                    "values('" + url.Value + "','" + created.Value + "', " + iddd + " ,'" + Survey_title.Text + "')";
                SqlCommand cmd = new SqlCommand(insert, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                // Save the session variables
                Session["surveyTitle"] = Survey_title.Text;
                Session["operationMode"] = "new";
                Session["url"] = url.Value;

                // go to the questions page. need another line.
                Response.Redirect("SurveyEdit.aspx");
            }
        }
        catch (Exception e1) { }
    }
  
}