<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change.aspx.cs" Inherits="admin_search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [Usercode] = @original_Usercode AND [User_ID] = @original_User_ID AND [Password] = @original_Password AND [User_Phone] = @original_User_Phone AND (([User_Sex] = @original_User_Sex) OR ([User_Sex] IS NULL AND @original_User_Sex IS NULL)) AND (([User_Nation] = @original_User_Nation) OR ([User_Nation] IS NULL AND @original_User_Nation IS NULL)) AND [Account_Type] = @original_Account_Type AND (([User_Name] = @original_User_Name) OR ([User_Name] IS NULL AND @original_User_Name IS NULL))" InsertCommand="INSERT INTO [Users] ([User_ID], [Password], [User_Phone], [User_Sex], [User_Nation], [Account_Type], [Usercode], [User_Name]) VALUES (@User_ID, @Password, @User_Phone, @User_Sex, @User_Nation, @Account_Type, @Usercode, @User_Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Users] WHERE ([User_ID] LIKE '%' + @User_ID + '%')" UpdateCommand="UPDATE [Users] SET [User_ID] = @User_ID, [Password] = @Password, [User_Phone] = @User_Phone, [User_Sex] = @User_Sex, [User_Nation] = @User_Nation, [Account_Type] = @Account_Type, [User_Name] = @User_Name WHERE [Usercode] = @original_Usercode AND [User_ID] = @original_User_ID AND [Password] = @original_Password AND [User_Phone] = @original_User_Phone AND (([User_Sex] = @original_User_Sex) OR ([User_Sex] IS NULL AND @original_User_Sex IS NULL)) AND (([User_Nation] = @original_User_Nation) OR ([User_Nation] IS NULL AND @original_User_Nation IS NULL)) AND [Account_Type] = @original_Account_Type AND (([User_Name] = @original_User_Name) OR ([User_Name] IS NULL AND @original_User_Name IS NULL))">
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
                    <asp:ControlParameter ControlID="TextBox1" Name="User_ID" PropertyName="Text" Type="String" />
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
        </div>
        <asp:Label ID="Label1" runat="server" Text="关键字搜索："></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="搜索" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Usercode" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="User_Phone" HeaderText="User_Phone" SortExpression="User_Phone" />
                <asp:BoundField DataField="User_Sex" HeaderText="User_Sex" SortExpression="User_Sex" />
                <asp:BoundField DataField="User_Nation" HeaderText="User_Nation" SortExpression="User_Nation" />
                <asp:BoundField DataField="Account_Type" HeaderText="Account_Type" SortExpression="Account_Type" />
                <asp:BoundField DataField="Usercode" HeaderText="Usercode" ReadOnly="True" SortExpression="Usercode" />
                <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" DeleteCommand="DELETE FROM [Roles] WHERE [Roles_ID] = @original_Roles_ID AND (([Roles_Name] = @original_Roles_Name) OR ([Roles_Name] IS NULL AND @original_Roles_Name IS NULL))" InsertCommand="INSERT INTO [Roles] ([Roles_ID], [Roles_Name]) VALUES (@Roles_ID, @Roles_Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Roles.Roles_ID, Roles.Roles_Name, Users.User_Name, Users.Usercode, Users.Account_Type, Users.User_Nation, Users.User_Sex, Users.User_Phone, Users.User_ID FROM Roles INNER JOIN Users_Roles ON Roles.Roles_ID = Users_Roles.Roles_ID INNER JOIN Users ON Users_Roles.Usercode = Users.Usercode WHERE (Roles.Roles_Name = @Roles_Name)" UpdateCommand="UPDATE [Roles] SET [Roles_Name] = @Roles_Name WHERE [Roles_ID] = @original_Roles_ID AND (([Roles_Name] = @original_Roles_Name) OR ([Roles_Name] IS NULL AND @original_Roles_Name IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Roles_ID" Type="String" />
                <asp:Parameter Name="original_Roles_Name" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Roles_ID" Type="String" />
                <asp:Parameter Name="Roles_Name" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" ConvertEmptyStringToNull="False" Name="Roles_Name" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Roles_Name" Type="String" />
                <asp:Parameter Name="original_Roles_ID" Type="String" />
                <asp:Parameter Name="original_Roles_Name" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Roles_ID,Usercode" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:BoundField DataField="Roles_ID" HeaderText="Roles_ID" ReadOnly="True" SortExpression="Roles_ID" />
                <asp:BoundField DataField="Roles_Name" HeaderText="Roles_Name" SortExpression="Roles_Name" />
                <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name" />
                <asp:BoundField DataField="Usercode" HeaderText="Usercode" ReadOnly="True" SortExpression="Usercode" />
                <asp:BoundField DataField="Account_Type" HeaderText="Account_Type" SortExpression="Account_Type" />
                <asp:BoundField DataField="User_Nation" HeaderText="User_Nation" SortExpression="User_Nation" />
                <asp:BoundField DataField="User_Sex" HeaderText="User_Sex" SortExpression="User_Sex" />
                <asp:BoundField DataField="User_Phone" HeaderText="User_Phone" SortExpression="User_Phone" />
                <asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [Usercode] = @original_Usercode AND [User_ID] = @original_User_ID AND [Password] = @original_Password AND [User_Phone] = @original_User_Phone AND (([User_Sex] = @original_User_Sex) OR ([User_Sex] IS NULL AND @original_User_Sex IS NULL)) AND (([User_Nation] = @original_User_Nation) OR ([User_Nation] IS NULL AND @original_User_Nation IS NULL)) AND [Account_Type] = @original_Account_Type AND (([User_Name] = @original_User_Name) OR ([User_Name] IS NULL AND @original_User_Name IS NULL))" InsertCommand="INSERT INTO [Users] ([User_ID], [Password], [User_Phone], [User_Sex], [User_Nation], [Account_Type], [Usercode], [User_Name]) VALUES (@User_ID, @Password, @User_Phone, @User_Sex, @User_Nation, @Account_Type, @Usercode, @User_Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Users.Password AS Expr2, Users.User_Phone AS Expr3, Users.User_Sex AS Expr4, Users.User_Nation AS Expr5, Users.Account_Type AS Expr6, Users.Usercode AS Expr7, Users.User_Name AS Expr8, Users.User_ID AS Expr1, Users.*, Users_Roles.Usercode AS Expr9, Roles.Roles_Name FROM Users INNER JOIN Users_Roles ON Users.Usercode = Users_Roles.Usercode INNER JOIN Roles ON Users_Roles.Roles_ID = Roles.Roles_ID WHERE (Users.User_Name LIKE '%' + @User_Name + '%')" UpdateCommand="UPDATE [Users] SET [User_ID] = @User_ID, [Password] = @Password, [User_Phone] = @User_Phone, [User_Sex] = @User_Sex, [User_Nation] = @User_Nation, [Account_Type] = @Account_Type, [User_Name] = @User_Name WHERE [Usercode] = @original_Usercode AND [User_ID] = @original_User_ID AND [Password] = @original_Password AND [User_Phone] = @original_User_Phone AND (([User_Sex] = @original_User_Sex) OR ([User_Sex] IS NULL AND @original_User_Sex IS NULL)) AND (([User_Nation] = @original_User_Nation) OR ([User_Nation] IS NULL AND @original_User_Nation IS NULL)) AND [Account_Type] = @original_Account_Type AND (([User_Name] = @original_User_Name) OR ([User_Name] IS NULL AND @original_User_Name IS NULL))">
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
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Expr7,Usercode" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" Visible="False" />
                <asp:BoundField DataField="Expr3" HeaderText="Expr3" SortExpression="Expr3" Visible="False" />
                <asp:BoundField DataField="Expr4" HeaderText="Expr4" SortExpression="Expr4" Visible="False" />
                <asp:BoundField DataField="Expr5" HeaderText="Expr5" SortExpression="Expr5" Visible="False" />
                <asp:BoundField DataField="Expr6" HeaderText="Expr6" SortExpression="Expr6" Visible="False" />
                <asp:BoundField DataField="Expr7" HeaderText="Expr7" ReadOnly="True" SortExpression="Expr7" Visible="False" />
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" Visible="False" />
                <asp:BoundField DataField="User_ID" HeaderText="账号" SortExpression="User_ID" />
                <asp:BoundField DataField="Password" HeaderText="密码" SortExpression="Password" />
                <asp:BoundField DataField="User_Phone" HeaderText="电话号码" SortExpression="User_Phone" />
                <asp:BoundField DataField="User_Sex" HeaderText="性别" SortExpression="User_Sex" />
                <asp:BoundField DataField="User_Nation" HeaderText="民族" SortExpression="User_Nation" />
                <asp:BoundField DataField="Account_Type" HeaderText="注销" SortExpression="Account_Type" />
                <asp:BoundField DataField="Usercode" HeaderText="账号编码" ReadOnly="True" SortExpression="Usercode" />
                <asp:BoundField DataField="User_Name" HeaderText="姓名" SortExpression="User_Name" />
                <asp:BoundField DataField="Expr9" HeaderText="Expr9" SortExpression="Expr9" Visible="False" />
                <asp:BoundField DataField="Roles_Name" HeaderText="角色" SortExpression="Roles_Name" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </form>
</body>
</html>
