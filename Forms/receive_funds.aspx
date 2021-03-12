<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Reception.Master" CodeBehind="receive_funds.aspx.vb" Inherits="CLOUD_HIMS.receive_funds" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
     <script src="../../scripts/master-theme.js"></script>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>

    <div id="myModal"  class="modal"  >                                            
           <div class="modal-content" style="width:600px;height:300px">                      
                   <div class="modal-header">
                      <span class="close">&times;</span>
                      <h2>  RECEIVE FUNDS</h2>
                    </div>
                             
               <div class="modal-body" style="margin-bottom:10px"> 
                    <%-- <asp:UpdatePanel ID="UpdatePanel2"  runat="server">
                           <ContentTemplate>  --%>
                                <div style="margin-top:10px;margin-left:20px; margin-bottom: 0px;">
                                    Search by:  &nbsp;                                    
                                     <asp:DropDownList ID="cbostype" runat="server" AutoPostBack="true" Height="25px" Width="160px"></asp:DropDownList> 
                                     &nbsp; 

                                    <asp:DropDownList ID="cbonames" runat="server" AutoPostBack="true" Width="274px" Height="25px">                                      
                                    </asp:DropDownList>
                                                     
                                                            
                                </div>                       
                                     <table style="border-style:outset;margin-top:20px;width:99%;margin-top:20px;border-width:1px">                                         
                                        
                                                  <tr>
                                                     <td style="text-align:right; " class="auto-style9" >
                                                            Fee type
                                                      </td>
                                                     <td> 
                                                         <asp:DropDownList ID="cbotype" runat="server" AutoPostBack="true" Height="22px" Width="250px"></asp:DropDownList>
                                                 
                                                     </td>
                                                 </tr>
                                                  <tr>
                                                     <td style="text-align:right; " class="auto-style9">
                                                         Amount
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="txtamount" runat="server" Width="250px" TextMode="Number" ReadOnly="false" ></asp:TextBox>
                                                     </td>
                                                 </tr>
                                            


                                         <tr  id="trqueu" runat="server" visible="false">
                                             <td colspan="2" style="text-align:center">
                                                 <asp:CheckBox ID="chkqueue" runat="server" Text="Add to Queue" />
                                             </td>
                                         </tr>
                                                                                                                    
                                                                                  
                                        <tr>
                                            <td colspan="2" style="text-align:center;height:60px">    
                                                         
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

                                 <asp:HiddenField ID="hddpid" runat="server" />
                                 <asp:HiddenField ID="hddfid" runat="server" />
                                <asp:HiddenField ID="hddamo" runat="server" />
                      <%-- </ContentTemplate>
                        </asp:UpdatePanel>--%>
                                

                      
                 </div>
                              
           </div>

     </div>

         

    <div id="myModal2"  class="modal"  >                                            
           <div class="modal-content2" style="width:460px;height:150px">                      
                   <div class="modal-header2">
                        <h2>  SUCCESS</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 
                                  YOU HAVE SUCCESSFULLY POSTED . <br />               
                         <asp:Button ID="btnsaved" runat="server" Text="CLOSE" OnClientClick="clear_all();"  ForeColor="Lime" BackColor="Black" Height="35px" Width="160px" />
               </div>
                              
           </div>

     </div>



    <div id="myModal3" class="modal"   >                                            
           <div class="modal-content" style="width:500px;height:230px">                      
                   <div class="modal-header">
                      <span class="close2">&times;</span>
                      <h2> FEE SETUP</h2>
                    </div>
                             
               <div class="modal-body" style="margin-bottom:10px"> 
                   
                                             
                                     <table style="border-style:outset;margin-top:2px;width:99%;margin-top:20px">                                         
                                        
                                          <tr>
                                             <td style="text-align:right; " class="auto-style6" >
                                                    Fee Type:
                                              </td>
                                             <td> 
                                               <asp:TextBox ID="txtftype" runat="server" Width="250px"></asp:TextBox>
                                             </td>
                                         </tr>
                                          <tr>
                                             <td style="text-align:right; " class="auto-style6">
                                                Fee Cost:
                                             </td>
                                             <td>
                                                 <asp:TextBox ID="Txtcost" runat="server" Width="114px" TextMode="Number"></asp:TextBox>
                                             </td>
                                         </tr>
                                                                                                                    
                                                                                  
                                        <tr>
                                            <td  colspan="4" style="text-align:center;height:60px">    
                                                         
                                                <div id="div_btn" style="display:block">
                                                    <asp:Button ID="Btnactivitysave" runat="server" Text="SAVE" OnClientClick="hide_me2();"  ForeColor="Lime" BackColor="Black" Height="35px" Width="160px" /><br />
                                                    <asp:Label ID="LblmsgA" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
                                                    </div> 

                                                <div id="div_btn2" style="display:none">
                                                    <button style="border-style:none;background-color:transparent" ><img src="loader.gif" style="height:25px;width:25px;border-style:none"    /> &nbsp;Posting, please wait..</button>                             
                                                </div>         
                                            </td>
                                        </tr>

                                                
                                         </table>

                      
                 </div>
                              
           </div>

     </div>

    <div style="width:100%;height:50px">
          <div style="width:30%;float:left;">
               <h2 style="padding-left:20px">RECEIVE FUNDS&nbsp;</h2>
          </div>
   
          <div  style="float:right;text-align:right;width:68%;" >
              <div style="margin-right:20px;margin-top:5px">

                  <img alt="" style="height:30px" src="../app_resources/imgs/addicon.jpg"  onclick="ReceiveFunds()" />
                                
               <%--   <input id="bttnreceive" type="button" value="Receive Funds" class="bttns" onclick="ReceiveFunds()"  />&nbsp;&nbsp--%>
           
                  <%--<input id="bttnSetup" type="button" value="Setup Activity" class="bttns" onclick="SetupFunds()"  />&nbsp;&nbsp--%>

              </div>
          
        
          </div>
      
      </div>


    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white">
            <div id="nodata" runat="server" visible="false" style="width:98%;text-align:center">
                <h2>
                    No funds received yet
                </h2>
             </div>
              <asp:GridView ID="GridView0" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id" OnPageIndexChanging="grdData_PageIndexChanging"  AllowPaging="true" PageSize="13"
                           CellPadding="7" BackColor="White" BorderStyle="Inset" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                         <asp:BoundField DataField="time"
                                       HeaderText="paid on"   ReadOnly="false">
                                         <ItemStyle Width="90px" Font-Size="Small" />
                                          </asp:BoundField>     

                                            <asp:BoundField DataField="names"
                                       HeaderText="Patient Name"   ReadOnly="false">
                                         <ItemStyle Width="250px" Font-Size="Small" />
                                          </asp:BoundField>     
                                   
                                            <asp:BoundField DataField="tel"
                                       HeaderText="Phone No" SortExpression="tel" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField>    
                                                     
                                            <asp:BoundField DataField="Amount"
                                       HeaderText="Amount" SortExpression="Amount" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField>         
                                                
                                                     
                                            <asp:BoundField DataField="feetype"
                                       HeaderText="Fee Type" SortExpression="feetype" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px"  Font-Size="Small"/>
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


            <script type = "text/javascript">
              

                var modal = document.getElementById('myModal');
                var modal2 = document.getElementById('myModal2');
                var modal3 = document.getElementById('myModal3');
                var span = document.getElementsByClassName("close")[0];
                var span2 = document.getElementsByClassName("close2")[0];
                span.onclick = function () {
                    modal.style.display = "none";

                }
                span2.onclick = function () {
                    modal3.style.display = "none";
                }

                function ReceiveFunds() {
                    modal.style.display = "block";
                }
                function SetupFunds() {
                    modal3.style.display = "block";
                }



                function Closeme() {
                    modal2.style.display = "block";
                    modal.style.display = "none";
                }

                function Closeme2() {
                    modal2.style.display = "block";
                    modal.style.display = "none";
                }
                function relauch2() {
                    modal3.style.display = "block";

                }


                function hide_me() {
                    document.getElementById('div_btn').style.display = 'none';
                    document.getElementById('div_btn2').style.display = 'block';
                }

                function hide_me2() {
                    document.getElementById('div_btnactivity').style.display = 'none';
                    document.getElementById('div_btnactivity2').style.display = 'block';
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
