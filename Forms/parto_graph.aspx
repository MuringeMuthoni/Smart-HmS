<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="parto_graph.aspx.vb" Inherits="CLOUD_HIMS.parto_graph" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
                       <div>
    <table style="width: 1078px; margin-left: 0px; background-color:white; margin-top: 0px;">
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
        <div></div>
        <div>
            <table style="width: 870px">
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Partograph" Width="491px" BackColor="DeepSkyBlue" Height="40px" OnClick="Button1_Click1" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Partograph(Labour Room)" Width="522px" backcolor="DeepSkyBlue" Height="40px" OnClick="Button2_Click1"/>
                    </td>

                </tr>
            </table>
        </div>    
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">   
            <asp:View ID="View1" runat="server">   
    <div style="width:100%">
        <div style="width:23%; float:left">
                        <table style="background-color:gray;">
                <tr>
                    <td style="width: 232px">
                        <asp:Button ID="Button3" runat="server" Text="Partograph" Width="230px"  ForeColor="Blue" BackColor="Gray"/>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 232px">
                        <asp:Button ID="Button4" runat="server" Text="Delivery and complications" ForeColor="Blue" BackColor="Gray" Width="230px"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 232px">
                        <asp:Button ID="Button5" runat="server" Text="Apgar Score" Width="231px" ForeColor="Blue" BackColor="Gray"/>
                    </td>
                </tr>
            </table>

           
        </div>
        <div style="width:70%;float:left">
            <table>
                <tr>
                    <td style="width: 487px; font-size:large;">
                        Partograph</td>
                    <td>
                        <asp:Button ID="Button6" runat="server" Text="Save" backcolor="Blue" ForeColor="White" Font-Bold="true"/>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="width: 125px">
                        Gravia
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 125px; text-align:right">
                        Para
                    </td>
                     <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px">
                        LMP
                    </td>
                     <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 125px; text-align:right">
                        EDD
                    </td>
                     <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px">
                        Uterus Size
                    </td>
                     <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                    <td style="text-align: right;width: 125px;">
                     <asp:LinkButton ID="imgone" runat="server"> Admission Date</asp:LinkButton>                                                                                      
                     &nbsp;<ajax:calendarextender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" PopupButtonID="imgone" TargetControlID="datepicker2" />
                   </td>

            <td style="text-align: left;">
                      <asp:TextBox ID="datepicker2" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="172px" Height="16px"></asp:TextBox>                                                                                                                                                                             
                   </td>

                </tr>
                <tr>
                    <td style="width: 125px">
                       Labour Started
                    </td>
                     <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 125px; text-align:right">
                        HOURS
                    </td>
                     <td>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   <td style="width: 125px">
                       Membranes Raptured
                    </td>
                     <td>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 125px; text-align:right">
                        HOURS
                    </td>
                     <td>
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 125px">
                       Pelivis
                    </td>
                     <td>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </div>
                </asp:View>


            <asp:View ID="View2" runat="server">
                <div style="border:solid; border-color:skyblue;">
                    <table>
                        <tr>
                            <td>
                                <h3>Partograph(Labour Room)</h3>
                            </td>
                            <td>
                                <asp:Button ID="Button7" runat="server" Text="Save" backcolor="blue" forecolor="White" Font-Bold="true"/>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td style="width: 170px">
                                Fetal Heart Rate
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Amniotic Fluid
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Moulding
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 170px">
                                Cervical Dilation
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Head Decent
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Constractions(/10min)
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 157px; text-align:right">
                                Constractions(/10min)Count
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Oxytocin(U/L)
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Drop/min
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                       <tr>
                            <td style="width: 170px">
                                Drug Given
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                IV Fluid Given
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Pulse Rate
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                            </td>
                       </tr>
                        <tr>
                             <td style="width: 170px">
                                Systolic B.P
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Diastolic B.P
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Temperature(C)
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                             <td style="width: 170px">
                                Urine(AceTone)
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 157px; text-align:right">
                                Urine(Protein)
                             </td>
                            <td>
                                <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
                            </td> 
                            <td style="width: 157px; text-align:right">
                                Urine(Volume)
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table style=" margin-left: 390px;">
                        <tr>
                            <td>
                                <asp:Button ID="Button8" runat="server" Text="OK" BackColor="LightGreen" ForeColor="darkgreen" Font-Bold="true" Font-Size="Large" />
                            </td>
                        </tr>
                    </table>


                </div>
            </asp:View>
            </asp:MultiView>
         </asp:Panel>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
</asp:Content>
