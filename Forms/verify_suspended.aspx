<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="verify_suspended.aspx.vb" Inherits="CLOUD_HIMS.verify_suspended" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title> SMART LOGISTIC </title>

    <script type = "text/javascript">
       function startTimer(duration, display) {
             var start = Date.now(),
                 diff,
                 minutes,
                 seconds;
             function timer() {
                 diff = duration - (((Date.now() - start) / 1000) | 0);
                 minutes = (diff / 60) | 0;
                 seconds = (diff % 60) | 0;
                 minutes = minutes < 10 ? "0" + minutes : minutes;
                 seconds = seconds < 10 ? "0" + seconds : seconds;

                 display.textContent = minutes + ":" + seconds;

                 if (diff <= 0) {
                     start = Date.now() + 1000;
                    document.getElementById('btnrefresh').click();                  
                 }
             };
             timer();
             setInterval(timer, 1000);
         }

         window.onload = function () {
             var fiveMinutes = 60 * 0.1,
                 display = document.querySelector('#time');
             startTimer(fiveMinutes, display);
         };
     </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <br />
              <table style="width: 100%;margin-top:50px">
                                <tr>
                                    <td style="text-align: center">                                     
                                         <div style="display:none">
                                                    <asp:Button ID="btnrefresh" runat="server"  Text="Button" />
                                            </div>      
                                                                                                                                                          
                                         <div>SORRY, YOUR ACCOUNT IS SUSPENDED! You will be redirected to login page in: <span id="time"></span></div>
                                        <asp:LinkButton Text="Click here to redirect to login page directly!!" runat="server" OnClick="Unnamed1_Click" />
                                    </td>
                                </tr>

                            </table>

         
           
        
       
   
    </form>
</body>
</html>
