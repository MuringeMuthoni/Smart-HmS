<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/lab_master.Master" CodeBehind="lab_results.aspx.vb" Inherits="CLOUD_HIMS.lab_results" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../scripts/master-theme.js"></script>
    <div style="width:100%;height:50px">
          <div style="width:30%;float:left;">
               <h4 style="padding-left:20px">LAB RESULTS</h4>
          </div>
              
      </div>


     <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll">
             <div style="height:5px"></div>


             <div id="nodata" runat="server" visible="false" style="width:98%;margin-top:50px">   
                 <div style="text-align:left;margin-left:100px">                                                               
                         <h2>   Whoops!   </h2>
                         <p>  NO LAB RESULTS FINALIZED TODAY     </p>
                  </div>   
                 <div style="text-align:center">
                     <img alt="" src="../app_resources/imgs/oops.png" style="margin-bottom:10px" />
                 </div>            
            </div>


        <div style="margin-top:10px">
         <asp:GridView ID="grdrequest" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
            EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
            CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle"  />
                <Columns> 
                                      
                    <asp:BoundField DataField="logstime"
                        HeaderText="Request time" SortExpression="logstime"  ReadOnly="true">
                            <ItemStyle Width="100px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                                                                                                                                                                                                        
                    <asp:BoundField DataField="pnames"
                        HeaderText="Patient Names" SortExpression="pnames"  ReadOnly="true">
                            <ItemStyle Width="150px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                        <asp:BoundField DataField="requestname"
                        HeaderText="Request" SortExpression="requestname"  ReadOnly="true">
                            <ItemStyle Width="250px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField>    
                    
                     <asp:BoundField DataField="status"
                        HeaderText="Status" SortExpression="status"  ReadOnly="true">
                            <ItemStyle Font-Size="Smaller" HorizontalAlign="Center" VerticalAlign="Middle"  />
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
