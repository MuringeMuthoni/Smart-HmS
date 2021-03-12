<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Nurse.Master" CodeBehind="RtpPatient.aspx.vb" Inherits="CLOUD_HIMS.RtpPatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div style="width:100%;background-color:darkgray">
      <div style="width:30%;float:left">
           <h2 style="padding-left:20px">PATIENT QUEUE</h2>
      </div>
   
      <div  style="text-align:right;width:70%" class="auto-style2">
           <asp:Button ID="btnBill" runat="server" Text="BILL" BackColor="#000066" ForeColor="#FF9900" Width="120px" Height="40px" />          
      </div>
      
  </div>
    <div style="height:20px">

    </div>
    <div>
       <asp:GridView ID="GridView0" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="11"  BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
<%--                                          "Select id,colregdate,colfirstname,colmiddlename,colDOB,colage,colgender,colemail,coltel,colnokname,colnoktel,cplnokrelation from tbl_patient '"                                                                                                                                                                                                --%>
                                   <asp:BoundField DataField="colregdate"
                                       HeaderText="Reg Date" SortExpression="colregdate" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField> 

                                     <asp:BoundField DataField="colfirstname"
                                       HeaderText="First Name" SortExpression="colfirstname" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="120px" Font-Size="Small" />
                                          </asp:BoundField>       
                                  
                                            <asp:BoundField DataField="colmiddlename"
                                       HeaderText="Middle Name" SortExpression="colmiddlename" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>     
                                   
                                            <asp:BoundField DataField="colDOB"
                                       HeaderText="DOB" SortExpression="colDOB" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px" Font-Size="Small" />
                                          </asp:BoundField>    
                                                     
                                            <asp:BoundField DataField="colage"
                                       HeaderText="Age" SortExpression="colage" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField>         
                                                
                                                     
                                            <asp:BoundField DataField="colgender"
                                       HeaderText="Gender" SortExpression="colgender" ItemStyle-Width="100" ReadOnly="false">
                                         <ItemStyle Width="100px"  Font-Size="Small"/>
                                          </asp:BoundField>         
                                                                         
                                            <asp:BoundField DataField="coltel"
                                       HeaderText="Tel" SortExpression="coltel" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>       
                                                          <%--   colnokname,colnoktel,cplnokrelation from tbl_patient --%>  
                                       <asp:BoundField DataField="colnokname"
                                       HeaderText="Kin Name" SortExpression="colnokname" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>  

                                     <asp:BoundField DataField="colnoktel"
                                       HeaderText="Kin Tel" SortExpression="colnoktel" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
                                          </asp:BoundField>  

                                   <asp:BoundField DataField="cplnokrelation"
                                       HeaderText="Kin Relation" SortExpression="cplnokrelation" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" Font-Size="Small" />
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
           

</asp:Content>
