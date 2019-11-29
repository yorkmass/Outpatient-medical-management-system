using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["username"] == null && Request.Form["password"] == null)
        {

        }
        else
        {
            //UserName = Request.Form["UserName"].ToString();
            //Pwd = Request.Form["password"].ToString();
            Session["Username"] = this.username.Value;
            Session["Password"] = this.password.Value;
            String username1 = this.username.Value;                                                     //取得数据“用户”初始账号
            String password1 = this.password.Value;                                                    //取得数据“密码”初始密码
            String num = ("Server=(local);integrated security=sspi;database=KS_yiyuan");                 //打开SOL server数据库并进行身份验证
            SqlConnection connect = new SqlConnection(num);                                             //建立一个数据库连接对象connect
            //string sql = "select * from Users where UserID=@username1 and Password=@password1";         //找到数据库LibraryDB并且找到其中的表格Reader,用一条记录作为连接桥梁
            string sql = string.Format("select * from Users where User_ID =@username1 and Password =@password1");
            connect.Open();                                                                             //打开SQL server数据库连接
            SqlCommand command = new SqlCommand(sql, connect);                                          //创建sqlCommand的实例，sql代表要执行的SQL语句；connect代表连接对象
            command.Parameters.AddWithValue("@username1", username.Value.Trim());
            command.Parameters.AddWithValue("@password1", password.Value.Trim());
            //打开SQL server数据库连接
            int num1 = Convert.ToInt32(command.ExecuteScalar());                                    //将从界面输入框中取得的两个数据与数据库中的数据进行验证
            if (num1 > 0)
            {
                Response.Write("<script>alert('登录成功！')</script>");
                string sql1 = string.Format("SELECT * FROM Roles INNER JOIN Users_Roles ON Roles.Roles_ID = Users_Roles.Roles_ID INNER JOIN Users ON Users_Roles.User_ID = Users.User_ID where Users.User_ID ={0} ", Session["Username"].ToString().Trim());
                SqlCommand comm = new SqlCommand(sql1, connect);
                DataSet ds = new DataSet();//创建数据集
                SqlDataReader dr = comm.ExecuteReader();//若要创建 SqlDataReader，必须调用 SqlCommand 对象的 ExecuteReader 方法，而不要直接使用构造函数。
                dr.Read();
                string roles = dr.GetString(dr.GetOrdinal("Roles_Name")).Trim();
                if (roles == "用户")
                {
                    Response.Redirect("patient.aspx");
                }
                if (roles == "医生")
                {
                    Response.Redirect("doctor.aspx");
                }
                if (roles == "收费管理员")
                {
                    Response.Redirect("money.aspx");
                }
                if (roles == "药房管理员")
                {
                    Response.Redirect("medical.aspx");
                }
                if (roles == "挂号管理员")
                {
                    Response.Redirect("call.aspx");
                }
                if (roles == "管理员")
                {
                    Response.Redirect("admin.aspx");
                }
            }
            else
            {
                connect.Close();                                                                            //关闭SQL server数据库连接
                Response.Write("<script>alert('对不起，你输入的账号或者密码错误！')</script>");
            }
        }
    }
   
}