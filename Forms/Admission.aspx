<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Reception.Master" CodeBehind="Admission.aspx.vb" Inherits="CLOUD_HIMS.Admission" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panel1" runat="server" scrollbars="None" >
        <div>
    <table style="width: 978px; margin-left: 0px; margin-top: 0px;">
                <tr >
                    <td style="width: 46px">
                        <asp:Image ID="Image1" runat="server" />
                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Lblpatientname" text-size="50px" runat="server" Text="Anu Roy"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="Label6" runat="server" Text="Adm.Date/Time: 31/02/2021 05:08 PM"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 220px">

                        <asp:Label ID="Label7" runat="server" Text="Female, 23 years"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label8" runat="server" Text="Payer:Private Cash"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="lblregno" runat="server" Text="Reg: No 29, Admission No:5"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label3" runat="server" Text="Kin Name: Puja Khan"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 46px">

                    </td>
                    <td style="width: 220px">
                        <asp:Label ID="Label4" runat="server" Text="Femalt Ward(Medical), Bed No:FM 01"></asp:Label>
                    </td>
                    <td style="width: 148px">
                        <asp:Label ID="label5" runat="server" Text="Kin Mobile No:0786599844"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

        <div >
    <table style="width: 1900px; margin-left: 0px; background-color:lightblue; margin-top: 0px;">
                   <tr  style="background-color:skyblue">
                       <td style="width: 202px">
                            <asp:Label ID="label9" runat="server" Text="Nurse Forms"></asp:Label>

                       </td>
                                  <td style="text-align: left; height: 1px; width: 150px;">
                   <ajax:ComboBox ID="cbsearch" runat="server" AutoCompleteMode="Suggest">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                                  </ajax:ComboBox>
                                  </td>
                       <td style="width: 167px">
                           <asp:Button ID="btnsearch" runat="server" text="Go" OnClick="btnsearch_Click"/>
                       </td>
                       <td style="width:1900px">
                           <asp:Button ID="btnsave" runat="server" text="Save" OnClick="btnsave_Click" style="margin-left: 159px" />
                       </td>

                   </tr>
        <tr style=" background-color:skyblue"> 
            <td style="width: 202px;"> 
          <h4 style="width: 202px">Patient Admision/Assessment</h4>
            </td>
          </tr>
         </table>

        <table> 
        <tr>
                 <td style="width: 200px">  
            Mode of Arrival
                 </td>
             <td style="width: 146px">
                 <asp:CheckBox ID="cbambulatory" runat="server" Text="Ambulatory" />
<%--                <asp:RadioButton ID="Rdambulatory" text="Ambulatory" runat="server" />--%>
            </td>
             <td style="width: 146px">
                 <asp:CheckBox ID="cbambwithaid" runat="server" text="Ambulatory with Aid"/>
<%--                <asp:RadioButton ID="Rdambwithaid" runat="server" text="Ambulatory with Aid"/>--%>
            </td>
             <td style="width: 146px">
                 <asp:CheckBox ID="cbwheelchair" runat="server" text="Wheel chair" />
<%--                <asp:RadioButton ID="Rdwheelchair" runat="server" text="Wheel chair" />--%>
            </td>
             <td style="width: 146px">
                 <asp:CheckBox ID="cbstrecher" runat="server" text="Stretcher"/>
