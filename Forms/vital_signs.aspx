<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Nurse.Master" CodeBehind="vital_signs.aspx.vb" Inherits="CLOUD_HIMS.vital_signs" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
     <script src="../../scripts/master-theme.js"></script>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>


     <div id="myModal2" class="modal"   >                                            
           <div class="modal-content2" style="width:460px;height:150px">                      
                   <div class="modal-header2">
                        <h2>  SUCCESS</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 
                                  YOU HAVE SUCCESSFULLY POSTED . <br />               
                         <asp:Button type="btnclose" ID="btnsaved" runat="server" Text="CLOSE" OnClientClick="close_me();"   ForeColor="Lime" BackColor="Black" Height="35px" Width="160px" />
               </div>
                              
           </div>

     </div>

                 

      <div style="width:100%;height:50px">
          <div style="width:30%;float:left;">
               <h2>Vitual Signs</h2>
          </div>
   
          <div  style="float:right;text-align:right;width:68%;" >
              <div style="margin-right:20px;margin-top:5px">
           
                  <input id="bttnSetup" type="button" value="SAVE VITALS" class="bttns"  runat="server" style="height:50px;width:200px"  />&nbsp;&nbsp

              </div>
          
        
          </div>
      
      </div>

          
  <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;margin-top:15px">          
                                
   
               <div style="background-color:silver; width:100%;">
                   <div style="height:20px"></div> 
                        <table style="width: 780px; margin-left: 10px;background-color:darkseagreen; margin-top: 0px;">
                        <tr >                           
                            <td style="width: 15px">
                                <asp:Label ID="lblnames"  runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 148px">
                                <asp:Label ID="lblqueue_time" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                           
                            <td style="width: 15px">
                                <asp:Label ID="lblgender_age" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 148px">
                                <asp:Label ID="lbllastvisit" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                
                    </table>
                <div style="height:10px"></div> 
                   </div>  
         
       
        

            <div style=" padding-left:20px;border:solid;border-color:lightslategray" >  
                    <table style=" margin-left: 0px;  margin-top: 0px;">
                        <tr>

                             <td style="width: 229px">
                                        <asp:Label ID="LblSystolicbp" runat="server" Text="Systolic B.P"></asp:Label>
                                    </td>
                                    <td style="width: 239px">
                                        <asp:TextBox ID="Txtsystolicbp" runat="server"  TabIndex="1"></asp:TextBox>
                                    </td>
            
                          <td style="width: 163px">
                                                    <asp:Label ID="Lbldiastolicbp" runat="server" Text="Diastolic B.P"></asp:Label>
                                                </td>
                                                <td style="width: 228px">
                                                    <asp:TextBox ID="Txtdiastolicbp" runat="server"  TabIndex="2"  ></asp:TextBox>
                                                </td>
                            <td style="width: 173px">
                                                    <asp:Label ID="Lbltemp" runat="server" Text="Temperature (0c)"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Txttemp" runat="server"  TabIndex="3"  ></asp:TextBox>
                                                </td>

                        </tr>



                        <tr>

                          <td style="width: 229px">
                                        <asp:Label ID="Label9" runat="server" Text="Weight (Kg)"></asp:Label>
                                    </td>
                                    <td style="width: 239px">
                                        <asp:TextBox ID="Txtweight" runat="server"  TabIndex="4" style="margin-left: 0px"></asp:TextBox>
                                    </td>

                              <td style="width: 163px">
                                                    <asp:Label ID="Lblheight" runat="server" Text="Height (cm)"></asp:Label>
                                                </td>
                                                <td style="width: 228px">
                                                    <asp:TextBox ID="Txthheight" runat="server"  TabIndex="5"  ></asp:TextBox>
                                                </td>

                         <td style="width: 173px">
                                                    <asp:Label ID="Lblbmi" runat="server" Text="BMI (Kg/m2)"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Txtbmi" runat="server"  TabIndex="6"  ></asp:TextBox>
                                                </td>
                        </tr>



                        <tr>
                              <td style="width: 229px">
                                                    <asp:Label ID="Lblrespiratory" runat="server" Text="Respiratory Rate(/Min)"></asp:Label>
                                                </td>
                                                <td style="width: 239px">
                                                    <asp:TextBox ID="Txtrep" runat="server" TabIndex="7"></asp:TextBox>
                                                </td>
                            <td style="width: 163px">
                                                    <asp:Label ID="Lblheartrate" runat="server" Text="Heart Rate(BPM)"></asp:Label>
                                                </td>
                                                <td style="width: 228px">
                                                    <asp:TextBox ID="Txtheart" runat="server"  TabIndex="8"  ></asp:TextBox>
                                                </td>
                                               <td style="text-align: left; height: 1px; width: 173px;">
                                                             Blood Sugar
                                               </td>
           
                                                <td>
                                                    <asp:TextBox ID="TxtbloodsugarF" runat="server"  TabIndex="10" ></asp:TextBox>
                                                </td>

                          
                       </tr>



                                </table>

                <table style="margin-top:30px;margin-bottom:20px">
                     <tr>
                <td>
                    <asp:Label ID="LblComments" runat="server" Text="Comments"></asp:Label>  
                </td>
                <td>
                    <asp:TextBox ID="Txtcomments" runat="server" TextMode="MultiLine" Rows="4" Width="500px" TabIndex="17"  ></asp:TextBox> 
                </td>
            </tr>
                </table>


                </div>
               
    <div style="text-align:center">
         <asp:Label ID="lblmsg" runat="server" ></asp:Label>

    </div>



      
  
      <div style="height:30px"></div>
      <div >
          <div style="text-align:center;padding-left:70px; width: 1222px;">
                <table>
           
        </table>
          </div>
          
    </div>
            
          
           
          <asp:HiddenField ID="hddpid" runat="server" />
        <asp:HiddenField ID="Hddqid" runat="server" />
                         </div>
                 
    <script type = "text/javascript">
              

              
                var modal2 = document.getElementById('myModal2');                            
                var span2 = document.getElementsByClassName("close2")[0];
               
                span2.onclick = function () {
                    modal3.style.display = "none";
                    window.open("./queue_all.aspx?", "_self");
                }


                function close_me() {
                  
                    modal3.style.display = "none";
                    //var url = "queue_all.aspx?";
                    //var myWindow = window.open(url, "_self");
                    //myWindow.document.write("Loading..");
                    //window.open(url, "_self");

                    //window.open('./queue_all.aspx?')
                   // window.open("./queue_all.aspx?", "_self");
                   // alert('2')
                }

              
                function Closeme() {
                    modal2.style.display = "block";
                    //modal.style.display = "none";


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
        

            

   
</asp:Content>
