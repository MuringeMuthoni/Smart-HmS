﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/reports_master.Master" CodeBehind="RtpIncome.aspx.vb" Inherits="CLOUD_HIMS.RtpIncome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:HiddenField ID="Hddid" runat="server" />

    <div style="width:100%">
          <h4 style="padding-left:20px">INCOME MANAGEMENT</h4>
        
        <div id="filter" runat="server" >               
                                <table style="background-color:silver;margin-left: 10px;  border-style:inset;border-color:antiquewhite;border-width:1px ;margin-top: 0px;">
                                                  <tr>
                                                     <td colspan="4" style="text-align: left;">
                                                         <div style="margin-top:6px;margin-left:10px;margin-bottom:6px; width: 385px;">
                                                             Number in the list &nbsp;&nbsp;
                                                                <asp:Label ID="lblincomecount" runat="server" Text=""></asp:Label>      
                                                             <asp:Button ID="Btnsearch" runat="server" Text="Button" Visible="False" />
                                                         </div>
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
                         <p>  NO INCOME FOUND    </p>
                  </div>   
                 <div style="text-align:center">
                     <img alt="" src="../app_resources/imgs/oops.png" style="margin-bottom:10px" />
                 </div>            
            </div>

     
        <div style="margin-top:10px">
                 <asp:GridView ID="grdrequest" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
            EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="dates"
            CellPadding="3" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" Width="491px">
                <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle"  />
                <Columns> 
                                <asp:BoundField DataField="no"
                        HeaderText="Date" SortExpression="no"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField>   
                     
                    <asp:BoundField DataField="dates"
                        HeaderText="Transactions Done" SortExpression="dates"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

              
                     
                        <asp:BoundField DataField="Pcost"
                        HeaderText="Total Collection" SortExpression="Pcost"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                      <asp:ButtonField ButtonType="Image"  CommandName="view" HeaderText="View More"
                                                                ImageUrl="~/src/app_resources/imgs/action.png"   >
                                                                 <ItemStyle Width="50px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle"  />
                                                                  </asp:ButtonField>    
                                                              
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
