<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="blood_transfusion_reaction.aspx.vb" Inherits="CLOUD_HIMS.blood_transfusion_reaction" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
            <div>
         <table style="width: 1078px; margin-left: 0px;">
                <tr >
                    <td style="width: 46px">
                        <asp:Image ID="Image1" runat="server" />
                    </td>
                    <td style="width: 357px">
                        <asp:Label ID="Label1" text-size="50px" runat="server" Text="Anu Roy"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="Label6" runat="server" Text="Adm.Date/Time: 31/02/2021 05:08 PM"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 357px">
                        <asp:Label ID="Label7" runat="server" Text="Female, 23 years"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label8" runat="server" Text="Payer:Private Cash"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 357px">
                        <asp:Label ID="Label2" runat="server" Text="Reg: No 29, Admission No:5"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label3" runat="server" Text="Kin Name: Puja Khan"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 357px">
                        <asp:Label ID="Label4" runat="server" Text="Female Ward(Medical), Bed No:FM 01"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label5" runat="server" Text="Kin Mobile No:0786599844"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <h3>
                            Blood Transfusion Reaction
                        </h3>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Save" BackColor="Blue" ForeColor="White" Font-Bold="true" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 250px">
                        Transfusion Reaction NO.
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Go" BackColor="Blue" ForeColor="White"/>
                    </td>
                    <td style="width: 239px; text-align:right">
                        Blood Transfusion No.
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Go" BackColor="Blue" ForeColor="White" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        Blood Group
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 277px; text-align:right">
                        Initial Diagnosis
                    </td>
                    <td>
                         <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Reasons For Giving Blood/Blood Products
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 277px; text-align:right">
                        Pre-Transfusion HB
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Donor Blood Group
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 277px; text-align:right">
                        Batch No.on Bag
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        X-match No.
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 277px; text-align:right">
                        Expiry Date
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                    </td>
                </tr>
         </table>

                <table>
                <tr>
                     <td style="text-align: left; height: 0px; width: 252px;">
                     <asp:LinkButton ID="LinkButton1" runat="server">Date and Time Transfusion Started</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="Datepicker1" />
                      </td>

                       <td style="text-align: left; height: 1px;">
                       <asp:TextBox ID="Datepicker1" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="90px" Height="16px"></asp:TextBox>  
                          <asp:DropDownList ID="ddlTimeFrom" runat="server" Width="80px"></asp:DropDownList>                                                                                                                                                                           
                       </td>
                     <td style="text-align: right; height: 0px; width: 278px;">
                     <asp:LinkButton ID="LinkButton2" runat="server">Date and Time Of onset Of Symptoms</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton2" TargetControlID="TextBox11" />
                      </td>

                       <td style="text-align: left; height: 1px;">
                       <asp:TextBox ID="TextBox11" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="90px" Height="16px"></asp:TextBox>  
                          <asp:DropDownList ID="DropDownList1" runat="server" Width="80px"></asp:DropDownList>                                                                                                                                                                           
                       </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        Time Transfusion Stopped
                    </td>
                    <td>
                             <asp:DropDownList ID="DropDownList2" runat="server" Width="80px"></asp:DropDownList>                                                                                                                                                                           
                    </td>
                    <td>
                        Volume Of Blood/Blood Product Given Before Symptoms Started
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Rate At Which Blood Was Transfused
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Does Patient Have Allergy?
                    </td>
                    <td>
                        <asp:RadioButton ID="RadioButton1" runat="server" Text="Yes" />
                        <asp:RadioButton ID="RadioButton2" runat="server" text="No"/>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
</asp:Content>
