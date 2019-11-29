<%@ Page Language="C#" AutoEventWireup="true" CodeFile="call.aspx.cs" Inherits="patient_call" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 31px;
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="姓名："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="挂号科室："></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>内科</asp:ListItem>
                <asp:ListItem>外科</asp:ListItem>
                <asp:ListItem>神经科</asp:ListItem>
                <asp:ListItem>脑外科</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style1" OnClick="Button1_Click" Text="预约" />
            <br />
        </div>
        <asp:Label ID="Label3" runat="server" CssClass="auto-style1" Text="挂号状态："></asp:Label>
        <asp:Label ID="Label4" runat="server" CssClass="auto-style1" Text="Label"></asp:Label>
        <asp:Label ID="Label5" runat="server" CssClass="auto-style1" Text="等待人数："></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label7" runat="server" CssClass="auto-style1" Text="挂号ID："></asp:Label>
        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
