<%@ Page Language="C#" AutoEventWireup="true" CodeFile="last.aspx.cs" Inherits="medical_last" %>

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
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <Series>
                <asp:Series ChartType="Radar" Name="Series1" XValueMember="Medicine_Name" YValueMembers="Price">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" SelectCommand="SELECT * FROM [Medicine]"></asp:SqlDataSource>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1">
            <Series>
                <asp:Series Name="Series1" XValueMember="Strock" YValueMembers="Medicine_Name_ID">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource1">
            <Series>
                <asp:Series ChartType="Spline" Name="Series1" XValueMember="Strock" YValueMembers="Medicine_Name_ID" YValuesPerPoint="2">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查询" />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Medicine_Name_ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Medicine_Name_ID" HeaderText="Medicine_Name_ID" ReadOnly="True" SortExpression="Medicine_Name_ID" />
                <asp:BoundField DataField="Strock" HeaderText="Strock" SortExpression="Strock" />
                <asp:BoundField DataField="Medicine_Name" HeaderText="Medicine_Name" SortExpression="Medicine_Name" />
                <asp:BoundField DataField="Manufactor" HeaderText="Manufactor" SortExpression="Manufactor" />
                <asp:BoundField DataField="Specifications" HeaderText="Specifications" SortExpression="Specifications" />
                <asp:BoundField DataField="Main_Components" HeaderText="Main_Components" SortExpression="Main_Components" />
                <asp:BoundField DataField="User_Range" HeaderText="User_Range" SortExpression="User_Range" />
                <asp:BoundField DataField="User_attention" HeaderText="User_attention" SortExpression="User_attention" />
                <asp:BoundField DataField="Save_Way" HeaderText="Save_Way" SortExpression="Save_Way" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" SelectCommand="SELECT * FROM [Medicine] WHERE ([Medicine_Name] LIKE '%' + @Medicine_Name + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" ConvertEmptyStringToNull="False" Name="Medicine_Name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
