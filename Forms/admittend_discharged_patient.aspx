<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="admittend_discharged_patient.aspx.vb" Inherits="CLOUD_HIMS.admittend_discharged_patient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                Admittend/Discharged Patient
            </td>
            <td style="width: 646px; text-align:right">
                <asp:Label ID="Label1" runat="server"  Font-Size="large" Font-  Text="Total Number Of Admission:53"></asp:Label>
            </td>
        </tr>
    </table>
    <table style="width: 829px">
        <tr>
            <td style="width: 80px">
           Search On
            </td>
            <td style="width: 85px">
                <asp:TextBox ID="TextBox1" runat="server" Width="83px"></asp:TextBox>
            </td>
            <td style="width: 133px">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td style="width: 76px">
                <asp:RadioButton ID="RadioButton1" runat="server" Text="Admitted" />
            </td>
            <td>
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Discharged" />
            </td>
            <td style="text-align:right">
                <asp:Button ID="Button1" runat="server" BackColor="Blue" ForeColor="White" Text="Go" />
            </td>


        </tr>
    </table>

    <h2>At 27:54 </h2>

</asp:Content>
