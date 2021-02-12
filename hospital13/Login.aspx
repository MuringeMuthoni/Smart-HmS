<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage.Master" CodeBehind="Login.aspx.vb" Inherits="hospital13.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contentbody"  runat="server">
    <h2>PLEASE ENTER THE BELOW DETAILS TO CONTINUE....</h2>
    <asp:Panel ID ="panel1" runat="server" Height="458px" ScrollBars="Auto" >
    <table style="margin-left:212px">     
        <tr>
            <td>
                User Name
            </td>
            <td>     
                   <asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>
                password
            </td>
            <td>
              <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" ></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Enter" runat="server" Text="Log In" Onclick="Enter_Click" />
            </td>
           </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" forecolor="red" ></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>

</asp:Content>
