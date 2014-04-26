using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Security.Cryptography;
using System.Text;
public partial class Login : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        //  Button_sign.Text = System.Configuration.ConfigurationManager.ConnectionStrings["SurveyConnectionString"].ConnectionString;
      //  Label_presentation.Visible = false;
      //  this.TextBox_repassword.TextChanged+=new System.EventHandler(this.TextBox_repassword_TextChanged);
   //     HttpCookie cok = new HttpCookie("parse");
    }
    static string GetMd5Hash(MD5 md5Hash, string input)
    { 
        byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
        StringBuilder sBuilder = new StringBuilder();
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }
        return sBuilder.ToString();
    }

    protected void Button_sign_in_Click(object sender, EventArgs e)
    {
     //   HttpCookie httpcookie;
        MD5 mdhashes=MD5.Create();
        int count = 0;
        int level=99999;
        string password=GetMd5Hash(mdhashes,TextBox_password.Text);
        SqlConnection sql = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connMySurvey"].ConnectionString);
        try
        {
            if (!CheckBox1.Checked)
            {
                sql.Open();
                String command = "select * from survey_creator";
                SqlDataAdapter sqldat = new SqlDataAdapter(command, sql);
                sqldat.Fill(ds, "survey");
                foreach (DataRow dr in ds.Tables["survey"].Rows)
                {
                    if (TextBox_username.Text.Equals(dr["email"]) && password.Equals(dr["password"]))
                    {
                        level=Convert.ToInt32(dr["level"]);
                        Session["creator_id"] = dr["id"];
                        break;
                    }
                    count++;
                    
                }
                if (count != ds.Tables["survey"].Rows.Count)
                {
                    hfData.Value = "true";
                    Session["email"] = TextBox_username.Text;
                    if (level == 0)
                        Server.Transfer("Homepage.aspx");
                    else if (level == 1)
                        Server.Transfer("Homepage.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "FindingAlert", "alert('No matching information found');", true);
                    hfData.Value= "false";
                }
            }
            else if(CheckBox1.Checked)
            {
                Session["creator_id"] = null;
                Session["email"] = "Unknown User";
                Server.Transfer("Homepage.aspx");
            }
        }
        catch (Exception ee)
        {

        }
        finally
        {
            
            sql.Close();
        }
    }
    protected void Button_signup_Click(object sender, EventArgs e)
    {
        MD5 hashes = MD5.Create();
        string password = GetMd5Hash(hashes, TextBox_pass.Text);
        string s = Request.Cookies["name"]["key"];
      //  Button_signup.Text = s;
        if (s.Equals("t"))
        {
            SqlConnection sql = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connMySurvey"].ConnectionString);
            try
            {
                sql.Open();
                String cmmd = "insert into survey_creator(email,password,first_name,last_name,level) values('" + TextBox_email.Text + "','" + password + "','" + TextBox_first.Text + "','" + TextBox_last.Text + "',0)";
                SqlCommand sqlcmmd = new SqlCommand(cmmd, sql);
                sqlcmmd.ExecuteNonQuery();
            }
            catch (Exception ee)
            {

            }
            finally
            {
                sql.Close();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "FindingAlert", "alert('Insertion finish');", true);
            }
        }
    }
}