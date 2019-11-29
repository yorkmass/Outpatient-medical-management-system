using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class son_pwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        Label4.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if ((this.TextBox1.Text == "") || (this.TextBox2.Text == "") || (this.TextBox2.Text == ""))
        {
            Response.Write("<script>alert('密码不能为空')</script>");
        }
        else
        {
            string pwd_input = this.TextBox1.Text.Trim();
            string new_pwd = this.TextBox2.Text.Trim();
            string check_pwd = this.TextBox3.Text.Trim();
            String num = ("Server=(local);integrated security=sspi;database=KS_yiyuan");
            SqlConnection connect = new SqlConnection(num);
            connect.Open();
            string sql;
            sql = "SELECT * FROM Users WHERE User_ID='" + Session["Username"].ToString().Trim() + "'";
            SqlCommand comm = new SqlCommand(sql, connect);
            DataSet ds = new DataSet();
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.Read())
            {
                string password = dr.GetString(dr.GetOrdinal("Password"));
                if (password == pwd_input)
                {
                    if (new_pwd == check_pwd)
                    {
                        dr.Close();
                        sql = "UPDATE Users SET Password='" + check_pwd + "'WHERE User_ID='" + Session["Username"].ToString().Trim() + "'";
                        comm = new SqlCommand(sql, connect);
                        comm.ExecuteNonQuery();
                        Response.Write("<script>alert('修改成功')</script>");
                    }
                    else
                    {
                        Label4.Visible = true;
                        Label4.Text = "两次输入的密码不一致！";
                    }
                }
                else
                {
                    Response.Write("<script>alert('您输入的密码有误！请重新输入！')</script>");
                }

            }
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        this.TextBox1.Text = "";
        this.TextBox2.Text = "";
        this.TextBox3.Text = "";
    }
}