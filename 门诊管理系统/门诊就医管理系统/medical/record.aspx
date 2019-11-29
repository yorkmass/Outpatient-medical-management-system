<%@ Page Language="C#" AutoEventWireup="true" CodeFile="record.aspx.cs" Inherits="medical_record" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="查询" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Medicine_Name_ID" DataSourceID="SqlDataSource1" Height="394px" Width="1200px">
            <Columns>
                <asp:BoundField DataField="Medicine_Name" HeaderText="药品名称" SortExpression="Medicine_Name" />
                <asp:BoundField DataField="Medicine_Name_ID" HeaderText="药品编号" ReadOnly="True" SortExpression="Medicine_Name_ID" />
                <asp:BoundField DataField="Strock" HeaderText="库存" SortExpression="Strock" />
                <asp:BoundField DataField="Manufactor" HeaderText="生产厂商" SortExpression="Manufactor" />
                <asp:BoundField DataField="Specifications" HeaderText="症状" SortExpression="Specifications" />
                <asp:BoundField DataField="Main_Components" HeaderText="主要功能" SortExpression="Main_Components" />
                <asp:BoundField DataField="User_Range" HeaderText="用药" SortExpression="User_Range" />
                <asp:BoundField DataField="User_attention" HeaderText="注意事项" SortExpression="User_attention" />
                <asp:BoundField DataField="Price" HeaderText="价格" SortExpression="Price" />
                <asp:BoundField DataField="Save_Way" HeaderText="保存方式" SortExpression="Save_Way" />
                <asp:BoundField DataField="User_Name" HeaderText="患者姓名" SortExpression="User_Name" />
                <asp:BoundField DataField="Illness_Desc" HeaderText="患者症状" SortExpression="Illness_Desc" />
                <asp:BoundField DataField="Illness_Time" HeaderText="生病时间" SortExpression="Illness_Time" />
                <asp:BoundField DataField="Illness_Grade" HeaderText="病情级别" SortExpression="Illness_Grade" />
                <asp:BoundField DataField="Cure_Time" HeaderText="治疗时间" SortExpression="Cure_Time" />
                <asp:BoundField DataField="Cure_Cycle" HeaderText="治疗周期" SortExpression="Cure_Cycle" />
                <asp:BoundField DataField="Entry_Time" HeaderText="住院时间" SortExpression="Entry_Time" />
                <asp:BoundField DataField="Remark" HeaderText="备注" SortExpression="Remark" />
                <asp:BoundField DataField="Patient_Name" HeaderText="姓名" SortExpression="Patient_Name" />
                <asp:BoundField DataField="Doctor_Name" HeaderText="医生姓名" SortExpression="Doctor_Name" />
                <asp:BoundField DataField="Entry_Person_ID" HeaderText="住院号" SortExpression="Entry_Person_ID" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" SelectCommand="SELECT Medicine.Medicine_Name, Medicine.Medicine_Name_ID, Medicine.Strock, Medicine.Manufactor, Medicine.Specifications, Medicine.Main_Components, Medicine.User_Range, Medicine.User_attention, Medicine.Price, Medicine.Save_Way, Patient.User_Name, Casses.Illness_Desc, Casses.Illness_Time, Casses.Illness_Grade, Casses.Cure_Time, Casses.Cure_Cycle, Casses.Entry_Time, Casses.Remark, Casses.Patient_Name, Casses.Doctor_Name, Casses.Entry_Person_ID FROM Casses_Patient INNER JOIN Patient ON Casses_Patient.Usercode = Patient.Usercode INNER JOIN Casses ON Casses_Patient.Cases_ID = Casses.Cases_ID INNER JOIN Cases_Medicine_Detail ON Casses.Cases_ID = Cases_Medicine_Detail.Cases_ID INNER JOIN Medicine ON Cases_Medicine_Detail.Medicine_Name_ID = Medicine.Medicine_Name_ID WHERE (Medicine.Medicine_Name LIKE '%' + @Medicine_Name + '%')" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Medicine] WHERE [Medicine_Name_ID] = @original_Medicine_Name_ID AND (([Medicine_Name] = @original_Medicine_Name) OR ([Medicine_Name] IS NULL AND @original_Medicine_Name IS NULL)) AND (([Strock] = @original_Strock) OR ([Strock] IS NULL AND @original_Strock IS NULL)) AND (([Manufactor] = @original_Manufactor) OR ([Manufactor] IS NULL AND @original_Manufactor IS NULL)) AND (([Specifications] = @original_Specifications) OR ([Specifications] IS NULL AND @original_Specifications IS NULL)) AND (([Main_Components] = @original_Main_Components) OR ([Main_Components] IS NULL AND @original_Main_Components IS NULL)) AND (([User_Range] = @original_User_Range) OR ([User_Range] IS NULL AND @original_User_Range IS NULL)) AND (([User_attention] = @original_User_attention) OR ([User_attention] IS NULL AND @original_User_attention IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([Save_Way] = @original_Save_Way) OR ([Save_Way] IS NULL AND @original_Save_Way IS NULL))" InsertCommand="INSERT INTO [Medicine] ([Medicine_Name], [Medicine_Name_ID], [Strock], [Manufactor], [Specifications], [Main_Components], [User_Range], [User_attention], [Price], [Save_Way]) VALUES (@Medicine_Name, @Medicine_Name_ID, @Strock, @Manufactor, @Specifications, @Main_Components, @User_Range, @User_attention, @Price, @Save_Way)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Medicine] SET [Medicine_Name] = @Medicine_Name, [Strock] = @Strock, [Manufactor] = @Manufactor, [Specifications] = @Specifications, [Main_Components] = @Main_Components, [User_Range] = @User_Range, [User_attention] = @User_attention, [Price] = @Price, [Save_Way] = @Save_Way WHERE [Medicine_Name_ID] = @original_Medicine_Name_ID AND (([Medicine_Name] = @original_Medicine_Name) OR ([Medicine_Name] IS NULL AND @original_Medicine_Name IS NULL)) AND (([Strock] = @original_Strock) OR ([Strock] IS NULL AND @original_Strock IS NULL)) AND (([Manufactor] = @original_Manufactor) OR ([Manufactor] IS NULL AND @original_Manufactor IS NULL)) AND (([Specifications] = @original_Specifications) OR ([Specifications] IS NULL AND @original_Specifications IS NULL)) AND (([Main_Components] = @original_Main_Components) OR ([Main_Components] IS NULL AND @original_Main_Components IS NULL)) AND (([User_Range] = @original_User_Range) OR ([User_Range] IS NULL AND @original_User_Range IS NULL)) AND (([User_attention] = @original_User_attention) OR ([User_attention] IS NULL AND @original_User_attention IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([Save_Way] = @original_Save_Way) OR ([Save_Way] IS NULL AND @original_Save_Way IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Medicine_Name_ID" Type="Int32" />
                <asp:Parameter Name="original_Medicine_Name" Type="String" />
                <asp:Parameter Name="original_Strock" Type="String" />
                <asp:Parameter Name="original_Manufactor" Type="String" />
                <asp:Parameter Name="original_Specifications" Type="String" />
                <asp:Parameter Name="original_Main_Components" Type="String" />
                <asp:Parameter Name="original_User_Range" Type="String" />
                <asp:Parameter Name="original_User_attention" Type="String" />
                <asp:Parameter Name="original_Price" Type="Double" />
                <asp:Parameter Name="original_Save_Way" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Medicine_Name" Type="String" />
                <asp:Parameter Name="Medicine_Name_ID" Type="Int32" />
                <asp:Parameter Name="Strock" Type="String" />
                <asp:Parameter Name="Manufactor" Type="String" />
                <asp:Parameter Name="Specifications" Type="String" />
                <asp:Parameter Name="Main_Components" Type="String" />
                <asp:Parameter Name="User_Range" Type="String" />
                <asp:Parameter Name="User_attention" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Save_Way" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" ConvertEmptyStringToNull="False" Name="Medicine_Name" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Medicine_Name" Type="String" />
                <asp:Parameter Name="Strock" Type="String" />
                <asp:Parameter Name="Manufactor" Type="String" />
                <asp:Parameter Name="Specifications" Type="String" />
                <asp:Parameter Name="Main_Components" Type="String" />
                <asp:Parameter Name="User_Range" Type="String" />
                <asp:Parameter Name="User_attention" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Save_Way" Type="String" />
                <asp:Parameter Name="original_Medicine_Name_ID" Type="Int32" />
                <asp:Parameter Name="original_Medicine_Name" Type="String" />
                <asp:Parameter Name="original_Strock" Type="String" />
                <asp:Parameter Name="original_Manufactor" Type="String" />
                <asp:Parameter Name="original_Specifications" Type="String" />
                <asp:Parameter Name="original_Main_Components" Type="String" />
                <asp:Parameter Name="original_User_Range" Type="String" />
                <asp:Parameter Name="original_User_attention" Type="String" />
                <asp:Parameter Name="original_Price" Type="Double" />
                <asp:Parameter Name="original_Save_Way" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
