<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="patient_list.aspx.vb" Inherits="CLOUD_HIMS.patient_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="">
        <div style="padding-left:20px">
            <h1 style="color:indigo">Patient List</h1>
        </div>
        <div style="height:20px"></div>
        
         <div style="background-color:greenyellow; width:100%;">
             <div style=" padding-left:20px;float:left;width:25%">
                 <table>
                     
                  <tr>
                <td >
               Search By Ward
            </td>          
            <td >
                <asp:TextBox ID="Txtward" runat="server" Width="128px" Height="32px"></asp:TextBox>
            </td>
            </tr>
                 </table>
                

             </div>
             <div style="float:left;width:30%">

                      <table>
                 <tr>
                      <td style=" text-align:right">
                  Search By  Doctor's name
                </td>
                  <td style="width: 85px">
                <asp:TextBox ID="Txtdoc" runat="server" Width="128px" Height="32px"></asp:TextBox>
            </td>                         
               
                 </tr>
             </table>
        

             </div>
        <div style="float:left;width:25%">
            
                      <table>
                 <tr>
                      <td style=" text-align:right">
                  Search By  payer
                </td>
                  <td style="width: 85px">
                <asp:TextBox ID="Txtpayer" runat="server" Width="128px" Height="32px" ></asp:TextBox>
            </td>                         
               
                 </tr>
             </table>
        </div>


   <div style="float:left;width:10%">
        <asp:Panel ID="Panel2" runat="server">
            <asp:Button ID="Btnsearch" runat="server" Text="Search"  Width="128px" Height="42px" BackColor="#000066" ForeColor="#FF9900"/>
        </asp:Panel>
      
                    
        </div>
            


         </div>
   
  
           

       
            
         </div>      
          <asp:GridView ID="GridView0" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
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
