<%@ Page Title="" EnableEventValidation="false" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/pharmacy_master.Master" CodeBehind="inventory_purchases.aspx.vb" Inherits="CLOUD_HIMS.inventory_purchases" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
    <link href="../app_resources/css/popup.css" rel="stylesheet" />


    

    
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



    <div id="myModalconfirm" class="modal"  >                                            
           <div class="modal-content2" style="width:565px;height:170px">                      
                   <div class="modal-header4">
                        <h2>  ALERT</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 

                        <div style="margin-top:10px;margin-bottom:10px">
                           <asp:Label ID="Lblconmessage" runat="server" Text="" Font-Size="medium"> </asp:Label>
                        </div>
                                             
                         <asp:Button ID="btncancel" runat="server" Text="No" OnClientClick="popup_alert_close();"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
                        <asp:Button ID="btnproceed" runat="server" Text="yes"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
                    
               </div>     
           </div>
     </div>


    <div id="myAlert"  class="modal"  >                                            
           <div class="modal-content2" style="width:460px;height:160px">                      
                   <div class="modal-header3">
                        <h2>  ALERT</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 

                        <div style="margin-top:10px;margin-bottom:10px">
                           <asp:Label ID="lblmsg2" runat="server" Text="" Font-Size="Large"> </asp:Label>
                        </div>     
                      
                         <asp:Button ID="btnclosed" runat="server" Text="CLOSE" OnClientClick="alert_close();"  ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
               </div>
                              
           </div>

     </div>
 
    <div id="myModalconfirm2" class="modal" >                                            
           <div class="modal-content2" style="width:565px;height:170px">                      
                   <div class="modal-header2">
                        <h2>  CONFIRM</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 

                        <div style="margin-top:10px;margin-bottom:10px">
                           <asp:Label ID="lblconmsg" runat="server" Text="" Font-Size="medium"> </asp:Label>
                        </div>
                                             
                         <asp:Button ID="Button1" runat="server" Text="No" OnClientClick="confirm_pop_close();"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
                        <asp:Button ID="btnproPur" runat="server" Text="yes"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
                    
               </div>     
           </div>
     </div>
    

    <asp:HiddenField ID="Hddid" runat="server" />

    <div style="width:100%;padding-left:10px">
        <div>
             <h3 style="padding-left:20px">NEW PURCHASES</h3>
        </div>
         
      </div>

  
    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll">
             <div style="height:5px"></div>
        <div style="width:98%;float:right">
                     <div style="width:20%;float:right;text-align:right;margin-right:50px;margin-top:5px">
                                <asp:ImageButton ID="btnsave" runat="server" ImageUrl="~/src/app_resources/imgs/save.png" Height="25px" Width="25px" />
                                  </div>
                   </div>
        <div style="padding-left:20px;">
                <table style="border-style:inset">
            <tr>
                 <td style="width: 119px;text-align:right">
                    Category name
                </td>
                <td>
                    <asp:DropDownList ID="cbocategory" runat="server" Height="26px" AutoPostBack="true" Width="189px"></asp:DropDownList>
                </td>
                <td style="width: 119px;text-align:right">
                    Product name
                </td>
                <td>
                   <div class="autocomplete" style="width:260px;">  
                     <input id="myInput" type="text" name="myproducts" placeholder="Select Medicine" style="width: 250px"  class="autobox" autocomplete="off" />
                    </div>
                </td>
            </tr>
            <tr>
                 <td style="width: 119px;text-align:right">
                    Packs B.P
                </td>
                <td>
                      <asp:TextBox ID="txtpbp" runat="server"></asp:TextBox>
                </td>
                <td>
                    Packs bought
                </td>
                <td>
                    <asp:TextBox ID="txtpack" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            
                    <tr>
                        <td colspan="4" style="text-align:right">
                             <asp:ImageButton ID="imgsave"  runat="server" ImageUrl="~/src/app_resources/imgs/addicon.jpg" Height="25px" Width="25px" />
                        </td>
                    </tr>
        </table>
               
        </div>

        
      <asp:HiddenField ID="hddinput" runat="server" />
        <asp:HiddenField ID="hdddata" runat="server" />
        <div style="margin-top:10px">
                       
          <h3 style="margin-left:10px">Purchases list</h3>
         <asp:GridView ID="grdrequest" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
            EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
            CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle"  />
                <Columns> 

                     <asp:BoundField DataField="colcategory"
                        HeaderText="Category Name " SortExpression="colcategory"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                      
                    <asp:BoundField DataField="colproduct"
                        HeaderText="Product Name" SortExpression="colproduct"  ReadOnly="true">
                            <ItemStyle   Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                                                                                                                                                                                                        
                    <asp:BoundField DataField="colpackbp"
                        HeaderText="Pack Bp" SortExpression="colpackbp"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="colpackqty"
                        HeaderText="Qty" SortExpression="colpackqty"  ReadOnly="true">
                            <ItemStyle   Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 

                     <asp:BoundField DataField="Totalamo"
                        HeaderText="Totalamo" SortExpression="Totalamo"  ReadOnly="true">
                            <ItemStyle   Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                       
                      <asp:ButtonField ButtonType="Image"  CommandName="view" HeaderText="Edit"
                                                                ImageUrl="~/src/app_resources/imgs/cancel.png"   >
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

         var myModalconfirm2 = document.getElementById('myModalconfirm2');
         var mdconfirm = document.getElementById('myModalconfirm');
         var modal2 = document.getElementById('myModal2');
         var myAlert = document.getElementById('myAlert');
       
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
             dashresize()
         }

         function popup_alert_show() {
             mdconfirm.style.display = "block";
         }

         function popup_alert_close() {
             mdconfirm.style.display = "none";
             dashresize()
         }

         function alert_show() {
             myAlert.style.display = "block";
         }

         function alert_close() {
             myAlert.style.display = "none";
             dashresize()
         }

         function confirm_pop() {
             myModalconfirm2.style.display = "block";
         }

         function confirm_pop_close() {
             myModalconfirm2.style.display = "none";
             dashresize()
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


    <script type = "text/javascript">
       

     function autocomplete(inp, arr) {
  
      var currentFocus;
      inp.addEventListener("input", function(e) {
          var a, b, i, val = this.value;
          closeAllLists();
          if (!val) { return false;}
          currentFocus = -1;
          a = document.createElement("DIV");
          a.setAttribute("id", this.id + "autocomplete-list");
          a.setAttribute("class", "autocomplete-items");
          this.parentNode.appendChild(a);
              for (i = 0; i < arr.length; i++) {
                if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                  b = document.createElement("DIV");
                  b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                  b.innerHTML += arr[i].substr(val.length);
                  b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                  b.addEventListener("click", function(e) {
                      inp.value = this.getElementsByTagName("input")[0].value;
                           closeAllLists();
                  });
                  a.appendChild(b);
                }
              }
          });
          inp.addEventListener("keydown", function(e) {
              var x = document.getElementById(this.id + "autocomplete-list");
              if (x) x = x.getElementsByTagName("div");
              if (e.keyCode == 40) {
                  currentFocus++;
                addActive(x);
              } else if (e.keyCode == 38) { //up
                   currentFocus--;
                   addActive(x);
              } else if (e.keyCode == 13) {
                e.preventDefault();
                if (currentFocus > -1) {
                  if (x) x[currentFocus].click();
                }
              }
          });
        function addActive(x) {          
            if (!x) return false;          
            removeActive(x);
            if (currentFocus >= x.length) currentFocus = 0;
            if (currentFocus < 0) currentFocus = (x.length - 1);            
            x[currentFocus].classList.add("autocomplete-active");
          }
          function removeActive(x) {           
            for (var i = 0; i < x.length; i++) {
              x[i].classList.remove("autocomplete-active");
            }
          }
          function closeAllLists(elmnt) {           
              var x = document.getElementsByClassName("autocomplete-items");             
            for (var i = 0; i < x.length; i++) {
              if (elmnt != x[i] && elmnt != inp) {
                  x[i].parentNode.removeChild(x[i]);
                 
              }
            }
          }
         

          document.addEventListener("click", function (e) {            
              if (document.getElementById("myInput").value != "") {
                 
                  var selected = document.getElementById("myInput").value
                  document.getElementById('<%= hddinput.ClientID%>').value = selected
                      
              }
              closeAllLists(e.target);
          });
   }

  
       

            var products =  [document.getElementById('<%= hdddata.ClientID%>').value] // [document.getElementById("hdddata").value];
            var myarray = JSON.parse(products);
             var mycontrol = document.getElementById("myInput")           
            autocomplete(mycontrol, myarray);
                  

</script>


</asp:Content>
