<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="CostSetUp.aspx.vb" Inherits="CLOUD_HIMS.CostSetUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Activity"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtactivity" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Amount Type"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtamounttype" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Cost"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcost" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td></td>
                <td></td>
                <td style="text-align:right">
                    <asp:Button ID="Button1" runat="server" Text="Save" BackColor="Blue" ForeColor="White" />
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel2" runat="server">
            <asp:GridView ID="CostGrid" runat="server"  AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="13" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                 <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                   <asp:BoundField DataField="colactivity"
                                       HeaderText="Activity" SortExpression="colactivity" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField> 

                                    <asp:BoundField DataField="colamounttype"
                                       HeaderText="Amount Type " SortExpression="colamounttype" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField> 

                                    <asp:BoundField DataField="colcost"
                                       HeaderText="Cost" SortExpression="colcost" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>   
                                   </Columns>
                                             <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                             <HeaderStyle BackColor="#a9b0b9" Font-Bold="True" ForeColor="Black" />
                                             <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                             <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                             <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                             <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                             <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                             <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        </asp:Panel>


    </asp:Panel>
</asp:Content>
