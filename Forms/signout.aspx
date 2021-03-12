<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="signout.aspx.vb" Inherits="CLOUD_HIMS.signout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Smartsys-HIMS - Logout</title>
   
    <link href="../app_resources/css/FluidLogin.css" rel="stylesheet" />
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
</head>
<body style="background:#333333">
    <form id="form1" runat="server">
    <div  >

        

         <asp:Panel ID="PNLLOG" runat="server"  CssClass="LoginSLOGAN">
            
             <div style="width:500px;color:black;background:#ECECEC;margin-top:50px;">
                
           
               
                 <img style="height:30px" src="../app_resources/DESIGN/add3.jpg" />
                  <h3 style="margin-top:5px">SIGNOUT</h3>
            <p style="text-align:left;margin-left:5px;" > 

                This has occurred due to one of the following security reasons:<br/>
                &nbsp;&nbsp;You have clicked on logout button.<br />
                &nbsp;&nbsp;You have kept the browser window idle for a long time.<br />
                &nbsp;&nbsp;You are accessing the application URL fro a saved or static page.<br />
                Please login again to continue.<br />
               </p>

               <div style="text-align:right;margin-bottom:5px;margin-right:3px">
                <asp:Button ID="btnSign" runat="server" Text="Go to Login Page"  CssClass="bttns"  Height="40px" Font-Size="Large"/>
                
                </div>
              <div style="text-align:center;width:98%;margin-bottom:10px">
                 <a href="http://www.quatrixglobal.com" target="_blank"  style="color: black"> </a>
                  <br />

            </div>
       
               
         </div>
     </asp:Panel>

     </div>
    </form>
</body>
</html>
