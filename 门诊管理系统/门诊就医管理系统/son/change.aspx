<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change.aspx.cs" Inherits="son_change" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [Usercode] = @original_Usercode AND (([User_Name] = @original_User_Name) OR ([User_Name] IS NULL AND @original_User_Name IS NULL)) AND (([User_Nation] = @original_User_Nation) OR ([User_Nation] IS NULL AND @original_User_Nation IS NULL)) AND (([User_Sex] = @original_User_Sex) OR ([User_Sex] IS NULL AND @original_User_Sex IS NULL)) AND [User_Phone] = @original_User_Phone" InsertCommand="INSERT INTO [Users] ([User_Name], [User_Nation], [User_Sex], [User_Phone], [Usercode]) VALUES (@User_Name, @User_Nation, @User_Sex, @User_Phone, @Usercode)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [User_Name], [User_Nation], [User_Sex], [User_Phone], [Usercode] FROM [Users] WHERE ([User_ID] = @User_ID)" UpdateCommand="UPDATE [Users] SET [User_Name] = @User_Name, [User_Nation] = @User_Nation, [User_Sex] = @User_Sex, [User_Phone] = @User_Phone WHERE [Usercode] = @original_Usercode AND (([User_Name] = @original_User_Name) OR ([User_Name] IS NULL AND @original_User_Name IS NULL)) AND (([User_Nation] = @original_User_Nation) OR ([User_Nation] IS NULL AND @original_User_Nation IS NULL)) AND (([User_Sex] = @original_User_Sex) OR ([User_Sex] IS NULL AND @original_User_Sex IS NULL)) AND [User_Phone] = @original_User_Phone">
            <DeleteParameters>
                <asp:Parameter Name="original_Usercode" Type="String" />
                <asp:Parameter Name="original_User_Name" Type="String" />
                <asp:Parameter Name="original_User_Nation" Type="String" />
                <asp:Parameter Name="original_User_Sex" Type="String" />
                <asp:Parameter Name="original_User_Phone" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_Name" Type="String" />
                <asp:Parameter Name="User_Nation" Type="String" />
                <asp:Parameter Name="User_Sex" Type="String" />
                <asp:Parameter Name="User_Phone" Type="String" />
                <asp:Parameter Name="Usercode" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="User_ID" SessionField="Username" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Name" Type="String" />
                <asp:Parameter Name="User_Nation" Type="String" />
                <asp:Parameter Name="User_Sex" Type="String" />
                <asp:Parameter Name="User_Phone" Type="String" />
                <asp:Parameter Name="original_Usercode" Type="String" />
                <asp:Parameter Name="original_User_Name" Type="String" />
                <asp:Parameter Name="original_User_Nation" Type="String" />
                <asp:Parameter Name="original_User_Sex" Type="String" />
                <asp:Parameter Name="original_User_Phone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Usercode" DataSourceID="SqlDataSource1" GridLines="None">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="User_Name" HeaderText="姓名" SortExpression="User_Name" />
                <asp:BoundField DataField="User_Nation" HeaderText="民族" SortExpression="User_Nation" />
                <asp:BoundField DataField="User_Sex" HeaderText="性别" SortExpression="User_Sex" />
                <asp:BoundField DataField="User_Phone" HeaderText="电话号码" SortExpression="User_Phone" />
                <asp:BoundField DataField="Usercode" HeaderText="Usercode" ReadOnly="True" SortExpression="Usercode" Visible="False" />
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
