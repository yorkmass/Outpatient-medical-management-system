using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class call_search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string stateing = "正在审核";
        Session["call_ing"] = stateing;
        if (Session["Username"] == null)
        {
            Response.Redirect("/login.aspx");
        }
    }
}