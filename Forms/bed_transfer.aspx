<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="bed_transfer.aspx.vb" Inherits="CLOUD_HIMS.bed_transfer" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:Panel ID="Panel2" runat="server">
            <table style="background-color:white">
                <tr>
                    <td style="width: 952px">
                      <h2> Bed Transfer</h2>
                    </td>
                    <td style="width:500px">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnsave" BackColor="blue" runat="server" ForeColor="White" Text="Save" style="margin-left: 1px" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        Admission NO.
                    </td>
                    <td>
                        <asp:TextBox ID="txtadmissionsearch" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnsearch" runat="server" Text="Go" />
                    </td>
                </tr>
            </table>
               <div>
                                                   <h2 style="background-color:white">Bed Transfer To</h2>
               </div>
                  
            <table>
                 <tr>

                    <td style="width: 106px">
                                            <asp:LinkButton ID="LinkButton1" runat="server">Transfer Date</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="Datepicker1" />

                    </td>
                    <td style="width: 199px;">
                        <asp:TextBox ID="Datepicker1" runat="server" Width="190px"></asp:TextBox>
                    </td>
                    <td style="width: 115px; text-align:right;">
                        Bed Category
                    </td>
                    <td style="width: 199px;">
                   <ajax:ComboBox ID="cbbedcategory" runat="server" AutoCompleteMode="Suggest"  Width="167px">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                  </ajax:ComboBox>                    </td>
                    <td style="width: 115px; text-align:right;">
                        Floor
                    </td>
                    <td style="width: 199px">
                        <asp:TextBox ID="TextBox3" runat="server" Width="190px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 82px">
                        Ward
                    </td>
                    <td style="width: 199px">
                   <ajax:ComboBox ID="cbward" runat="server" AutoCompleteMode="Suggest" Width="167px">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                  </ajax:ComboBox>
                    </td>
                    <td style="width: 115px; text-align:right;">
                        Bed NO
                    </td>
                    <td>
                   <ajax:ComboBox ID="Cbbedno" runat="server" AutoCompleteMode="Suggest"  Width="167px">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                  </ajax:ComboBox>                    </td>
                    <td style="width: 115px; text-align:right;">
                        Billing Category
                    </td>
                    <td>
                       <ajax:ComboBox ID="cbbillcategory" runat="server" AutoCompleteMode="Suggest" Width="167px"></ajax:ComboBox>
                    </td>
                </tr>

            </table>
        </asp:Panel>


                     <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>

    </asp:Panel>
</asp:Content>
