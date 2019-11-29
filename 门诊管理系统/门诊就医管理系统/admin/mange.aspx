<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mange.aspx.cs" Inherits="admin_mange" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 93px;
            margin-top: 0px;
            margin-bottom: 12px;
        }
        .auto-style2 {
            margin-left: 7px;
            margin-bottom: 0px;
        }
        .auto-style3 {
            margin-left: 112px;
        }
        .auto-style4 {
            margin-left: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="请输入姓名：" CssClass="auto-style3"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style4"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查询" CssClass="auto-style2" />
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [Usercode] = @original_Usercode AND [User_ID] = @original_User_ID AND [Password] = @original_Password AND [User_Phone] = @original_User_Phone AND (([User_Sex] = @original_User_Sex) OR ([User_Sex] IS NULL AND @original_User_Sex IS NULL)) AND (([User_Nation] = @original_User_Nation) OR ([User_Nation] IS NULL AND @original_User_Nation IS NULL)) AND [Account_Type] = @original_Account_Type AND (([User_Name] = @original_User_Name) OR ([User_Name] IS NULL AND @original_User_Name IS NULL))" InsertCommand="INSERT INTO [Users] ([User_ID], [Password], [User_Phone], [User_Sex], [User_Nation], [Account_Type], [Usercode], [User_Name]) VALUES (@User_ID, @Password, @User_Phone, @User_Sex, @User_Nation, @Account_Type, @Usercode, @User_Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Users.User_ID, Users.Password, Users.User_Phone, Users.User_Sex, Users.User_Nation, Users.Account_Type, Users.Usercode, Users.User_Name, Users_Roles.Usercode AS Expr1, Roles.Roles_Name, Roles.Roles_ID FROM Users INNER JOIN Users_Roles ON Users.Usercode = Users_Roles.Usercode INNER JOIN Roles ON Users_Roles.Roles_ID = Roles.Roles_ID WHERE (Users.User_Name LIKE '%' + @User_Name + '%')" UpdateCommand="UPDATE [Users] SET [User_ID] = @User_ID, [Password] = @Password, [User_Phone] = @User_Phone, [User_Sex] = @User_Sex, [User_Nation] = @User_Nation, [Account_Type] = @Account_Type, [User_Name] = @User_Name WHERE [Usercode] = @original_Usercode AND [User_ID] = @original_User_ID AND [Password] = @original_Password AND [User_Phone] = @original_User_Phone AND (([User_Sex] = @original_User_Sex) OR ([User_Sex] IS NULL AND @original_User_Sex IS NULL)) AND (([User_Nation] = @original_User_Nation) OR ([User_Nation] IS NULL AND @original_User_Nation IS NULL)) AND [Account_Type] = @original_Account_Type AND (([User_Name] = @original_User_Name) OR ([User_Name] IS NULL AND @original_User_Name IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Usercode" Type="String" />
                    <asp:Parameter Name="original_User_ID" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_User_Phone" Type="String" />
                    <asp:Parameter Name="original_User_Sex" Type="String" />
                    <asp:Parameter Name="original_User_Nation" Type="String" />
                    <asp:Parameter Name="original_Account_Type" Type="Int32" />
                    <asp:Parameter Name="original_User_Name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="User_ID" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="User_Phone" Type="String" />
                    <asp:Parameter Name="User_Sex" Type="String" />
                    <asp:Parameter Name="User_Nation" Type="String" />
                    <asp:Parameter Name="Account_Type" Type="Int32" />
                    <asp:Parameter Name="Usercode" Type="String" />
                    <asp:Parameter Name="User_Name" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" ConvertEmptyStringToNull="False" Name="User_Name" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="User_ID" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="User_Phone" Type="String" />
                    <asp:Parameter Name="User_Sex" Type="String" />
                    <asp:Parameter Name="User_Nation" Type="String" />
                    <asp:Parameter Name="Account_Type" Type="Int32" />
                    <asp:Parameter Name="User_Name" Type="String" />
                    <asp:Parameter Name="original_Usercode" Type="String" />
                    <asp:Parameter Name="original_User_ID" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_User_Phone" Type="String" />
                    <asp:Parameter Name="original_User_Sex" Type="String" />
                    <asp:Parameter Name="original_User_Nation" Type="String" />
                    <asp:Parameter Name="original_Account_Type" Type="Int32" />
                    <asp:Parameter Name="original_User_Name" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Usercode,Roles_ID" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="101px" Width="727px" AllowPaging="True" CssClass="auto-style1" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="User_Name" HeaderText="姓名" SortExpression="User_Name" />
                    <asp:BoundField DataField="User_ID" HeaderText="账号" SortExpression="User_ID" />
                    <asp:BoundField DataField="Password" HeaderText="密码" SortExpression="Password" />
                    <asp:BoundField DataField="User_Phone" HeaderText="电话号码" SortExpression="User_Phone" />
                    <asp:BoundField DataField="User_Sex" HeaderText="性别" SortExpression="User_Sex" />
                    <asp:BoundField DataField="User_Nation" HeaderText="民族" SortExpression="User_Nation" />
                    <asp:BoundField DataField="Account_Type" HeaderText="注销" SortExpression="Account_Type" />
                    <asp:BoundField DataField="Usercode" HeaderText="账号编码" ReadOnly="True" SortExpression="Usercode" />
                    <asp:BoundField DataField="Expr1" HeaderText="账号编码" SortExpression="Expr1" Visible="False" />
                    <asp:BoundField DataField="Roles_Name" HeaderText="角色" SortExpression="Roles_Name" />
                    <asp:BoundField DataField="Roles_ID" HeaderText="角色编码" ReadOnly="True" SortExpression="Roles_ID" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                    <FooterStyle Width="100px" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
