<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Nurse.Master" CodeBehind="DrugRequest.aspx.vb" Inherits="CLOUD_HIMS.DrugRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

        <div>
    <table style="width: 978px; margin-left: 0px; background-color:white; margin-top: 0px;">
                <tr >
                    <td style="width: 46px">
                        <asp:Image ID="Image1" runat="server" />
                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Label1" text-size="50px" runat="server" Text="Anu Roy"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="Label6" runat="server" Text="Adm.Date/Time: 31/02/2021 05:08 PM"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Label7" runat="server" Text="Female, 23 years"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label8" runat="server" Text="Payer:Private Cash"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Label2" runat="server" Text="Reg: No 29, Admission No:5"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label3" runat="server" Text="Kin Name: Puja Khan"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Label4" runat="server" Text="Female Ward(Medical), Bed No:FM 01"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label5" runat="server" Text="Kin Mobile No:0786599844"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    <div style="padding-left:20px">
        <h3>Drug/Consumable Request</h3>
    </div>
    <div style="height:5%;width:100%;padding-left:20px">
         <div style="float:left;width:30%">
        <table>
            <tr>
                <td>
                    <asp:Label ID="LblOrdertype" runat="server" Text="Order Type"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="Dporoutine" runat="server" Height="33px" Width="202px"></asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div style="float:left;width:30%">
       <table>
            <tr>
                <td>
                    <asp:Label ID="Lblstore" runat="server" Text="Store"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="Dpostore" runat="server" Height="28px" Width="247px"></asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div style="float:left;width:40%">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Doctor"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" Width="247px"></asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    </div>
   <div style="height:20px"></div>
       <div style="height:8%;width:100%;padding-left:20px">
         <div style="float:left;width:60%">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblItem" runat="server" Text="Item"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="Txtitemsearch" runat="server" Height="32px" Width="526px" ></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
 
    <div style="float:left;width:40%">
        <table>
            <tr>
                
                <td style="text-align: left; height: 0px; width: 85px;">
                         &nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:LinkButton ID="LinkButton1" runat="server"> From Date</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="txtdatefrom" />
                    </td>

                    <td style="text-align: left; height: 1px; width: 172px;">
                       <asp:TextBox ID="txtdatefrom" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="119px" ></asp:TextBox>                                                                                                                                                                             
                   </td>
            </tr>
        </table>
    </div>
    </div>
   <div style="width:100%;height:17%"> 
       <div  style="float:left;padding-left:10px;width:30%">
        <table>
            <tr>
                <td>
                    <asp:Label ID="LblDose" runat="server" Text="Dose"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="Txtdose" runat="server" Height="38px" Width="232px" ></asp:TextBox>
                </td>
             
            </tr>
              <tr>
                <td>
                    <asp:Label ID="Lblroute" runat="server" Text="Route"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtRoute" runat="server" Height="38px" Width="232px" ></asp:TextBox>
                </td>
            </tr>
        </table>
       </div>
        <div   style="float:left;padding-left:10px;width:30%">
            <table>
                <tr>
                    <td>
                          <asp:Label ID="Lblfrequency" runat="server" Text="Frequency"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtfrequency" runat="server" Height="38px" Width="198px"></asp:TextBox> 
                    </td>
                </tr>

                 <tr>
                    <td>
                          <asp:Label ID="Lblfoodrelation" runat="server" Text="Food Relation"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtfoodrelation" runat="server" Height="38px" Width="198px"></asp:TextBox> 
                    </td>
                </tr>


            </table>

          
       </div>
        <div  style="float:left;padding-left:10px;width:30%">
           <table>
                <tr>
                    <td>
                          <asp:Label ID="Lblduration" runat="server" Text="Duration"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtduration" runat="server" Height="38px" Width="198px"></asp:TextBox> 
                    </td>
                </tr>
            </table>
       </div>
   </div>
      <div style="text-align:center;padding-left:10px; width: 1222px;">
                <table>
            <tr>
                <td>
                    <asp:Label ID="Lblinstruction" runat="server" Text="Instruction"></asp:Label>  
                </td>
                <td>
                    <asp:TextBox ID="TxtInstruction" runat="server" Height="62px" Width="1103px"  ></asp:TextBox> 
                </td>
            </tr>
        </table>
          </div>
    <div style="padding-left:20px">
        <h3>Item Details</h3>
    </div>

        <asp:GridView ID="GridView0" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="5" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                  
                                            <asp:BoundField DataField="colSN"
                                       HeaderText="Sn" SortExpression="colSN" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>     
                                   
                                            <asp:BoundField DataField="colitemname"
                                       HeaderText="Item Name" SortExpression="colitemname" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField>    
                                                     
                                            
                                                                                  
                                            <asp:BoundField DataField="colprescriptiondetails"
                                       HeaderText="Prescription Details" SortExpression="colprescriptiondetails" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField> 
                                   
                                      <asp:BoundField DataField="colquantity"
                                       HeaderText="Quanity" SortExpression="colquantity" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField> 
                                         
                                              
                                      <asp:BoundField DataField="colaction"
                                       HeaderText="Action" SortExpression="colaction" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>          
                                       <asp:ButtonField ButtonType="Button"  CommandName="view"  HeaderText="Action" ItemStyle-Width="120"
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


</asp:Content>
