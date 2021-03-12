<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="Out_patient_medical_dispense.aspx.vb" Inherits="CLOUD_HIMS.Out_patient_medical_dispense" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">  
        <asp:Panel ID="Panel3" runat="server"> 
        <asp:Panel ID="Panel2" runat="server">
            <table>
                <tr>
                    <td style="width: 311px">
                       <h3>  Out-Patient Medicine Dispense </h3>
                    </td>
                    <td style="width: 360px">
                        <asp:TextBox ID="TextBox1" runat="server" Text="Pharmacy dispensary" Width="141px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Save" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
            <asp:Panel ID="Panel4" runat="server"></asp:Panel>
            <asp:Panel ID="Panel5" runat="server">
                <table>
                    <tr>
                        <td style="width: 53px">
                            Reg.No
                        </td>
                        <td style="width: 145px">
                            <asp:TextBox ID="txtregno" runat="server" Width="139px"></asp:TextBox>
                        </td>
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

                    </tr>
                    <tr>
                        <td style="width: 53px">
                            Status
                        </td>
                        <td style="width: 145px">
                            <asp:TextBox ID="txtstatus" runat="server" Width="139px"></asp:TextBox>
                        </td>
                         <td style="text-align: Right; height: 0px; width: 105px;">
                            Patient Name
                        </td>
                        <td style="width: 145px">
                            <asp:TextBox ID="txtpatientname" runat="server" style="margin-left: 0px" Width="139px"></asp:TextBox>
                        </td>
                    </tr>
                </table>

            </asp:Panel>
            <h1>need 2 Grid Views Below</h1>
            <h1>TIME At-> 16:29</h1>
        </asp:Panel>
    </asp:Panel>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
</asp:Content>
