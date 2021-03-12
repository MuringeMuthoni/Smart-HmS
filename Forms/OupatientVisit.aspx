<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Nurse.Master" CodeBehind="OupatientVisit.aspx.vb" Inherits="CLOUD_HIMS.OupatientVisit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:Panel ID="Panel1" runat="server" Width="100%">   
            <div style="width:100%;padding-left:1%;height:8%">
          
       
          <div style="float:right;width:30%;text-align:left">
              <table>
                  <tr>
                     
                      <td>
                          <asp:Button ID="Btnsave"  runat="server" Text="Save" Height="34px"  />
                      </td>
                  </tr>
              </table>
            </div>
         </div>
      
       
        <asp:Panel ID="Panel2" runat="server">     
        <div >
        

            <div style=" padding-left:20px;border:solid;border-color:lightslategray" >  
    <table style="width: 102%; margin-left: 0px;  margin-top: 0px;">
        <tr>
            <td style="text-align: left;">
                <h3>Add Patient Visit</h3>         
                </td>
        </tr>
            
        <tr>

            <td style="text-align: left; height: 1px;">
               Visit type
            </td>
            <td style="text-align: left; height: 1px;">
                <asp:DropDownList ID="Drpvisittype" runat="server" Height="16px" Width="115px"></asp:DropDownList>
            </td>
            
            <td style="text-align: left; height: 1px;">
                       Description
              </td>
              <td style="text-align: left; height: 1px;">                                                   
                        <asp:TextBox ID="txtdescription" runat="server" ></asp:TextBox>
              </td>
            <td style="text-align: left; height: 1px;">
                Clinical/Department
            </td>
              <td style="text-align: left; height: 1px;">                                                   
               <asp:DropDownList ID="Drpdepartment" runat="server"></asp:DropDownList>
            </td>
            
            

        </tr>

        <tr>
             <td style="text-align: left; height: 1px;">
               Nurse
            </td>
              <td style="text-align: left; height: 1px;">                                                   
             <asp:TextBox ID="Txtnurse" runat="server" ></asp:TextBox>
              

              </td>

            <td style="text-align: left; height: 1px;">
               Doctor
            </td>
              <td style="text-align: left; height: 1px;">                                                   
                 <asp:TextBox ID="Txtdoc" runat="server" ></asp:TextBox>
            </td>
              <td style="text-align: left; height: 1px;">
               Patient Reg
            </td>
              <td style="text-align: left; height: 1px;">                                                   
                 <asp:TextBox ID="Txtregno" runat="server" ></asp:TextBox>
            </td>
        </tr>

     
                </table>
                </div>

    
    

                   </div>
                 </asp:Panel>
           
        
            </asp:Panel>
    <div style="text-align:center">
         <asp:Label ID="lblmsg" runat="server" ></asp:Label>

    </div>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                <asp:BoundField DataField="id"
                                HeaderText="ID" SortExpression="id" ItemStyle-Width="450" ReadOnly="false" Visible="False">
                                   <ItemStyle Width="150px" />
                                      </asp:BoundField>   
                                                                                                                                                                                                            
                                   <asp:BoundField DataField="colvisittype"
                                       HeaderText="Visit Type" SortExpression="colvisittype" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="120px" />
                                          </asp:BoundField>     
                                  
                                         
                                   
                                            <asp:BoundField DataField="coldescription"
                                       HeaderText="Description" SortExpression="coldescription" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="120px" />
                                          </asp:BoundField>    
                                                  
                                    <asp:BoundField DataField="coldepartment"
                                       HeaderText="Department" SortExpression="coldepartment" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="120px" />
                                          </asp:BoundField> 
                                   
                                  
                                   <asp:BoundField DataField="colnurse"
                                       HeaderText="Nurse" SortExpression="colnurse" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="120px" />
                                          </asp:BoundField>  
                                                        
                                     <asp:BoundField DataField="coldoctor"
                                       HeaderText="Doctor" SortExpression="coldoctor" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="120px" />
                                          </asp:BoundField>      
                                   
                                     <asp:BoundField DataField="colpatientregno"
                                       HeaderText="Patient Regno" SortExpression="colpatientregno" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="120px" />
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



</asp:Content>
