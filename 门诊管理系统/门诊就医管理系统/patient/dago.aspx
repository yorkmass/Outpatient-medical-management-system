<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dago.aspx.cs" Inherits="patient_dago" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Casses.Cases_ID, Casses.Illness_Desc, Casses.Illness_Time, Casses.Illness_Grade, Casses.Cure_Time, Casses.Cure_Cycle, Casses.Entry_Person_ID, Casses.Entry_Time, Casses.Remark, Casses.Patient_Name, Casses.Doctor_Name, Medicine.Medicine_Name, Patient.User_ID FROM Patient INNER JOIN Users ON Patient.Usercode = Users.Usercode INNER JOIN Casses_Patient ON Patient.Usercode = Casses_Patient.Usercode INNER JOIN Casses INNER JOIN Cases_Medicine_Detail ON Casses.Cases_ID = Cases_Medicine_Detail.Cases_ID INNER JOIN Medicine ON Cases_Medicine_Detail.Medicine_Name_ID = Medicine.Medicine_Name_ID ON Casses_Patient.Cases_ID = Casses.Cases_ID WHERE (Users.User_ID = @Username)">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Cases_ID" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Cases_ID" HeaderText="Cases_ID" ReadOnly="True" SortExpression="Cases_ID" />
                <asp:BoundField DataField="Illness_Desc" HeaderText="Illness_Desc" SortExpression="Illness_Desc" />
                <asp:BoundField DataField="Illness_Time" HeaderText="Illness_Time" SortExpression="Illness_Time" />
                <asp:BoundField DataField="Illness_Grade" HeaderText="Illness_Grade" SortExpression="Illness_Grade" />
                <asp:BoundField DataField="Cure_Time" HeaderText="Cure_Time" SortExpression="Cure_Time" />
                <asp:BoundField DataField="Cure_Cycle" HeaderText="Cure_Cycle" SortExpression="Cure_Cycle" />
                <asp:BoundField DataField="Entry_Person_ID" HeaderText="Entry_Person_ID" SortExpression="Entry_Person_ID" />
                <asp:BoundField DataField="Entry_Time" HeaderText="Entry_Time" SortExpression="Entry_Time" />
                <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
                <asp:BoundField DataField="Patient_Name" HeaderText="Patient_Name" SortExpression="Patient_Name" />
                <asp:BoundField DataField="Doctor_Name" HeaderText="Doctor_Name" SortExpression="Doctor_Name" />
                <asp:BoundField DataField="Medicine_Name" HeaderText="Medicine_Name" SortExpression="Medicine_Name" />
                <asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle ForeColor="#4A3C8C" BackColor="#E7E7FF" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </form>
</body>
</html>