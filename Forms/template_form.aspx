<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="template_form.aspx.vb" Inherits="CLOUD_HIMS.template_form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width:100%;height:50px">
          <div style="width:30%;float:left;">
               <h4 style="padding-left:20px">LAB RESULTS</h4>
          </div>
              
      </div>


    <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll">
             <div style="height:5px"></div>




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
