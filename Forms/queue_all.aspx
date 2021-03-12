<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Nurse.Master" CodeBehind="queue_all.aspx.vb" Inherits="CLOUD_HIMS.queue_all" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../scripts/master-theme.js"></script>

    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />

  <div style="width:100%;height:50px">
          <div style="width:30%;float:left;">
               <h2 style="padding-left:20px">QUEUE</h2>
          </div>
   
          <div  style="float:right;text-align:right;width:68%;" >
              <div style="margin-right:20px;margin-top:5px">
                  <%--<input id="bttnreceive" type="button" value="Receive Funds" class="bttns" onclick="ReceiveFunds()"  />&nbsp;&nbsp
           
                  <input id="bttnSetup" type="button" value="Setup Activity" class="bttns" onclick="SetupFunds()"  />&nbsp;&nbsp--%>

              </div>
          
        
          </div>
      
      </div>
   
  

   <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll">
        <div style="height:5px"></div>

            

   



          <div style="height:20px"></div>

        <div style="height:5px"></div>
        <div >
             <div style="border-style:inset; background-color:gray;">    
                <asp:Button Text="On Queue" ID="Tab1" CssClass="bttns_tabs_active"  runat="server"
                            OnClick="Tab1_Click" ForeColor="White" width="200px" Height="30px"  />
                        <asp:Button Text="On Process"  ID="Tab2"  CssClass="bttns_tabs_inactive" runat="server"
                            OnClick="Tab2_Click" ForeColor="White" width="200px" Height="30px"  />   
                 <asp:Button Text="Process Completed"  ID="Tab3"  CssClass="bttns_tabs_inactive" runat="server"
                            OnClick="Tab3_Click" ForeColor="White" width="200px" Height="30px"  />   
                </div>
       
            <div class="tabContents">
                 <br />
                <div style="height:10px"></div>

                <div id="filter" runat="server">               
                            <table style="background-color:darkseagreen;width:auto;margin-left: 10px;  border-style:inset;border-color:antiquewhite;border-width:1px ;margin-top: 0px;">
                                              <tr>
                                                 <td colspan="4" style="text-align: left; ">
                                                     <div style="margin-top:6px;margin-left:10px;margin-bottom:6px">
                                                        <span style="font-size:x-large">Filter</span> &nbsp;&nbsp;  <asp:Label ID="lblcount" runat="server" Text=""></asp:Label>        

                                                     </div>
                                                  </td>
                                           </tr>
              
                                    <tr>
                                         <td style="text-align: right; height: 1px; width: 69px;">
                                                    By Name:
                                          </td>

                                        <td style="text-align: left; height: 1px; width: 211px;">
                                            <asp:TextBox ID="txtnames" runat="server"></asp:TextBox>
                                            <asp:Button ID="Btnsearch" runat="server" Text="go" style="height: 26px" />
                                            </td>

                                                    <td style="text-align: right; height: 1px; width: 61px;">
                                                        By Tel:
                                                         </td>
                                                        <td style="text-align: left; height: 1px; width: 200px;">
                                                            <asp:TextBox ID="txttel" runat="server"></asp:TextBox>
                                                             <asp:Button ID="btngo" runat="server" Text="go" style="height: 26px" />
                                                        </td>                                          
                                        </tr>
                                <tr>
                                    <td>

                                    </td>
                                </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div style="margin-left:10px">
                                       
                                                </div>
                                     
                                            </td>
                                        </tr>

                                 </table>
                 </div>

                <asp:MultiView ID="multiview1" ActiveViewIndex="0" runat="server">
                    <asp:View ID="View1" runat="server">
                         <div id="nodata" runat="server" visible="false" style="width:98%;margin-top:50px">   
                             <div style="text-align:left;margin-left:100px">                                                               
                                     <h2>   Whoops!   </h2>
                                     <p>  No one awaiting service     </p>
                              </div>   
                             <div style="text-align:center">
                                 <img alt="" src="../app_resources/imgs/oops.png" style="margin-bottom:10px" />
                             </div>            
                        </div>


                       
                        

                         <div style="padding-top:20px">

                    <asp:GridView ID="GridView0" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="7" BackColor="White" BorderStyle="Inset" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                                                                                                                                                                                                                          
                                   <asp:BoundField DataField="qno"
                                       HeaderText="Queue" SortExpression="qno"  ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField> 

                                     <asp:BoundField DataField="arrival"
                                       HeaderText="Arrival " SortExpression="arrival" ItemStyle-Width="100"  ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>       
                                  
                                            <asp:BoundField DataField="names"
                                       HeaderText="Patient Name"   ReadOnly="false">
                                         <ItemStyle Width="200px" Font-Size="Small" />
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
                                   
                                     <asp:BoundField DataField="vitalstatus"
                                       HeaderText="Vital Status" SortExpression="vitalstatus" ItemStyle-Width="100" ReadOnly="false">
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
           
                    </asp:View>
                     <asp:View ID="View2" runat="server">

                         <div id="nodata2" runat="server" visible="false" style="width:98%;margin-top:50px">   
                             <div style="text-align:left;margin-left:100px">                                                               
                                     <h2>   Whoops!   </h2>
                                     <p>  No one awaiting service     </p>
                              </div>   
                             <div style="text-align:center">
                                 <img alt="" src="../app_resources/imgs/oops.png" style="margin-bottom:10px" />
                             </div>            
                        </div>

                          <div style="padding-top:20px">
                    

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="7" BackColor="White" BorderStyle="Inset" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                                                                                                                                                                                                                          
                                   <asp:BoundField DataField="qno"
                                       HeaderText="Queue" SortExpression="qno"  ReadOnly="false">
                                         <ItemStyle Width="50px" Font-Size="Small" />
                                          </asp:BoundField> 

                                     <asp:BoundField DataField="arrival"
                                       HeaderText="Arrival " SortExpression="arrival" ItemStyle-Width="50"  ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>       
                                  
                                            <asp:BoundField DataField="names"
                                       HeaderText="Patient Name"   ReadOnly="false">
                                         <ItemStyle Width="250px" Font-Size="Small" />
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
                                                                                  
                                          
                                                       
                                     <%-- <asp:ButtonField ButtonType="Image"  CommandName="view" 
                                                                ImageUrl="~/src/app_resources/imgs/action.png"   >
                                                                 <ItemStyle Width="50px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle"  />
                                                                  </asp:ButtonField> --%>
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
           
                    </asp:View>
                      <asp:View ID="View3" runat="server">
                           <div id="nodata3" runat="server" visible="false" style="width:98%;margin-top:50px">   
                             <div style="text-align:left;margin-left:100px">                                                               
                                     <h2>   Whoops!   </h2>
                                     <p>  No patient discharged today     </p>
                              </div>   
                             <div style="text-align:center">
                                 <img alt="" src="../app_resources/imgs/oops.png" style="margin-bottom:10px" />
                             </div>            
                        </div>
                               <div style="padding-top:20px">

                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="7" BackColor="White" BorderStyle="Inset" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                                                                                                                                                                                                                          
                                   <asp:BoundField DataField="qno"
                                       HeaderText="Queue" SortExpression="qno"  ReadOnly="false">
                                         <ItemStyle Width="50px" Font-Size="Small" />
                                          </asp:BoundField> 

                                     <asp:BoundField DataField="arrival"
                                       HeaderText="Arrival " SortExpression="arrival" ItemStyle-Width="50"  ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>       
                                  
                                            <asp:BoundField DataField="names"
                                       HeaderText="Patient Name"   ReadOnly="false">
                                         <ItemStyle Width="250px" Font-Size="Small" />
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

                                    <asp:BoundField DataField="discharged"
                                       HeaderText="Discharged" SortExpression="discharged" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField>  
                                   
                                          
                                                                                  
                                          
                                                       
                                      
                                           
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
           
                      </asp:View>


                    
                </asp:MultiView>
            </div>


        </div>
       

      
        
        

    </div>







     <script type = "text/javascript">

          function dashresize() {             
              var heights = window.innerHeight;
              document.getElementById("dmains").style.height = heights - 200 + "px";
          }
          resize();
          window.onresize = function () {
              dashresize();
          };

        </script>

</asp:Content>
