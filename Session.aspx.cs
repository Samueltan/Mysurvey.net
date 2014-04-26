using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Session : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      //  Label1.Text = Session["email"].ToString();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Label1.Text = "how are you";
    }
}