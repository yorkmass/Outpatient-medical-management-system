<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detial.aspx.cs" Inherits="doctor_detial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" DeleteCommand="DELETE FROM [Register] WHERE [Key1] = @original_Key1 AND [Register_ID] = @original_Register_ID AND (([User_ID] = @original_User_ID) OR ([User_ID] IS NULL AND @original_User_ID IS NULL)) AND (([Patient_Name] = @original_Patient_Name) OR ([Patient_Name] IS NULL AND @original_Patient_Name IS NULL)) AND (([Departement_ID] = @original_Departement_ID) OR ([Departement_ID] IS NULL AND @original_Departement_ID IS NULL)) AND [Reqister_State] = @original_Reqister_State" InsertCommand="INSERT INTO [Register] ([Register_ID], [User_ID], [Patient_Name], [Departement_ID], [Reqister_State]) VALUES (@Register_ID, @User_ID, @Patient_Name, @Departement_ID, @Reqister_State)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Register] WHERE (([Reqister_State] = @Reqister_State) AND ([Departement_ID] = @Departement_ID))" UpdateCommand="UPDATE [Register] SET [Register_ID] = @Register_ID, [User_ID] = @User_ID, [Patient_Name] = @Patient_Name, [Departement_ID] = @Departement_ID, [Reqister_State] = @Reqister_State WHERE [Key1] = @original_Key1 AND [Register_ID] = @original_Register_ID AND (([User_ID] = @original_User_ID) OR ([User_ID] IS NULL AND @original_User_ID IS NULL)) AND (([Patient_Name] = @original_Patient_Name) OR ([Patient_Name] IS NULL AND @original_Patient_Name IS NULL)) AND (([Departement_ID] = @original_Departement_ID) OR ([Departement_ID] IS NULL AND @original_Departement_ID IS NULL)) AND [Reqister_State] = @original_Reqister_State">
            <DeleteParameters>
                <asp:Parameter Name="original_Key1" Type="Int32" />
                <asp:Parameter Name="original_Register_ID" Type="String" />
                <asp:Parameter Name="original_User_ID" Type="String" />
                <asp:Parameter Name="original_Patient_Name" Type="String" />
                <asp:Parameter Name="original_Departement_ID" Type="String" />
                <asp:Parameter Name="original_Reqister_State" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Register_ID" Type="String" />
                <asp:Parameter Name="User_ID" Type="String" />
                <asp:Parameter Name="Patient_Name" Type="String" />
                <asp:Parameter Name="Departement_ID" Type="String" />
                <asp:Parameter Name="Reqister_State" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Reqister_State" SessionField="call_ing" Type="String" />
                <asp:SessionParameter Name="Departement_ID" SessionField="depid" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Register_ID" Type="String" />
                <asp:Parameter Name="User_ID" Type="String" />
                <asp:Parameter Name="Patient_Name" Type="String" />
                <asp:Parameter Name="Departement_ID" Type="String" />
                <asp:Parameter Name="Reqister_State" Type="String" />
                <asp:Parameter Name="original_Key1" Type="Int32" />
                <asp:Parameter Name="original_Register_ID" Type="String" />
                <asp:Parameter Name="original_User_ID" Type="String" />
                <asp:Parameter Name="original_Patient_Name" Type="String" />
                <asp:Parameter Name="original_Departement_ID" Type="String" />
                <asp:Parameter Name="original_Reqister_State" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Key1" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Register_ID" HeaderText="挂号ID" SortExpression="Register_ID" />
                    <asp:BoundField DataField="User_ID" HeaderText="用户账号" SortExpression="User_ID" />
                    <asp:BoundField DataField="Patient_Name" HeaderText="病人姓名" SortExpression="Patient_Name" />
                    <asp:BoundField DataField="Departement_ID" HeaderText="科室号" SortExpression="Departement_ID" />
                    <asp:BoundField DataField="Reqister_State" HeaderText="挂号状态" SortExpression="Reqister_State" />
                    <asp:BoundField DataField="Key1" HeaderText="序号" InsertVisible="False" ReadOnly="True" SortExpression="Key1" />
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
        </div>
    </form>
</body>
</html>
