<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="son_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style type="text/css">
        .text1 {
            margin-left: 300px;
            margin-bottom: 0px;
        } 
        .text2 {
            margin-left: 200px;
            margin-bottom: 0px;
        }
            .auto-style1 {
                margin-left: 0px;
                margin-bottom: 0px;
            }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" SelectCommand="SELECT User_Name, User_ID, User_Nation, User_Sex, User_Phone FROM Users WHERE (User_ID = @Username)">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" DataSourceID="SqlDataSource1" GridLines="None">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="User_Name" HeaderText="姓名" SortExpression="User_Name" />
                <asp:BoundField DataField="User_ID" HeaderText="账号" SortExpression="User_ID" />
                <asp:BoundField DataField="User_Nation" HeaderText="民族" SortExpression="User_Nation" />
                <asp:BoundField DataField="User_Sex" HeaderText="性别" SortExpression="User_Sex" />
                <asp:BoundField DataField="User_Phone" HeaderText="电话号码" SortExpression="User_Phone" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </form>
</body>
</html>