<%--                <asp:RadioButton ID="Rdstrecher" runat="server" text="Stretcher" />--%>
            </td>
        </tr>
     </table>


     <table>

            <tr>
                <td style="width: 200px">
                    Referral
                </td>
                <td>
                    <asp:TextBox ID="txtreferral" runat="server" Width="529px" style="margin-left: 0px"></asp:TextBox>
                </td>
            </tr>
         </table>
            <table>
             <tr>
                <td style="width: 200px">
                    Admitting Medical Doctor
                </td>
                <td>
                    <asp:TextBox ID="txtadmittingmedicaldoctor" runat="server" Width="529px"></asp:TextBox>
                </td>
            </tr>
                </table>
            <table>
             <tr>
                <td style="width: 200px">
                   Time Notified
                </td>
                <td>
               <asp:DropDownList ID="ddlTimeFrom" runat="server" Width="529px"></asp:DropDownList>   
                </td>
            </tr>
                </table>
            <table>
             <tr>
                <td style="width: 200px">
                   Privisional Diagnosis
                </td>
                <td>
                    <asp:TextBox ID="txtprivisionaldiagnosis" runat="server" Width="529px"></asp:TextBox>
                </td>
            </tr>
                </table>
            <table>
             <tr>
                <td style="width: 200px">
                   Name of Admitting Nurse
                </td>
                <td>
                    <asp:TextBox ID="txtadmitting_nurse" runat="server" Width="529px"></asp:TextBox>
                </td>
            </tr>
                </table>
            <table>
             <tr>
                <td style="width: 200px">
                    Rank/Signature
                </td>
                <td>
                    <asp:TextBox ID="txtrank_signature" runat="server" Width="529px"></asp:TextBox>
                </td>
            </tr>
                </table>
            <table>
             <tr>
                <td style="width: 200px; height: 24px;">
                    Type of Patient
                </td>
                <td style="width: 146px; height: 24px;">
                    <asp:CheckBox ID="cb_NHIS" runat="server" Text="NHIS" />
                </td>
                 <td style="width: 146px; height: 24px;">
                     <asp:CheckBox ID="cb_paying" runat="server" Text="Paying" />
                  
                </td>
                 <td style="width: 146px; height: 24px;">
                     <asp:CheckBox ID="cb_others" runat="server" Text="Others" />
<%--                    <asp:RadioButton ID="Rd_others" runat="server" text="others"/>--%>
                </td>
            </tr>
                </table>
            <table>
            <tr>
                <td style="width: 200px">
                    Other(Type of Patient)
                </td>
                <td>
                    <asp:TextBox ID="txtother_typeofpatient" runat="server" Width="529px"></asp:TextBox>
                </td>
            </tr>
                </table>
            <table>
             <tr>
                <td style="width: 200px">
                    Type of Patient
                </td>
                <td style="width: 146px">
                    <asp:CheckBox ID="cb_patient" runat="server" Text="Patient"/>
<%--                    <asp:RadioButton ID="rd_patient" Text="Patient"  runat="server" />--%>
                </td>
                 <td style="width: 146px">
                     <asp:CheckBox ID="cbothers" runat="server" Text="Others"/>
<%--                    <asp:RadioButton ID="rdothers" runat="server" Text="Others" />--%>
                </td>
                 <td style="width: 209px">
                     <asp:CheckBox ID="rdunabl_History" runat="server" text="Unable to Obtain History"/>
<%--                    <asp:RadioButton ID="rdunable_History" runat="server" text="Unable to Obtain History"/>--%>
                </td>
            </tr>
                
            </table>
                            <table>  
                    <tr>
                <td style="width: 200px">
                Orientation to ward

                        </td>
                        <td style="width: 146px">
                            <asp:CheckBox ID="cbyes" runat="server" text="Yes"/>
<%--                            <asp:RadioButton ID="rdyes" runat="server" text="Yes"/>--%>
                        </td>
                          <td style="width: 146px">
                              <asp:CheckBox ID="cb_No" runat="server" Text="No"/>
<%--                            <asp:RadioButton ID="rd_No" runat="server" Text="No" />--%>
                        </td>
                    </tr>
                </table>

<%--            <div>
               <h4 style="background-color:skyblue; width:1900px">Orientation To Unit/Ward</h4>
                <h5>PATIENT ACTIVITY</h5>
            </div>--%>
        </div>
        <asp:ScriptManager ID="manager1" runat="server"></asp:ScriptManager>
    </asp:Panel>
</asp:Content>
