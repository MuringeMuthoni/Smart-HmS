<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="Out_patient_billing.aspx.vb" Inherits="CLOUD_HIMS.Out_patient_billing" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div style="width:100%;background-color:darkgray">
      <div style="width:40%;float:left">
           <h2 style="padding-left:20px">OUT-PATIENT BILLING</h2>
      </div>
   
      <div  style="text-align:right;width:60%;" class="auto-style2">
           <asp:Button ID="btnsave" runat="server" Text="Save" BackColor="#1d1a42" ForeColor="#FF9900" Width="120px" Height="40px" />

            <asp:Button ID="Btncheckvitals" runat="server" Text="Check Vitals" BackColor="#1d1a42" ForeColor="#FF9900" Width="120px" Height="40px" />

      </div>
      
  </div>
   


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
            background-color:#23223d;
            border-width:3px;
            border-style:solid;
            border-color:black;
            padding-top:10px;
            padding-left: 10px;
            width:56%;
            height:32%;

        }
        
         </style>
  


   
   <div style="height:20px"></div>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
    <asp:Panel ID="Panel3" runat="server">
                <div style="padding-left:3%;border:solid;border-color:lightslategray" >  
    <table style="width: 100%; margin-left: 0px;  border-bottom:thin; margin-top: 0px;">
                          <tr>
                        <td style="text-align: left;">
                            <asp:Label ID="Lblpatientreg" runat="server" Text="Patient Reg"></asp:Label>  
                </td>
                              <td>
                                  <asp:TextBox ID="Txtpatientregno" runat="server"></asp:TextBox>
                                   <asp:Button ID="Btnsearch" runat="server" Text="Search" BackColor="#000066" ForeColor="Yellow" />
                              </td>
                             
       </tr>
              
         <tr>
            <td style="text-align: left; height: 1px;">
                             First Name
                  </td>

            <td style="text-align: left; height: 1px;">
                 <asp:TextBox ID="txtpatientfname" runat="server" style="margin-left: 0px"></asp:TextBox>
                 </td>

                        <td style="text-align: left; height: 1px;">
                            Last name
                 </td>

                        <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="txtpatientlname" runat="server" style="margin-left: 0px" ></asp:TextBox>
                 </td>
                        <td style="text-align: left; height: 1px;">
                                     Age
                                 </td>
                        <td style="text-align: left; height: 1px;">
                                     <asp:TextBox runat="server" Id="txtage"></asp:TextBox>
                                 </td>
        </tr>

             </table>
                </div>

    


    </asp:Panel>



    <asp:Panel ID="Panel1" runat="server" Width="100%">   
           
      
       
        <asp:Panel ID="Panel2" runat="server">     
        <div >
        

            <div style="padding-left:20px;border:solid;border-color:lightslategray" >  
    <table style="width: 102%; margin-left: 0px;  margin-top: 0px;">
        <tr>

            <td style="text-align: left; height: 1px;">
                Activity
            </td>
            <td style="text-align: left; height: 1px;">
                <ajax:ComboBox ID="cbactivity" runat="server"></ajax:ComboBox>
<%--                <asp:TextBox ID="Txtactivity" runat="server"></asp:TextBox> --%>
             
            </td>
            
            <td style="text-align: left; height: 1px;">
                       Amount Type
              </td>
              <td style="text-align: left; height: 1px;">     
                    <ajax:ComboBox ID="cbamounttype" runat="server"></ajax:ComboBox>
                                 
