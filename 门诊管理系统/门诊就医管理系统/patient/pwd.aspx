<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pwd.aspx.cs" Inherits="patient_pwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 16px;
        }
        .auto-style2 {
            margin-left: 7px;
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .auto-style3 {
            margin-left: 3px;
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .auto-style4 {
            margin-left: 104px;
            margin-bottom: 6px;
        }
        .auto-style5 {
            margin-left: 58px;
            margin-bottom: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="旧密码："></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox1" runat="server" margin-left="15px" Width="138px" CssClass="auto-style1"></asp:TextBox>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="新密码："></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style2" Width="138px"></asp:TextBox>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style3" Width="138px"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" ForeColor="#CC3300" Text="msg"></asp:Label>
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style4" Height="24px" Text="确认" Width="45px" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" CssClass="auto-style5" Height="24px" Text="清空" Width="45px" OnClick="Button2_Click" />
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
