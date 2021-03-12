<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Nurse.Master" CodeBehind="Medicine.aspx.vb" Inherits="CLOUD_HIMS.Medicine" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="../../scripts/master-theme.js"></script>

        <style>
        .roundedcorner{
            font-size:11pt;
            margin-left:auto;
            margin-right:auto;
            margin-top:1px;
            margin-bottom:1px;
            padding:3px;
            border-top: 1px solid;
            border-left:1px solid;
            border-right:1px solid;
            border-bottom:1px solid;
            -moz-border-radius: 8px;
            -webkit-border-radius:8px;
        }
        .background{
            background-color:black;
            filter: alpha(opacity=90);
            opacity:0.8;

        }
        .popup {
            background-color:#162036;
            border-width:3px;
            border-style:solid;
            border-color:black;
            padding-top:10px;
            padding-left: 10px;
            width:400px;
            height:440px;

        }
    </style>
      <div style="float:left;width:50%">
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Patient Name"></asp:Label>
            <asp:TextBox ID="Txtpatientsearch" runat="server"></asp:TextBox>
            <asp:Button ID="Btnsearch" runat="server" Text="Search" />
        </asp:Panel>
    </div>
     <div style="float:left;width:50%">
        <asp:Panel ID="Panel2" runat="server">
            <div style="margin-left:110px;border-radius:10px;">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Button ID="Btnaddnewpatient" runat="server"  Text="Add New" CssClass="roundedcorner"  Font-Size="Larger"/>
            </div>
         
        </asp:Panel>
           

    </div>
    <asp:Panel ID="Pnladdpatient" runat="server" CssClass="popup roundedcorner">
       <div style="">
           <div style="padding:2px;padding-left:380px">
                    <asp:Button ID="Btnclose" runat="server" Text="X" BackColor="snow" ForeColor="indigo" Height="38px" Width="22px" />                
           </div>
           <table>
                <tr>
                   <td>
                <asp:Label ID="Lblmedname" runat="server" Text="Patient Name" ForeColor="White"></asp:Label>    
                   </td>
                   <td>
                   <asp:TextBox ID="Txtmedname" runat="server" Height="28px" Width="208px"></asp:TextBox>
                   </td>
               </tr>
                
               <tr>
                   <td>
                <asp:Label ID="LblMedCat" runat="server" Text="Medicine Category" ForeColor="White"></asp:Label>
                   </td>
                   <td>
                 <asp:TextBox ID="Txtmedcategory" runat="server" Height="31px" Width="207px"></asp:TextBox>
                   </td>
               </tr>
                <tr>
                   <td>
                 <asp:Label ID="Lbldescription" runat="server" Text="Description" ForeColor="White"></asp:Label>      
                   </td>
                   <td>
                  <asp:TextBox ID="txtdescription" runat="server" Height="129px" Width="206px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td>
                <asp:Label ID="Lblprice" runat="server" Text="Price" ForeColor="White"></asp:Label>    
                   </td>
                   <td>
                   <asp:TextBox ID="Txtprice" runat="server" Height="26px" Width="207px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td>
                <asp:Label ID="Lbltotalquantity" runat="server" Text="Total Quantity" ForeColor="White"></asp:Label>    
                   </td>
                   <td>
                   <asp:TextBox ID="txttotalquantity" runat="server" Height="26px" Width="207px"></asp:TextBox>
                   </td>
               </tr>
                <tr>
                   <td>
                <asp:Label ID="Lblmancompany" runat="server" Text="Manufacturing company" ForeColor="White"></asp:Label>    
                   </td>
                   <td>
                   <asp:TextBox ID="Txtmancompany" runat="server" Height="26px" Width="207px"></asp:TextBox>
                   </td>
               </tr>
              <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>    
           </table>

              <div style="text-align:center;border-radius:10px">
                            <asp:Button ID="Btnpost" runat="server" Text="Save" BackColor="snow" ForeColor="indigo" Height="38px" Width="104px" />
                
                        </div>
    
        
       
       
        
    </div>


    </asp:Panel>



    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Btnaddnewpatient" PopupControlID="Pnladdpatient"></ajaxToolkit:ModalPopupExtender>




    <asp:Button ID="Button1" runat="server" Text="Button" />
    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white">
            <div id="nodata" runat="server" visible="false" style="width:98%;text-align:center">
                <h2>
                    NO ONE IN QUEUE
                </h2>
             </div>
              <asp:GridView ID="GridView0" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                                                                                                                                                                                                                          
                                   <asp:BoundField DataField="qno"
                                       HeaderText="Queue" SortExpression="qno" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField> 

                                     <asp:BoundField DataField="arrival"
                                       HeaderText="Arrival " SortExpression="arrival" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="120px" Font-Size="Small" />
                                          </asp:BoundField>       
                                  
                                            <asp:BoundField DataField="names"
                                       HeaderText="Patient Name" SortExpression="colpatientname" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
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
                                                                                  
                                            <asp:BoundField DataField="paymentinfo"
                                       HeaderText="Payment info" SortExpression="Payment" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>       
                                                       
                                       <asp:ButtonField ButtonType="Button"  CommandName="view"  HeaderText="Manage Item" ItemStyle-Width="120"
                                             ImageUrl="~/src/app_resources/DESIGN/action.png" text="View" ControlStyle-Width="120"/>   
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
