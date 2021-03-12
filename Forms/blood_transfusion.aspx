<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="blood_transfusion.aspx.vb" Inherits="CLOUD_HIMS.blood_transfusion" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>  
    <asp:Panel ID="Panel1" runat="server">
                <div>
    <table style="width: 1078px; margin-left: 0px;margin-top: 0px;">
                <tr >
                    <td style="width: 46px">
                        <asp:Image ID="Image1" runat="server" />
                    </td>
                    <td style="width: 357px">
                        <asp:Label ID="Label1" text-size="50px" runat="server" Text="Anu Roy"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="Label6" runat="server" Text="Adm.Date/Time: 31/02/2021 05:08 PM"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 357px">
                        <asp:Label ID="Label7" runat="server" Text="Female, 23 years"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label8" runat="server" Text="Payer:Private Cash"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 357px">
                        <asp:Label ID="Label2" runat="server" Text="Reg: No 29, Admission No:5"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label3" runat="server" Text="Kin Name: Puja Khan"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 357px">
                        <asp:Label ID="Label4" runat="server" Text="Femalt Ward(Medical), Bed No:FM 01"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label5" runat="server" Text="Kin Mobile No:0786599844"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table style="width: 1027px">
                <tr>
                    <td style="width: 622px">
                        <h3 style="width: 262px">Blood transfusion</h3>
                    </td>
                    <td style="text-align:right;">
                        <asp:Button ID="Button1" runat="server" Text="Save" BackColor="Blue" ForeColor="White" Font-Bold="true" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 127px;">
                        Blood Transfusion No.
                    </td>
                    <td style="width: 133px;">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 35px">
                        <asp:Button ID="Button2" runat="server" Text="GO" backcolor="Blue" ForeColor="White" Font-Bold="false" Font-Italic="true" Font-Size="Medium"/>
                    </td>
                    <td style="width: 209px; text-align:right">
                        Blood Component Transfused
                    </td>
                    <td style="width: 255px">
                    <asp:TextBox ID="TextBox2" runat="server" Width="167px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="width: 127px;">
                       Start Transfusion (24-hrs)
                    </td>
                    <td style="width: 222px;">
                        <asp:DropDownList ID="ddlTimeFrom" runat="server" Width="180px"></asp:DropDownList>
                    </td>
                    <td style="width: 209px; text-align:right">
                        Finish Transfusion (24-hrs)
                    </td>
                    <td style="width: 255px">
                        <asp:DropDownList ID="ddlTimeTo" runat="server" Width="180px"></asp:DropDownList>
                    </td>
                </tr>
            </table>

        </div>
        <div>
            <table style="width: 900px">
                <tr>
                    <td style="width: 252px; border:medium solid gray; background-color:gray">
                        
                    </td>
                    <td style="width: 550px; border:solid; border-color:gray; background-color:gray">
                        <h5>Start</h5>
                    </td>
                    <td style="width: 550px; border:solid; border-color:gray; background-color:gray">
                        <h5>
                            Finish
                         </h5>
                    </td>
                </tr>

                <tr>
                    <td style="width: 252px; border:medium solid gray; ">
                        BP
                    </td>
                    <td style="width: 550px; border:solid; border-color:gray" >
                        &nbsp;&nbsp;
                        <asp:TextBox ID="TextBox3" runat="server" Width="400px"></asp:TextBox>
                    </td>
                     <td style="width: 550px; border:solid; border-color:gray">
                         &nbsp;&nbsp;
                        <asp:TextBox ID="TextBox4" runat="server" Width="400px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="width: 252px; border:medium solid gray; ">
                        TEMP
                    </td>
                     <td style="width: 550px; border:solid; border-color:gray;">
                         &nbsp;&nbsp;
                        <asp:TextBox ID="TextBox5" runat="server" Width="400px"></asp:TextBox>
                    </td> 
                    <td style="width: 550px; border:solid; border-color:gray">
                        &nbsp;&nbsp;
                        <asp:TextBox ID="TextBox6" runat="server" Width="400px"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td style="width: 252px; border:medium solid gray; ">
                        PULSE
                    </td>
                     <td style="width: 550px; border:solid; border-color:gray">
                         &nbsp;&nbsp;
                        <asp:TextBox ID="TextBox7" runat="server" Width="400px"></asp:TextBox>
                    </td> <td style="width: 550px; border:solid; border-color:gray">
                        &nbsp;&nbsp;
                        <asp:TextBox ID="TextBox8" runat="server" Width="400px"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td style="width: 252px; border:medium solid gray; ">
                        RESP
                    </td>
                     <td style="width: 550px; border:solid; border-color:gray">
                         &nbsp;&nbsp;
                        <asp:TextBox ID="TextBox9" runat="server" Width="400px"></asp:TextBox>
                    </td> <td style="width: 550px; border:solid; border-color:gray">
                        &nbsp;&nbsp;
                        <asp:TextBox ID="TextBox10" runat="server" Width="400px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="width: 51px;border:solid; border-color:gray; background-color:gray"">

                    </td>
                    <td style="width: 200px;border:solid; border-color:gray; background-color:gray"">
                        15 MIN
                    </td>
                    <td style="width: 200px;border:solid; border-color:gray; background-color:gray"">
                        30 MIN
                    </td>
                    <td style="width: 200px;border:solid; border-color:gray; background-color:gray"">
                        1HR
                    </td>
                    <td style="width: 200px;border:solid; border-color:gray; background-color:gray"">
                        2HR
                    </td>
                </tr>
                <tr>
                    <td style="width: 51px">
                        PULSE
                    </td>
                     <td style="width: 200px">
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                    </td> <td style="width: 200px">
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                    </td> <td style="width: 200px">
                        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                    </td> <td style="width: 200px">
                        <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td style="width: 51px">
                        RESP
                    </td>
                     <td style="width: 200px">
                        <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                    </td> <td style="width: 200px">
                        <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                    </td> <td style="width: 200px">
                        <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                    </td> <td style="width: 200px">
                        <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 51px">
                        TEMP
                    </td>
                     <td style="width: 200px">
                        <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                    </td> <td style="width: 200px">
                        <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                    </td> <td style="width: 200px">
                        <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                    </td> <td style="width: 200px">
                        <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        Was the whole unit transfused uneventfully?
                    </td>
                    <td>
                        <asp:RadioButton ID="RadioButton1" runat="server" text="Yes"></asp:RadioButton>
                    </td>
                    <td>
                        <asp:RadioButton ID="RadioButton2" runat="server" text="No"></asp:RadioButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        If no, tick reason for discontinuing transfusion
                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" text="challenges with venous access"/>
                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBox2" runat="server" Text="Transfusion Reaction" />
                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBox3" runat="server" Text="Others" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        Please state reason
                    </td>
                    <td style="width: 548px">
                        <asp:TextBox ID="TextBox23" runat="server" TextMode="MultiLine" Height="54px" Width="492px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        

                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>

    </asp:Panel>
        </div>
</asp:Content>
