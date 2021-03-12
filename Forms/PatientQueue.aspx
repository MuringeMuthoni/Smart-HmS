<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Nurse.Master" CodeBehind="PatientQueue.aspx.vb" Inherits="CLOUD_HIMS.PatientQueue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<div style="width:100%;background-color:darkgray">
      <div style="width:60%;float:left">
           <h2 style="padding-left:20px">QUEUE ENTRY</h2>
      </div>
   
      <div  style="text-align:right;" class="auto-style2">
           <asp:Button ID="btnsave" runat="server" Text="Save" BackColor="#000066" ForeColor="#FF9900" Width="120px" Height="40px" />
            <asp:Button ID="Btnreport" runat="server" Text="View Queue" BackColor="#FF9900" ForeColor="#000066" Width="120px" Height="40px" />
           
      </div>
      
  </div>
    <div style="height:20px"></div>
      <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>

    <asp:Panel ID="Panel1" runat="server" Width="100%">   
           
      
       
        <asp:Panel ID="Panel2" runat="server">     
        <div >
        

            <div style=" padding-left:20px;border:solid;border-color:lightslategray" >  
    <table style="width: 102%; margin-left: 0px;  margin-top: 0px;">
        <tr>

            <td style="text-align: left; height: 1px;">
                Queue No
            </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="txtqueueno" runat="server"></asp:TextBox>
            </td>
            
            <td style="text-align: left; height: 1px;">
                        Patient Reg No
              </td>
              <td style="text-align: left; height: 1px;">                                                   
                        <asp:TextBox ID="txtregno" runat="server" ></asp:TextBox>
              </td>
            
               <td style="text-align: left; height: 0px;">
                     <asp:LinkButton ID="LinkButton1" runat="server"> DOB</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="Datepicker1" />
                   </td>

            <td style="text-align: left; height: 1px;">
                       <asp:TextBox ID="Datepicker1" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="119px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                   </td>

        </tr>



        <tr>

        <td style="width: 200px">
                   Time Notified
                </td>
                <td>
               <asp:DropDownList ID="ddlTimeFrom" runat="server" ></asp:DropDownList>   
                </td>

            <td style="text-align: left; height: 1px;">
                <asp:Label ID="Lblroom" runat="server" Text="From(Room)"></asp:Label>
                   </td>

            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtfromroom" runat="server"></asp:TextBox>                                                                 
                   </td>

            <td style="text-align: left; height: 1px;">
                    To(Room)
                </td>

            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txttoroom" runat="server"></asp:TextBox>
                </td>
        </tr>



        <tr>
           
            <td style="text-align: left; height: 1px;">
                               Doctor
                    </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtdoctor" runat="server"></asp:TextBox>
                    </td>
      
       </tr>



                </table>
                </div>

            <div style="padding-left:3%;border:solid;border-color:lightslategray" >  
    <table style="width: 100%; margin-left: 0px;  border-bottom:thin; margin-top: 0px;">
                          <tr>
                        <td style="text-align: left;">
                <h3>Observation</h3>         
                </td>
       </tr>
              
         <tr>
            <td style="text-align: left; height: 1px;">
                            Observation
                  </td>

      
            <td style="text-align: left; height: 1px;">
                     
                <asp:TextBox ID="Txtnote" runat="server" Height="69px" Width="274px"></asp:TextBox>
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
    <div style="height:20px"></div>
    
                    <asp:GridView ID="GridView0" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="7"  BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                                                                                                                                                                                                                          
                                   <asp:BoundField DataField="qno"
                                       HeaderText="Queue" SortExpression="qno" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField> 

                                     <asp:BoundField DataField="arrival"
                                       HeaderText="Arrival " SortExpression="arrival" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="120px" Font-Size="Small" />
                                          </asp:BoundField>       
                                  
                                            <asp:BoundField DataField="names"
                                       HeaderText="Patient Name" SortExpression="colpatientname" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>     
                                   
                                            <asp:BoundField DataField="tel"
                                       HeaderText="Phone No" SortExpression="tel" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField>    
                                                     
                                            <asp:BoundField DataField="age"
                                       HeaderText="Age" SortExpression="age" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField>         
                                                
                                                     
                                            <asp:BoundField DataField="gender"
                                       HeaderText="Gender" SortExpression="gender" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField>         
                                                                                  
                                            <asp:BoundField DataField="paymentinfo"
                                       HeaderText="Payment info" SortExpression="Payment" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>       
                                                       
                                       <asp:ButtonField ButtonType="Button"  CommandName="view"  HeaderText="Manage Item" ItemStyle-Width="120"
                                             ImageUrl="~/src/app_resources/DESIGN/action.png" text="View" ControlStyle-Width="120"/>   
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
       


</asp:Content>
