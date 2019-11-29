<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="patient_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" SelectCommand="SELECT Users.User_ID AS 用户账号, Users.User_Name AS 姓名, Users.User_Nation AS 国家, Users.User_Sex AS 性别, Roles.Roles_Name AS 身份, Patient.Patient_BT AS 血型, Users.User_Phone AS 手机号码, Patient.Patient_Occupation AS 职业, Patient.Patient_Marriage AS 结婚, Users.Account_Type AS 使用中 FROM Users INNER JOIN Users_Roles ON Users.User_ID = Users_Roles.User_ID INNER JOIN Roles ON Users_Roles.Roles_ID = Roles.Roles_ID CROSS JOIN Patient WHERE (Users.User_ID = @Username)">
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="Username" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label1" runat="server" BackColor="White" BorderColor="White" ForeColor="#663300" Text="个人信息"></asp:Label>
&nbsp;<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="用户账号" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="16px" Width="480px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#333399" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="用户账号" HeaderText="用户账号" ReadOnly="True" SortExpression="用户账号">
                <ControlStyle BorderColor="Fuchsia" />
                </asp:BoundField>
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="国家" HeaderText="民族" SortExpression="国家" />
                <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" />
                <asp:BoundField DataField="身份" HeaderText="身份" SortExpression="身份" />
                <asp:BoundField DataField="血型" HeaderText="血型" SortExpression="血型" />
                <asp:BoundField DataField="手机号码" HeaderText="手机号码" SortExpression="手机号码" />
                <asp:BoundField DataField="职业" HeaderText="职业" SortExpression="职业" />
                <asp:BoundField DataField="结婚" HeaderText="结婚" SortExpression="结婚" />
                <asp:BoundField DataField="使用中" HeaderText="使用中" SortExpression="使用中" />
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>
    </form>
</body>
</html>
