<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PatientVisit.aspx.vb" Inherits="CLOUD_HIMS.PatientVisit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 style="margin-left:20px">
               Add Triage
            </h2>
        </div>
        <div style="margin-left:200px" >

                    <asp:Label ID="Label1" runat="server" Text="Blood Pressure"></asp:Label>       
                    &nbsp; &nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="Txtpatientname" runat="server" Height="16px" Width="192px"></asp:TextBox>
                            <div style="height:20px"></div>
                     <asp:Label ID="Label2" runat="server" Text="Weight"></asp:Label>       
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;    
                    <asp:TextBox ID="txtweight" runat="server" Height="16px" Width="186px"></asp:TextBox>
                             <div style="height:20px"></div>
                    <asp:Label ID="Label3" runat="server" Text="Temperature"></asp:Label>
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="184px"></asp:TextBox>
                             <div style="text-align:center;border-radius:10px">
                        <asp:Button ID="Btnsave" runat="server" Text="Save" BackColor="Navy" ForeColor="White" Height="38px" Width="104px" />
                </div>
         </div>
    </form>
</body>
</html>
