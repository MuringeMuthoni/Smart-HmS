<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage.Master" CodeBehind="Logout.aspx.vb" Inherits="hospital13.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contentbody" runat="server">
    <asp:Panel ID="panel" runat="server" Height="155px" >
    <table style="margin-left:212px">
        <tr>
            <td>
                <asp:label ID ="label" runat="server"  Text="Hope to see you next time"></asp:label>
            </td>
            </tr>
        <tr>
            <td>
                <asp:Button  ID ="logout" runat="server" Text="Log Out" onclick="logout_Click"/>
            </td>
         </tr>
               
    </table>
     </asp:Panel>

</asp:Content>
