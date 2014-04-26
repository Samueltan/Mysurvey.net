using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using LHCYW.Core.DataAccess;
using System.Data;
using System.Text;
using System.Data.SqlClient;


public partial class charts : System.Web.UI.Page
{
    public StringBuilder seriesData = new StringBuilder(); //Y轴

    protected void Page_Load(object sender, EventArgs e)
    {
        usermail.Text = Session["email"].ToString(); 


        const string connString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\mysurveydb.mdf; Integrated Security=True";
        SqlConnection conn = new SqlConnection(connString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT [survey].is_published from survey", conn);
        SqlDataReader rdr = cmd.ExecuteReader(); 
        //StringBuilder xAxisCategories = new StringBuilder();
        //xAxisCategories.Append("[");

        int  y_unp = 0;
        int y_p = 0;

        //string[] x_array={"unpublished","published"};
        string[] y_array={};

        while (rdr.Read())
        {
            if (Convert.ToInt32(rdr["is_published"]) == 0 )
            {
                y_unp++;
            }
            else if (Convert.ToInt32(rdr["is_published"]) == 1)
            {
               y_p++;
            }
        }
        rdr.Close();
         seriesData.Append("[{ data: [ ['unpublished',"+y_unp+"],['published',"+y_p);
        seriesData.Append("]]}]");  
           
        //    xAxisCategories.Append("'");
        //    if (Convert.ToInt32(rdr["is_published"]) == 0 && x_unp == 0)
        //    {
        //        xAxisCategories.Append("unpublished");
        //        x_unp++;
        //        xAxisCategories.Append("',");
        //    }
        //    else if (Convert.ToInt32(rdr["is_published"]) == 1 && x_p == 0)
        //    {
        //        xAxisCategories.Append("published");
        //        x_p++;
        //        xAxisCategories.Append("',");
        //    }
        //    //xAxisCategories.Append(Convert.ToInt32(rdr["is_published"]) == 0 ? "unpublished " : "published");          
        //}

        //rdr.Close();
        //XAxisCategories = xAxisCategories.Replace(",", "", xAxisCategories.Length - 1, 1).Append("]").ToString();
        
        //StringBuilder yAxisCategories = new StringBuilder();
        //x_unp = 0;
        //x_p = 0;
        //rdr = cmd.ExecuteReader();
        //while (rdr.Read())
        //{
        //    if (Convert.ToInt32(rdr["is_published"]) == 0 )
        //    {
        //        x_unp++;
        //    }
        //    else if (Convert.ToInt32(rdr["is_published"]) == 1)
        //    {
        //        x_p++;
        //    }

        //}
        //yAxisCategories.Append(x_unp);
        //yAxisCategories.Append(",");
        //yAxisCategories.Append(x_p);
        //yAxisCategories.Append(",");

        //seriesData.Append("[{data: [");
        //seriesData.Append(yAxisCategories.Replace(",", "", yAxisCategories.Length - 1, 1)); //去除最后一个逗号(，)
        //seriesData.Append("]}]");
        rdr.Close();
       
    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}