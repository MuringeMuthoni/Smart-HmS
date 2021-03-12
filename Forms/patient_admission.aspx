<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/outpatient_master.Master" CodeBehind="patient_admission.aspx.vb" Inherits="CLOUD_HIMS.patient_admission" %>
 <%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:ScriptManager ID="sricpmng" runat="server"></asp:ScriptManager>

    <asp:Panel ID="pane" runat="server"> 
    <div style="width: 100%">
        <div style="width:40%; float:left;"  >
                                  <asp:label ID="Label3" runat="server" Text="Patient Admission" Font-Size="xLarge" Font-Bold="True"></asp:label>
        </div>
        <div style="width:50%; float:left; text-align:right">
            <asp:Button ID="btnSave" runat="server" BackColor="Blue" ForeColor="White" Text="SAVE" onclick="btnSave_Click"/>
        </div>
    </div>
           <div style="width:100%;">  
        <table>
            <tr>
                <td>
                     <ajax:ComboBox ID="cbsearch" runat="server" AutoCompleteMode="Suggest">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                  </ajax:ComboBox>
                </td>
                <td>
                    <asp:ImageButton ID="imgpatientsearch" runat="server"  ImageUrl="~/src/app_resources/imgs/Searchpatient.png" Width="27px" />
                </td>
                <td>
                   <asp:Label ID="labelpatientname" runat="server" Text="patient name" Visible="false"></asp:Label> 
                </td>
                <td>
                    <asp:Label ID="labelregno" runat="server" Visible="false" Text="Regno"></asp:Label>
                </td>
                
            </tr>
        </table>
               </div>
        <div>
                      <asp:label ID="Label2" runat="server" Text="Admission Details" Font-Size="xLarge" Font-Bold="True"></asp:label>
        </div>

         <div style="width:100%; border-style:solid; border-color:gray">
            <div style="float:left; width:33.33333333%;">
         <table>
            <tr>
             <td style="text-align: left; width: 150px;" class="">
                     <asp:LinkButton ID="LinkButton1" runat="server" forecolor="blue">Admission Date</asp:LinkButton>
                     <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" PopupButtonID="LinkButton1" TargetControlID="txtadmissiondate" />
                   </td>
            <td style="text-align: left; width: 192px;" class="">
                       <asp:TextBox ID="txtadmissiondate" runat="server" BackColor="Wheat" BorderStyle="None" ClientIDMode="Static" Width="192px" Height="20px" ></asp:TextBox>                                                                                                                                                                             
             </td>   
            </tr>
            <tr>
                 <td style="width: 130px">
                     Ward
                 </td>
               
                 <td style="text-align: left; width: 192px;">
                   <ajax:ComboBox ID="cbward" runat="server" AutoCompleteMode="Suggest" Width="167px">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                  </ajax:ComboBox>
                 </td>
            </tr>
            <tr>
                <td style="height: 26px">
                    Visit Type
                </td>
                <td style="width: 192px; height: 26px;">
                     <ajax:ComboBox ID="cbvisittype" runat="server" AutoCompleteMode="Suggest"  Width="167px">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                  </ajax:ComboBox>
                </td>
            </tr>
             <tr>
                 <td>
                     patient Contact
                 </td>
                 <td>
                     <asp:TextBox ID="txtcontact" runat="server" Width="192px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td>
                     Age
                 </td>
                 <td>
                     <asp:TextBox ID="txtage" runat="server" Width="192px"></asp:TextBox>
                 </td>
             </tr>
        </table>
        </div>
            <div style="float:left; width:33.33333333%">
 <table>
                <tr>
                <td style="text-align: left; width: 130px;" class="">
                        Bed Category
                    </td>
            <td style="text-align: left; width: 192px;" class="">
                     <ajax:ComboBox ID="cbbedcategory" runat="server" AutoCompleteMode="Suggest"  Width="167px">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                  </ajax:ComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Bed No.
                    </td>
                    <td>
                         <ajax:ComboBox ID="Cbbedno" runat="server" AutoCompleteMode="Suggest"  Width="167px">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                  </ajax:ComboBox>
                    </td>
                    </tr>
                <tr>
                    <td>
                        Clinic/Department
                    </td>
                    <td>
                     <ajax:ComboBox ID="Cbclinic" runat="server" AutoCompleteMode="Suggest"  Width="167px">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem></asp:ListItem>
                  </ajax:ComboBox>
                    </td>
                </tr>
     <tr>
         <td>
             Gender
         </td>
         <td>
              <ajax:ComboBox ID="cbgender" runat="server" AutoCompleteMode="Suggest"  Width="167px">
                   <asp:ListItem>Male</asp:ListItem>
                   <asp:ListItem>Female</asp:ListItem>
                  </ajax:ComboBox>
         </td>
     </tr>
            </table>
            </div>
             <div style="float:left; width:33.33333333%">
                             <table>
                                 <tr>
                           <td style="width: 163px">
                                         Floor
                                     </td>
                                     <td>
                                         <ajax:ComboBox ID="cbfloor" runat="server" AutoCompleteMode="Suggest" Width="167px"></ajax:ComboBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         Bill Category
                                     </td>
                                     <td>
                                            <ajax:ComboBox ID="cbbillcategory" runat="server" AutoCompleteMode="Suggest" Width="167px"></ajax:ComboBox>

                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         Adimitting Doctor
                                     </td>
                                     <td>
                                     <ajax:ComboBox ID="cbadimittingdoc" runat="server" AutoCompleteMode="Suggest" Width="167px"></ajax:ComboBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         Address
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txtpatientaddress" runat="server" Width="192px"></asp:TextBox>
                                     </td>
                                 </tr>
                             </table>
                         </div>
            </div>
           <asp:label ID="lable" runat="server" Text="Kin Details" Font-Size="xLarge" Font-Bold="True"></asp:label>
         <div style="width:100%; border-style:solid; border-color:gray;margin-bottom:10px">
            <div style="width:33.33333333%; float:left;">
                <table>                    
                    <tr>
                    <td style="width:150px">
                            Kin Relation
                        </td>
                        <td>
                            <ajax:ComboBox ID="cbkinrelation" runat="server" AutoCompleteMode="Suggest" Width="167px"></ajax:ComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtaddress" runat="server" width="192px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:TextBox ID="txtcountry" runat="server" width="192px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>

              <div style="width:33.33333333%; float:left;">
                            <table>
                                <tr>
                           <td style="text-align: left; width: 130px;" class="">
                                        Kin Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtkinname" runat="server" width="192px"></asp:TextBox>
                                    </td>                                 
                                </tr>
                                <tr>
                                    <td>
                                        Surburb
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtsurburb" runat="server" width="192px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Post Code
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtpostCode" runat="server" width="192px"></asp:TextBox>
                                    </td>
                                    <td>

                                    </td>
                                </tr>
                            </table>
                        </div>
               <div style="width:33.33333333%; float:left;">
                   <table>                     
                       <tr>
                           <td style="height: 24px; width: 163px">
                               City
                           </td>
                           <td style="height: 24px">
                               <asp:TextBox ID="txtcity" runat="server" width="192px"></asp:TextBox>
                           </td>
                             </tr>
                       <tr>
                           <td style="width: 163px">
                               Kin Mobile No.
                           </td>
                           <td>
                               <asp:TextBox ID="txtkinmobile" runat="server" width="192px"></asp:TextBox>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               .
                           </td>
                       </tr>
                   </table>

                </div>
        </div>
       

        <div style="border-color:gray; border-style:solid;margin-top:50px;clear:left;clear:right;clear:both">
           <span style="font-size:x-large;font-weight:bold">Payer info</span>
            <table>
                
                <tr>
                    <td style="width:150px">
                        Payer
                    </td>
                    <td>
                        <asp:TextBox ID="txtpayer" runat="server" width="192px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="height: 26px">
                        Sponsor
                    </td>
                    <td style="height: 26px">
                        <asp:TextBox ID="txtsponsor" runat="server" width="192px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>

     
    </asp:Panel>
</asp:Content>
