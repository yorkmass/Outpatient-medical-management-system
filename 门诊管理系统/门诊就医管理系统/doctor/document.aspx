<%@ Page Language="C#" AutoEventWireup="true" CodeFile="document.aspx.cs" Inherits="doctor_document" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" DeleteCommand="DELETE FROM [Casses] WHERE [Cases_ID] = @original_Cases_ID AND (([Illness_Desc] = @original_Illness_Desc) OR ([Illness_Desc] IS NULL AND @original_Illness_Desc IS NULL)) AND (([Illness_Time] = @original_Illness_Time) OR ([Illness_Time] IS NULL AND @original_Illness_Time IS NULL)) AND (([Illness_Grade] = @original_Illness_Grade) OR ([Illness_Grade] IS NULL AND @original_Illness_Grade IS NULL)) AND (([Cure_Time] = @original_Cure_Time) OR ([Cure_Time] IS NULL AND @original_Cure_Time IS NULL)) AND (([Cure_Cycle] = @original_Cure_Cycle) OR ([Cure_Cycle] IS NULL AND @original_Cure_Cycle IS NULL)) AND (([Entry_Person_ID] = @original_Entry_Person_ID) OR ([Entry_Person_ID] IS NULL AND @original_Entry_Person_ID IS NULL)) AND (([Entry_Time] = @original_Entry_Time) OR ([Entry_Time] IS NULL AND @original_Entry_Time IS NULL)) AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([Patient_Name] = @original_Patient_Name) OR ([Patient_Name] IS NULL AND @original_Patient_Name IS NULL)) AND (([Doctor_Name] = @original_Doctor_Name) OR ([Doctor_Name] IS NULL AND @original_Doctor_Name IS NULL))" InsertCommand="INSERT INTO [Casses] ([Cases_ID], [Illness_Desc], [Illness_Time], [Illness_Grade], [Cure_Time], [Cure_Cycle], [Entry_Person_ID], [Entry_Time], [Remark], [Patient_Name], [Doctor_Name]) VALUES (@Cases_ID, @Illness_Desc, @Illness_Time, @Illness_Grade, @Cure_Time, @Cure_Cycle, @Entry_Person_ID, @Entry_Time, @Remark, @Patient_Name, @Doctor_Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Casses] WHERE ([Doctor_Name] = @Doctor_Name)" UpdateCommand="UPDATE [Casses] SET [Illness_Desc] = @Illness_Desc, [Illness_Time] = @Illness_Time, [Illness_Grade] = @Illness_Grade, [Cure_Time] = @Cure_Time, [Cure_Cycle] = @Cure_Cycle, [Entry_Person_ID] = @Entry_Person_ID, [Entry_Time] = @Entry_Time, [Remark] = @Remark, [Patient_Name] = @Patient_Name, [Doctor_Name] = @Doctor_Name WHERE [Cases_ID] = @original_Cases_ID AND (([Illness_Desc] = @original_Illness_Desc) OR ([Illness_Desc] IS NULL AND @original_Illness_Desc IS NULL)) AND (([Illness_Time] = @original_Illness_Time) OR ([Illness_Time] IS NULL AND @original_Illness_Time IS NULL)) AND (([Illness_Grade] = @original_Illness_Grade) OR ([Illness_Grade] IS NULL AND @original_Illness_Grade IS NULL)) AND (([Cure_Time] = @original_Cure_Time) OR ([Cure_Time] IS NULL AND @original_Cure_Time IS NULL)) AND (([Cure_Cycle] = @original_Cure_Cycle) OR ([Cure_Cycle] IS NULL AND @original_Cure_Cycle IS NULL)) AND (([Entry_Person_ID] = @original_Entry_Person_ID) OR ([Entry_Person_ID] IS NULL AND @original_Entry_Person_ID IS NULL)) AND (([Entry_Time] = @original_Entry_Time) OR ([Entry_Time] IS NULL AND @original_Entry_Time IS NULL)) AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([Patient_Name] = @original_Patient_Name) OR ([Patient_Name] IS NULL AND @original_Patient_Name IS NULL)) AND (([Doctor_Name] = @original_Doctor_Name) OR ([Doctor_Name] IS NULL AND @original_Doctor_Name IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Cases_ID" Type="String" />
                    <asp:Parameter Name="original_Illness_Desc" Type="String" />
                    <asp:Parameter Name="original_Illness_Time" Type="DateTime" />
                    <asp:Parameter Name="original_Illness_Grade" Type="String" />
                    <asp:Parameter Name="original_Cure_Time" Type="DateTime" />
                    <asp:Parameter Name="original_Cure_Cycle" Type="String" />
                    <asp:Parameter Name="original_Entry_Person_ID" Type="String" />
                    <asp:Parameter Name="original_Entry_Time" Type="DateTime" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                    <asp:Parameter Name="original_Patient_Name" Type="String" />
                    <asp:Parameter Name="original_Doctor_Name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Cases_ID" Type="String" />
                    <asp:Parameter Name="Illness_Desc" Type="String" />
                    <asp:Parameter Name="Illness_Time" Type="DateTime" />
                    <asp:Parameter Name="Illness_Grade" Type="String" />
                    <asp:Parameter Name="Cure_Time" Type="DateTime" />
                    <asp:Parameter Name="Cure_Cycle" Type="String" />
                    <asp:Parameter Name="Entry_Person_ID" Type="String" />
                    <asp:Parameter Name="Entry_Time" Type="DateTime" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="Patient_Name" Type="String" />
                    <asp:Parameter Name="Doctor_Name" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Doctor_Name" SessionField="doctor" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Illness_Desc" Type="String" />
                    <asp:Parameter Name="Illness_Time" Type="DateTime" />
                    <asp:Parameter Name="Illness_Grade" Type="String" />
                    <asp:Parameter Name="Cure_Time" Type="DateTime" />
                    <asp:Parameter Name="Cure_Cycle" Type="String" />
                    <asp:Parameter Name="Entry_Person_ID" Type="String" />
                    <asp:Parameter Name="Entry_Time" Type="DateTime" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="Patient_Name" Type="String" />
                    <asp:Parameter Name="Doctor_Name" Type="String" />
                    <asp:Parameter Name="original_Cases_ID" Type="String" />
                    <asp:Parameter Name="original_Illness_Desc" Type="String" />
                    <asp:Parameter Name="original_Illness_Time" Type="DateTime" />
                    <asp:Parameter Name="original_Illness_Grade" Type="String" />
                    <asp:Parameter Name="original_Cure_Time" Type="DateTime" />
                    <asp:Parameter Name="original_Cure_Cycle" Type="String" />
                    <asp:Parameter Name="original_Entry_Person_ID" Type="String" />
                    <asp:Parameter Name="original_Entry_Time" Type="DateTime" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                    <asp:Parameter Name="original_Patient_Name" Type="String" />
                    <asp:Parameter Name="original_Doctor_Name" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Cases_ID" DataSourceID="SqlDataSource1">
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
