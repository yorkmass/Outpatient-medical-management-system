using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class patient_change : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        GridView1.Visible = false;
        Button2.Visible = false;
        Button3.Visible = false;

    }





    protected void Button1_Click(object sender, EventArgs e)
    {

        string name = this.TextBox1.Text.Trim();
        string job = this.TextBox2.Text.Trim();
        string sex = this.DropDownList1.Text.Trim();
        string BT = this.DropDownList2.Text.Trim();
        string nation = this.TextBox3.Text.Trim();
        string phone = this.TextBox4.Text.Trim();
        string marry = this.DropDownList3.Text.Trim();
        if ((name != "")&&(job != "") && (nation != "")&&(phone != ""))
        {
            String num = ("Server=(local);integrated security=sspi;database=KS_yiyuan");
            SqlConnection connect = new SqlConnection(num);
            connect.Open();
            string sql;
            sql = "UPDATE Users SET User_Name='" + name + "',User_Phone='" + phone + "',User_Sex='" + sex + "',User_Nation='" + nation + "'WHERE User_ID='" + Session["Username"].ToString().Trim() + "'";
            SqlCommand comm = new SqlCommand(sql, connect);
            comm.ExecuteNonQuery();
            sql = "UPDATE Patient SET Patient_Occupation='" + job + "',Patient_BT='" + BT + "',Patient_Marriage='" + marry + "'WHERE User_ID='" + Session["Username"].ToString().Trim() + "'";
            comm = new SqlCommand(sql, connect);
            comm.ExecuteNonQuery();
            Response.Write("<script>alert('修改成功！')</script>");
            Button2.Visible = true;
           
        }
        else
        {
            Response.Write("<script>alert('输入不能为空，请重新输入！')</script>");
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        GridView1.Visible=true;
        Button3.Visible = true;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;         
        Button3.Visible = false;
    }
}