using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using System.Security.Cryptography;
public partial class Homepage : System.Web.UI.Page
{
    ArrayList surveyTitles;
    protected void Page_Load(object sender, EventArgs e)
    {
        //// Test html
        //string innerhtml = "<LI id='li0'>Test href<A href='#' onclick='test()'>Test</A><LI>";
        //ulP.InnerHtml = innerhtml;

        // Initialize the db connection
        const string connString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\mysurveydb.mdf;Integrated Security=True";
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd;
        SqlDataReader rdr;
        conn.Open();
        surveyTitles = new ArrayList();

        // Get the published survey list
        cmd = new SqlCommand("SELECT [title] FROM [survey] WHERE ([is_published] = 1)", conn);
        rdr = cmd.ExecuteReader();
        ulP.InnerHtml = "";
        int i = 0;
        while (rdr.Read())
        {
            string surveytitle = (string)rdr["title"];
            surveyTitles.Add(surveytitle);
            //Response.Write("<br />" + s);

            string innerhtml = "<LI id='li" + i + "'>" + surveytitle +
                "<A class='delete-confirm' href='#' onclick='deleteSurvey(" + i + ")'>Delete</A>" +
                "<A class='unpublish-confirm' href='#' onclick='updateSurvey(" + i + ")'>Unpublish</A> " +
                "<A href='Preview.aspx' target='_blank'>Preview</A></LI>";
            ulP.InnerHtml += innerhtml;
            ++i;
        }
        rdr.Close();

        // Get the unpublished survey list
        cmd = new SqlCommand("SELECT [title] FROM [survey] WHERE ([is_published] = 0)", conn);
        rdr = cmd.ExecuteReader();
        ulUP.InnerHtml = "";
        while (rdr.Read())
        {
            string surveytitle = (string)rdr["title"];
            surveyTitles.Add(surveytitle);
            //Response.Write("<br />" + s);

            string innerhtml = "<LI id='li" + i + "'>" + surveytitle +
                "<A class='delete-confirm' href='#' onclick='deleteSurvey(" + i + ")'>Delete</A>" +
                "<A class='unpublish-confirm' href='#' onclick='updateSurvey(" + i + ")'>Publish</A> " +
                "<A class='unpublish-confirm' href='#' onclick='editSurvey(" + i + ")'>Edit</A></LI>";

            ulUP.InnerHtml += innerhtml;
            ++i;
        }

        conn.Close();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //Response.Write("This is backend - btnUpdate_Click.");
        HttpCookie myCookie = Request.Cookies["surveyidx"];
        int idx = int.Parse(Convert.ToString(myCookie.Value));
        if (myCookie != null)
        {
            string surveyTitle = (string)surveyTitles[idx];
            HFSurveyTitle.Value = surveyTitle;
            //Response.Write("This is backend - btnUpdate_Click: " + surveyTitle);
            DSSurvey.Update();
            Page_Load(sender, e);
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //Response.Write("This is backend - btnDelete_Click.");
        HttpCookie myCookie = Request.Cookies["surveyidx"];
        int idx = int.Parse(Convert.ToString(myCookie.Value));
        if (myCookie != null)
        {
            string surveyTitle = (string)surveyTitles[idx];
            HFSurveyTitle.Value = surveyTitle;
            //Response.Write("This is backend - btnDelete_Click: " + surveyTitle);
            DSSurvey.Delete();
            Page_Load(sender, e);
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        //Response.Write("This is backend - btnEdit_Click.");
        HttpCookie myCookie = Request.Cookies["surveyidx"];
        int idx = int.Parse(Convert.ToString(myCookie.Value));
        if (myCookie != null)
        {
            string surveyTitle = (string)surveyTitles[idx];
            HFSurveyTitle.Value = surveyTitle;
            //Response.Write("This is backend - btnDelete_Click: " + surveyTitle);
            Session["surveyTitle"] = surveyTitle;
            Response.Redirect("SurveyEdit.aspx");
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Write("This is backend - btnLogout_Click.");
        Session["email"] = "";
        Response.Redirect("Login.aspx");
    }
}