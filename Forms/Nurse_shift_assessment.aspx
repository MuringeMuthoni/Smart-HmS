<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="Nurse_shift_assessment.aspx.vb" Inherits="CLOUD_HIMS.Nurse_shift_assessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
    <div>
         <table style="width: 1078px; margin-left: 0px; margin-top: 0px;">
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
                        <asp:Label ID="Label4" runat="server" Text="Female Ward(Medical), Bed No:FM 01"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label5" runat="server" Text="Kin Mobile No:0786599844"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr style="border:solid; border-color:deepskyblue">
                    <td>
                        <h3>Nurse  Shift Assessment</h3> 
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Go" BackColor="Blue" ForeColor="White" Font-Bold="true" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Save" BackColor="Blue" ForeColor="White" Font-Bold="true" Font-Size="Large"  />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="New Entry" BackColor="Blue" ForeColor="White" Font-Bold="true" Font-Size="Large"  />

                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        Airway
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox2" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Breathing
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox3" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Circulation
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox4" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Hydration/Nutrition
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox5" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Out/Elemination
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox6" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Skin
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox7" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Pain
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox8" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Disability
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox9" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Focused Assessment
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox10" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Risk Assessment
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox11" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Wellbeing
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox12" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Social Support
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox13" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Others
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox14" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Review Of Medical Record
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox15" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Problem Identified
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox16" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Patient/Client Strength
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox17" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Expected Outcome
                    </td>
                    <td style="width: 585px"> 
                        <asp:TextBox ID="TextBox18" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nursing Order
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox19" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nursing Orders(others)
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox20" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nursing interventions
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox21" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Evaluation
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox22" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Handing Over/Taking UP Notes
                    </td>
                    <td style="width: 585px">
                        <asp:TextBox ID="TextBox23" runat="server" Width="576px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>

    </asp:Panel>
</asp:Content>
