using CYQ.Data.Tool;
using LYS.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DataGridData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //Response.Write("调试!");
        //return;

        //if (Session["UserID"] == null)
        //{
        //    Response.Write("您不在登录状态!");
        //    return;
        //}
        string fn = RequestHelper.GetString("fn", "").Trim();
        switch (fn)
        {
            case "select": select(); break;
            case "add": add(); break;
            case "update": update(); break;
            case "delete": delete(); break;
        }

    }

    protected void select()
    {
        //方式一
        //获取单位全称等
        string tablename = RequestHelper.GetString("table", "").Trim();
        string keyfield = RequestHelper.GetString("keyfield", "RecordID").Trim();
        string where = RequestHelper.GetString("where", "").Trim();
        string sort = RequestHelper.GetString("sort", "");


        if (where == null)
            where = "RecordID<>-1";

        string jsonstr = EasyUIDataGridHelper.GetJsonForEasyuiDatagrid(keyfield, where, sort, tablename, 1);    //keyfield类型,0,数值,1字符


        Response.Write(jsonstr);
        Response.End();

    }
    protected void add()
    {
        //----------------------------准备--------------------------------
        string table = Request.QueryString["table"].ToString();
        string idName = Request["idName"].ToString();
        string query = Request["query"].ToString();

        string newid = BitConverter.ToInt64(Guid.NewGuid().ToByteArray(), 0).ToString();//生成一个数字GUID
        var act = new DBUtilityV2.MAction(table);
        if (act.MyErr.NotNullOrEmpty())
        {
            Response.Write("网络错误!");
            return;
        }
        //-----------------------------插入操作----------------------
        int i = 0;//返回的记录数
        switch (table.ToLower())
        {


            case "vip":
                var obj2 = JsonConvert.DeserializeObject<Tab_Vip>(query);
                obj2.RecordID = null;
                //obj2.Role2ID = newid;
                i = act.SetEntityToMDataRow(obj2).Insert();
                break;

        }


        //判断是否出错，如果没出错，那么继续下一步操作,这里,出错会自动回滚事物
        if (i < 1)
        {
            Response.Write(act.MyException.Message);
            return;
        }

        Response.Write("操作成功");

    }

    //修改记录======================================================================================================
    protected void update()
    {
        //----------------------------准备--------------------------------
        string table = Request["table"].ToString();
        string query = Request["query"].ToString();
        string idName = Request["idName"].ToString();
        string oldID = ((Request["oldID"] == null) ? "" : Request["oldID"].ToString());

        var act = new DBUtilityV2.MAction(table);
        if (act.MyErr.NotNullOrEmpty())
        {
            Response.Write("网络错误!");
            return;
        }

        //-----------------------------更新操作----------------------
        int i = 0;//返回的记录数
        switch (table.ToLower())
        {



            case "vip":
                var obj2 = JsonConvert.DeserializeObject<Tab_Vip>(query);
                obj2.RecordID = null;
                i = act.SetEntityToMDataRow(obj2).Update(idName + "='" + oldID + "'");
                break;


 
        }
        //判断是否出错，如果没出错，那么继续下一步操作,这里,出错会自动回滚事物
        if (i < 1)
        {
            Response.Write(act.MyException.Message);
            return;
        }

        Response.Write("操作成功");


    }

    //==============================================
    protected void delete()
    {

        //----------------------------准备--------------------------------
        string table = Request.QueryString["table"].ToString();
        string idName = Request["idName"].ToString();
        string id = Request["id"].ToString();


        var act = new DBUtilityV2.MAction(table);
        if (act.MyErr.NotNullOrEmpty())
        {
            Response.Write("网络错误!");
            return;
        }

        //------------------------------删除数据-----------------------------
        int i = 0;

        switch (table.ToLower())
        {
           
            case "vip":
                i = act.SetEntityToMDataRow(new LYS.Entity.Tab_Vip()).Delete(idName + "='" + id + "'");
                break;


        }
        //判断是否出错，如果没出错，那么继续下一步操作,这里,出错会自动回滚事物
        if (i < 1)
        {
            Response.Write(act.MyException.Message);
            return;
        }
        else
            Response.Write("操作成功");
    }




   

    }

