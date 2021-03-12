<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Reception.Master" CodeBehind="requisition_form.aspx.vb" Inherits="CLOUD_HIMS.requisition_form" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">

        <div>
    <table style="width: 978px; margin-left: 0px; background-color:white; margin-top: 0px;">
                <tr >
                    <td style="width: 46px">
                        <asp:Image ID="Image1" runat="server" />
                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Label1" text-size="50px" runat="server" Text="Anu Roy"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="Label6" runat="server" Text="Adm.Date/Time: 31/02/2021 05:08 PM"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Label7" runat="server" Text="Female, 23 years"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label8" runat="server" Text="Payer:Private Cash"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Label2" runat="server" Text="Reg: No 29, Admission No:5"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label3" runat="server" Text="Kin Name: Puja Khan"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Label4" runat="server" Text="Femalt Ward(Medical), Bed No:FM 01"></asp:Label>
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
                       <h3>Drug/Consumable Request</h3>
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" text="search icon" runat="server" />
                    </td>
                    <td>
                        <asp:Button ID="btnsavedrug" runat="server" Text="Save" OnClick="btnsavedrug_Click" />
                    </td>
                </tr>
            </table>
            <table style="width: auto">
                <tr>
            <td style="width: 70px">
                        Order Type
            </td>
            <td style="width: 70px">
                       <ajax:ComboBox ID="cbordertype" runat="server" AutoCompleteMode="Suggest">
                       <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        </ajax:ComboBox>
                    </td>
            <td style="width: 70px">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Store*
                    </td>
            <td style="width: 70px">
                         <ajax:ComboBox ID="cbstore" runat="server" AutoCompleteMode="Suggest">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem></asp:ListItem>
                         </ajax:ComboBox>                    </td>
            <td style="width: 70px">
                      Doctor*
                    </td>
            <td style="width: 70px">
                        <ajax:ComboBox ID="cbdoctor" runat="server" AutoCompleteMode="Suggest">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        </ajax:ComboBox>
                    </td>
                </tr>
            </table>

            <table style="width: auto">
                <tr>
            <td style="width: 70px">
                        Item
                    </td>
            <td style="width: 72px">
                        <asp:TextBox ID="txtitem" runat="server" Text="search items" Width="450px" style="margin-left: 0px"></asp:TextBox>
                    </td>
                     <td style="text-align: left; height: 0px; width: 85px;">
                         &nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:LinkButton ID="LinkButton1" runat="server"> From Date</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="txtdatefrom" />
                    </td>

                    <td style="text-align: left; height: 1px; width: 172px;">
                       <asp:TextBox ID="txtdatefrom" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="119px" ></asp:TextBox>                                                                                                                                                                             
                   </td>
                </tr>
            </table>
            <table style="width: auto">
                <tr>
            <td style="width: 70px">
                       Dose*
                    </td>
                    <td>
                        <asp:TextBox ID="txtdose" runat="server" style="margin-left: 32px" Width="36px"></asp:TextBox>
                    </td>
                    <td style="width: 51px">
                         <ajax:ComboBox ID="cbdose" runat="server" AutoCompleteMode="Suggest">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        </ajax:ComboBox>
                    </td>
                    <td>
                        <asp:Button ID="btnsavedose" runat="server" Text="Save" OnClick="btnsavedose_Click" Width="59px" />
                    </td>
                    <td>
                        Frequency*
                    </td>
                    <td>
                         <ajax:ComboBox ID="cbfrequency" runat="server" AutoCompleteMode="Suggest">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        </ajax:ComboBox>
                    </td>
                    <td>
                        Duration
                    </td>
                    <td>
                        <asp:TextBox ID="txtduration" runat="server" ></asp:TextBox>
                    </td>
                    <td>
                         <ajax:ComboBox ID="cbduration" runat="server" AutoCompleteMode="Suggest">
                        <asp:ListItem>Day</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        </ajax:ComboBox>
                    </td>
                    <td>
                        <asp:Button ID="btnchangedosetime" runat="server" OnClick="btnchangedosetime_Click" />
                    </td>
                </tr>
            </table>
            <table style="width: auto">
                    <tr>
                        <td style="width: 70px">
                            Route
                        </td>
                        <td style="width: 188px">
                              <ajax:ComboBox ID="cbroute" runat="server" AutoCompleteMode="Suggest">
                              <asp:ListItem>select</asp:ListItem>
                              <asp:ListItem></asp:ListItem>
                               </ajax:ComboBox>                      
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                      
                        </td>
                        <td>
                            &nbsp;Food Relation
                        </td>
                        <td>
                            
                              <ajax:ComboBox ID="cbfood" runat="server" AutoCompleteMode="Suggest">
                              <asp:ListItem>select</asp:ListItem>
                              <asp:ListItem></asp:ListItem>
                               </ajax:ComboBox>     
                        </td>
                    </tr>
            </table>

            <table style="width: auto">
                <tr> 
                    <td style="width: 70px">
                        Instructions
                    </td>
                    <td>
                        <asp:TextBox ID="txtinstruction" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Quantity
                    </td>
                    <td>
                        <asp:TextBox ID="txtquantity" runat="server"></asp:TextBox>
                    </td>
                </tr> 
            </table>
            <table style="width: auto">
                <tr>
                    <td>
                        <h3>Item Details</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        SN
                    </td>
                    <td>

                    </td>
                </tr>
            </table >
        </div>


    </asp:Panel>
            <asp:ScriptManager ID="manager1" runat="server"></asp:ScriptManager>

</asp:Content>
