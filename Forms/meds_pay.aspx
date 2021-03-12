<%@ Page Title="" EnableEventValidation="false" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Reception.Master" CodeBehind="meds_pay.aspx.vb" Inherits="CLOUD_HIMS.meds_pay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
    <link href="../app_resources/css/popup.css" rel="stylesheet" />
     <script src="../../scripts/master-theme.js"></script>
 
    <div id="myModal"  class="modal" >                                            
           <div class="modal-content" style="width:600px;height:230px">                      
                   <div class="modal-header">
                      <span class="close">&times;</span>
                      <h2>  RECEIVE FUNDS</h2>
                    </div>
                             
               <div class="modal-body" style="margin-bottom:10px"> 
                   <%-- <asp:UpdatePanel ID="UpdatePanel2"  runat="server">
                            <ContentTemplate>  --%>
                                             
                                     <table style="border-style:outset;margin-top:20px;width:99%;margin-top:20px;border-width:1px">                                         

                                          <tr>
                                             <td style="text-align:right; " class="auto-style9" >
                                                    Pay Mode:
                                              </td>
                                             <td> 
                                                 <asp:DropDownList ID="cbotype" runat="server"  Height="22px" Width="250px"></asp:DropDownList>
                                                 
                                             </td>
                                         </tr>
                                          <tr>
                                             <td style="text-align:right; " class="auto-style9">
                                                 Amount
                                             </td>
                                             <td>
                                                 <asp:TextBox ID="txtamount" runat="server" Width="250px" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                             </td>
                                         </tr>

                                                                                                                                                            
                                                                                  
                                        <tr>
                                            <td  colspan="4" style="text-align:center;height:60px">    
                                                         
                                                <div id="div_btnactivity" style="display:block">
                                                    <asp:Button ID="Btnpost" runat="server" Text="SAVE PAYMENT" OnClientClick="hide_me();"  ForeColor="Lime" BackColor="Black" Height="35px" Width="160px" /><br />
                                                    <asp:Label ID="LblmsgP" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
                                                    </div> 

                                                <div id="div_btnactivity2" style="display:none">
                                                    <button style="border-style:none;background-color:transparent" ><img src="loader.gif" style="height:25px;width:25px;border-style:none"    /> &nbsp;Posting, please wait..</button>                             
                                                </div>         
                                            </td>
                                        </tr>

                                                
                                         </table>

                               
                               
                              <%--  </ContentTemplate>
                         </asp:UpdatePanel>--%>

                      
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

    <asp:HiddenField ID="Hddid" runat="server" />

    <div style="width:100%;height:50px">
          <div style="width:30%;float:left;">
               <h4 style="padding-left:20px">MEDS PRESCRIPTIONS</h4>
          </div>
              
      </div>

  
    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll">
             <div style="height:5px"></div>


             <div id="nodata" runat="server" visible="false" style="width:98%;margin-top:50px">   
                 <div style="text-align:left;margin-left:100px">                                                               
                         <h2>   Whoops!   </h2>
                         <p>  NO PRESCRIPTIONS PENDING PAYMENTS     </p>
                  </div>   
                 <div style="text-align:center">
                     <img alt="" src="../app_resources/imgs/oops.png" style="margin-bottom:10px" />
                 </div>            
            </div>

     
        <div id="isdata" runat="server" style="margin-top:10px">
         <asp:GridView ID="grdrequest" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
            EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
            CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle"  />
                <Columns> 

                     <asp:BoundField DataField="logstime"
                        HeaderText="Request time " SortExpression="logstime"  ReadOnly="true">
                            <ItemStyle Width="200px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                      
                    <asp:BoundField DataField="Medicine"
                        HeaderText="Patient name " SortExpression="mname"  ReadOnly="true">
                            <ItemStyle Width="200px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                                                                                                                                                                                                        
                    <asp:BoundField DataField="Meds"
                        HeaderText="Meds Count" SortExpression="dosage"  ReadOnly="true">
                            <ItemStyle Width="150px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                    <asp:BoundField DataField="Cost"
                        HeaderText="Cost" SortExpression="Cost"  ReadOnly="true">
                            <ItemStyle Width="150px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="Status"
                        HeaderText="Status" SortExpression="Status"  ReadOnly="true">
                            <ItemStyle Width="150px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
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
         var span = document.getElementsByClassName("close")[0];
         var span2 = document.getElementsByClassName("close2")[0];
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

         function close_message() {
             modal2.style.display = "none";
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
