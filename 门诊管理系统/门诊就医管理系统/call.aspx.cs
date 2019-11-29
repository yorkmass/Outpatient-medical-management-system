using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class call : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            String num = ("Server=(local);integrated security=sspi;database=KS_yiyuan");
            SqlConnection connect = new SqlConnection(num);
            connect.Open();
            string sql = string.Format("SELECT * FROM Roles INNER JOIN Users_Roles ON Roles.Roles_ID = Users_Roles.Roles_ID INNER JOIN Users ON Users_Roles.User_ID = Users.User_ID where Users.User_ID ={0} ", Session["Username"].ToString());
            SqlCommand comm = new SqlCommand(sql, connect);
            DataSet ds = new DataSet();//创建数据集
            SqlDataReader dr = comm.ExecuteReader();//若要创建 SqlDataReader，必须调用 SqlCommand 对象的 ExecuteReader 方法，而不要直接使用构造函数。
            if (dr.Read())
            {
                Label1.Text = string.Format("{0}  角色：{1}", dr.GetString(dr.GetOrdinal("User_Name")), dr.GetString(dr.GetOrdinal("Roles_Name")));

            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
}