<%--                         <asp:TextBox ID="Txtamounttype" runat="server"></asp:TextBox> --%>
              </td>
            <td style="text-align: left; height: 1px;">
                Value
            </td>
              <td style="text-align: left; height: 1px;">                                                   
                <asp:TextBox ID="txtValue" runat="server"></asp:TextBox>
            </td>

        </tr>



        <tr>

           
            <td style="text-align: left; height: 1px;">
                <asp:Label ID="Lblservicename" runat="server" Text="Service Name"></asp:Label>
                   </td>

            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtservicename" runat="server"></asp:TextBox>                                                                 
                   </td>

            <td style="text-align: left; height: 1px;">
                    Doctor
                </td>

            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtdoc" runat="server"></asp:TextBox> 
                </td>
              <td style="text-align: left; height: 1px;">
                    Amount
                </td>

            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtamo" runat="server"></asp:TextBox>
                </td>
        </tr>



        <tr>
            <td style="text-align: left; height: 1px;">
                             Discount
                  </td>
            <td style="text-align: left; height: 1px;">
                 <asp:TextBox ID="Txtdiscount" runat="server"></asp:TextBox>
                    </td>
            <td style="text-align: left; height: 1px;">
                                Unit
                    </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtunit" runat="server"></asp:TextBox>
                    </td>
            <td style="text-align: left; height: 1px;">
                           Net Amount
                    </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtnetamount" runat="server"></asp:TextBox> 
                         </td>
       </tr>



        <tr>

            <td style="text-align: left; height: 1px;">
                                Co-pay
                   </td>
            <td style="text-align: left; height: 1px;">
                          <asp:TextBox Id="txtcopay" runat="server"></asp:TextBox>
                   </td>
            <td style="text-align: left; height: 1px;">
                                   Company Amount
                   </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtcompanyamo" runat="server"></asp:TextBox>
                    </td>
            <td style="text-align: left; height: 1px;">
                           Patient Amo
                    </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtpatientamo" runat="server"></asp:TextBox>      
                  </td>

        </tr>



        <tr>

            <td style="text-align: left; height: 1px;">
                             Receive Amount
                   </td>
            <td style="text-align: left; height: 1px;">
                         <asp:TextBox ID="txtrecieveamo" runat="server"></asp:TextBox>
                   </td>
              <td style="text-align: left; height: 1px;">
                            Balance Amount
                   </td>
            <td style="text-align: left; height: 1px;">
                         <asp:TextBox ID="TxtBalance" runat="server"></asp:TextBox>
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
   <div>
                     <asp:GridView ID="Grdoutpatientbilling" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="14" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                      <asp:BoundField DataField="id"
                                       HeaderText="Activity" SortExpression="id" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField> 
                                                                                                                                                                                                                                          
                                   <asp:BoundField DataField="colactivity"
                                       HeaderText="Activity" SortExpression="colactivity" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField> 

                                     <asp:BoundField DataField="colamounttype"
                                       HeaderText="Amount Type " SortExpression="colamounttype" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="120px" Font-Size="Small" />
                                          </asp:BoundField>       
                                  
                                            <asp:BoundField DataField="colvalue"
                                       HeaderText="Value" SortExpression="colvalue" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>     
                                   
                                            <asp:BoundField DataField="colservicename"
                                       HeaderText="Service Name" SortExpression="colservicename" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField>    
                                                     
                                            <asp:BoundField DataField="coldoctor"
                                       HeaderText="Doctor" SortExpression="coldoctor" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField>         
                                                
                                                     
                                            <asp:BoundField DataField="colamount"
                                       HeaderText="Amount" SortExpression="colamount" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField>         
                                                                                  
                                            <asp:BoundField DataField="coldiscount"
                                       HeaderText="Discount" SortExpression="coldiscount" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>       
                                                       
                                                                               
                                            <asp:BoundField DataField="colunit"
                                       HeaderText="Unit" SortExpression="colunit" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>     
                                                                            
                                            <asp:BoundField DataField="colnetamount"
                                       HeaderText="Net Amount" SortExpression="colnetamount" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>  

                                         <asp:BoundField DataField="colcopay"
                                       HeaderText="Co-Pay" SortExpression="colcopay" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField> 

                                      <asp:BoundField DataField="colcompanyamount"
                                       HeaderText="Company Amount" SortExpression="colcompanyamount" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField> 

                                      <asp:BoundField DataField="colpatientamo"
                                       HeaderText="Patient Amount" SortExpression="colpatientamo" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>

                                    <asp:BoundField DataField="colreceiveamo"
                                       HeaderText="Recieved Amount" SortExpression="colreceiveamo" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>

                                      <asp:BoundField DataField="colballance"
                                       HeaderText="Balance" SortExpression="colballance" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>

                                       <asp:ButtonField ButtonType="Button"  CommandName="view"  HeaderText="Manage Item" ItemStyle-Width="120"
                                             ImageUrl="~/src/app_resources/DESIGN/action.png" text="Print" ControlStyle-Width="120"/>   
                                            </Columns> 
                    
                                             <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                             <HeaderStyle BackColor="#a9b0b9" Font-Bold="True" ForeColor="Black" />
                                             <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                             <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                             <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                             <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                             <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                             <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                         </asp:GridView>

   </div>
</asp:Content>
