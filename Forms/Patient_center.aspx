<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Reception.Master" CodeBehind="Patient_center.aspx.vb" Inherits="CLOUD_HIMS.Patient_center" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="float:left;width:80%">
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Patient Name"></asp:Label>
            <asp:TextBox ID="Txtpatientsearch" runat="server"></asp:TextBox>
            <asp:ImageButton ID="imgpatientsearch" runat="server" Height="21px" ImageUrl="~/src/app_resources/imgs/Searchpatient.png" Width="17px" />
        </asp:Panel>
    </div>
     <div style="float:left;width:20%">
        <asp:Panel ID="Panel2" runat="server">
            <div style="text-align:end">

                <asp:Button ID="Btnaddnewpatient" runat="server" Text="Add New" />

            </div>
        </asp:Panel>
    </div>
</asp:Content>
