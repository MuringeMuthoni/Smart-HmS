<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="Out_patient_op_sale.aspx.vb" Inherits="CLOUD_HIMS.Out_patient_op_sale" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div style="width:100%">
        <div style="padding-left:20px;float:left;width:70%">
             <h2 style="padding-left:20px;"> Patient Details</h2>

        </div>
         <div style="padding-left:20px;float:left;width:10%">
            
              <asp:Button ID="Button4"  CssClass="roundedcorner"  runat="server" OnClick="btnsave_Click" Text="SAVE" style="margin-left: 0px" Width="144px" Height="41px" />
        </div>
    </div>
   
    <asp:Panel ID="Panel7" runat="server" Width="100%">   
        
         <div style="width:100%;padding-left:1%;height:8%">
            <div style="float:left;width:40%">
               <table>
              
               </table>
            </div>
          
          <div style="float:left;width:30%">
              <table>
                  <tr>
                      <td>
                          <asp:CheckBox ID="Chknewborn" runat="server" />
                      </td>
                      <td>
                          <asp:Label ID="LblChknewborn" runat="server" Text="New born"></asp:Label>
                      </td>
                  </tr>
              </table>
            </div>
         </div>
       
        <asp:Panel ID="Panel8" runat="server">     
        <div >
        

            <div style=" padding-left:20px;border:solid;border-color:lightslategray" >  
    <table style="width: 102%; margin-left: 0px;  margin-top: 0px;">
             <tr>
                       <td>
                             <asp:Label ID="LblissueSale" runat="server" Text="Issue Sale"></asp:Label>
                       </td>    
                       <td>
                           <asp:DropDownList ID="Dpoissuesale" runat="server"></asp:DropDownList>
                           </td>
                      
                             
           
            

            <td style="text-align: left; height: 1px;">
              Issue No
            </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                <asp:Button ID="Button5" runat="server" Text="search" BackColor="#000066" ForeColor="#FF9900" />
            </td>
            
            <td style="text-align: left; height: 1px;">
                        Payer
              </td>
              <td style="text-align: left; height: 1px;">                                                   
                  <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
              </td>
            

       

       


                        
                       
                   </tr>
        <tr>

            <td style="text-align: left; height: 1px;">
              Reg No
            </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="txtregno" runat="server"></asp:TextBox>
                <asp:Button ID="Btnregnosearch" runat="server" Text="search" BackColor="#000066" ForeColor="#FF9900" />
            </td>
            
            <td style="text-align: left; height: 0px;">
                     <asp:LinkButton ID="LinkButton2" runat="server"> Issue Date</asp:LinkButton>
                     <ajax:CalendarExtender ID="Calissuedate" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="Datepicker1" />
                   </td>

            <td style="text-align: left; height: 1px;">
                       <asp:TextBox ID="Txtissuedate" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="119px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                   </td>
            <td style="text-align: left; height: 1px;">
                Patient Type
            </td>
              <td style="text-align: left; height: 1px;">                                                   
                <asp:TextBox ID="txtpatienttype" runat="server"></asp:TextBox>
            </td>

        </tr>



        <tr>

            <td style="text-align: left; height: 0px;">
                <asp:Label ID="Lblname" runat="server" Text="Name"></asp:Label> 
                   </td>

            <td style="text-align: left; height: 1px;">
                       <asp:TextBox ID="Datepicker1" runat="server"  BorderStyle="None" ClientIDMode="Static" Width="119px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                   </td>

            <td style="text-align: left; height: 1px;">
                <asp:Label ID="Lblorders" runat="server" Text="Orders"></asp:Label>
                   </td>

            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtorders" runat="server"></asp:TextBox> 
                 <asp:Button ID="Btnordersearch" runat="server" Text="search" BackColor="#000066" ForeColor="#FF9900" />                                                                
                   </td>

            <td style="text-align: left; height: 1px;">
                    Doctor
                </td>

            <td style="text-align: left; height: 1px;">
                <asp:DropDownList ID="Dpodoctor" runat="server"></asp:DropDownList>
                </td>
        </tr>



        <tr>
            <td style="text-align: left; height: 1px;">
                     Age
                  </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtage" runat="server"></asp:TextBox>
                    </td>
            <td style="text-align: left; height: 1px;">
                                 Mobile
                    </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtmobile" runat="server"></asp:TextBox>
                    </td>
            <td style="text-align: left; height: 1px;">
                <asp:CheckBox ID="Chkissuetopatient" runat="server" />     
                    </td>
            <td style="text-align: left; height: 1px;">
                <asp:Label ID="Lblissuetopatient" runat="server" Text="Issue To Patient"></asp:Label>
                         </td>
       </tr>



      
                </table>
                </div>

            <div style="padding-left:3%;border:solid;border-color:lightslategray" >  
    <table style="width: 100%; margin-left: 0px;  border-bottom:thin; margin-top: 10px;">
                       
              
         <tr>
            <td style="text-align: left; width: 314px;">
                <asp:CheckBox ID="Chksubsituterequired" runat="server" />    
                <asp:Label ID="Lblsubsituterequired" runat="server" Text="Subsitute Required"></asp:Label> 
                    </td>
          

                        <td style="text-align: left; height: 1px; width: 106px;">
                Generic
                 </td>

                        <td style="text-align: left; height: 1px; width: 143px;">
                            <asp:DropDownList ID="Dpogeneric" runat="server"></asp:DropDownList>
                 </td>
                        <td style="text-align: left; height: 1px; width: 151px;">
                                     Profile Item
                                 </td>
                        <td style="text-align: left; height: 1px;">
                            <asp:DropDownList ID="Dpoprofileitem" runat="server"></asp:DropDownList>   
                                 </td>
        </tr>

             </table>
                </div>

    

                   </div>
                 </asp:Panel>
           
        
            </asp:Panel>
    <div style="text-align:center">
         <asp:Label ID="lblmsg" runat="server" ></asp:Label>

    </div>
   









    
               
     <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
</asp:Content>
