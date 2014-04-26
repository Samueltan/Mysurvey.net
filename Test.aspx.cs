using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void DropDownSelection_Change(Object sender, EventArgs e)
    {
        Calendar1.DayStyle.BackColor = System.Drawing.Color.FromName(ColorList.SelectedItem.Value);
    }
}