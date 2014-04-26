using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
public partial class preview : System.Web.UI.Page
{
    public ArrayList listinsertion = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["connMySurvey"].ConnectionString;
        int number=0;
        Label_survey.Text =Session["surveyTitle"].ToString();
        try
        {
            SqlConnection sqlconn = new SqlConnection(conn);
            sqlconn.Open();
            string sql = "select * from survey_question where survey_ID="+Session["survey_num"];
            SqlDataAdapter adapter = new SqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "question");
            for (int i = 0; i < ds.Tables["question"].Rows.Count; i++)
            {
                number = i + 1;
                biaoge.Controls.Add(new LiteralControl("<H2>"+i+"."+ds.Tables["question"].Rows[i]["text"]+"</H2>"));
                string sql1 = "select * from survey_answer where survey_question_ID=" + ds.Tables["question"].Rows[i]["id"];
                SqlDataAdapter adapter1 = new SqlDataAdapter(sql1, conn);
                DataSet ds1 = new DataSet();
                adapter1.Fill(ds1, "answer");
                if (Int16.Parse(ds.Tables["question"].Rows[i]["type"].ToString()) == 0)
                {
                    biaoge.Controls.Add(new LiteralControl("<DIV class=\"errorSummary\" id=\"survey-response-form_es_\" style=\"display: none;\">"));
                    biaoge.Controls.Add(new LiteralControl("<P>Please fix the following input errors:</P>"));
                    biaoge.Controls.Add(new LiteralControl("<UL>"));
                    biaoge.Controls.Add(new LiteralControl("<LI>dummy</LI></UL></DIV>"));
                    biaoge.Controls.Add(new LiteralControl("<DIV class=\"row\"><INPUT name=\"SurveyResponse[10][survey_question_type]\" id=\"SurveyResponse_10_survey_question_type\" type=\"hidden\" value=\"0\"><INPUT name=\"SurveyResponse[10][survey_answer_id]\" id=\"SurveyResponse_10_survey_answer_id\" type=\"hidden\" value=\"14\"><TEXTAREA name=\"SurveyResponse[10][text]\" id=\"SurveyResponse_10_text\" onkeypress=\"text_record()\"></TEXTAREA><BR>"));
                    biaoge.Controls.Add(new LiteralControl("<DIV class=\"errorMessage\" id=\"SurveyResponse_10_text_em_\" style=\"display: none;\"></DIV><BR></DIV>"));
                }
                else if (Int16.Parse(ds.Tables["question"].Rows[i]["type"].ToString()) == 1)
                {
                    biaoge.Controls.Add(new LiteralControl("<DIV class=\"errorSummary\" id=\"survey-response-form_es_\" style=\"display: none;\">"));
                    biaoge.Controls.Add(new LiteralControl("<P>Please fix the following input errors:</P>"));
                    biaoge.Controls.Add(new LiteralControl("<UL>"));
                    biaoge.Controls.Add(new LiteralControl("<LI>dummy</LI></UL></DIV>"));
                    biaoge.Controls.Add(new LiteralControl("<DIV class=\"row\"><INPUT name=\"SurveyResponse[9][survey_question_type]\" id=\"SurveyResponse_9_survey_question_type\" type=\"hidden\" value=\"3\"><INPUT name=\"SurveyResponse[9][text]\" id=\"ytSurveyResponse_9_text\" type=\"hidden\"><SPAN id=\"SurveyResponse_9_text\">"));
                    for (int j = 0; j < ds1.Tables["answer"].Rows.Count; j++)
                        biaoge.Controls.Add(new LiteralControl("<INPUT name=\"SurveyResponse[9][text][]\" id=\"SurveyResponse_9_text_0\" type=\"checkbox\" value=\"12\" onclick=\"check_TF_record(" + int.Parse(ds1.Tables["answer"].Rows[j]["id"].ToString()) + ")\"><LABEL for=\"SurveyResponse_9_text_0\">" + ds1.Tables["answer"].Rows[j]["text"] + "</LABEL><BR>"));
                    //    biaoge.Controls.Add(new LiteralControl("<LABEL for=\"SurveyResponse_9_text_0\">answer x</LABEL><BR><INPUT name=\"SurveyResponse[9][text][]\" id=\"SurveyResponse_9_text_1\" type=\"checkbox\" value=\"13\"> <LABEL for=\"SurveyResponse_9_text_1\">answer y</LABEL></SPAN><BR>"));
                    biaoge.Controls.Add(new LiteralControl("</SPAN><DIV class=\"errorMessage\" id=\"SurveyResponse_9_text_em_\" style=\"display: none;\"></DIV><BR></DIV>"));
                }
                else if (Int16.Parse(ds.Tables["question"].Rows[i]["type"].ToString()) == 2)
                {
                    biaoge.Controls.Add(new LiteralControl("<DIV class=\"errorSummary\" id=\"survey-response-form_es_\" style=\"display: none;\">"));
                    biaoge.Controls.Add(new LiteralControl("<P>Please fix the following input errors:</P>"));
                    biaoge.Controls.Add(new LiteralControl("<UL>"));
                    biaoge.Controls.Add(new LiteralControl("<LI>dummy</LI></UL></DIV>"));
                    biaoge.Controls.Add(new LiteralControl("<DIV class=\"row\"><INPUT name=\"SurveyResponse[8][survey_question_type]\" id=\"SurveyResponse_8_survey_question_type\" type=\"hidden\" value=\"2\"><INPUT name=\"SurveyResponse[8][text]\" id=\"ytSurveyResponse_8_text\" type=\"hidden\"><SPAN id=\"SurveyResponse_8_text\">"));
                    for (int j = 0; j < ds1.Tables["answer"].Rows.Count; j++)
                    {
                        biaoge.Controls.Add(new LiteralControl("<INPUT name=\"SurveyResponse[8][text]\" id=\"SurveyResponse_8_text_0\" type=\"radio\" value=\"9\" onmousedown=\"radio_record(" + int.Parse(ds1.Tables["answer"].Rows[j]["id"].ToString()) + ")\"> <LABEL for=\"SurveyResponse_8_text_0\">" + ds1.Tables["answer"].Rows[j]["text"] + "</LABEL><BR>"));

                    }
                    biaoge.Controls.Add(new LiteralControl("</SPAN><DIV class=\"errorMessage\" id=\"SurveyResponse_9_text_em_\" style=\"display: none;\"></DIV><BR></DIV>"));
                }
                else if (Int16.Parse(ds.Tables["question"].Rows[i]["type"].ToString()) == 3)
                {
                   biaoge.Controls.Add(new LiteralControl("<DIV class=\"errorSummary\" id=\"survey-response-form_es_\" style=\"display: none;\">"));
                    biaoge.Controls.Add(new LiteralControl("<P>Please fix the following input errors:</P>"));
                    biaoge.Controls.Add(new LiteralControl("<UL>"));
                    biaoge.Controls.Add(new LiteralControl("<LI>dummy</LI></UL></DIV>"));
                    biaoge.Controls.Add(new LiteralControl("<DIV class=\"row\"><INPUT name=\"SurveyResponse[8][survey_question_type]\" id=\"SurveyResponse_8_survey_question_type\" type=\"hidden\" value=\"2\"><INPUT name=\"SurveyResponse[8][text]\" id=\"ytSurveyResponse_8_text\" type=\"hidden\"><SPAN id=\"SurveyResponse_8_text\">"));
                    for (int j = 0; j < ds1.Tables["answer"].Rows.Count; j++)
                        biaoge.Controls.Add(new LiteralControl("<INPUT name=\"SurveyResponse[8][text]\" id=\"SurveyResponse_8_text_0\" type=\"checkbox\" value=\"9\" onclick=\"check_single_record(" + int.Parse(ds1.Tables["answer"].Rows[j]["id"].ToString()) + ")\"> <LABEL for=\"SurveyResponse_8_text_0\">" + ds1.Tables["answer"].Rows[j]["text"] + "</LABEL><BR>"));
                    biaoge.Controls.Add(new LiteralControl("</SPAN><DIV class=\"errorMessage\" id=\"SurveyResponse_9_text_em_\" style=\"display: none;\"></DIV><BR></DIV>"));
                }
                listinsertion.Add(ds.Tables["question"].Rows[i]["id"].ToString());
              //  break;
            }
            biaoge.Controls.Add(new LiteralControl("<DIV class=\"row buttons\"><INPUT name=\"yt0\" type=\"submit\" value=\"Submit\" onclick=\"buttonclick()\"></DIV>"));
        }
        catch(Exception ee)
        {

        }
        finally 
        {
            string[] arr = hfarray.Value.Split(",".ToCharArray());
            Random random = new Random();
            int maximum = random.Next(1, 10);
            int maximum_second = random.Next(1, 20);
            try
            {
                SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connMySurvey"].ConnectionString);
                connection.Open();
               // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "FindingAlert", "alert('" + Session["email"].ToString() + "');", true);
                for (int j = 0; j < maximum;j++ )
                {
                    for (int mm = 0; mm < maximum_second; mm++)
                    {
                        string insertion = "insert into [conclusion]([user],[answer],[question]) values('" + Session["email"].ToString() + "'," + mm + "," + j + ")";
                        SqlCommand sqlcm = new SqlCommand(insertion, connection);
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "FindingAlert", "insertion", true);
                        sqlcm.ExecuteNonQuery();
                        //if (mm == maximum_second)
                        //    break;
                    }
                    /*    if (j == maximum)
                            break;
                        j++;*/
                }
                connection.Close();
            }
            catch (Exception ee)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "FindingAlert", "how old are you", true);
            }
            finally
            {

            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}