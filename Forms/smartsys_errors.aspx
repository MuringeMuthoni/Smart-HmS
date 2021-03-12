<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="smartsys_errors.aspx.vb" Inherits="Netbiz.smartsys_errors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> SMART LOGISTIC </title>
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="../app_resources/imgs/favicon.ico" />
    <link href="../app_resources/css/menu.css" rel="stylesheet" />

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
             var fiveMinutes = 60 * 0.2,
                 display = document.querySelector('#time');
             startTimer(fiveMinutes, display);
         };
     </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
                   <div style="display:none">
                            <asp:Button ID="btnrefresh" runat="server"  Text="Button" />
                    </div>           

        <br />
                
        <div>

        <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
        <div>You will be redirected to login page in: <span id="time"></span></div>
           <%-- <asp:Timer ID="tm_log" Interval="500" Enabled="false" runat="server"></asp:Timer>--%>
            <br />

        </div>

    </div>
    </form>
</body>
</html>
