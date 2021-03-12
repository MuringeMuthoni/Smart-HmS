<%@ Page Title="" EnableEventValidation="false" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/pharmacy_master.Master" CodeBehind="inventory.aspx.vb" Inherits="CLOUD_HIMS.inventory" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
    <link href="../app_resources/css/popup.css" rel="stylesheet" />
     <script src="../../scripts/master-theme.js"></script>


    <div id="myModal"  class="modal"    >                                            
           <div class="modal-content2" style="width:700px;height:400px;">                      
                   <div class="modal-header">
                      <span class="close">&times;</span>
                      <h2>  Edit Medicine</h2>
                    </div>
                             
               <div class="modal-body" style="margin-bottom:10px"> 

                
                   <div style="text-align:center">
                      

                       <table style="margin-left:50px;font-size:large;border-spacing:10px">
                           <tr>
                               <td  style="text-align:right">
                                   Product Name:
                               </td>
                               <td style="text-align:left">
                                   <asp:Label ID="lblpname" runat="server" Text="name"></asp:Label>
                               </td>                               
                           </tr>
                           <tr>
                               <td  style="text-align:right">
                                   Total cost
                               </td>
                               <td style="text-align:left">
                                    <asp:Label ID="lblcost" runat="server" Text="0"></asp:Label>
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

    <asp:HiddenField ID="Hddid" runat="server" />

    <div style="width:100%">
          <h4 style="padding-left:20px">INVENTORY MANAGEMENT</h4>
        
        <div id="filter" runat="server" >               
                                <table style="background-color:silver;margin-left: 10px;  border-style:inset;border-color:antiquewhite;border-width:1px ;margin-top: 0px;">
                                                  <tr>
                                                     <td colspan="4" style="text-align: left;">
                                                         <div style="margin-top:6px;margin-left:10px;margin-bottom:6px; width: 385px;">
                                                            <span style="font-size:x-large">Filter</span> &nbsp;&nbsp;
                                                                <asp:Label ID="lblsales" runat="server" Text=""></asp:Label>      

                                                         </div>
                                                      </td>
                                               </tr>
              
                                        <tr>
                                             <td style="text-align: right; height: 1px; width: 63px;">
                                                        Name: </td>

                                            <td style="text-align: left; height: 1px; width: 210px;">
                                                <asp:TextBox ID="txtnames" runat="server"></asp:TextBox>
                                                <asp:Button ID="Btnsearch" runat="server" Text="go" style="height: 26px" />
                                                </td>

                                                        <td style="text-align: right; height: 1px; width: 82px;">
                                                            Category:
                                                             </td>
                                                            <td style="text-align: left; height: 1px; width: 206px;">
                                                               <asp:DropDownList ID="cbonames" runat="server" AutoPostBack="true" Width="274px" Height="25px">                                      
                                                              </asp:DropDownList>
                                                            </td>                                          
                                            </tr>
                                   
                                           

                                     </table>
                 </div>
              
      </div>

  
    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll">
             <div style="height:5px"></div>


             <div id="nodata" runat="server" visible="false" style="width:98%;margin-top:50px">   
                 <div style="text-align:left;margin-left:100px">                                                               
                         <h2>   Whoops!   </h2>
                         <p>  NO PRODUCT FOUND    </p>
                  </div>   
                 <div style="text-align:center">
                     <img alt="" src="../app_resources/imgs/oops.png" style="margin-bottom:10px" />
                 </div>            
            </div>

     
        <div style="margin-top:10px">
            
            
         <asp:GridView ID="grdrequest" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
            EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="ProductCode"
            CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle"  />
                <Columns> 

                     <asp:BoundField DataField="CategoryName"
                        HeaderText="Category Name " SortExpression="CategoryName"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                      
                    <asp:BoundField DataField="ProductName"
                        HeaderText="Product Name" SortExpression="ProductName"  ReadOnly="true">
                            <ItemStyle   Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                                                                                                                                                                                                        
                    <asp:BoundField DataField="UnitBp"
                        HeaderText="Unit Bp" SortExpression="UnitBp"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="PackBp"
                        HeaderText="Pack Bp" SortExpression="PackBp"  ReadOnly="true">
                            <ItemStyle   Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="Unitsp"
                        HeaderText="Unit Sp" SortExpression="Unitsp"  ReadOnly="true">
                            <ItemStyle   Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     

                     <asp:BoundField DataField="Margin"
                        HeaderText="Margin" SortExpression="Margin"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="BatchQtty"
                        HeaderText="Batch Qtty" SortExpression="BatchQtty"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                      <asp:BoundField DataField="UnitsAvailable"
                        HeaderText="Units Qty" SortExpression="UnitsAvailable"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                      <asp:BoundField DataField="QttyHand"
                        HeaderText="Pack Qty" SortExpression="QttyHand"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                      <asp:BoundField DataField="StockValue"
                        HeaderText="Stock Value" SortExpression="StockValue"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                    <%--  <asp:ButtonField ButtonType="Image"  CommandName="view" HeaderText="Edit"
                                                                ImageUrl="~/src/app_resources/imgs/action.png"   >
                                                                 <ItemStyle Width="50px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle"  />
                                                                  </asp:ButtonField>    --%>
                                                              
                    </Columns> 
                    
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#a9b0b9" Font-Bold="True" ForeColor="Black" HorizontalAlign="Justify" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="left" />
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
             document.getElementById('<%= Btnsearch.ClientID%>').click();    
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
