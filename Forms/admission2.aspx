<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="admission2.aspx.vb" Inherits="CLOUD_HIMS.admission2" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .roundedcorner{
            font-size:11pt;
            margin-left:auto;
            margin-right:auto;
            margin-top:1px;
            margin-bottom:1px;
            padding:3px;
            border-top: 1px solid;
            border-left:1px solid;
            border-right:1px solid;
            border-bottom:1px solid;
            -moz-border-radius: 8px;
            -webkit-border-radius:8px;
        }
        .background{
            background-color:black;
            filter: alpha(opacity=90);
            opacity:0.8;

        }
        .popup {
            background-color:#162036;
            border-width:3px;
            border-style:solid;
            border-color:black;
            padding-top:10px;
            padding-left: 10px;
            width:400px;
            height:100px;

        }
         .auto-style1 {
             width: 105px;
         }
         .auto-style3 {
             width: 91px;
         }
         .auto-style4 {
             width: 207px;
         }
         .auto-style5 {
             height: 26px;
         }
         .auto-style8 {
             width: 195px;
         }
         .auto-style9 {
             height: 26px;
             width: 87px;
         }
         .auto-style10 {
             width: 87px;
         }
         .auto-style11 {
             height: 26px;
             width: 173px;
         }
         .auto-style12 {
             width: 173px;
         }
         .auto-style13 {
             height: 26px;
             width: 112px;
         }
         .auto-style14 {
             height: 466px;
         }
         .auto-style15 {
             height: 26px;
             width: 172px;
         }
    </style>



    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Panel ID="Pnltest" runat="server"  CssClass="popup roundedcorner">
          <div style="padding:2px;padding-left:380px">
                    <asp:Button ID="Btnclose" runat="server" Text="X" BackColor="snow" ForeColor="indigo" Height="38px" Width="22px" />                
           </div>
        <table>
            <tr>
                <td class="auto-style1" >
                    <asp:Label ID="Label1" runat="server" Text=" Bed Category" ForeColor="white"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtroom" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align:right">
                    <asp:Button ID="btnsavepop" runat="server" Text="SAVE" ForeColor="White"  BackColor="DarkBlue" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Btnaddnew" PopupControlID="Pnltest"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlFloorname" runat="server"  CssClass="popup roundedcorner">
         <div style="padding:2px;padding-left:380px">
                    <asp:Button ID="btnclose1" runat="server" Text="X" BackColor="snow" ForeColor="indigo" Height="38px" Width="22px" />                
           </div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text=" Floor Name" ForeColor="white"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtfloorname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align:right">
                    <asp:Button ID="btnsavefloorname" runat="server" Text="Save" backcolor="darkBlue" ForeColor="white"/>
                </td>
            </tr>
        </table>
    </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnaddnewfloor" PopupControlID="pnlFloorname"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlward" runat="server" CssClass="popup roundedcorner">
         <div style="padding:2px;padding-left:380px">
                    <asp:Button ID="btnclose2" runat="server" Text="X" BackColor="snow" ForeColor="indigo" Height="38px" Width="22px" />                
           </div>
        <table>
            <tr>
                <td>
                     <asp:Label ID="Label3" runat="server" Text="Ward" ForeColor="white"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtward" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td style="text-align:right">
                    <asp:Button ID="Button1" runat="server" Text="Save" BackColor="DarkBlue"  ForeColor="White"/>
                </td>
            </tr>
        </table>
    </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="btnaddward" PopupControlID="pnlward"></ajaxToolkit:ModalPopupExtender>

    <asp:Panel ID="pnlbedno" runat="server" CssClass="popup roundedcorner">
         <div style="padding:2px;padding-left:380px">
                    <asp:Button ID="btnclose3" runat="server" Text="X" BackColor="snow" ForeColor="indigo" Height="38px" Width="22px" />                
           </div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Bed NO" ForeColor="white"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtbedno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnsavebedno" runat="server" Text="Save" BackColor="DarkBlue"  ForeColor="White"/>
                </td>
            </tr>
        </table>
    </asp:Panel>
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender4" runat="server" TargetControlID="btnaddbeddno" PopupControlID="pnlbedno"></ajaxToolkit:ModalPopupExtender>




    <asp:Panel ID="Panel1" runat="server" Height="475px">
        
        <div style=" padding-left:20px;border:solid;border-color:lightslategray" class="auto-style14" >    
        <div >    
            
            <table>
                <tr>
                    <td>
                        Reg No:
                    </td>
                    <td>
                        <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
                    </td>
                    <td>
                <asp:ImageButton ID="imgpatientsearch" runat="server" Height="21px" ImageUrl="~/src/app_resources/imgs/Searchpatient.png" Width="17px" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtregno" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
                        <div style=" padding-left:20px;border:solid;border-color:lightslategray;border-left:none" >  
    <table style="width: 102%; margin-left: 0px;  margin-top: 0px;">
        <tr>

             <td class="auto-style9">
                       Patient Name
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtpatientname" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
            <td>
                Middle Name
            </td>
            <td>
               <asp:TextBox ID="txtmiddlename" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                Last Name
            </td>
            <td>
             <asp:TextBox ID="txtlastname" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
           

        </tr>



        <tr>

             
                    <td class="auto-style10">
                        G-mail
                    </td>
                    <td class="auto-style12">
                        <asp:TextBox ID="txtaddress" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
            <td class="auto-style13">
                        Patient Gender
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtogender" runat="server"></asp:TextBox>
<%--                      <ajax:ComboBox ID="cbogender" runat="server"></ajax:ComboBox>--%>
<%--                <asp:DropDownList ID="Dpogender" runat="server" Width="178px"></asp:DropDownList>--%>
                    </td>  
            <td class="auto-style13">
                        Patient Telephone
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtpatienttel" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
        </tr>



  

                </table>
                </div>
                    <h3>Admission Details</h3>         
                    <div style="width:50%; float:left;">
                                                <table>
                    <tr>
                        <td class="auto-style3" >
                            Floor Name
                        </td>
                        <td>
                                <ajax:ComboBox ID="cbfloorname" runat="server"></ajax:ComboBox>

