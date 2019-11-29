using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_sign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        Label4.Visible = false;
        Label5.Visible = false;
        Label6.Visible = false;
        Label7.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string tel = this.TextBox1.Text.Trim();
        string roles = this.DropDownList1.Text.Trim();
        string name = this.TextBox2.Text.Trim();
        int roleid=1;
        if (roles =="用户")
        {
            roleid = 1;
        }
        if (roles == "医生")
        {
            roleid = 2;
        }
        if (roles =="收费管理员")
        {
            roleid = 3;
        }
        if (roles == "管理员")
        {
            roleid = 4;
        }
        if (roles == "药房管理员")
        {
            roleid = 5;
        }
        if (roles == "挂号管理员")
        {
            roleid = 6;
        }
        int account = 1;
        int change = Convert.ToInt32(tel)+ 1;
        string usercode = Convert.ToString(change);
        String num = ("Server=(local);integrated security=sspi;database=KS_yiyuan");
        SqlConnection connect = new SqlConnection(num);
        connect.Open();
        string sql;
        sql = "insert into Users(User_ID,Password,Usercode,Account_Type,User_Phone,User_Name) values('" + tel + "', '" + tel + "','"+ usercode+ "','" + account + "','" + tel + "','" + name + "')";
        SqlCommand comm = new SqlCommand(sql, connect);
        comm.ExecuteNonQuery();
        sql = "UPDATE Users_Roles SET Roles_ID='" + roleid + "'WHERE User_ID='" +tel+"'";
        comm = new SqlCommand(sql, connect);
        comm.ExecuteNonQuery();
        Label5.Visible = true;
        Label7.Visible = true;
        Label4.Visible = true;
        Label6.Visible = true;
        Label5.Text = tel;
        Label7.Text = tel;     
        }



    protected void Button2_Click(object sender, EventArgs e)
    {
        this.TextBox1.Text = "";
        this.Label4.Text = "";
        this.Label5.Text = "";
        this.Label6.Text="";
        this.Label7.Text = "";

    }
}
