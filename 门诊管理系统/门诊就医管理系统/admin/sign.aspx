<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sign.aspx.cs" Inherits="admin_sign" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <style type="text/css">
        .text1 {
            margin-left: 200px;
            margin-bottom: 0px;
        } 
        .text2{
            margin-left: 120px;
            margin-bottom: 0px;
        }
        .text3{
            margin-left: 200px;
            margin-bottom: 0px;
        }
          
            .auto-style3 {
                margin-left: 23px;
                margin-bottom: 0px;
            }
            .auto-style4 {
                margin-left: 14px;
                margin-bottom: 0px;
            }
            .auto-style5 {
                margin-left: 22px;
            }
          
            .auto-style6 {
                margin-left: 31px;
                margin-bottom: 0px;
            }
          
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" CssClass="text1" runat="server">添加新用户</asp:HyperLink>
            <br />
            <br />
            <br />
        </div>
        <asp:Label ID="Label1" runat="server" CssClass="text2" Text="手机号码："></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" CssClass="text2" Text="姓名："></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style6"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" CssClass="text2" Text="角色："></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style4">
            <asp:ListItem>用户</asp:ListItem>
            <asp:ListItem>医生</asp:ListItem>
            <asp:ListItem>管理员</asp:ListItem>
            <asp:ListItem>收费管理员</asp:ListItem>
            <asp:ListItem>药房管理员</asp:ListItem>
            <asp:ListItem>挂号管理员</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style3" Text="注册" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style5" OnClick="Button2_Click" Text="清空" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" CssClass="text2" Text="账号："></asp:Label>
        <asp:Label ID="Label5" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" CssClass="text2" Text="默认密码："></asp:Label>
        <asp:Label ID="Label7" runat="server"></asp:Label>
    </form>
</body>
</html>
