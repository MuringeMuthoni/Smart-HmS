<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/Nurse.Master" CodeBehind="vitals.aspx.vb" Inherits="CLOUD_HIMS.vitals" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
                       <asp:Button ID="allergize1" runat="server" Text="Allergies/Immunization" BackColor="Green" font-size="large" OnClick="allergize1_Click1" Width="192px" />
                         <asp:Button ID="vitual1" runat="server" Text="Vital Sign" BackColor="Green" font-size="large" OnClick="vitual1_Click1" Width="84px"/>
    </div>
     <asp:MultiView ID="MultiView1" runat="server" activeviewindex="0"> 
         <asp:View ID ="view0" runat="server">
             <h3>Presenting Complaint</h3>
                 <asp:Panel ID="Panel1" runat="server">
                      <div  >  
                          <div style="padding-left:3%;border:solid;border-color:lightslategray" >
                            <h3>Presenting Complaint</h3>
                                       <table>
                            
                             <tr>

                                 <td>
                            <asp:TextBox ID="Txtpresentingcomplaint" runat="server" Height="16px" Width="574px"></asp:TextBox>
                                 </td>
                                 <td>
                                     <asp:ImageButton ID="Imgadd" imageurl="~/src/app_resources/imgs/addicon.jpg" runat="server" Height="16px" Width="19px" />
                                 </td>
                             </tr>
                            
                         </table>
                               <div >
                             <textarea id="Txtpresentcomplaint" style="width: 611px; height: 91px"></textarea>
                         </div>
                         </div>
                          <div style="height:20px"></div>
               
                               <div style="padding-left:3%;border:solid;border-color:lightslategray" >  
                            <h3>Initial Complaint</h3>
                                     
                               <div>
                             <textarea id="Txtinitialcomplaint" style="width: 611px; height: 91px"></textarea>
                         </div>
                         </div>
                          
                         
                     </div>


                 </asp:Panel>
         </asp:View>
                <asp:View ID="View2" runat="server"> 
                      <asp:Panel ID="Panel3" runat="server">
                <div style="padding-left:3%;border:solid;border-color:lightslategray" >  
    <table style="width: 100%; margin-left: 0px;  border-bottom:thin; margin-top: 0px;">
                          <tr>
                        <td style="text-align: left;">
                            <asp:Label ID="Lblpatientreg" runat="server" Text="Patient Reg"></asp:Label>  
                </td>
                              <td>
                                  <asp:TextBox ID="Txtpatientregno" runat="server"></asp:TextBox>
                                   <asp:Button ID="Btnsearch" runat="server" Text="Search" BackColor="#000066" ForeColor="Yellow" />
                              </td>
                             
       </tr>
              
         <tr>
            <td style="text-align: left; height: 1px;">
                             First Name
                  </td>

            <td style="text-align: left; height: 1px;">
                 <asp:TextBox ID="txtpatientfname" runat="server" style="margin-left: 0px"></asp:TextBox>
                 </td>

                        <td style="text-align: left; height: 1px;">
                            Last Name</td>

                        <td style="text-align: left; height: 1px;">
                <asp:TextBox ID="txlastname" runat="server" style="margin-left: 0px" ></asp:TextBox>
                 </td>
                        <td style="text-align: left; height: 1px;">
                                     Patient Type
                                 </td>
                        <td style="text-align: left; height: 1px;">
                                     <asp:TextBox runat="server" Id="txtpatienttype"></asp:TextBox>
                                 </td>
        </tr>

             </table>
                </div>

    


    </asp:Panel>

    <div style="padding-top:10px;height:30px">

        <div style="padding-left:20px;float:left">
           
             <h3>Vitual Signs</h3>
         </div>
          <div style="padding-right:20px;float:right">
               <asp:Button ID="Button1" runat="server" Text="Save" BackColor="#000066" ForeColor="#FF9900"  Width="120px" Height="40px" />
         </div>
    </div>