<%--                           <asp:DropDownList ID="Dpfloornam" runat="server" Width="128px"></asp:DropDownList>--%>
                        </td>
                        <td>
                            <asp:Button ID="btnaddnewfloor" runat="server" Text="Add New" />
                        </td>
                    </tr>
                     <tr>
                        <td class="auto-style3" >
                             Ward
                         </td>
                         <td>
                             <ajax:ComboBox ID="cbward" runat="server"></ajax:ComboBox>
<%--                                <asp:DropDownList ID="Dpward" runat="server" Width="128px"></asp:DropDownList>--%>
                         </td>
                         <td>
                             <asp:Button ID="btnaddward" runat="server" Text="Add New" />
                         </td>
                     </tr>
                    <tr>
                        <td class="auto-style3" >
                            Bed NO
                        </td>
                        <td>
                                      <ajax:ComboBox ID="cbbedno" runat="server"></ajax:ComboBox>
<%--                         <asp:DropDownList ID="Dpbedno" runat="server" Width="128px"></asp:DropDownList>--%>
                        </td>
                        <td>
                            <asp:Button ID="btnaddbeddno" runat="server" Text="Add new" />
                        </td>
                    </tr>
                     </table>

                <table> 
                    <tr>
                        <td class="auto-style3" >
                            Doctor Name
                        </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtdoctor" runat="server" Width="196px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
             <table>              
         <tr>
             <td style="text-align: left; " class="auto-style3">
                     <asp:LinkButton ID="LinkButton1" runat="server" forecolor="blue">Admission Date</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="Datepicker1" />
                   </td>

            <td style="text-align: left;" class="auto-style4">
                       <asp:TextBox ID="Datepicker1" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="196px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                   </td>   
             </tr>
                 </table>


                        <table>
                            <tr>   

                        <td class="auto-style3" >
                        Bed Category
                    </td>
                    <td>
                           <ajax:ComboBox ID="cbbedcategory" runat="server"></ajax:ComboBox>
<%--                        <asp:DropDownList ID="Dpbedcategory" runat="server" Width="128px"></asp:DropDownList>--%>
                            <asp:Button ID="Btnaddnew" runat="server" Text="Add New" />
                    </td>
 </tr>
                 </table>


                        <table>
                            <tr>
                        <td class="auto-style3" >
                        Admission Cost
                    </td>
                    <td>
                        <asp:TextBox ID="txtcost" runat="server" Width="196px"></asp:TextBox>
                    </td>
        </tr>
             </table>
                                    <table>
                <tr>
                        <td class="auto-style3" >
                            Illnes
                        </td>
                        <td>
                            <textarea id="TextArea1" runat="server" rows="2" class="auto-style8"></textarea>
                        </td>
                </tr>
            </table>
<table>
    <tr>
        <td style="width:150px; text-align:right">
            <asp:Button ID="btnsavedata" runat="server" Text="SAVE" BackColor="DarkBlue" ForeColor="White" />
        </td>
    </tr>
</table>

            </div>

              


        <div >    
            <table>
            </table>
        </div>
            
      
            </div>
    </asp:Panel>


           <asp:Panel ID="Panel2" runat="server">     
        <div >
        



    

                   </div>
                 </asp:Panel>
           


</asp:Content>
