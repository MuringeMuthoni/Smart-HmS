<%@ Page Title="" EnableEventValidation="false" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/pharmacy_master.Master" CodeBehind="meds_issue.aspx.vb" Inherits="CLOUD_HIMS.meds_issue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
    <link href="../app_resources/css/popup.css" rel="stylesheet" />
     <script src="../../scripts/master-theme.js"></script>
 
    <div id="myModal"  class="modal"   >                                            
           <div class="modal-content2" style="width:550px;height:300px;">                      
                   <div class="modal-header">
                      <span class="close">&times;</span>
                      <h2>  Prescriptions</h2>
                    </div>
                             
               <div class="modal-body" style="margin-bottom:10px"> 

                   <div style="width:98%;float:right">
                     <div style="width:20%;float:right;text-align:right;margin-right:30px;margin-top:5px">
                                <asp:ImageButton ID="btnsave" OnClick="btnsave_Click" runat="server" ImageUrl="~/src/app_resources/imgs/save.png" Height="25px" Width="25px" />
                                  </div>
                   </div>
                                      
                      
                   

                      <div id="PrintDiv" style="border-style:inset;margin-top:50px">   

                          <table>
                              <tr>
                                  <td>
                                      Medicine
                                  </td>
                                  <td>
                                      <asp:Label ID="lblMname" runat="server" Text=""></asp:Label>
                                  </td>
                              </tr>
                               <tr>
                                  <td>
                                      Total Qty
                                  </td>
                                  <td>
                                      <asp:Label ID="lblRtotal" runat="server" Text=""></asp:Label>
                                  </td>
                              </tr>
                               <tr>
                                  <td>
                                      Issued
                                  </td>
                                  <td>
                                      <asp:TextBox ID="Txtissued" runat="server"></asp:TextBox>
                                      
                                  </td>
                              </tr>
                               <tr>
                                  <td>
                                      Unit Cost
                                  </td>
                                  <td>
                                    
                                       <asp:Label ID="lbltcost" runat="server" Text=""></asp:Label>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      Total Cost
                                  </td>
                                  <td>
                                      <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2" style="text-align:center">
                                      <asp:Button ID="bttncompute" runat="server" Text="Compute" />
                                  </td>
                              </tr>
                          </table>
                         
                        </div>
                 </div>
                              
           </div>

     </div>

    
    <div id="myModal2"  class="modal"  >                                            
           <div class="modal-content2" style="width:460px;height:160px">                      
                   <div class="modal-header2">
                        <h2>  SUCCESS</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 

                        <div style="margin-top:10px;margin-bottom:10px">
                           <asp:Label ID="lblmsg" runat="server" Text="" Font-Size="Large"> </asp:Label>
                        </div>
                       
                 
                      
                         <asp:Button ID="btnsaved" runat="server" Text="CLOSE" OnClientClick="close_message();"  ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
               </div>
                              
           </div>

     </div>

    <div id="myModal3"  class="modal"  >                                            
           <div class="modal-content2" style="width:460px;height:160px">                      
                   <div class="modal-header2">
                        <h2>  SUCCESS</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 

                        <div style="margin-top:10px;margin-bottom:10px">
                           <asp:Label ID="lblmsg2" runat="server" Text="" Font-Size="Large"> </asp:Label>
                        </div>
                       
                 
                      
                         <asp:Button ID="Button1" runat="server" Text="CLOSE"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
               </div>
                              
           </div>

     </div>


 
    <div id="myModalconfirm" class="modal"  >                                            
           <div class="modal-content2" style="width:465px;height:170px">                      
                   <div class="modal-header3">
                        <h2>  CONFIRM</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 

                        <div style="margin-top:10px;margin-bottom:10px">
                           <asp:Label ID="Lblconmessage" runat="server" Text="" Font-Size="Large"> </asp:Label>
                        </div>
                                             
                         <asp:Button ID="btncancel" runat="server" Text="CLOSE"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" /> &nbsp;&nbsp;

                          <asp:Button ID="brnproceed" runat="server" Text="YES"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
               </div>
                              
           </div>

     </div>

    <asp:HiddenField ID="hddstatus" runat="server" />
    <asp:HiddenField ID="Hddid" runat="server" />
    <asp:HiddenField ID="hddmid" runat="server" />

    <div style="width:100%;height:50px">
          <div style="width:30%;float:left;">
               <h4 style="padding-left:20px">ISSUE PRESCRIPTIONS</h4>
          </div>
              
      </div>

    <div style="text-align:center">
                      

                       <table style="margin-left:50px;font-size:large;border-spacing:10px">
                           <tr>
                               <td  style="text-align:right">
                                   Patient Name:
                               </td>
                               <td style="text-align:left">
                                   <asp:Label ID="lblname" runat="server" Text="name"></asp:Label>
                               </td>                               
                           </tr>
                           <tr>
                               <td  style="text-align:right">
                                   Total cost:
                               </td>
                              <td style="text-align:left">
                                    <asp:Label ID="lblcost" runat="server" Text="0"></asp:Label>
                               </td>
                           </tr>
                                                    
                          
                       </table>
                   </div>


  
    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll">
             <div style="height:5px"></div>


             <div id="nodata" runat="server" visible="false" style="width:98%;margin-top:50px">   
                 <div style="text-align:left;margin-left:100px">                                                               
                         <h2>   Whoops!   </h2>
                         <p>  NO PRESCRIPTIONS YET     </p>
                  </div>   
                 <div style="text-align:center">
                     <img alt="" src="../app_resources/imgs/oops.png" style="margin-bottom:10px" />
                 </div>            
            </div>

     
        <div style="margin-top:10px">
             <div style="width:98%;height:35px">
                         
                                 <div style="width:50%;float:left;margin-top:6px">
                                     <span style="font-size:large;margin-left:8px">Treatment Details </span>
                                      
                                </div>
                                <div style="width:20%;float:right;text-align:right;margin-right:30px;margin-top:5px"> 
                                        <asp:ImageButton ID="imgcheckout"  runat="server" ImageUrl="~/src/app_resources/imgs/save.png" Height="25px" Width="25px" />
                                  </div>
                           </div>

         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
            EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
            CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle"  />
                <Columns> 

                     <asp:BoundField DataField="Medicine"
                        HeaderText="Medicine " SortExpression="Medicine"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                      
                    <asp:BoundField DataField="Dosage"
                        HeaderText="Dosage" SortExpression="Dosage"  ReadOnly="true">
                            <ItemStyle Width="100px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                                                                                                                                                                                                        
                    <asp:BoundField DataField="Frequency"
                        HeaderText="Frequency" SortExpression="Frequency"  ReadOnly="true">
                            <ItemStyle Width="100px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="Duration"
                        HeaderText="Duration" SortExpression="Duration"  ReadOnly="true">
                            <ItemStyle Width="100px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="TotalQty"
                        HeaderText="Total Qty" SortExpression="TotalQty"  ReadOnly="true">
                            <ItemStyle Width="100px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="foodrelation"
                        HeaderText="food relation" SortExpression="foodrelation"  ReadOnly="true">
                            <ItemStyle   Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField>
                     
                    <asp:BoundField DataField="instructions"
                        HeaderText="instructions" SortExpression="instructions"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="issued"
                        HeaderText="Issued" SortExpression="issued"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="cost"
                        HeaderText="Cost" SortExpression="cost"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                               <asp:ButtonField ButtonType="Image"  CommandName="edit"  HeaderText="Post Results" 
                                ImageUrl="~/src/app_resources/imgs/action.png"   >
                                    <ItemStyle Width="100px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle"  />
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

    

     <script type = "text/javascript">

         var modal2 = document.getElementById('myModal2');
         var modal = document.getElementById('myModal');
         var modal3 = document.getElementById('myModal3');
         var span = document.getElementsByClassName("close")[0];
         var span2 = document.getElementsByClassName("close2")[0];

         var mdconfirm = document.getElementById('myModalconfirm');

         span.onclick = function () {
             modal.style.display = "none";

         }
         span2.onclick = function () {
             modal3.style.display = "none";
         }

         function edit_results() {
             modal.style.display = "block";
         }

         function ShowMessage() {
             modal2.style.display = "block";
         }
         function ShowMessage2() {
             modal3.style.display = "block";
         }

         function close_message() {
             modal2.style.display = "none";
         }

         function confirm_message() {
             mdconfirm.style.display = "block";
         }
         function confirm_close() {
             mdconfirm.style.display = "none";
         }
         

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
