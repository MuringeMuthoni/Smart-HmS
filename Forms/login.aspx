<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="CLOUD_HIMS.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smartsys-HIMS - Login</title>

     <script type = "text/javascript">
                  function dashresize() {             
                      var heights = window.innerHeight;
                      document.getElementById("dmains").style.height = heights  + 10 + "px";
                  }
                  resize();
                  window.onresize = function () {
                      dashresize();
                  };

             </script>
    
    
</head>
<body>
    <form id="form1" runat="server" style="padding:0px">
        <div id="dmains" style="height:660px;margin-top:0px;padding:0px">
            <div style="background-color:#0e0730;width:26%;float:left;height:100%;margin-top:0px;padding:0px" > 
        
                        <div style="text-align:center;margin-top:70px" >
                             <img style="width:200px;height:100px" src="../app_resources/DESIGN/smartsy%20hms.png" />
                        </div>      

                        <div style="margin-top:50px;text-align:center;align-content:center;justify-content:center">
                                 <div style="margin-left:10px;text-align:center;align-content:center;"> 
                                     <asp:Login ID="Login1" runat="server"  BorderColor="#4a35f0"
                                        BorderPadding="4"  BorderWidth="1px" Font-Names="Verdana"  
                                        Font-Size="0.8em" ForeColor="white" DisplayRememberMe="False" Width="250px" TitleText="Account Info" UserNameLabelText="Account:">
                                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                                        <LoginButtonStyle BackColor="Black" BorderColor="#CCCCCC" BorderStyle="Solid" 
                                            BorderWidth="2px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Lime" Font-Bold="True" />
                                        <TextBoxStyle Font-Size="0.9em" Width="130px" />
                                        <TitleTextStyle  BackColor="Transparent" Font-Bold="True" Font-Size="1.8em" 
                                            ForeColor="White" />
                        
                                    </asp:Login>
                                    <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="red"></asp:Label>
                                 </div>
                             </div>
                    
              </div>
        
           
                <div style="float:left;width:74%;height:100%">          
                        <img style="height:100%" src="../app_resources/DESIGN/background1.png" />              
          
                </div>


             
    
    </div>
    </form>
</body>
</html>
