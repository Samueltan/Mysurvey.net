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

public partial class QuestionEdit : System.Web.UI.Page
{
    ArrayList gvshows = new ArrayList();
    ArrayList questions = new ArrayList();
    SqlConnection conn;
    const string connString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\mysurveydb.mdf;Integrated Security=True";
    DataTable dt; 
    SqlDataAdapter adapter;
    DataSet ds1 = new DataSet();
    TextBox tbAnswer;
    Button btnAddQuestion;

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
        //surveyTitles = new ArrayList();

        // Get the question list
        string strcmd = "SELECT [survey_question].id as qid, survey_id, type, text FROM [survey_question], [survey] where [survey].id=survey_question.survey_ID and [survey].title='" + surveyTitle + "'";
        cmd = new SqlCommand(strcmd, conn);
        rdr = cmd.ExecuteReader();
        //ulQuestions.InnerHtml = "";
        int i = 0;
        int j = 0;

        // Iterate the question list and display
        while (rdr.Read())
        {
            int qid = (int)rdr["qid"];
            string qtext = (string)rdr["text"];
            int qtype = (int)rdr["type"];
            questions.Add(qid);

            HtmlGenericControl qli = new HtmlGenericControl("li");
            qli.Attributes.Add("class", "question_summary");

            HtmlGenericControl qdiv1 = new HtmlGenericControl("div");
            qdiv1.Attributes.Add("id", "questiondetails" + i);
            qdiv1.Attributes.Add("class", "row question-text clearfix");
            qdiv1.Attributes.Add("data-editable", "true");

            HtmlGenericControl qdiv2 = new HtmlGenericControl("div");
            qdiv2.Attributes.Add("class", "details");

            qdiv1.Controls.Add(qdiv2);
            qli.Controls.Add(qdiv1);

            string strOption0, strOption1, strOption2, strOption3;
            strOption0 = strOption1 = strOption2 = strOption3 = "";
            switch (qtype)
            {
                case 0: {strOption0 = "selected='selected' ";break;}
                case 1: { strOption1 = "selected='selected' "; break;}
                case 2: { strOption2 = "selected='selected' "; break;}
                case 3: { strOption3 = "selected='selected' "; break;}
                default: break;
            }
            qli.InnerHtml = "<input id='q" + i + "' type='text' size='15' Width='371px' value='" + qtext + "'>" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "<SELECT id='s" + i + "'>" +
                "<OPTION " + strOption0 + "value='0'>Short Answer</OPTION>" +
                "<OPTION " + strOption1 + "value='1'>True/False</OPTION>" +
                "<OPTION " + strOption2 + "value='2'>Multiple Choice</OPTION>" +
                "<OPTION " + strOption3 + "value='3'>Multiple Select</OPTION></SELECT>" +                                            
                "<div class='buttons'>" +
                    "<A class='delete-confirm' href='#' onclick='deleteQuestion(" + i + ")'>Delete Question</A>" + 
                "</div>";

            string strcmd2 = "SELECT survey_answer.* from [survey_answer] WHERE [survey_answer].survey_question_ID = " + qid;
            SqlDataAdapter adapter = new SqlDataAdapter(strcmd2, connString);
            adapter.Fill(ds1, "answers");

            // Show all the answerss of a question
            HtmlGenericControl aul = new HtmlGenericControl("ul");
            HtmlGenericControl ali = new HtmlGenericControl("li");
            HtmlGenericControl adiv1 = new HtmlGenericControl("div");
            HtmlGenericControl adiv2 = new HtmlGenericControl("div");
            HtmlGenericControl adiv3 = new HtmlGenericControl("div");
            HtmlGenericControl adiv4 = new HtmlGenericControl("div");

            adiv1.Attributes.Add("class", "row");
            aul.Attributes.Add("class", "sortable ui-sortable");
            ali.Attributes.Add("class", "answer_summary");
            adiv2.Attributes.Add("class", "row answers clearfix");
            adiv2.Attributes.Add("data-editable", "true");
            adiv3.Attributes.Add("class", "details");

            // Add gridview for answer details
            dt = ds1.Tables["answers"];
            setBind();
            tbAnswer = new TextBox();
            btnAddQuestion = new Button();
            btnAddQuestion.Text = "Add New Answer";
            btnAddQuestion.CssClass = "button";
            btnAddQuestion.Command += new CommandEventHandler(this.addNewAnswer); 

            adiv4.Attributes.Add("class", "row buttons add-new-answer");
            HtmlGenericControl alink = new HtmlGenericControl("a");
            //alink.Attributes.Add("class","add-sortable");
            //alink.Attributes.Add("data-model","answer");
            //alink.Attributes.Add("href","#");
            //alink.Attributes.Add("onclick","addQuestion(" + surveyTitle + "," + qid,);    // Incomplete!!!

            //adiv4.Controls.Add(alink);
            adiv3.Controls.Add((GridView)gvshows[i]);
            adiv2.Controls.Add(adiv3);
            ali.Controls.Add(adiv2);
            aul.Controls.Add(ali);
            adiv1.Controls.Add(aul);
            adiv1.Controls.Add(adiv4);

            ulQuestions.Controls.Add(qli);
            ulQuestions.Controls.Add(adiv1);

            //<div class='row'>                                                             // adiv1
            //<ul id='answers_9616' class='sortable ui-sortable'>                           // aul
            //<li class='answer_summary'>                                                   // ali
            //<div class='row answers clearfix' data-editable='true'>                       // adiv2
            //<div id='answerdetails' class='details' runat='server'>                       // adiv3
            // Add gridview                                                                 // gridview
            //            <asp:GridView ID='gvAnswers1' runat='server' DataSourceID='DSAnswers' OnSelectedIndexChanged='gvAnswers1_SelectedIndexChanged'>
            //                <Columns>
            //                    <asp:CommandField ShowEditButton='True' />
            //                    <asp:CommandField ShowDeleteButton='True' />
            //                    <asp:ButtonField Text='Button' />
            //                </Columns>
            //                </asp:GridView>
            //            </div>                                                            // adiv3
            //        </div>                                                                // adiv2
            //    </li>                                                                     // ali
            //</ul>                                                                         // aul
            //<div class='row buttons add-new-answer'>                                      // adiv4
            //        <a class='add-sortable ' data-model='answer' data-target='#answers_9616' 
            //            href='#' onclick='addQuestion()'>Add New Answer</a>
            //    </div>                                                                    // adiv4
            //</div>                                                                        // adiv1


            //string innerhtml = "<LI id='liq" + i + "' class='question_summary'>" +
            //    "<div id='questiondetails" + i + "' class='row question-text clearfix' data-editable='true'>" +
            //        "<div id='details" + i + "' class='details'>" +
            //    "<A href='Preview.htm' target='_blank'>Preview</A></LI>";
            //ulQuestions.InnerHtml += innerhtml;
            ++i;
        }
        rdr.Close();
    }

    public void addNewAnswer(Object Sender, CommandEventArgs e)
    {
        string answer = tbAnswer.Text;

        //string sql = "insert into [survey_answer] (survey_question_ID, text, order_number, choice_letter) values(" + qid + ",'" + qtext + "',0,'');";
        //SqlCommand sqlcmd = new SqlCommand(sql, conn);
        //sqlcmd.ExecuteNonQuery();
        //bind((GridView)Sender);

        tbAnswer.Text = "";
    }  

    public void setBind()
    {
        GridView gvshow = new GridView();
        //gvshows.Width = Unit.Pixel(700);

        gvshow.AutoGenerateColumns = false;        

        gvshow.DataSource = dt;
        gvshow.Font.Size = 12;
        gvshow.Width = 976;
        //gvshow.Height = 237;
        gvshow.CellPadding = 0;
        gvshow.ForeColor = System.Drawing.ColorTranslator.FromHtml("#333333");
        gvshow.GridLines = GridLines.Horizontal;
        gvshow.ShowHeader = false;
        gvshow.BorderColor = Color.White;
        gvshow.BorderWidth = 15;

        gvshow.EditRowStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#999999");  
        gvshow.FooterStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#5D7B9D"); 
        gvshow.FooterStyle.ForeColor = Color.White;          
        gvshow.FooterStyle.Font.Bold = true; 
        //gvshow.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#568c9e"); 
        //gvshow.HeaderStyle.ForeColor = Color.White;          
        //gvshow.HeaderStyle.Font.Bold = true;
        gvshow.RowStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F7F6F3"); 
        gvshow.RowStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#333333");
        gvshow.SelectedRowStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E2DED6"); 
        gvshow.SelectedRowStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#333333");          
        gvshow.SelectedRowStyle.Font.Bold = true;

        // Columns
        BoundField bc = new BoundField();
        bc.DataField = dt.Columns["text"].ColumnName.ToString();
        bc.ItemStyle.Width = 700;
        //bc.HeaderText = dt.Columns[i].Caption.ToString();
        //BoundField bc2 = new BoundField();
        //bc2.DataField = dt.Columns["id"].ColumnName.ToString();
        
        //gvshow.Columns[1].Visible = false;
        CommandField cf = new CommandField();
        cf.ButtonType = ButtonType.Button;
        cf.ShowEditButton = true;
        cf.EditText = "Edit";
        cf.UpdateText = "Update";
        cf.CancelText = "Cancel";
        cf.ControlStyle.CssClass = "gridbutton";
        cf.ControlStyle.ForeColor = Color.White;
        cf.ControlStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#6eb4cd");
        cf.CausesValidation = false;
        cf.ItemStyle.Width = 138;
        
        CommandField cf2 = new CommandField();
        cf2.ButtonType = ButtonType.Button;
        cf2.ShowDeleteButton = true;
        cf2.DeleteText = "Delete";
        cf2.ControlStyle.CssClass = "gridbutton";
        cf2.ControlStyle.ForeColor = Color.White;
        cf2.ControlStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#6eb4cd");
        cf2.CausesValidation = false;
        cf2.ItemStyle.Width = 138;

        gvshow.Columns.Add(bc);
        gvshow.Columns.Add(cf);
        gvshow.Columns.Add(cf2);

        gvshow.RowEditing += new GridViewEditEventHandler(gvshow_RowEditing);                       // Add edit handler
        gvshow.RowCancelingEdit += new GridViewCancelEditEventHandler(gvshow_RowCancelingEdit);     // Add cancel edit handler
        gvshow.RowUpdating += new GridViewUpdateEventHandler(gvshow_RowUpdating);                   // Add update handler
        gvshow.RowDeleting += new GridViewDeleteEventHandler(gvshow_RowDeleting);                   // Add delete handler

        if (!IsPostBack)
        {
           // bind(gvshow);
            gvshow.DataKeyNames = new string[] { "id", "text" };//主键  
            gvshow.DataBind();
        }  
        gvshows.Add(gvshow);
    }
    public void bind(GridView gv, int index)
    {
        //将数据显示在gridview中   
        string strcmd2 = "SELECT survey_answer.* from [survey_answer] WHERE [survey_answer].survey_question_ID = " + index;
        SqlDataAdapter adapter = new SqlDataAdapter(strcmd2, connString);
        DataSet ds2 = new DataSet();
        adapter.Fill(ds2, "answers");
        gv.DataSource=ds2.Tables["answers"];
        gv.DataKeyNames = new string[] { "id", "text" };//主键  
        gv.DataBind();
    }
    public void bind1(GridView gv)
    {
        gv.DataKeyNames = new string[] { "id", "text" };//主键  
        gv.DataBind();
    }
    void gvshow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Response.Write("This is backend - gvshow_RowDeleting.");
        GridView gv = (GridView)sender;
        string qid = gv.DataKeys[e.RowIndex].Values["id"].ToString();
        string sqlStr = "delete from [survey_answer] where id =" + gv.DataKeys[e.RowIndex].Values["id"].ToString();
        //System.Diagnostics.Debug.Write(sqlStr);  
        SqlCommand sqlcmd = new SqlCommand(sqlStr, conn);
        sqlcmd.ExecuteNonQuery();
        DataSet ds = new DataSet();
        string sql2 = "select survey_question_ID from [survey_answer] where id=" + qid;
        SqlCommand sqlcmd2 = new SqlCommand(sql2, conn);
        adapter = new SqlDataAdapter(sql2, conn);
        adapter.Fill(ds, "test");
        int ii = int.Parse(ds.Tables["test"].Rows[0]["survey_question_ID"].ToString());
        bind(gv, ii);
    }

    protected void gvshow_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Response.Write("This is backend - gvshow_RowUpdating.");
        GridView gv = (GridView)sender;
        string qid = gv.DataKeys[e.RowIndex].Values["id"].ToString();
        string qtext = ((TextBox)(gv.Rows[e.RowIndex].Cells[0].Controls[0])).Text.ToString();

        string sql = "update [survey_answer] set text='" + qtext + "' where id = " + qid;
        SqlCommand sqlcmd = new SqlCommand(sql, conn);
        sqlcmd.ExecuteNonQuery();
        gv.EditIndex = -1;
        //Page_Load(sender, e);
        DataSet ds=new DataSet();
        string sql2 = "select survey_question_ID from [survey_answer] where id=" + qid;
        SqlCommand sqlcmd2 = new SqlCommand(sql2, conn);
        adapter = new SqlDataAdapter(sql2,conn);
        adapter.Fill(ds, "test");
        int ii =int.Parse( ds.Tables["test"].Rows[0]["survey_question_ID"].ToString());
        bind(gv, ii);
    }

    protected void gvshow_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Response.Write("This is backend - gvshow_RowCancelingEdit.");
        GridView gv = (GridView)sender;
        gv.EditIndex = -1;
        //bind(gv);
    }

   public void gvshow_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Response.Write("This is backend - gvshow_RowEditing.");
         GridView gv = (GridView)sender;
         //int index = Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);  
         gv.EditIndex = e.NewEditIndex;
         bind1(gv);
    }
}