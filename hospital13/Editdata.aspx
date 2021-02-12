<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage.Master" CodeBehind="Editdata.aspx.vb" Inherits="hospital13.Editdata" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Contentbody" runat="server">
     <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex ="0">
        <asp:View ID="View1" runat="server">
   <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Height="482px">
            <h2>Update And Delete Data</h2>
            <table style="width: 313px; margin-left: 237px; background-color:lightblue;">
                <tr>
                      <td>
                        Enter patient name to continue 
                    </td>  
                </tr>
                <tr>
                    <td >
                      ENTER patient Name
                    </td>
                    <td>
                    <asp:TextBox ID="txtsearch" runat="server" Width="143px"></asp:TextBox>
                    </td>
                    <td>
                                        <asp:Button ID="Button1" runat="server" Text="GO" backcolor="green" OnClick="Button1_Click1" />

                    </td>
                </tr>              
                 <tr>
                    <td>
                        NAME
                    </td>
                     <td>
                                         <asp:TextBox ID="txtname" runat="server" Width="142px"></asp:TextBox>

                     </td>
                </tr> 

                <tr>
                    <td>
                        MEDICATION
                    </td>
                    <td>
                           <asp:TextBox ID="txtmedication" runat="server" Width="142px"></asp:TextBox>

                    </td>
                </tr>
                 <tr>
                    <td>
                        DIAGNOSED
                    </td>
                      <td>
                          <asp:TextBox ID="txtdiagnosed" runat="server" Width="144px"></asp:TextBox>

                    </td>
                </tr>
                 <tr>
                    <td>
                        AGE
                    </td>
                      <td>
                            <asp:TextBox ID="txtage" runat="server" Width="147px"></asp:TextBox>

                    </td>
                </tr> 
                <tr>
                    <td>
                         P.NO
                    </td>
                     <td>
                           <asp:TextBox ID="txtcontact" runat="server" Width="144px"></asp:TextBox>

                    </td>
                </tr> 
                <tr >
                      <td colspan="2" style="text-align:center">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" BackColor="LightGreen" OnClick ="btnUpdate_Click" />
                    </td>
                    
                </tr>
                <tr>
                     <td colspan="2" style="text-align:center">
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" BackColor ="OrangeRed" OnClick ="btnDelete_Click" />
                    </td>
                </tr>
            </table>
 
            <asp:GridView ID="DGVhistory" runat="server" HeaderStyle-BackColor="black" ForeColor="LIGHTGreen" style="margin-left: 13px; margin-top: 0px;" Width="648px" BackColor="Black" Font-Size ="large" Font-Bold ="true" Font-Italic="fALSE" Height="229px" HeaderStyle-ForeColor="Lime"></asp:GridView>

            </asp:Panel>
        </asp:View>
    </asp:MultiView>
</asp:Content>
