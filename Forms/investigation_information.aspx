<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="investigation_information.aspx.vb" Inherits="CLOUD_HIMS.investigation_information" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:Panel ID="Panel2" runat="server">
            <table>
                <tr>
                    <td>
                                    <h3>Investigation Information</h3>

                    </td>
                    <td>
                        <asp:Button ID="btnsamplecollection" runat="server" Text="Sample collection" />
                    </td>
                    <td>
                        <asp:Button ID="btndispatchtolab" runat="server" Text="Dispatch To Lab" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server"></asp:Panel>
        <asp:Panel ID="Panel4" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:label ID="lblneworder" runat="server" Height="50px" font-size="Large" Text="New Order 0" />
                    </td>
                    <td>
                        <asp:label ID="lblstatorder" BackColor="Orange" Height="50px" runat="server" font-size="Large" Text="Stat Order 0" />
                    </td>
                    <td>
                        <asp:label ID="lblpartialsample" BackColor="#666633" Height="50px" runat="server" font-size="Large" Text="Partial Sample 0" />
                    </td>
                    <td>
                        <asp:label ID="lblsamplecollecte" backcolor="#00ccff" Height="50px" runat="server" font-size="Large" Text="Sample Collected 0" />
                    </td>
                    <td>
                        <asp:label ID="lbldispatch" runat="server" BackColor="#336699" Height="50px" font-size="Large" Text="Dispatch To Lab 1" />
                    </td>
                    <td>
                        <asp:label ID="lbltotalpatient" runat="server" font-size="Large" Height="50px" Text="Total Patient 1" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel5" runat="server"></asp:Panel>
        <asp:Panel ID="Panel6" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:RadioButton ID="RadioButton1" Text="all" runat="server" />
                    </td>
                     <td>
                        <asp:RadioButton ID="RadioButton2" runat="server" Text="Out-Patient" />
                    </td> <td>
                        <asp:RadioButton ID="RadioButton3" runat="server" Text="In-Patient" />
                    </td> <td>
                        <asp:RadioButton ID="RadioButton4" runat="server" Text="Package" />
                    </td> <td>
                        <asp:RadioButton ID="RadioButton5" runat="server" Text="ER" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel7" runat="server"></asp:Panel>
        <asp:Panel ID="Panel8" runat="server">

            <table>
                <tr>
                      <td style="text-align: Right; height: 0px; width: 105px;">
                     <asp:LinkButton ID="LinkButton1" runat="server">From Date</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="Datepicker1" />
                   </td>

            <td style="text-align: left; height: 1px; width: 145px;">
                       <asp:TextBox ID="Datepicker1" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="141px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                   </td>
                    <td style="text-align: right; height: 0px; width: 105px;">
                     <asp:LinkButton ID="LinkButton2" runat="server">To Date</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton2" TargetControlID="TextBox2" />
                   </td>

            <td style="text-align: left; height: 1px; width: 145px;">
                       <asp:TextBox ID="TextBox2" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="139px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                   </td>
                    <td>
                        <asp:TextBox ID="txtlab_no" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Button" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <h1>At 19:32</h1>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
    </asp:Panel>
</asp:Content>
