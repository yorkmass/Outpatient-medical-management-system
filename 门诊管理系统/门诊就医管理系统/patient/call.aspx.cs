using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patient_call : System.Web.UI.Page
{
    
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        Label3.Visible = false;
        Label4.Visible = false;
        Label5.Visible = false;
        Label6.Visible = false;
        Label7.Visible = false;
        Label8.Visible = false;
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Random MyRandom = new Random();
        int n = MyRandom.Next(1, 9999);
        string name=this.TextBox1.Text.Trim();
        string dep = this.DropDownList1.Text.Trim();
        int depid=0;
        if (dep == "内科")
        {
            depid = 1;
        }
        if (dep == "外科")
        {
            depid = 2;
        }
        if (dep == "神经科")
        {
            depid = 3;
        }
        if (dep == "脑外科")
        {
            depid = 4;
        }
        
        string id = Session["Username"].ToString().Trim();
        string regis = id+""+n+"";
        Session["regis"] = regis;
        n++;
        string sql;
        string usercode;
        string state = "正在审核";
        String num = ("Server=(local);integrated security=sspi;database=KS_yiyuan");
        SqlConnection connect = new SqlConnection(num);
        connect.Open();
        if (name!="")
        {
            sql = "SELECT Usercode FROM Users WHERE User_ID='" + id + "'";
            SqlCommand comm = new SqlCommand(sql, connect);
            DataSet ds = new DataSet();
            SqlDataReader dr = comm.ExecuteReader();
            dr.Read();
            usercode = dr.GetString(dr.GetOrdinal("Usercode"));
            dr.Close();
            sql= "insert into User_Rsqister(Register_ID,User_ID,Usercode) values('" + regis + "', '" +id+ "','" + usercode+ "')"; 
            comm= new SqlCommand(sql, connect);
            comm.ExecuteNonQuery();
            sql = "insert into Reqister_Department(Register_ID,Departement_ID) values('" + regis + "','" + depid + "')";
            comm = new SqlCommand(sql, connect);
            comm.ExecuteNonQuery();
            sql = "insert into Register(Register_ID,User_ID,Patient_Name,Departement_ID,Reqister_State) values('" + regis + "','" + id + "','" + name + "','" + depid + "','" + state + "')";
            comm = new SqlCommand(sql, connect);
            comm.ExecuteNonQuery();
            sql = "select * from Register WHERE Register_ID='" + regis + "'";
            comm = new SqlCommand(sql, connect);
            ds = new DataSet();
            dr = comm.ExecuteReader();
            dr.Read();
            string newstate= dr.GetString(dr.GetOrdinal("Reqister_State"));
            dr.Close();
            sql = "select count(*) AS counts from Register where Reqister_State='成功'";
            comm = new SqlCommand(sql, connect);
            ds = new DataSet();
            dr = comm.ExecuteReader();
            dr.Read();
            int  counts= dr.GetInt32(dr.GetOrdinal("counts"));
            dr.Close();
            Label4.Text = newstate;
            Label6.Text=counts+"人";
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;
            Label6.Visible = true;
            Label7.Visible = true;
            Label8.Visible = true;
            Label8.Text = regis;
            Response.Write("<script>alert('预约成功！')</script>");
            name = "";

        }
        else
        {
            Response.Write("<script>alert('输入不能为空！')</script>");
        }
    }
}