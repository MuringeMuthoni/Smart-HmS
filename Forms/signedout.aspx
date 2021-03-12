<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="signedout.aspx.vb" Inherits="CLOUD_HIMS.signedout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> CLOUD-HIMS </title>    
    <link href="app_resources/css/FluidLogin.css" rel="stylesheet" />
    <link href="app_resources/css/Fluid3.css" rel="stylesheet" />
</head>
<body style="background:#333333">
    <form id="form1" runat="server">
    <div  >

        

         <asp:Panel ID="PNLLOG" runat="server"  CssClass="LoginSLOGAN">
            
             <div style="width:600px;color:black;background:#ECECEC;margin-top:50px;">
                
           
<img src="app_resources/imgs/icon.png" />
                  <h3 style="margin-top:5px">Application Log off</h3>
            <p style="text-align:center;margin-left:5px;" > 

                You have been successfully logged off:<br/>
            For security reasons, please close the current browser window<br />
             
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
