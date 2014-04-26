using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class SurveyEdit : System.Web.UI.Page
{
    SqlConnection conn;
    const string connString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\mysurveydb.mdf;Integrated Security=True";
    SqlDataAdapter adapter;
    DataSet ds1 = new DataSet();
    ArrayList qIDs = new ArrayList();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string surveyTitle = (string)Session["surveyTitle"];
        Survey_title.Text = surveyTitle;
        //surveyTitle = "survey 1";

        // Initialize the db connection        
        conn = new SqlConnection(connString);
        SqlCommand cmd;
        SqlDataReader rdr;
        conn.Open();

        // Get the question list
        string strcmd = "SELECT [survey_question].id as qid, survey_id, type, text FROM [survey_question], [survey] where [survey].id=survey_question.survey_ID and [survey].title='" + surveyTitle + "'";
        cmd = new SqlCommand(strcmd, conn);
        rdr = cmd.ExecuteReader();
        int i = 0;

        // Iterate the question list and display
        while (rdr.Read())
        {
            int qid = (int)rdr["qid"];
            string qtext = (string)rdr["text"];
            int qtype = (int)rdr["type"];
            qIDs.Add(qid);

            initQuestionRow(i, qtext, qtype);
            ++i;
        }
        rdr.Close();
    }

    protected void initQuestionRow(int index, string qText, int qType)
    {
        TextBox tbQText;
        DropDownList ddlQType;

        HtmlGenericControl qli = new HtmlGenericControl("li");
        qli.Attributes.Add("class", "question_summary");
        qli.ID = "qli" + index;

        HtmlGenericControl qdiv = new HtmlGenericControl("div");
        qdiv.Attributes.Add("id", "questiondetails" + index);
        //qdiv.Attributes.Add("class", "row question-text clearfix");
        qdiv.Attributes.Add("data-editable", "true");

        // Question text
        tbQText = new TextBox();
        tbQText.ID = "tbQText" + index;
        tbQText.Text = qText;
        tbQText.Enabled = false;

        // Question type
        ddlQType = new DropDownList();
        ddlQType.ID = "ddlQType" + index;
        ddlQType.Items.Add(new ListItem("Short Answer", "0"));
        ddlQType.Items.Add(new ListItem("True/False", "1"));
        ddlQType.Items.Add(new ListItem("Multiple Choice", "2"));
        ddlQType.Items.Add(new ListItem("Multiple Select", "3"));
        ddlQType.CssClass = "griddropdownlist";
        ddlQType.SelectedIndex = qType;
        ddlQType.Enabled = false;

        // Edit question button
        Button btnEditQuestion = new Button();
        btnEditQuestion.ID = "btnEditQuestion" + index;
        btnEditQuestion.Text = "Edit Question";
        btnEditQuestion.CssClass = "widegridbutton";
        btnEditQuestion.Command += new CommandEventHandler(editQuestion);

        // Delete question button
        Button btnDeleteQuestion = new Button();
        btnDeleteQuestion.ID = "btnDeleteQuestion" + index;
        btnDeleteQuestion.Text = "Delete Question";
        btnDeleteQuestion.CssClass = "widegridbutton";
        btnDeleteQuestion.Command += new CommandEventHandler(deleteQuestion);

        // Add the controls to container
        qdiv.Controls.Add(tbQText);
        qdiv.Controls.Add(ddlQType);
        qdiv.Controls.Add(btnEditQuestion);
        qdiv.Controls.Add(btnDeleteQuestion);
        qli.Controls.Add(qdiv);
        ulQuestions.Controls.Add(qli);
    }
    private void deleteQuestion(object sender, CommandEventArgs e)
    {
        string btnName = ((Button)sender).ID;
        int idx = getControlIndex(btnName);

        // Delete from database
        string sqlStr = "delete from [survey_question] where id =" + qIDs[idx];
        SqlCommand sqlcmd = new SqlCommand(sqlStr, conn);
        sqlcmd.ExecuteNonQuery();

        // Delete from UI
        HtmlGenericControl qli = (HtmlGenericControl)FindControl("qli" + idx);
        qli.Visible = false;
    }

    private void editQuestion(object sender, CommandEventArgs e)
    {
        string btnName = ((Button)sender).ID;
        int idx = getControlIndex(btnName);
        TextBox tbQText = (TextBox)FindControl("tbQText" + idx);
        DropDownList ddlQType = (DropDownList)FindControl("ddlQType" + idx);

        if (tbQText.Enabled)
        {
            string sqlStr = "update [survey_question] set text = '" + tbQText.Text + "', type = '" + ddlQType.SelectedIndex
                + "' where id =" + qIDs[idx];
            SqlCommand sqlcmd = new SqlCommand(sqlStr, conn);
            sqlcmd.ExecuteNonQuery();
        }

        tbQText.Enabled = !tbQText.Enabled;
        ddlQType.Enabled = !ddlQType.Enabled;
    }
    
   protected void btnBackHome_Click(object sender, EventArgs e)
   {
       Response.Redirect("Homepage.aspx");
   }
   protected void btnLogout_Click(object sender, EventArgs e)
   {
       Response.Write("This is backend - btnLogout_Click.");
       Session["email"] = "";
       Response.Redirect("Login.aspx");
   }
   protected int getControlIndex(string name)
   {
       int result = 0;
       if(name.Contains("tbQText"))
       {
           result = int.Parse(name.Substring(7));
       }
       if (name.Contains("ddlQType"))
       {
           result = int.Parse(name.Substring(8));
       }
       if (name.Contains("btnEditQuestion"))
       {
           result = int.Parse(name.Substring(15));
       }
       if (name.Contains("btnDeleteQuestion"))
       {
           result = int.Parse(name.Substring(17));
       }
       return result;
   }
}