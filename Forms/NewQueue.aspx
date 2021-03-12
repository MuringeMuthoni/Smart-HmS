<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Nurse.Master" CodeBehind="NewQueue.aspx.vb" Inherits="CLOUD_HIMS.NewQueue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<div style="width:100%;background-color:darkgray">
      <div style="width:60%;float:left">
           <h2 style="padding-left:20px">QUEUE ENTRY</h2>
      </div>
   
      <div  style="text-align:right;" class="auto-style2">
           <asp:Button ID="btnsave" runat="server" Text="Save" BackColor="#000066" ForeColor="#FF9900" Width="120px" Height="40px" />
            <asp:Button ID="Btnreport" runat="server" Text="View Queue" BackColor="#FF9900" ForeColor="#000066" Width="120px" Height="40px" />
           
      </div>
      
  </div>
    <div style="height:20px"></div>
      <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>

    <asp:Panel ID="Panel1" runat="server" Width="100%">   
           
      
       
        <asp:Panel ID="Panel2" runat="server">     
        <div >
        

            <div style=" padding-left:20px;border:solid;border-color:lightslategray" >  
    <table style="width: 102%; margin-left: 0px;  margin-top: 0px;">
        <tr>

            <td style="text-align: left; height: 1px;">
                Queue No
            </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="txtqueueno" runat="server"></asp:TextBox>
            </td>
            
            <td style="text-align: left; height: 1px;">
                        Patient Reg No
              </td>
              <td style="text-align: left; height: 1px;">                                                   
                        <asp:TextBox ID="txtregno" runat="server" ></asp:TextBox>
              </td>
             <td style="text-align: left; height: 0px;">
                     <asp:LinkButton ID="Lnkdate" runat="server"> Date</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="Datepicker1" />
                   </td>

            <td style="text-align: left; height: 1px;">
                       <asp:TextBox ID="TextBox1" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="119px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                   </td>

        </tr>



        <tr>

        <td style="width: 200px">
                   Time Notified
                </td>
                <td>
               <asp:DropDownList ID="ddlTimeFrom" runat="server" ></asp:DropDownList>   
                </td>

            <td style="text-align: left; height: 1px;">
                <asp:Label ID="Lblroom" runat="server" Text="From(Room)"></asp:Label>
                   </td>

            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtroom" runat="server"></asp:TextBox>                                                                 
                   </td>

            <td style="text-align: left; height: 1px;">
                    To(Room)
                </td>

            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txttoroom" runat="server"></asp:TextBox>
                </td>
        </tr>



        <tr>
           
            <td style="text-align: left; height: 1px;">
                               Doctor
                    </td>
            <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="Txtdoctor" runat="server"></asp:TextBox>
                    </td>
      
       </tr>



                </table>
                </div>

            <div style="padding-left:3%;border:solid;border-color:lightslategray" >  
    <table style="width: 100%; margin-left: 0px;  border-bottom:thin; margin-top: 0px;">
                          <tr>
                        <td style="text-align: left;">
                <h3>Observation</h3>         
                </td>
       </tr>
              
         <tr>
            <td style="text-align: left; height: 1px;">
                            Observation
                  </td>

      
            <td style="text-align: left; height: 1px;">
                     
                <asp:TextBox ID="Txtnote" runat="server" Height="69px" Width="274px"></asp:TextBox>
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
</asp:Content>