<div style=" padding-left:20px;border:solid;border-color:lightslategray" >  
    <table style="width: 102%; margin-left: 0px;  margin-top: 0px;">
        <tr>

            <td>
                        <asp:Label ID="LblSystolicbp" runat="server" Text="Systolic B.P"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtsystolicbp" runat="server"  TabIndex="1"></asp:TextBox>
                    </td>
            
           <td>
                                    <asp:Label ID="Lbldiastolicbp" runat="server" Text="Diastolic B.P"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Txtdiastolicbp" runat="server"  TabIndex="2"  ></asp:TextBox>
                                </td>
           <td>
                                    <asp:Label ID="Label2" runat="server" Text="Temperature (0c)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Txttxttemp" runat="server"  TabIndex="3"  ></asp:TextBox>
                                </td>

        </tr>



        <tr>

            <td style="text-align: left; height: 0px;">
                <asp:Label ID="Lblweight" runat="server" Text="Weight"></asp:Label> 
                   </td>

            <td style="text-align: left; height: 1px;">
                       <asp:TextBox ID="Txtweight" runat="server"  BorderStyle="None" ClientIDMode="Static" ></asp:TextBox>                                                                                                                                                                             
                   </td>

             <td>
                                    <asp:Label ID="Lblheight" runat="server" Text="Height (cm)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Txtheight" runat="server"  TabIndex="5"  ></asp:TextBox>
                                </td>

          <td>
                                    <asp:Label ID="Lblbmi" runat="server" Text="BMI (Kg/m2)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Txtbmi" runat="server"  TabIndex="6"  ></asp:TextBox>
                                </td>
        </tr>



        <tr>
           <td>
                                    <asp:Label ID="LblRespiratory" runat="server" Text="Respiratory Rate(/Min)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Txtrespiratory" runat="server"  TabIndex="7"></asp:TextBox>
                                </td>
            <td>
                                    <asp:Label ID="Lblheartrate" runat="server" Text="Heart Rate(BPM)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Txtheart" runat="server"  TabIndex="8"  ></asp:TextBox>
                                </td>
          <td>
                                    <asp:Label ID="LblUrine" runat="server" Text="Urine Output"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Txturineoutput" runat="server"  TabIndex="9"  ></asp:TextBox>
                                </td>
       </tr>



        <tr>

             <td>
                                    <asp:Label ID="LblBloodSugar" runat="server" Text="Blood Sugar(F)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtbpF" runat="server"  TabIndex="10" ></asp:TextBox>
                                </td>
            <td>
                                    <asp:Label ID="LblbloodsugarR" runat="server" Text="Blood Sugar(R)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtbloodsugaR" runat="server"  TabIndex="11"  ></asp:TextBox>
                                </td>
              <td>
                                    <asp:Label ID="LblSpo2" runat="server" Text="SPO2"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxtSpo" runat="server"  TabIndex="12"  ></asp:TextBox>
                                </td>

        </tr>



        <tr>

           <td>
                                    <asp:Label ID="LblAVPU" runat="server" Text="AVPU"></asp:Label>
                                </td>
                               <td>
                                    <asp:TextBox ID="Txtavpu" runat="server"  TabIndex="12"  ></asp:TextBox>
                                </td>
                      <td>
                                    <asp:Label ID="LblTrauma" runat="server" Text="Trauma"></asp:Label>
                                </td>

                                <td>
                                    <asp:TextBox ID="Txttrauma" runat="server"></asp:TextBox>
                                 </td>
               <td>
                                    <asp:Label ID="LblMobility" runat="server" Text="Mobility"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Txtmobility" runat="server" Height="31px" TabIndex="12"  ></asp:TextBox>
                                </td>
      </tr>
        <tr>
             <td>
                                    <asp:Label ID="LblOxygenSupplement" runat="server" Text="OxygenSupplement"></asp:Label>
                                </td>
                               <td>
                                    <asp:TextBox ID="Txtoxygen" runat="server"  TabIndex="12"  ></asp:TextBox>
                                </td>
        </tr>
                </table>
       
                </div>
  <div id="dmains" style="width:100%;height:100%;padding-top:20px;padding-left:20px;padding-right:20px">                      
      <div style="height:20px"></div>
      <div >
          <div style="text-align:center;padding-left:10px; width: 1222px;">
                <table>
            <tr>
                <td>
                    <asp:Label ID="LblComments" runat="server" Text="Comments"></asp:Label>  
                </td>
                <td>
                    <asp:TextBox ID="Txtcomments" runat="server" Height="62px" Width="1103px" TabIndex="17"  ></asp:TextBox> 
                </td>
            </tr>
        </table>
          </div>
          <asp:Label ID="lblmsg" runat="server" ></asp:Label>
    </div>
      <div style="text-align:center">
          
       </div>
       <div >
          <h2>Current Vitals </h2>
      </div>
        
          
           
        <asp:GridView ID="GridView0" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                        EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                           CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                               <AlternatingRowStyle BackColor="#F7F7F7" />
                               <Columns> 
                                <asp:BoundField DataField="id"
                                HeaderText="ID" SortExpression="id" ItemStyle-Width="450" ReadOnly="false" Visible="False">
                                   <ItemStyle Width="150px" />
                                      </asp:BoundField>   
                                                                                                                                                                                                            
                                   <asp:BoundField DataField="colvisittype"
                                       HeaderText="Visit Type" SortExpression="colvisittype" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="120px" />
                                          </asp:BoundField>     
                                  
                                            <asp:BoundField DataField="colscore"
                                       HeaderText="Score" SortExpression="colscore" ItemStyle-Width="150" ReadOnly="false">
                                         <ItemStyle Width="150px" />
                                          </asp:BoundField>     
                                   
                                            <asp:BoundField DataField="coldatetime"
                                       HeaderText="Date Time" SortExpression="coldatetime" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="120px" />
                                          </asp:BoundField>    
                                                     
                                            <asp:BoundField DataField="colsbp"
                                       HeaderText="SBP" SortExpression="colsbp" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="100px" />
                                          </asp:BoundField>         
                                                
                                                     
                                            <asp:BoundField DataField="coldgp"
                                       HeaderText="DBP" SortExpression="coldgp" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="100px" />
                                          </asp:BoundField>   
                                         
                                       <asp:BoundField DataField="coltemp"
                                       HeaderText="TEMP" SortExpression="coltemp" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="100px" />
                                          </asp:BoundField>         
                                   
                                                  <asp:BoundField DataField="colrr"
                                       HeaderText="RR" SortExpression="colrr" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="100px" />
                                          </asp:BoundField>     
                                            <asp:BoundField DataField="colhr"
                                       HeaderText="HR" SortExpression="colhr" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" />
                                          </asp:BoundField>       

                                                  <asp:BoundField DataField="colurineop"
                                       HeaderText="OP" SortExpression="colurineop" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" />
                                          </asp:BoundField>       
                                   
                                                  <asp:BoundField DataField="colBSf"
                                       HeaderText="BS(F)" SortExpression="colBSf" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" />
                                          </asp:BoundField>   
                                    
                                           <asp:BoundField DataField="colBSr"
                                       HeaderText="BS(R)" SortExpression="colBSr" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" />
                                          </asp:BoundField>    

                                      <asp:BoundField DataField="colSpo2"
                                       HeaderText="SPO2" SortExpression="colSpo2" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" />
                                          </asp:BoundField>    

                                   
                                      <asp:BoundField DataField="colAVPU"
                                       HeaderText="AVPU" SortExpression="colAVPU" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="150px" />
                                          </asp:BoundField>    
                                            <asp:BoundField DataField="colTrauma"
                                       HeaderText="Trauma" SortExpression="colTrauma" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="120px" />
                                          </asp:BoundField>       

                                      <asp:BoundField DataField="colMobility"
                                       HeaderText="Mobility" SortExpression="colMobility" ItemStyle-Width="450" ReadOnly="false">
                                         <ItemStyle Width="120px" />
                                          </asp:BoundField>                                                                                                          
                                            </Columns> 
                    
                                             <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                             <HeaderStyle BackColor="#a9b0b9" Font-Bold="True" ForeColor="Black" />
                                             <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                             <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                             <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                             <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                             <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                             <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                         </asp:GridView>
  </div>
                    </asp:View>
     </asp:MultiView> 
     <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>



             <script type = "text/javascript">
                  function dashresize() {             
                      var heights = window.innerHeight;
                      document.getElementById("dmains").style.height = heights - 200 + "px";
                  }
                  resize();
                  window.onresize = function () {
                      dashresize();
                  };


               </script>


</asp:Content>