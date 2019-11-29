<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tell.aspx.cs" Inherits="son_tell" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>公告栏</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
 <link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
 <link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
 <link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
 <style type="text/css">
    code {
      padding: 0px 4px;
      color: #d14;
      background-color: #f7f7f9;
      border: 1px solid #e1e1e8;
    }
 </style>
</head>
<body>
     <div class="container">
    <div class="row">
      <div class="span10">
        <h2>医院招标</h2>
        <p>华北理工大学附属医院</p>
        <ol>
          <li>华北理工大学附属医院“招标代理机构”公开招标，结果如下：</li>
          <li>采购单位：华北理工大学附属医院</li>
          <li>采购方式：公开招标</>
          <li>招标编号：20170227</li>
          <li>招标内容：招标代理机构</li>
          <li>采购内容及中标信息</li>
          </ol>            
      </div>
      <div class="span14">
        <h3>华北理工大学附属医院</h3>
        <img src="../images/yiyuan.jpg" alt="附属医院" width="500" height="366" >
      </div>
    </div>
  </div>
  <script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="../assets/js/bui-min.js"></script>

  <script type="text/javascript" src="../assets/js/config-min.js"></script>
  <script type="text/javascript">
    BUI.use('common/page');
  </script>
  <!-- 仅仅为了显示代码使用，不要在项目中引入使用-->
  <script type="text/javascript" src="../assets/js/prettify.js"></script>
  <script type="text/javascript">
    $(function () {
      prettyPrint();
    });
  </script> 
</body>
</html>
