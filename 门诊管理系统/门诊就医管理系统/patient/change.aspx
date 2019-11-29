<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change.aspx.cs" Inherits="patient_change" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 17px;
            margin-bottom: 0px;
        }
        .auto-style2 {
            margin-left: 13px;
            margin-bottom: 0px;
        }
        .auto-style3 {
            margin-left: 15px;
            margin-bottom: 0px;
        }
        .auto-style4 {
            margin-left: 91px;
            margin-bottom: 0px;
        }
        .auto-style5 {
            margin-left: 122px;
        }
        .auto-style6 {
            margin-left: 11px;
            margin-bottom: 0px;
        }
        .auto-style7 {
            margin-left: 54px;
        }
        .auto-style8 {
            margin-left: 267px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" aria-checked="undefined">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" ForeColor="#663300" Text="个人信息修改"></asp:Label>
        <br />
        <br />
        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" SelectCommand="SELECT Users.User_Name, Users.User_Nation, Users.User_Sex, Users.User_Phone, Patient.Patient_BT, Patient.Patient_Occupation, Patient.Patient_Marriage FROM Patient INNER JOIN Users ON Patient.Usercode = Users.Usercode WHERE (Users.User_ID = @Username)">
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="Username" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label2" runat="server" CssClass="auto-style4" Height="16px" Text="姓名:" Width="50px"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CausesValidation="True"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" CssClass="auto-style1" Height="16px" Text="  职业：" Width="50px"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" CssClass="auto-style2" Height="16px" Text="性别" Width="50px"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" Height="24px" Width="49px">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label5" runat="server" CssClass="auto-style3" Height="16px" Text="血型" Width="50px"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>A</asp:ListItem>
            <asp:ListItem>B</asp:ListItem>
            <asp:ListItem>AB</asp:ListItem>
            <asp:ListItem>O</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" CssClass="auto-style4" Text="民族:"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style6" ></asp:TextBox>
        <asp:Label ID="Label7" runat="server" CssClass="auto-style2" Height="16px" Text="电话号码:" Width="79px"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" CssClass="auto-style1" Text="结婚:"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>已婚</asp:ListItem>
            <asp:ListItem>未婚</asp:ListItem>
        </asp:DropDownList>
        <br />
        <p>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style5" Text="修改" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" CssClass="auto-style7" Text="查询" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="返回" />
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="auto-style8" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name" />
                    <asp:BoundField DataField="User_Nation" HeaderText="User_Nation" SortExpression="User_Nation" />
                    <asp:BoundField DataField="User_Sex" HeaderText="User_Sex" SortExpression="User_Sex" />
                    <asp:BoundField DataField="User_Phone" HeaderText="User_Phone" SortExpression="User_Phone" />
                    <asp:BoundField DataField="Patient_BT" HeaderText="Patient_BT" SortExpression="Patient_BT" />
                    <asp:BoundField DataField="Patient_Occupation" HeaderText="Patient_Occupation" SortExpression="Patient_Occupation" />
                    <asp:BoundField DataField="Patient_Marriage" HeaderText="Patient_Marriage" SortExpression="Patient_Marriage" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </p>
    </form>
</body>
</html>
