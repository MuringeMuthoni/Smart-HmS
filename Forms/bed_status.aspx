<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="bed_status.aspx.vb" Inherits="CLOUD_HIMS.bed_status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <h3>Bed Status</h3>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
        <table>
            <tr>
                <td style="width: 72px">
                    Search ON
                </td>
                <td style="width: 160px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td style="width: 72px; text-align:right;">
                    Ward
                </td>
                <td style="width: 159px">
                    <asp:TextBox ID="TextBox2" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" backcolor="Blue" forecolor="white" Text="Check" />
                </td>
            </tr>
        </table>
        <h1>At 27:30</h1>

    </asp:Panel>

</asp:Content>
