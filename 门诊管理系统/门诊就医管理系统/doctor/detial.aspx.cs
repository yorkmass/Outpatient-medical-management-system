using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doctor_detial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string stateing = "成功";
        string depid ;
        string sql;
        String num = ("Server=(local);integrated security=sspi;database=KS_yiyuan");               
        SqlConnection connect = new SqlConnection(num);
        connect.Open();
        sql = "select * FROM  Department INNER JOIN Doctor ON Department.Departement_ID = Doctor.Departement_ID where User_ID='"+Session["Username"].ToString().Trim()+"'";
        SqlCommand comm = new SqlCommand(sql, connect);
        DataSet ds = new DataSet();
        SqlDataReader dr = comm.ExecuteReader();
        dr.Read();
        depid = dr.GetString(dr.GetOrdinal("Departement_ID")).Trim();
        Session["call_ing"] = stateing;
        Session["depid"] = depid;
        if (Session["Username"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        
    }
}