<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Reception.Master" CodeBehind="dashboard_receiption.aspx.vb" Inherits="CLOUD_HIMS.dashboard_receiption" %>
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
                     <td>
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton1" ImageUrl="~/src/app_resources/imgs/new_patience.png" runat="server" Height="100px"     />
                         </div>
                     </td>
                      <td style="border-spacing:15px" >
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton7" ImageUrl="~/src/app_resources/imgs/receive_funds.png" runat="server" Height="100px"     />
                         </div>
                     </td>
                     <td style="border-spacing:15px" >
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton2" ImageUrl="~/src/app_resources/imgs/funds_pres.png" runat="server" Height="100px"     />
                         </div>
                     </td>
                     <td style="border-spacing:15px" >
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton3" ImageUrl="~/src/app_resources/imgs/funds_labs.png" runat="server" Height="100px"     />
                         </div>
                     </td>
                      <td style="border-spacing:15px">
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton8" ImageUrl="~/src/app_resources/imgs/queue.png" runat="server" Height="100px"     />
                         </div>
                     </td>
                     <%-- <td>
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton9" ImageUrl="~/src/app_resources/imgs/discharged.png" runat="server" Height="100px"     />
                         </div>
                     </td>
                      <td>
                         <div style="border-style:ridge;width:100px;border-radius:25px;border-width:1px">
                            <asp:ImageButton type="button"  ID="ImageButton10" ImageUrl="~/src/app_resources/imgs/Reports.png" runat="server" Height="100px"     />
                         </div>
                     </td>--%>
                 </tr>
             </table>

                             
         </div>
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

          function sos() {             
              window.open("./../Forms/PatientVisit.aspx?", "_self");
              //sidemenu.style.display = "none";
          }

       </script>

</asp:Content>
