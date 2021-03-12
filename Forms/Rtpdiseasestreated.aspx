<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/reports_master.Master" CodeBehind="Rtpdiseasestreated.aspx.vb" Inherits="CLOUD_HIMS.Rtpdiseasestreated" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
      <div style="width:100%">
          <h4 style="padding-left:20px">INCOME MANAGEMENT</h4>
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="filter" runat="server" style="padding-left:10px" >
            <div>
                
                    
                 
            </div>               
              <table class="ui-accordion" border="0" style="background-color:silver; width:50%;margin-bottom:10px" >                                                                       
                                                                                                                                          
                                                                       <tr>
                                                                           <td class="auto-style2" style="text-align: left; ">
                                                                               Select Diagnosis
                                                                               <asp:DropDownList ID="cbo" runat="server"></asp:DropDownList>
                                                                            </td>
                                                                           <td class="auto-style2" style="text-align: left; ">
                                                                               <asp:LinkButton ID="imgones" runat="server">Select Date</asp:LinkButton><br />
                                                                               &nbsp;<ajax:CalendarExtender ID="CalendarExtender2" runat="server" CssClass="MyCalendar" Format="dd-MM-yyyy" PopupButtonID="imgones" TargetControlID="datepicker" />
                                                                               <asp:TextBox ID="datepicker" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="100px"></asp:TextBox><br />
                                                                            </td>

                                                                           <td class="auto-style2" style="text-align: left; ">
                                                                               <asp:LinkButton ID="imgones2" runat="server">End Date</asp:LinkButton><br />
                                                                               &nbsp;<ajax:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="MyCalendar" Format="dd-MM-yyyy" PopupButtonID="imgones2" TargetControlID="datepicker2" />
                                                                               <asp:TextBox ID="datepicker2" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="100px"></asp:TextBox><br />
                                                                            </td>
                                                                           
                                                                            <td  style="text-align: left; ">
                                                                                  <asp:Button ID="BtnPlay" runat="server" style="background-color: #000000; color: lime" Text="Fetch Report" />  <br />  
                                                                                                                                                          
                                                                           </td>  
                                                                                                                                                   
                                                                       </tr>
                                                             <tr>

                                                                   <asp:Label ID="txtdate" Text="" runat="server" /><br />
                                                                    <asp:Label ID="txtdate2" Text="" runat="server" />

                                                                 <td colspan="2" style="text-align:center"> 
                                                                    <asp:Label ID="lblmsg" runat="server" Font-Bold="true" ForeColor="black" Text="" Visible="false"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                                                                          
                                                          </table>
                             <%--   <table style="border: 1px inset antiquewhite; background-color:silver; margin-left: 10px;  margin-top: 0px; width: 449px;">
                                                  <tr>
                                                     <td colspan="4" style="text-align: left;">
                                                         
                                                         <div style="margin-top:6px;margin-left:10px;margin-bottom:6px; width: 385px;">
                                                    <b>Disease Treated</b>
                                                              <asp:Label ID="lblincomecount" runat="server" Text=""></asp:Label>      
                                                         </div>
                                                      </td>
                                                    
                                               </tr>
              
                                        <tr>
                                            <td>
                                                <asp:Label ID="Lbldiagnosis" runat="server" Text="Diagnosis"></asp:Label>
                                            </td>
                                             <td>
                                                 <asp:DropDownList ID="cbodiagnosis" runat="server"></asp:DropDownList>  
                                                 <asp:Button ID="Btnsearch" runat="server" Text="Search" />
                                             
                                             </td>
                                          
                  

                                            </tr>
                                     <tr>
                           <td style="text-align: left; height: 0px;">
                         <asp:LinkButton ID="Lnkfrom" runat="server"> From</asp:LinkButton>
                         <ajax:CalendarExtender ID="Calfrom" runat="server" Format="yyyy-MM-dd" PopupButtonID="Lnkfrom" TargetControlID="txtfrom" />
                       </td>

                          <td style="text-align: left; height: 1px;">
                           <asp:TextBox ID="txtfrom" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="119px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                           </td>



                     <td style="text-align: left; height: 0px;">
                     <asp:LinkButton ID="Lnkto" runat="server"> To</asp:LinkButton>
                     <ajax:CalendarExtender ID="Calto" runat="server" Format="yyyy-MM-dd" PopupButtonID="Lnkto" TargetControlID="Txtto" />
                   </td>

                     <td style="text-align: left; height: 1px;">
                       <asp:TextBox ID="Txtto" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="119px" Height="16px"></asp:TextBox>   
                           <asp:Button ID="Btndate" runat="server" Text="Search" />
                                                                                                                                                                                                                       
                   </td>


                                     </tr>
                                           

                                     </table>--%>
                 </div>
              
      </div>

  
    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll">
             <div style="height:5px"></div>


             <div id="nodata" runat="server" visible="false" style="width:98%;margin-top:50px">   
                 <div style="text-align:left;margin-left:100px">                                                               
                         <h2>   Whoops!   </h2>
                         <p>  NO DIAGNOSIS FOUND    </p>
                  </div>   
                 <div style="text-align:center">
                     <img alt="" src="../app_resources/imgs/oops.png" style="margin-bottom:10px" />
                 </div>            
            </div>

     
        <div style="margin-top:10px">
            
            
         <asp:GridView ID="grdrequest" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
            EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
            CellPadding="4" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" Width="966px">
                <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle"  />
                <Columns> 
                    <asp:BoundField DataField="id" Visible="false"
                        HeaderText="id" SortExpression="id"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                      
                     <asp:BoundField DataField="diagnosis"
                        HeaderText="Diagnosis" SortExpression="diagnosis"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                      
                    <asp:BoundField DataField="diagcode"
                        HeaderText="Diagnosis Code" SortExpression="diagcode"  ReadOnly="true">
                            <ItemStyle   Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                                                                                                                                                                                                                        
                    <asp:BoundField DataField="icd10"
                        HeaderText="Icd 10" SortExpression="icd10"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField> 
                      <asp:BoundField DataField="logstime"
                        HeaderText="On Date" SortExpression="logstime"  ReadOnly="true">
                            <ItemStyle  Font-Size="Small" HorizontalAlign="Justify" VerticalAlign="Middle"  />
                            </asp:BoundField>     
                    
                       
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



</asp:Content>
