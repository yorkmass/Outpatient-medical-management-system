<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="doctor_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" SelectCommand="SELECT Users.User_Name, Users.User_ID, Users.User_Nation, Users.User_Sex, Users.User_Phone, Doctor.Doctor_Title, Doctor.Doctor_Hospital, Doctor.Departement_ID, Department.Departement_Name FROM Doctor INNER JOIN Users ON Doctor.Usercode = Users.Usercode INNER JOIN User_Doctor ON Doctor.Usercode = User_Doctor.Usercode INNER JOIN Department ON Doctor.Departement_ID = Department.Departement_ID WHERE (Doctor.User_ID = @Username)">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1" GridLines="None">
            <Columns>
                <asp:BoundField DataField="User_Name" HeaderText="姓名" SortExpression="User_Name" />
                <asp:BoundField DataField="User_ID" HeaderText="账号" SortExpression="User_ID" />
                <asp:BoundField DataField="User_Nation" HeaderText="民族" SortExpression="User_Nation" />
                <asp:BoundField DataField="User_Sex" HeaderText="性别" SortExpression="User_Sex" />
                <asp:BoundField DataField="User_Phone" HeaderText="电话号码" SortExpression="User_Phone" />
                <asp:BoundField DataField="Doctor_Title" HeaderText="职称" SortExpression="Doctor_Title" />
                <asp:BoundField DataField="Doctor_Hospital" HeaderText="医院" SortExpression="Doctor_Hospital" />
                <asp:BoundField DataField="Departement_ID" HeaderText="部门编号" SortExpression="Departement_ID" />
                <asp:BoundField DataField="Departement_Name" HeaderText="部门" SortExpression="Departement_Name" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
    </form>
</body>
</html>
