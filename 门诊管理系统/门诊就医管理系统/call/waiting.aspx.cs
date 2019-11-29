using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class call_waiting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        string sql;
        String num = ("Server=(local);integrated security=sspi;database=KS_yiyuan");
        SqlConnection connect = new SqlConnection(num);
        connect.Open();
        sql = "select count(*) AS counts from Register where Reqister_State='成功'";
        SqlCommand comm = new SqlCommand(sql, connect);
        DataSet ds = new DataSet();
        SqlDataReader dr = comm.ExecuteReader();
        dr.Read();
        int counts = dr.GetInt32(dr.GetOrdinal("counts"));
        Label2.Text = counts + "人";
        dr.Close();
    }
}