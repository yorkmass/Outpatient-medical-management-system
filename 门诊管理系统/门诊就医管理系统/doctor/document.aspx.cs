using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doctor_document : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        string doctor;
        string sql;
        String num = ("Server=(local);integrated security=sspi;database=KS_yiyuan");
        SqlConnection connect = new SqlConnection(num);
        connect.Open();
        sql = "select * FROM Users where User_ID='" + Session["Username"].ToString().Trim() + "'";
        SqlCommand comm = new SqlCommand(sql, connect);
        DataSet ds = new DataSet();
        SqlDataReader dr = comm.ExecuteReader();
        dr.Read();
        doctor = dr.GetString(dr.GetOrdinal("User_Name")).Trim();
        Session["doctor"] = doctor;
    }
}