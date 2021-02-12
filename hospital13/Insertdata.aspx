<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage.Master" CodeBehind="Insertdata.aspx.vb" Inherits="hospital13.WebForm1" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    HOME
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btn-primary {
            margin-left: 2px;
        }
    </style>
   <style type="text/css">
                            .MyCalendar .ajax__calendar_container {
                            border:1px solid #646464;
                            background-color: lemonchiffon;
                            color: red;
                        }

                        .auto-style17 {
           width: 131px;
       }

  </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contentbody" runat="server">
    <asp:MultiView ID="MultiView1" runat="server" activeviewindex="0">
        <asp:View ID="View1" runat="server">
            <h2 style="height: 37px">Insert Patient Details</h2>
            <div>
                <table style="margin-left:20px">
                   
                     <tr>
                       <td style="text-align:right">
                            Patient name
                        </td>
                        <td>
                            <asp:TextBox ID="txtname" runat="server" ></asp:TextBox>
                        </td>
                    </tr>

                     <tr>
                       <td style="text-align:right">
                            Contact
                        </td>
                        <td>
                            <asp:TextBox ID="txtpatiectcontact" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                       <td style="text-align:right">
                           medicine
                        </td>
                        <td>
                            <asp:TextBox ID="txtmedicine" runat="server" TextMode="MultiLine"  ></asp:TextBox>
                        </td>
                         </tr>
                          <tr>
                              
                       <td style="text-align:right">
                            Patient diagnosed
                        </td>
                        <td>
                            <asp:TextBox ID="txtdiagnosed" runat="server" TextMode="MultiLine" ></asp:TextBox>
                        </td>
                    </tr>
                          <tr>
                       <td style="text-align:right">
                            Patient Condition
                        </td>
                        <td>
                            <asp:TextBox ID="txtcondition" runat="server" ></asp:TextBox>
                        </td>
                    
                    </tr>
                    <tr>
                        <td>
                            Age
                        </td>
                        <td>
                            <asp:TextBox ID="txtage"  runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                              
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>                     
                     
                        </td>
                    </tr>
                  <tr>
                   
                                 <td style="text-align:right;width:30%" class="auto-style1" > 
                                                    <asp:LinkButton ID="imgones" runat="server">appointment date</asp:LinkButton>                                                                                      
                                                        &nbsp;<ajax:calendarextender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" PopupButtonID="imgones" TargetControlID="datepicker" />

                                                </td>
                                                <td style="text-align: left; ">
                                                      <asp:TextBox ID="datepicker" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="119px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                                                    </td>
                                         </tr>
                  <tr>
                      <td colspan="2" style="text-align:center">
                          <asp:Button ID="Button1" runat="server" Text="Next" CssClass="btn btn-primary" Width="62px" />
                      </td>
                  </tr>


                </table>


                
                 </div>
            <br /> 

        <br />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div>
            <h2">INSERT NEXT OF KIN DETAILS</h2>
            <br />
                 <table style="margin-left:20px">
                     <tr>
                         <td style="text-align: left; ">
                             Next Of Kin Name
                         </td>
                         <td class="auto-style17">
                             <asp:TextBox ID="txtnextkin" runat="server"></asp:TextBox>
                         </td>
                     </tr>

                      <tr>
                         <td style="text-align: left; ">
                             Next Of Kin Contact
                         </td>
                         <td class="auto-style17">
                             <asp:TextBox ID="txtcontact" runat="server"></asp:TextBox>

                         </td>
               </tr>
             <tr>

                         <td style="text-align: left; ">
                              Next of kin Gender
                          </td>
                         <td class="auto-style17">
               <ajax:ComboBox ID="kincbage" runat="server" AutoCompleteMode="Suggest">
                   <asp:ListItem>Male</asp:ListItem>
                   <asp:ListItem>Female</asp:ListItem>
                                  </ajax:ComboBox>
                          </td>
                     </tr>

                     <tr>
                         <td colspan="2" style="text-align:center">
                                         <asp:Button ID="Button3" runat="server" Text="save" OnClick ="Button3_Click" Width="59px" />

                         </td>
                     </tr>

                     <tr>
                         <td colspan="2" style="text-align:center">
                                                     <asp:Button ID="Button2" runat="server" style="margin-left: 12px" Text="Previous page" />


                         </td>
                     </tr>
                      </table>
                <table>
                    <asp:Calendar ID="calender1" runat="server" visible="false"></asp:Calendar>
                </table>
              
            
            </div>

            <br />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server">
           </asp:Panel>
            <br />
            <br />
            <br />
        </asp:View>

    </asp:MultiView>

</asp:Content>