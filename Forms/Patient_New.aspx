<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Reception.Master" CodeBehind="Patient_New.aspx.vb" Inherits="CLOUD_HIMS.Patient_New" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="Scripts/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>
     <script src="../../scripts/master-theme.js"></script>

         <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
    <style>
        
         .auto-style3 {
             height: 0px;
             width: 150px;
         }
        
         .auto-style4 {
             height: 1px;
             width: 150px;
         }
        
         
         .auto-style6 {
            height: 1px;
            width: 104px;
        }
        .auto-style7 {
            height: 1px;
            width: 470px;
        }
        
         
         </style>


    <div id="myModal" class="modal"   >                                            
           <div class="modal-content" style="width:500px;height:370px">                      
                   <div class="modal-header">
                      <span class="close">&times;</span>
                      <h2>  NEW PATIENT</h2>
                    </div>
                             
               <div class="modal-body" style="margin-bottom:10px"> 
                   <table style=" margin-left: 5px;  margin-top: 0px;border-style:outset">
                                            <tr>

                                                <td style="text-align: right; " class="auto-style4">
                                                    Names Name
                                                </td>
                                                <td style="text-align: left; height: 1px;">
                                                    <asp:TextBox ID="txtnames" runat="server" Width="260px"></asp:TextBox>
                                                </td>

                                            </tr>



                                            <tr>

                                                <td style="text-align: right; " class="auto-style3">
                                                         Age
                                                      </td>

                                                <td style="text-align: left; height: 1px;">
                                                           <asp:TextBox ID="txtage" runat="server"></asp:TextBox>                  
                                                       </td>

            

           
                                            </tr>
                                              <tr>
                                                <td style="text-align: right; " class="auto-style4">
                                                            Telephone
                                                  </td>
                                                  <td style="text-align: left; height: 1px;">                                                   
                                                            <asp:TextBox ID="txtpatientphone" runat="server"></asp:TextBox>
                                                  </td>
           
                                            </tr>
                                               <tr>
                                                 <td style="text-align: right; " class="auto-style4">
                                                        ID Number
                                                    </td>

                                                <td style="text-align: left; height: 1px;">
                                                 <asp:TextBox ID="Txtpatientid" runat="server" TextMode="Number"></asp:TextBox>      
                                                    </td>
                                            </tr>
        
                                          
                                           
                                            <tr>
                                                 <td style="text-align: right; " class="auto-style4">
                                                    Gender
                                                </td>
                                                  <td style="text-align: left; height: 1px;">                                                   
                                                     <asp:DropDownList ID="Dpogender" runat="server"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; " class="auto-style4">
                                                     Marital Status
                                                       </td>

                                                <td style="text-align: left; height: 1px;">
                                                    <asp:DropDownList ID="Dpomaritalstatus" runat="server"></asp:DropDownList>                                                                
                                                       </td>
                                            </tr>
                                             <tr>
                                                <td style="text-align: right; " class="auto-style4">
                                                                  Email
                                                 </td>
                                                <td style="text-align: left; height: 1px;">
                                                             <asp:TextBox ID="txtemail" runat="server" Text="N/A" Width="254px"></asp:TextBox>
                                                       </td>
                                             </tr>
                       <tr>
                           <td style="text-align: right; " class="auto-style4">
                               Home address:
                           </td>
                           <td>
                                <asp:TextBox ID="txthome" runat="server" Text="" Width="254px"></asp:TextBox>
                           </td>
                       </tr>
                                           
                                            <tr>
                                                <td colspan="2" style="text-align:center">
                                                     <asp:Button ID="btnsave" runat="server" Text="Save Records" BackColor="#000066" ForeColor="#FF9900" Width="120px" Height="40px" /><br />
                                                     <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                                                </td>
                                            </tr>





                                    </table>

                      
                 </div>
                              
           </div>

     </div>

         

    <div id="myModal2"  class="modal"  >                                            
           <div class="modal-content2" style="width:460px;height:150px">                      
                   <div class="modal-header2">
                        <h2>  SUCCESS</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 
                                  YOU HAVE SUCCESSFULLY SAVED THE ENTRY . <br />               
                         <asp:Button ID="btnsaved" runat="server" Text="CLOSE" OnClientClick="clear_all();"  ForeColor="Lime" BackColor="Black" Height="35px" Width="160px" />
               </div>
                              
           </div>

     </div>



    


    <div style="width:100%;height:50px">
          <div style="width:30%;float:left;">
               <h2 style="padding-left:20px">PATIENT REGISTRATION</h2>
          </div>
   
          <div  style="float:right;text-align:right;width:68%;" >
                <div  style="float:right;text-align:right;width:68%;" >
              <div style="margin-right:20px;margin-top:5px">
                  <input id="bttnreceive" type="button" value="New Patient" class="bttns" onclick="newpatient()"  />&nbsp;&nbsp
           
              </div>
          
        
          </div>
          
        
          </div>
      
      </div>
      
 
     

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
                                                  <asp:DropDownList ID="cbotype" runat="server" Height="26px" Width="211px"></asp:DropDownList>
                                                                <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
                                                                 <asp:Button ID="btngo" runat="server" Text="go" style="height: 26px" />
                                                </td>

                                                       
                                                                                           
                                            </tr>
                                  
                                            

                                     </table>
                 </div>
         

              <asp:GridView ID="Grdnewpatients" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="ID"
                           CellPadding="6" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">

                               <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Right" VerticalAlign="Middle" />
                               <Columns> 
                                                        
                 
                                   
                                   <asp:BoundField DataField="pcode"
                                       HeaderText="Patient code" SortExpression="pcode" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField> 
                                                                                                                                                                                 
                                   <asp:BoundField DataField="colnames"
                                       HeaderText="Names" SortExpression="colnames" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField> 

                                       <asp:BoundField DataField="coltel"
                                       HeaderText="Tel" SortExpression="coltel" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>    

                                     <asp:BoundField DataField="colemail"
                                       HeaderText="email" SortExpression="colemail" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>         
                                                                                

                                     <asp:BoundField DataField="colage"
                                       HeaderText="Age " SortExpression="colage" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle  Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>       
                                  
                                            <asp:BoundField DataField="colgender"
                                       HeaderText="Gender" SortExpression="colgender" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle  Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>     
                                   
                                        

                                    <asp:BoundField DataField="location"
                                       HeaderText="Home address" SortExpression="location" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle  Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle" />
                                          </asp:BoundField>    

                                     <asp:BoundField DataField="maritalstatus"
                                       HeaderText="Marital Status" SortExpression="maritalstatus" ItemStyle-Width="150" ReadOnly="false">
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
       
        function newpatient() {          
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
        
      


         //function dashresize() {
         //    var heights = window.innerHeight;
         //    document.getElementById("dmains").style.height = heights - 200 + "px";
         //}
         //resize();
         //window.onresize = function () {
         //    dashresize();
         //};
                

       </script>
   
</asp:Content>

