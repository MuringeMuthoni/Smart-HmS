<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SmartLogin.aspx.vb" Inherits="hospital13.SmartLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
         .fill {
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden
}
.fill img {
    flex-shrink: 0;
    min-width: 100%;
    min-height: 100%
}
           .auto-style1 {
             float: left;
             width: 30%;
             height: 791px;
         }
           .auto-style2 {             width: 285px;
         }
           .btn btn-info{
                background-color:aqua
           }
           .letspad{
               padding-left:8px
           }
           </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div style="background-color:#0e0730;" class="auto-style1">
           <br />
        <br />
          <br />
        <br />
          <br />
        <br />
          <br />
        <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;&nbsp;&nbsp;&nbsp;;&nbsp;&nbsp;&nbsp;
             <img src="app_resources/smartsy hms (1).png" alt="" />
        
         
        <br />
        <br />
       
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="Txtusername" runat="server" Height="30px" Width="238px" placeholder="username" CssClass="letspad"></asp:TextBox>
        <br />
        <br />
         &nbsp;
        &nbsp;
             &nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="Txtpassword" runat="server" Height="30px" Width="238px" placeholder="password" CssClass="letspad"></asp:TextBox>
        
         <br />
        <br />
        <br />
        
         &nbsp;
        &nbsp;
             &nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         
           <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/app_resources/login icon.png" Width="246px" />
           <br />
         <br />
        <br />
         
          &nbsp;
             &nbsp;
         &nbsp;
             &nbsp;
          &nbsp;
             &nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White">Forgot Your Password?</asp:LinkButton>
        

       <br />
          <br />
        <br />
        <br />
        <div style="text-align:center;" class="auto-style2">
             <br />
            <br />
              <br />
            <br />
         
             <br />
            <br />
           
        
        </div>
        
             <br />
            <br />
       
             </div>
        <div style="float:left;width:70%;height:100%">
            <div class="fill">
    <img src="app_resources/background1.png" alt="" />
</div>
        </div>
    </div>
    </form>
</body>
</html>
