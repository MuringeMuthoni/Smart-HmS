<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/outpatient_master.Master" CodeBehind="patient_admission_viewdata.aspx.vb" Inherits="CLOUD_HIMS.patient_admission_viewdata" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <h3>patient admission Details</h3>
 
    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll;height:600px">
         <div style="height:10px"></div>
                                
          

      <div style="margin-top:30px">
          <div id="filter" runat="server">               
                                <table style="border: 1px inset antiquewhite; background-color:silver;width:600px; margin-left: 10px;  margin-top: 0px;">
                                                  <tr>
                                                     <td colspan="4" style="text-align: left; ">
                                                         <div style="margin-top:6px;margin-left:10px;margin-bottom:6px; width: 323px;">
                                                            <span style="font-size:x-large">Filter</span> &nbsp;&nbsp;  <asp:Label ID="lblcount" runat="server" Text=""></asp:Label>        

                                                         </div>
                                                      </td>
                                               </tr>


              
                                        <tr style="border-style:inset">
                                             <td style="text-align: right; " class="auto-style6">
                                                        Search type
                                              </td>

                                              <td style="text-align: left; " class="auto-style7">
                                                  <asp:DropDownList ID="cbostype" runat="server" Height="26px" Width="211px" style="margin-bottom: 0px"></asp:DropDownList>
                                                                <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
                                                                 <asp:Button ID="btngo" runat="server" Text="go" style="height: 26px" />
                                                </td>

                                                       
                                                                                           
                                            </tr>
                                  
                                            

                                     </table>
                 </div>
         

              <asp:GridView ID="Grdnewpatients" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="6" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">

                               <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Right" VerticalAlign="Middle" />
                               <Columns> 
                                                        
                 
                                   
                                   <asp:BoundField DataField="colpatientname"
                                       HeaderText="Patient Name" SortExpression="colpatientname" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField> 
                                                                                                                                                                                 
                                   <asp:BoundField DataField="colpatientcontact"
                                       HeaderText="Patient contact" SortExpression="colpatientcontact" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField> 

                                       <asp:BoundField DataField="colgender"
                                       HeaderText="Gender" SortExpression="colgender" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>    

                                     <asp:BoundField DataField="colfloor"
                                       HeaderText="Floor" SortExpression="colfloor" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>         
                                                                                

                                     <asp:BoundField DataField="colward"
                                       HeaderText="Ward " SortExpression="colward" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle  Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>       
                                  
                                            <asp:BoundField DataField="colbedcategory"
                                       HeaderText="Bed category" SortExpression="colbedcategory" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle  Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>     
                                   
                                        

                                    <asp:BoundField DataField="colbedno"
                                       HeaderText="Bed No" SortExpression="colbedno" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle  Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>    

                                     <asp:BoundField DataField="colclinic"
                                       HeaderText="Clinic" SortExpression="colclinic" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle  Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>    
                                                               
                                    <asp:ButtonField ButtonType="Image"  CommandName="view" 
                                                                ImageUrl="~/src/app_resources/imgs/action.png"   HeaderText="Put On Queue">
                                                                 <ItemStyle Width="50px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle"  />
                                                                  </asp:ButtonField>
                                     
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
     </div>
                                 <div style="padding-top:20px">

                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="7" BackColor="White" BorderStyle="Inset" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                                                                                                                                                                                                                          
                                   <asp:BoundField DataField="id"
                                       HeaderText="Adm NO." SortExpression="id"  ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField> 

                                     <asp:BoundField DataField="coladmdate"
                                       HeaderText="Adm date " SortExpression="coladmdate" ItemStyle-Width="100"  ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>
                                   
                                    <asp:BoundField DataField="colregno"
                                       HeaderText="Reg No. " SortExpression="colregno" ItemStyle-Width="100"  ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>           

                                  
                                            <asp:BoundField DataField="colpatientname"
                                       HeaderText="Patient Name"   ReadOnly="false" SortExpression="colpatientname">
                                         <ItemStyle Width="200px" Font-Size="Small" />
                                          </asp:BoundField>     
                                   
                                            <asp:BoundField DataField="colpatientcontact"
                                       HeaderText="Phone No" SortExpression="colpatientcontact" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField>    
                                                     
                                            <asp:BoundField DataField="colage"
                                       HeaderText="Age" SortExpression="colage" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField>         
                                                
                                                     
                                            <asp:BoundField DataField="colgender"
                                       HeaderText="Gender" SortExpression="colgender" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField> 
                                   
                                     <asp:BoundField DataField="colfloor"
                                       HeaderText="Floor Name" SortExpression="colfloor" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="150px"  Font-Size="Small"/>
                                          </asp:BoundField>   
                                   
                                               <asp:BoundField DataField="colward"
                                       HeaderText="Ward" SortExpression="colward" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="150px"  Font-Size="Small"/>
                                          </asp:BoundField>  

                                   <asp:BoundField DataField="colbedno"
                                       HeaderText="Bed.No" SortExpression="colbedno" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="150px"  Font-Size="Small"/>
                                          </asp:BoundField>  
                                                   
                                   <asp:BoundField DataField="colbedcategory"
                                       HeaderText="Bed Category" SortExpression="colbedcategory" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="150px"  Font-Size="Small"/>
                                          </asp:BoundField>  
                                   
                                   <asp:BoundField DataField="colbillcategory"
                                       HeaderText="Billing Category" SortExpression="colbillcategory" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="150px"  Font-Size="Small"/>
                                          </asp:BoundField>   
                                   
                                   <asp:BoundField DataField="coladmittingdoc"
                                       HeaderText="Doctor" SortExpression="coladmittingdoc" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="150px"  Font-Size="Small"/>
                                          </asp:BoundField>                                
                                          
                                   <asp:BoundField DataField="colpayer"
                                       HeaderText="Payer" SortExpression="colpayer" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="150px"  Font-Size="Small"/>
                                          </asp:BoundField>  

                                   <asp:BoundField DataField="colpatientaddress"
                                       HeaderText="Address" SortExpression="colpatientaddress" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="150px"  Font-Size="Small"/>
                                          </asp:BoundField>  

                                                       
                                     <asp:ButtonField ButtonType="Image"  CommandName="view" 
                                                                ImageUrl="~/src/app_resources/imgs/action.png"   >
                                                                 <ItemStyle Width="50px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle"  />
                                                                  </asp:ButtonField>  
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

    </asp:Panel>
</asp:Content>
