<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/reports_master.Master" CodeBehind="dashboard_reports.aspx.vb" Inherits="CLOUD_HIMS.dashboard_reports" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        table, th, td {          
          padding: 5px;
        }
        table {
          border-spacing: 15px;
        }
</style>

    
        <div style="margin-top:10px;margin-bottom:10px;margin-left:10px">
             <span style="font-size:larger" >Dashboard</span>
        </div>
     
      
  

    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white">
        <script src="../../scripts/master-theme.js"></script>
         <div style="margin-top:10px;padding-top:10px">

             <table>
                 <tr>
                      <td style="border-spacing:15px">
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton8" ImageUrl="~/src/app_resources/imgs/income.png" runat="server" Height="100px"     />
                         
                         </div>
                     </td>
                     <td>
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton1" ImageUrl="~/src/app_resources/imgs/des.png" runat="server" Height="100px"     />
                         </div>
                     </td>                     
                     
                      <td>
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton9" ImageUrl="~/src/app_resources/imgs/pat.png" runat="server" Height="100px"     />
                         </div>
                     </td>
                      <td style="border-spacing:15px" >
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton7" ImageUrl="~/src/app_resources/imgs/inv.png" runat="server" Height="100px"     />
                         </div>
                     </td>
                     <td style="border-spacing:15px" >
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton2" ImageUrl="~/src/app_resources/imgs/lab.png" runat="server" Height="100px"     />
                         </div>
                     </td>
                                           
                        
                 </tr>

                 </table>

                             
         </div>
           
        
        

    </div>



</asp:Content>
