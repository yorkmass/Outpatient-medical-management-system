<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="medical_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        function check() {
            var nid = document.getElementById("Medicine_Name_IDLabel");
            if (nid == "") {
                alert("不能为空！");
                return false;
            }
        }
        </script>
</head>
    
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="搜索" />
        </div>
        <asp:ListView ID="ListView1" runat="server" onsubmit="return check()" DataKeyNames="Medicine_Name_ID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" >
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" onsubmit="return check()" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="Medicine_Name_IDLabel" runat="server" Text='<%# Eval("Medicine_Name_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StrockLabel" runat="server" Text='<%# Eval("Strock") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Medicine_NameLabel" runat="server" Text='<%# Eval("Medicine_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ManufactorLabel" runat="server" Text='<%# Eval("Manufactor") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SpecificationsLabel" runat="server" Text='<%# Eval("Specifications") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Main_ComponentsLabel" runat="server" Text='<%# Eval("Main_Components") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_RangeLabel" runat="server" Text='<%# Eval("User_Range") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_attentionLabel" runat="server" Text='<%# Eval("User_attention") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Save_WayLabel" runat="server" Text='<%# Eval("Save_Way") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" type="number" runat="server" Text='<%# Eval("Price") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" onsubmit="return check()" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </td>
                    <td>
                        <asp:Label ID="Medicine_Name_IDLabel1" runat="server" Text='<%# Eval("Medicine_Name_ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="StrockTextBox" runat="server" Text='<%# Bind("Strock") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Medicine_NameTextBox" runat="server" Text='<%# Bind("Medicine_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ManufactorTextBox" runat="server" Text='<%# Bind("Manufactor") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SpecificationsTextBox" runat="server" Text='<%# Bind("Specifications") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Main_ComponentsTextBox" runat="server" Text='<%# Bind("Main_Components") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="User_RangeTextBox" runat="server" Text='<%# Bind("User_Range") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="User_attentionTextBox" runat="server" Text='<%# Bind("User_attention") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Save_WayTextBox" runat="server" Text='<%# Bind("Save_Way") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PriceTextBox" type="number" runat="server" Text='<%# Bind("Price") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" onsubmit="return check()" CommandName="Insert" Text="插入" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    </td>
                    <td>
                        <asp:TextBox ID="Medicine_Name_IDTextBox" runat="server" Text='<%# Bind("Medicine_Name_ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="StrockTextBox" runat="server" Text='<%# Bind("Strock") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Medicine_NameTextBox" runat="server" Text='<%# Bind("Medicine_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ManufactorTextBox" runat="server" Text='<%# Bind("Manufactor") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SpecificationsTextBox" runat="server" Text='<%# Bind("Specifications") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Main_ComponentsTextBox" runat="server" Text='<%# Bind("Main_Components") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="User_RangeTextBox" runat="server" Text='<%# Bind("User_Range") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="User_attentionTextBox" runat="server" Text='<%# Bind("User_attention") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Save_WayTextBox" runat="server" Text='<%# Bind("Save_Way") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PriceTextBox" type="number" runat="server" Text='<%# Bind("Price") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="Medicine_Name_IDLabel" runat="server" Text='<%# Eval("Medicine_Name_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StrockLabel" runat="server" Text='<%# Eval("Strock") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Medicine_NameLabel" runat="server" Text='<%# Eval("Medicine_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ManufactorLabel" runat="server" Text='<%# Eval("Manufactor") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SpecificationsLabel" runat="server" Text='<%# Eval("Specifications") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Main_ComponentsLabel" runat="server" Text='<%# Eval("Main_Components") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_RangeLabel" runat="server" Text='<%# Eval("User_Range") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_attentionLabel" runat="server" Text='<%# Eval("User_attention") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Save_WayLabel" runat="server" Text='<%# Eval("Save_Way") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" type="number" runat="server" Text='<%# Eval("Price") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server"></th>
                                    <th runat="server">Medicine_Name_ID</th>
                                    <th runat="server">Strock</th>
                                    <th runat="server">Medicine_Name</th>
                                    <th runat="server">Manufactor</th>
                                    <th runat="server">Specifications</th>
                                    <th runat="server">Main_Components</th>
                                    <th runat="server">User_Range</th>
                                    <th runat="server">User_attention</th>
                                    <th runat="server">Save_Way</th>
                                    <th runat="server">Price</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="Medicine_Name_IDLabel" runat="server" Text='<%# Eval("Medicine_Name_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StrockLabel" runat="server" Text='<%# Eval("Strock") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Medicine_NameLabel" runat="server" Text='<%# Eval("Medicine_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ManufactorLabel" runat="server" Text='<%# Eval("Manufactor") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SpecificationsLabel" runat="server" Text='<%# Eval("Specifications") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Main_ComponentsLabel" runat="server" Text='<%# Eval("Main_Components") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_RangeLabel" runat="server" Text='<%# Eval("User_Range") %>' />
                    </td>
                    <td>
                        <asp:Label ID="User_attentionLabel" runat="server" Text='<%# Eval("User_attention") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Save_WayLabel" runat="server" Text='<%# Eval("Save_Way") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" type="number" runat="server" Text='<%# Eval("Price") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KS_yiyuanConnectionString %>" SelectCommand="SELECT * FROM [Medicine] WHERE ([Medicine_Name] LIKE '%' + @Medicine_Name + '%')" DeleteCommand="DELETE FROM [Medicine] WHERE [Medicine_Name_ID] = @original_Medicine_Name_ID" InsertCommand="INSERT INTO [Medicine] ([Medicine_Name_ID], [Strock], [Medicine_Name], [Manufactor], [Specifications], [Main_Components], [User_Range], [User_attention], [Save_Way], [Price]) VALUES (@Medicine_Name_ID, @Strock, @Medicine_Name, @Manufactor, @Specifications, @Main_Components, @User_Range, @User_attention, @Save_Way, @Price)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Medicine] SET [Strock] = @Strock, [Medicine_Name] = @Medicine_Name, [Manufactor] = @Manufactor, [Specifications] = @Specifications, [Main_Components] = @Main_Components, [User_Range] = @User_Range, [User_attention] = @User_attention, [Save_Way] = @Save_Way, [Price] = @Price WHERE [Medicine_Name_ID] = @original_Medicine_Name_ID">
            <DeleteParameters>
                <asp:Parameter Name="original_Medicine_Name_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Medicine_Name_ID" Type="Int32" />
                <asp:Parameter Name="Strock" Type="String" />
                <asp:Parameter Name="Medicine_Name" Type="String" />
                <asp:Parameter Name="Manufactor" Type="String" />
                <asp:Parameter Name="Specifications" Type="String" />
                <asp:Parameter Name="Main_Components" Type="String" />
                <asp:Parameter Name="User_Range" Type="String" />
                <asp:Parameter Name="User_attention" Type="String" />
                <asp:Parameter Name="Save_Way" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" ConvertEmptyStringToNull="False" Name="Medicine_Name" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Strock" Type="String" />
                <asp:Parameter Name="Medicine_Name" Type="String" />
                <asp:Parameter Name="Manufactor" Type="String" />
                <asp:Parameter Name="Specifications" Type="String" />
                <asp:Parameter Name="Main_Components" Type="String" />
                <asp:Parameter Name="User_Range" Type="String" />
                <asp:Parameter Name="User_attention" Type="String" />
                <asp:Parameter Name="Save_Way" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="original_Medicine_Name_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
