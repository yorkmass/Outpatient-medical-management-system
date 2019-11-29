<%@ Page Language="C#" AutoEventWireup="true" CodeFile="money.aspx.cs" Inherits="money" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<title>门诊就医管理系统</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="header">
    
      <div class="dl-title">
          <span class="lp-title-port"></span><span class="dl-title-text">门诊就医管理系统 (费用管理员)</span>
      </div>

    <div class="dl-log"><span class="dl-log-user">欢迎<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </span>
        &nbsp;<a href="login.aspx" title="退出系统" class="dl-log-quit">[注销]</a>
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">首页</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-order">收费</div></li>
   <%--     <li class="nav-item"><div class="nav-item-inner nav-inventory"></div></li>--%>
        <li class="nav-item"><div class="nav-item-inner nav-supplier">个人信息</div></li>
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="./assets/js/bui.js"></script>
  <script type="text/javascript" src="./assets/js/config.js"></script>
  <script>
    BUI.use('common/main',function(){
      var config = [{
          id:'menu', 
          homePage:'code',
          menu:[{
              text:'医院概况',
              items:[
                {id:'code',text:'最新消息',href:'son/news.aspx',closeable : false},
                { id: 'main-menu', text: '公告栏', href: 'son/tell.aspx' },         
              ]
          },
          //{
              //text:'医院',
              //items:[
              //  {id:'operation',text:' ',href:'  '},
              //  {id:'quick',text:'',href:'  '}  
              //]
            //},{
              //text:'',
              //items:[
              //  {id:'resource',text:' ',href:' '},
              //  {id:'loader',text:' ',href:'  '}  
              //]
            //}
          ]
          },{
            id:'form',
            menu:[{
                text:'用户账户',
                items:[
                  {id:'code',text:'账户查询',href:'money/search.aspx'},
                  {id:'example',text:'用户充值',href:'money/account.aspx'},
                  //{id:'introduce',text:'  ',href:'  '},
                  //{id:'valid',text:'  ',href:'  l'},
                  //{id:'advalid',text:'  ',href:'  '},
                  //{id:'remote',text:'  ',href:'  '},
                  //{id:'group',text:'  ',href:'  '},
                  //{id:'depends',text:'  ',href:'  '}
                ]
            },
            {
                text:'费用结算',
                items:[
                  {id:'success',text:'费用结算',href:'money/end.aspx'},
                  {id:'fail',text:'收费记录',href:'money/record.aspx'}
                
                ]
                },
                //{
                //text:'可编辑表格',
                //items:[
                //  {id:'grid',text:'可编辑表格',href:'form/grid.html'},
                //  {id:'form-grid',text:'表单中的可编辑表格',href:'form/form-grid.html'},
                //  {id:'dialog-grid',text:'使用弹出框',href:'form/dialog-grid.html'},
                //  {id:'form-dialog-grid',text:'表单中使用弹出框',href:'form/form-dialog-grid.html'}
                //]
                //}
            ]
          },
          //{
          //  id:'search',
          //  menu:[{
          //      text:'我的病例',
          //      items:[
          //        {id:'code',text:'病例信息',href:'search/code.html'},
          //        //{id:'example',text:'搜索页面示例',href:'search/example.html'},
          //        //{id:'example-dialog',text:'搜索页面编辑示例',href:'search/example-dialog.html'},
          //        //{id:'introduce',text:'搜索页面简介',href:'search/introduce.html'}, 
          //        //{id:'config',text:'搜索配置',href:'search/config.html'}
          //      ]
          //    },{
          //      text : '用药情况',
          //      items : [
          //        {id : 'tab',text : '用药信息',href : 'search/tab.html'}
          //      ]
          //    }]
          //},
          {
            id:'detail',
            menu:[{
                text:'个人信息',
                items:[
                  {id:'code',text:'个人信息',href:'son/user.aspx'},
                  {id:'example',text:'信息修改',href:'son/change.aspx'}
                ]
            },
                {
                    text: '我的账户',
                    items: [
                        { id: 'pwd', text: '修改密码', href: 'son/pwd.aspx' }
                    ]
                }
            ]
          }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
    </form>
</body>
</html>

