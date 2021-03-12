<%@ Page Title="" Language="vb"  AutoEventWireup="false" MasterPageFile="~/src/Master_Forms/doctors.Master" CodeBehind="Doctors_processing.aspx.vb" Inherits="CLOUD_HIMS.Doctors_processing" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <link href="../app_resources/css/Fluid3.css" rel="stylesheet" />
    <link href="../app_resources/css/popup.css" rel="stylesheet" />    
    <script src="../app_resources/js/jquery-1.7.1.js"></script>
    <link href="../../Content/css/select2.css" rel="stylesheet" />
    <script src="../../scripts/master-theme.js"></script>
      <asp:ScriptManager ID="ScriptManager1" runat="server" />
   
    

    <div id="myModal"  class="modal"    >                                            
           <div class="modal-content" style="width:auto;height:500px;margin-right:20px;margin-left:20px">                      
                   <div class="modal-header">
                      <span class="close">&times;</span>
                      <h2>  LAB RESULTS</h2>
                    </div>
                             
               <div class="modal-body" style="margin-bottom:10px"> 
                 <input type="button" onclick="printDiv('PrintDiv')"  value="Print results" style="background-color:black;color:lime" /> <br />
                                        
                   <div style="text-align:center">
                       <h2>Laboratory Report</h2>

                       <table style="margin-left:50px;font-size:large;border-spacing:10px">
                           <tr>
                               <td  style="text-align:right">
                                   Patient Name:
                               </td>
                               <td style="text-align:left">
                                   <asp:Label ID="lblname" runat="server" Text="name"></asp:Label>
                               </td>
                               
                           </tr>
                           <tr>
                              <td style="text-align:right">
                                   Patient id:
                               </td>
                               <td style="text-align:left">
                                   <asp:Label ID="lblid" runat="server" Text="11"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td style="text-align:right">
                                   Age / Sex:
                               </td>
                               <td style="text-align:left">
                                   <asp:Label ID="lblage" runat="server" Text="45  female"></asp:Label>
                               </td>
                                
                           </tr>
                           <tr>
                               <td style="text-align:right">
                                   Print date:-
                               </td>
                               <td style="text-align:left">
                                   <asp:Label ID="lbldate" runat="server" Text=""></asp:Label>
                               </td>
                           </tr>
                       </table>
                   </div>   

                      <div id="PrintDiv" style="border-style:inset;margin-top:20px">   
                         <asp:PlaceHolder ID="Plc1" runat="server"></asp:PlaceHolder>
                        </div>
                 </div>
                              
           </div>

     </div>

         

    <div id="myModal2" class="modal"   >                                            
           <div class="modal-content2" style="width:460px;height:160px">                      
                   <div class="modal-header2">
                        <h2>  SUCCESS</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 
                                  <span> 
                                      You have successfully released the patient. <br />  
                                       You will be redirected to the queue.  
                                  </span>
                                   
                 <br /><br />
                            
                         <asp:Button ID="btnclose" runat="server" Text="CLOSE"  ForeColor="Lime" BackColor="Black" Height="35px" Width="160px" />
               </div>
                              
           </div>

     </div>


    <div id="myModalconfirm"  class="modal" >                                            
           <div class="modal-content2" style="width:465px;height:170px">                      
                   <div class="modal-header3">
                        <h2>  ALERT</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 

                        <div style="margin-top:10px;margin-bottom:10px">
                           <asp:Label ID="Lblconmessage" runat="server" Text="" Font-Size="Large"> </asp:Label>
                        </div>
                                             
                         <asp:Button ID="btncancel" runat="server" Text="CLOSE" OnClientClick="popup_alert_close();"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />

                         
               </div>
                              
           </div>

     </div>


    <div id="myModalconfirm2" class="modal"  >                                            
           <div class="modal-content2" style="width:565px;height:200px">                      
                   <div class="modal-header4">
                        <h2>CONFIRM</h2>
                    </div>

             <div class="modal-body" style="margin-bottom:10px;width:100%;text-align:center"> 

                        <div style="margin-top:10px;margin-bottom:10px">
                            <span>Hey Dr. <br /> 
                                You are about to release this patient. <br /> 
                                Proceed?
                            </span>
                           
                        </div>
                                             
                         <asp:Button ID="Button1" runat="server" Text="No" OnClientClick="alert_close();"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
                        <asp:Button ID="btnproceed" runat="server" Text="yes"   ForeColor="Lime" BackColor="Black" Height="30px" Width="160px" />
                    
               </div>     
           </div>
     </div>

       


    <div style="width:100%;height:50px">
          <div style="width:30%;float:left;">
               <h4 style="padding-left:20px">TREATMENT CENTRE</h4>
          </div>

         <div  style="float:right;text-align:right;width:68%;" >
              <div style="margin-right:20px;margin-top:5px;">
                    <asp:Label ID="lblnames"  runat="server" Text=""></asp:Label>
              </div>
          </div>
   
          
      
      </div>

     <div id="dmains" style="margin-left:10px;margin-right:10px;width:98%;background-color:white;overflow:scroll">
             <div style="height:5px"></div>


                           <div style="border-style:none; height:35px;">  
                 
                               <div style="margin-top:2px;margin-left:5px;">
                                    <asp:Button Text="MEDICAL HISTORY" ID="Btnmedicalrecords"  CssClass="bttns_tabs_active"   runat="server"
                                           Onclick="Btnmedicalrecords_Click"     width="250px" Height="30px"  /> 

                                            <asp:Button Text="CURRENT TREATMENT"  ID="BtnConsultation"  CssClass="bttns_tabs_inactive"   runat="server"
                                                OnClick="BtnConsultation_Click"  width="250px" Height="30px" />  

                                             <asp:Button Text="REFERRAL"  ID="bttnrefal"  CssClass="bttns_tabs_inactive"   runat="server"
                                                          width="200px" Height="30px" />   


                               </div>
                        
             
                     </div>
                         

                           <div style="width:98%;height:35px">
                         
                                 <div style="width:50%;float:left;margin-top:6px">
                                     <span style="font-size:large;margin-left:8px">Treatment Details </span>
                                      
                                </div>
                                <div style="width:20%;float:right;text-align:right;margin-right:30px;margin-top:5px">
                                       <%--<asp:UpdatePanel ID="UpdatePanel2"  runat="server">
                                             <ContentTemplate> --%>
                                                <asp:CheckBox ID="chkcomplete" Text="Release" runat="server" AutoPostBack="true" />&nbsp;
                                                <asp:ImageButton Visible="false" ID="btnsave" OnClick="btnsave_Click" runat="server" ImageUrl="~/src/app_resources/imgs/save.png" Height="25px" Width="25px" />
                                            <%-- </ContentTemplate>
                                         </asp:UpdatePanel>--%>
                                     </div>
                           </div>
                 
              
                        
                
                    <div style="margin-top:6px;width:98%;border-style:solid;border-width:1px;border-color:aliceblue;margin-left:5px;margin-right:5px;height:auto" class="container"> 
                               
                            <div class="left">
                              <asp:Panel ID="Pnlmedicalrecords" runat="server">
                                   <div style="text-align:left">
                                    <asp:Button ID="Btnalergies" runat="server" Text="Alergies"  Height="30px" Width="177px"  CssClass="bttns_link_active"   />
                                    <asp:Button ID="btnimmun"  runat="server" Text="Immunization"  Height="30px" Width="177px" CssClass="bttns_link_inactive"  />
       
                                        <asp:Button ID="Btnhealthissues" runat="server" Text="Health Issues" onclick="Btnhealthissues_Click" Height="30px" Width="177px" CssClass="bttns_link_inactive"  />
        
                                        <asp:Button ID="BtnDiagnosis" runat="server" Text="Previous Diagnosis" OnClick="BtnDiagnosis_Click1" Height="30px" Width="177px" CssClass="bttns_link_inactive" />
      
                                        <asp:Button ID="Btnmedication" runat="server" Text="Medications" OnClick="Btnmedication_Click1" Height="30px" Width="177px" CssClass="bttns_link_inactive"  />
       
                                        <asp:Button ID="BtnTestresults" runat="server" Text="Tests Results" OnClick="BtnTestresults_Click1" Height="30px" Width="177px" CssClass="bttns_link_inactive" />
                                        <asp:Button ID="BtnvisitHis" runat="server" Text="Visit History"  Height="30px" Width="177px" CssClass="bttns_link_inactive" />
         

                                   </div>
                                </asp:Panel>

 
                                <asp:Panel ID="Pnlconsultation" runat="server" Visible="False" >
                                    <asp:Button ID="Btntriage"  runat="server" Text="Nurse Assessment" Height="30px" Width="177px"  CssClass="bttns_link_active"  />
         
                                    <asp:Button ID="Btnn1complaint"  runat="server" Text="Current Complaint" Height="30px" Width="177px"  CssClass="bttns_link_inactive"/>
                                     <asp:Button ID="btninvesti"  runat="server" Text="Lab Requests" Height="30px" Width="177px" CssClass="bttns_link_inactive"/>
         
                                      <asp:Button ID="Btncurrentmedication"  runat="server" Text="Current Medication" Height="30px" Width="177px" CssClass="bttns_link_inactive"/>
         
                        
                                      <asp:Button ID="BtnAllergies"  runat="server" Text="Allergies" Height="30px" Width="177px" CssClass="bttns_link_inactive" />
        
                                      <asp:Button ID="btnnowdiag"  runat="server" Text="Diagnosis" Height="30px" Width="177px" CssClass="bttns_link_inactive" />
                                      <asp:Button ID="btnPres"  runat="server" Text="Prescription Medicine" Height="30px" Width="177px" CssClass="bttns_link_inactive" />
        

                                     </asp:Panel>
      

                                </div>

                        <div class="right">
                            
                            

                          <asp:Panel ID="Pnlmedicalrec" runat="server">
                           <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            

                                <asp:View ID="Vwallergiesreport" runat="server">
                                     <h3>Allergies</h3>
                                          <div style="padding-top:10px">
                                                             <asp:GridView ID="grdalergy" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="descri"
                                                               HeaderText="Description" SortExpression="descri"  ReadOnly="false">
                                                                 <ItemStyle Width="400px" Font-Size="Small" />
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


                                <asp:View ID="Vwmedicalrecords" runat="server">
                                      <h3>Immunization</h3>
                                  <div style="padding-top:20px">
                                               <asp:GridView ID="Gdimmunization" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="qno"
                                                               HeaderText="Queue" SortExpression="qno" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField> 

                                                             <asp:BoundField DataField="arrival"
                                                               HeaderText="Arrival " SortExpression="arrival" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="120px" Font-Size="Small" />
                                                                  </asp:BoundField>       
                                  
                                                                    <asp:BoundField DataField="names"
                                                               HeaderText="Patient Name" SortExpression="colpatientname" ItemStyle-Width="450" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>     
                                   
                                                                    <asp:BoundField DataField="tel"
                                                               HeaderText="Phone No" SortExpression="tel" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField>    
                                                     
                                                                    <asp:BoundField DataField="age"
                                                               HeaderText="Age" SortExpression="age" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                
                                                     
                                                                    <asp:BoundField DataField="gender"
                                                               HeaderText="Gender" SortExpression="gender" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                                                  
                                                                    <asp:BoundField DataField="paymentinfo"
                                                               HeaderText="Payment info" SortExpression="Payment" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>       
                                                       
                                                               <asp:ButtonField ButtonType="Button"  CommandName="view"  HeaderText="Manage Item" ItemStyle-Width="120"
                                                                     ImageUrl="~/src/app_resources/DESIGN/action.png" text="View" ControlStyle-Width="120"/>   
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
      
        

                                <asp:View ID="Vwhealthrtp" runat="server">
                                         <h3>Health Issue</h3>
                                          <div style="padding-top:20px">
                                                             <asp:GridView ID="Grdhealthissue" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="qno"
                                                               HeaderText="Queue" SortExpression="qno" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField> 

                                                             <asp:BoundField DataField="arrival"
                                                               HeaderText="Arrival " SortExpression="arrival" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="120px" Font-Size="Small" />
                                                                  </asp:BoundField>       
                                  
                                                                    <asp:BoundField DataField="names"
                                                               HeaderText="Patient Name" SortExpression="colpatientname" ItemStyle-Width="450" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>     
                                   
                                                                    <asp:BoundField DataField="tel"
                                                               HeaderText="Phone No" SortExpression="tel" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField>    
                                                     
                                                                    <asp:BoundField DataField="age"
                                                               HeaderText="Age" SortExpression="age" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                
                                                     
                                                                    <asp:BoundField DataField="gender"
                                                               HeaderText="Gender" SortExpression="gender" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                                                  
                                                                    <asp:BoundField DataField="paymentinfo"
                                                               HeaderText="Payment info" SortExpression="Payment" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>       
                                                       
                                                               <asp:ButtonField ButtonType="Button"  CommandName="view"  HeaderText="Manage Item" ItemStyle-Width="120"
                                                                     ImageUrl="~/src/app_resources/DESIGN/action.png" text="View" ControlStyle-Width="120"/>   
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



       
                                <asp:View ID="VwDiagnosis" runat="server">
                                       <h3>Previous Diagnosis</h3>
                                          <div style="padding-top:20px">
                                                             <asp:GridView ID="Grddiagnosis" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="qno"
                                                               HeaderText="Queue" SortExpression="qno" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField> 

                                                             <asp:BoundField DataField="arrival"
                                                               HeaderText="Arrival " SortExpression="arrival" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="120px" Font-Size="Small" />
                                                                  </asp:BoundField>       
                                  
                                                                    <asp:BoundField DataField="names"
                                                               HeaderText="Patient Name" SortExpression="colpatientname" ItemStyle-Width="450" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>     
                                   
                                                                    <asp:BoundField DataField="tel"
                                                               HeaderText="Phone No" SortExpression="tel" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField>    
                                                     
                                                                    <asp:BoundField DataField="age"
                                                               HeaderText="Age" SortExpression="age" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                
                                                     
                                                                    <asp:BoundField DataField="gender"
                                                               HeaderText="Gender" SortExpression="gender" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                                                  
                                                                    <asp:BoundField DataField="paymentinfo"
                                                               HeaderText="Payment info" SortExpression="Payment" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>       
                                                       
                                                               <asp:ButtonField ButtonType="Button"  CommandName="view"  HeaderText="Manage Item" ItemStyle-Width="120"
                                                                     ImageUrl="~/src/app_resources/DESIGN/action.png" text="View" ControlStyle-Width="120"/>   
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

                                 <asp:View ID="Vwmedication" runat="server">
                                       <h3>Medications</h3>
                                          <div style="padding-top:20px">
                                               <asp:GridView ID="grdpremeds" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="dates"
                                                               HeaderText="dates" SortExpression="dates"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField> 

                                                             <asp:BoundField DataField="mname"
                                                               HeaderText="Medicine " SortExpression="mname"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>       
                                  
                                                                    <asp:BoundField DataField="dosage"
                                                               HeaderText="dosage" SortExpression="dosage"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>     
                                   
                                                                    <asp:BoundField DataField="frequency"
                                                               HeaderText="Frequency" SortExpression="frequency"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField>   
                                                           
                                                           <asp:BoundField DataField="duration"
                                                               HeaderText="duration" SortExpression="duration"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField>    

                                                           <asp:BoundField DataField="Totaldose"
                                                               HeaderText="Total dose" SortExpression="Totaldose"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField>    
                                                     
                                                                    <asp:BoundField DataField="foodrelation"
                                                               HeaderText="Food Relation" SortExpression="foodrelation"  ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                
                                                     
                                                                    <asp:BoundField DataField="route"
                                                               HeaderText="route" SortExpression="route"  ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                                                  
                                                                    <asp:BoundField DataField="instructions"
                                                               HeaderText="Instructions" SortExpression="instructions" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>    
                                                           
                                                           <asp:BoundField DataField="status"
                                                               HeaderText="Med status" SortExpression="status"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
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

                                   <asp:View ID="Vwtestresults" runat="server">
                                       <h3>Test Results</h3>
                                          <div style="padding-top:20px">
                                                             <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="qno"
                                                               HeaderText="Queue" SortExpression="qno" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField> 

                                                             <asp:BoundField DataField="arrival"
                                                               HeaderText="Arrival " SortExpression="arrival" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="120px" Font-Size="Small" />
                                                                  </asp:BoundField>       
                                  
                                                                    <asp:BoundField DataField="names"
                                                               HeaderText="Patient Name" SortExpression="colpatientname" ItemStyle-Width="450" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>     
                                   
                                                                    <asp:BoundField DataField="tel"
                                                               HeaderText="Phone No" SortExpression="tel" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField>    
                                                     
                                                                    <asp:BoundField DataField="age"
                                                               HeaderText="Age" SortExpression="age" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                
                                                     
                                                                    <asp:BoundField DataField="gender"
                                                               HeaderText="Gender" SortExpression="gender" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"/>
                                                                  </asp:BoundField>         
                                                                                  
                                                                    <asp:BoundField DataField="paymentinfo"
                                                               HeaderText="Payment info" SortExpression="Payment" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" />
                                                                  </asp:BoundField>       
                                                       
                                                               <asp:ButtonField ButtonType="Button"  CommandName="view"  HeaderText="Manage Item" ItemStyle-Width="120"
                                                                     ImageUrl="~/src/app_resources/DESIGN/action.png" text="View" ControlStyle-Width="120"/>   
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
                             

                               <asp:View ID="View2" runat="server">
                                       <h3>Visit History</h3>
                                          <div style="padding-top:20px">
                                                             <asp:GridView ID="grdvhis" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="vdate"
                                                               HeaderText="Visit Date" SortExpression="vdate" ItemStyle-Width="100" ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" />
                                                                  </asp:BoundField> 

                                                             <asp:BoundField DataField="doc"
                                                               HeaderText="Doctory " SortExpression="doc" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="120px" Font-Size="Small" />
                                                                  </asp:BoundField> 

                                                            <asp:BoundField DataField="diag"
                                                               HeaderText="Diagnosis " SortExpression="diag" ReadOnly="false">
                                                                 <ItemStyle  Font-Size="Small" />
                                                                  </asp:BoundField>

                                                           <asp:BoundField DataField="tests"
                                                               HeaderText="Tests Done " SortExpression="tests"  ReadOnly="false">
                                                                 <ItemStyle Font-Size="Small" />
                                                                  </asp:BoundField>        
                                   
                                                       
                                                               <asp:ButtonField ButtonType="Button"  CommandName="view"  HeaderText="View more" ItemStyle-Width="120"
                                                                     ImageUrl="~/src/app_resources/DESIGN/action.png" text="View results" ControlStyle-Width="120"/>   
                                                                  
                                                                  

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
         
      
                            </asp:Panel>
 

                                <asp:Panel ID="Pnlconsultationgr" runat="server">
                                    <asp:MultiView ID="MultiView2" runat="server">

                                        <asp:View ID="Vwnurseassessment" runat="server">
                                            <div style="padding-left:30px">
                                                 <h3>Nurse assesment</h3>
                         <div style="margin-left:10px;margin-right:10px;width:98%;background-color:white;margin-top:15px">          
                                
   
                 
         
       
        

                        <div style=" padding-left:20px;border:solid;border-color:lightslategray" >  
                                <table style=" margin-left: 0px;  margin-top: 0px;">
                                    <tr>

                                         <td style="width: 229px">
                                                    <asp:Label ID="LblSystolicbp" runat="server" Text="Systolic B.P"></asp:Label>
                                                </td>
                                                <td style="width: 239px">
                                                    <asp:TextBox ID="Txtsystolicbp" runat="server"  TabIndex="1"></asp:TextBox>
                                                </td>
            
                                      <td style="width: 163px">
                                                                <asp:Label ID="Lbldiastolicbp" runat="server" Text="Diastolic B.P"></asp:Label>
                                                            </td>
                                                            <td style="width: 228px">
                                                                <asp:TextBox ID="Txtdiastolicbp" runat="server"  TabIndex="2"  ></asp:TextBox>
                                                            </td>
                                        <td style="width: 173px">
                                                                <asp:Label ID="Lbltemp" runat="server" Text="Temperature (0c)"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="Txttemp" runat="server"  TabIndex="3"  ></asp:TextBox>
                                                            </td>

                                    </tr>



                                    <tr>

                                      <td style="width: 229px">
                                                    <asp:Label ID="Label9" runat="server" Text="Weight (Kg)"></asp:Label>
                                                </td>
                                                <td style="width: 239px">
                                                    <asp:TextBox ID="Txtweight" runat="server"  TabIndex="4" style="margin-left: 0px"></asp:TextBox>
                                                </td>

                                          <td style="width: 163px">
                                                                <asp:Label ID="Lblheight" runat="server" Text="Height (cm)"></asp:Label>
                                                            </td>
                                                            <td style="width: 228px">
                                                                <asp:TextBox ID="Txthheight" runat="server"  TabIndex="5"  ></asp:TextBox>
                                                            </td>

                                     <td style="width: 173px">
                                                                <asp:Label ID="Lblbmi" runat="server" Text="BMI (Kg/m2)"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="Txtbmi" runat="server"  TabIndex="6"  ></asp:TextBox>
                                                            </td>
                                    </tr>



                                    <tr>
                                          <td style="width: 229px">
                                                                <asp:Label ID="Lblrespiratory" runat="server" Text="Respiratory Rate(/Min)"></asp:Label>
                                                            </td>
                                                            <td style="width: 239px">
                                                                <asp:TextBox ID="Txtrep" runat="server" TabIndex="7"></asp:TextBox>
                                                            </td>
                                        <td style="width: 163px">
                                                                <asp:Label ID="Lblheartrate" runat="server" Text="Heart Rate(BPM)"></asp:Label>
                                                            </td>
                                                            <td style="width: 228px">
                                                                <asp:TextBox ID="Txtheart" runat="server"  TabIndex="8"  ></asp:TextBox>
                                                            </td>
                                                           <td style="text-align: left; height: 1px; width: 173px;">
                                                                         Blood Sugar
                                                           </td>
           
                                                            <td>
                                                                <asp:TextBox ID="TxtbloodsugarF" runat="server"  TabIndex="10" ></asp:TextBox>
                                                            </td>

                          
                                   </tr>



                                            </table>

                                                <table style="margin-top:30px;margin-bottom:20px">
                                                     <tr>                                    
                                                <td colspan="2">
                                                    <asp:TextBox ID="Txtcomments" Text="comment" runat="server"  TextMode="MultiLine" Rows="4" Width="500px" TabIndex="17" ReadOnly="true"  ></asp:TextBox> 
                                                </td>
                                            </tr>
                                                </table>


                                                </div>
               
                                            <div style="text-align:center">
                                                 <asp:Label ID="lblmsg" runat="server" ></asp:Label>

                                            </div>
                            
          
           
                                             
                                     </div>
                                
                                            </div>
               
                                        </asp:View>

                                        <asp:View ID="Vwpresentingcomplaint" runat="server">
                                           
                                             <span style="font-size:large" > Current complains</span>  <br />    

                                                  <div style="margin-left:7px;margin-top:6px">                                       
                                                       
                                                         <asp:TextBox ID="txtcomp" runat="server" Width="392px" ></asp:TextBox>
                                                           
                                                           <asp:ImageButton ID="imgcomplain"  runat="server" ImageUrl="~/src/app_resources/imgs/addicon.jpg" Height="25px" Width="25px" />
                                     
                                                                         
                                                           <div style="margin-top:8px">
                                                               <textarea id="txtcomplains" runat="server" style="width: 611px; height: 91px; background-color:#e1dada" readonly="readonly"></textarea>
                                                               <img alt="" src="../app_resources/imgs/clear.png" onclick="clearcomp()"   style="width:19px;height:16px" />
                                                   
                                                           </div>
                                                     </div>

                                             <div style="margin-left:7px;margin-top:20px"> 
                                                
                                                          <span style="font-size:large" > Previous complains</span>  <br />                                                            
                                                           <div style="margin-top:8px">
                                                               <textarea id="txtprecomplains" style="width: 611px; height: 91px; background-color:#e1dada" runat="server" readonly="readonly" ></textarea>
                                                                                                                 
                                                           </div>
                                                     </div>
                                        
                                             
                                        </asp:View>


                                        <asp:View ID="Viewinv" runat="server">
                                            <h3>Lab Requests / Investigations</h3>
                                             <table style="width: 548px">
                                                 <tr>
                                                     <td>
                                                            Investigations
                                                     </td>
                                                     <td>
                                                         <asp:DropDownList ID="cbolab" runat="server" Width="360px" Height="20px"></asp:DropDownList>                                                        
                                                         <asp:ImageButton ID="imgaddinv"  runat="server" ImageUrl="~/src/app_resources/imgs/addicon.jpg" Height="25px" Width="25px" />
                                                      </td>
                                                 </tr>                                                
                                             </table>

                                            <div style="margin-top:20px">

                                                 <asp:GridView ID="grdInv" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="requestname"
                                                               HeaderText="Request" SortExpression="requestname"  ReadOnly="false">
                                                                 <ItemStyle Width="250px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField> 

                                                           <asp:BoundField DataField="cost"
                                                               HeaderText="Cost" SortExpression="cost"  ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField> 


                                                             <asp:BoundField DataField="Results"
                                                               HeaderText="Results" SortExpression="Results"  ReadOnly="false">
                                                                 <ItemStyle Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>   
                                                           
                                                          

                                                            <asp:ButtonField ButtonType="Image"  CommandName="view" 
                                                                ImageUrl="~/src/app_resources/imgs/action.png"   >
                                                                 <ItemStyle Width="50px" Font-Size="Small" HorizontalAlign="Right" VerticalAlign="Middle"  />
                                                                  </asp:ButtonField>        
                                  
                                                        
                                                              
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

                                                        
                                        <asp:View ID="VwCurrentmedication" runat="server">
                
                                             <div style="width:100%">
                                                 <div style="width:50%;float:left">
                                                <h3>Current Medication</h3>
                                                 </div>
                                                  <div style="float:right">
                         
                                                 </div>
                                                 <table style="width: 600px">
                                                 <tr>
                                                     <td>
                                                            Medicine name <br />
                                                            <asp:TextBox ID="txtmname" runat="server"></asp:TextBox>
                                                     </td>
                                                     <td>
                                                         Dose / frequecy <br />
                                                            <asp:TextBox ID="txtmdose" runat="server"></asp:TextBox>
                                                     </td>
                                                     <td>
                                                            Duration <br />
                                                            <asp:TextBox ID="txtmdur" runat="server"></asp:TextBox>
                                                     </td>
                                                     <td>
                                                            Route <br />
                                                            <asp:TextBox ID="txmroute" runat="server"></asp:TextBox>
                                                     </td>

                                                     <td>
                                                         
                                                         <asp:ImageButton ID="imgcmedic"  runat="server" ImageUrl="~/src/app_resources/imgs/addicon.jpg" Height="25px" Width="25px" />
                                                      </td>
                                                 </tr>                                                
                                             </table>
                                             </div>
                                            <br />
                                            <div style="border-style:inset">
                                                        <span>Prescribed here</span>                                  
                                                  <asp:GridView ID="grdcmeds" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="dates"
                                                               HeaderText="dates" SortExpression="dates"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField> 

                                                             <asp:BoundField DataField="mname"
                                                               HeaderText="Medicine " SortExpression="mname"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"/>
                                                                  </asp:BoundField>       
                                  
                                                                    <asp:BoundField DataField="dosage"
                                                               HeaderText="dosage" SortExpression="dosage"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>     
                                   
                                                                    <asp:BoundField DataField="frequency"
                                                               HeaderText="Frequency" SortExpression="frequency"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>  
                                                           
                                                           <asp:BoundField DataField="duration"
                                                               HeaderText="duration" SortExpression="duration"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>    

                                                           <asp:BoundField DataField="Totaldose"
                                                               HeaderText="Total dose" SortExpression="Totaldose"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>     
                                                     
                                                                    <asp:BoundField DataField="foodrelation"
                                                               HeaderText="Food Relation" SortExpression="foodrelation"  ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                                  </asp:BoundField>         
                                                
                                                     
                                                                    <asp:BoundField DataField="route"
                                                               HeaderText="route" SortExpression="route"  ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle"/>
                                                                  </asp:BoundField>         
                                                                                  
                                                                    <asp:BoundField DataField="instructions"
                                                               HeaderText="Instructions" SortExpression="instructions" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>    
                                                           
                                                           <asp:BoundField DataField="status"
                                                               HeaderText="Med status" SortExpression="status"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                            <br />

                                          
                                            <div style="margin-top:10px;border-style:inset" class="divs">
                                                <span>From outside</span>
                                          
                                              <asp:GridView ID="grdcmedsout" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           

                                                             <asp:BoundField DataField="mname"
                                                               HeaderText="Medicine " SortExpression="mname"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>       
                                  
                                                                    <asp:BoundField DataField="dosage"
                                                               HeaderText="Dosage / Frequecy " SortExpression="dosage"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>   
                                                             
                                                               <asp:BoundField DataField="duration"
                                                               HeaderText="How long " SortExpression="duration"  ReadOnly="false">
                                                                 <ItemStyle Width="150px"   Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField> 
                                                                                   
                                                     
                                                                    <asp:BoundField DataField="route"
                                                               HeaderText="route" SortExpression="route"  ReadOnly="false">
                                                                 <ItemStyle    Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
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
                             
                            
                                         <asp:View ID="VwAllergies" runat="server">
                                            <h3>Allergies</h3>
                                             <table>
                                                 <tr>
                                                     <td>
                                                            <asp:TextBox ID="txtalergies" runat="server" Width="360px"></asp:TextBox>
                                                         <asp:ImageButton ID="btnalergy"  runat="server" ImageUrl="~/src/app_resources/imgs/addicon.jpg" Height="25px" Width="25px" />
                                  
                                                     </td>
                                                    
                                      
                                                 </tr>
                                             </table>
                                              <div style="margin-top:20px">

                                                 <asp:GridView ID="grdallegy" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="descri"
                                                               HeaderText="Description" SortExpression="descri"  ReadOnly="false">
                                                                 <ItemStyle Width="400px" Font-Size="Small" />
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
                                    
                             
                                    <asp:View ID="Vwcondiagnosis" runat="server"  >
                                        <div class="views">                                       
                                            <h3>Diagnosis</h3>
                                             <div style="width:98%">

                                                 <div style="width:75%;float:left;border-style:inset;border-width:1px;padding-top:10px;padding-bottom:10px">

                                                
                                                 <table style="border-spacing:6px" >
                                                     <tr>
                                                         <td style="width: 163px">
                                                             Attending
                                                         </td>
                                                         <td>
                                                             <asp:DropDownList ID="cboattending" runat="server" Height="28px" Width="232px"></asp:DropDownList>
                                                         </td>
                                                          <td colspan="2" >
                                                             <asp:Label ID="LblType" runat="server" Text="Disease Type"></asp:Label>
                                                         </td>
                                                        <td>
                                                             <asp:DropDownList ID="cbotype" runat="server" Height="28px" Width="206px"></asp:DropDownList>
                                                         </td>
                            
                                                     </tr>
                                                       <tr>
                                                        
                                                            <td  style="width: 168px">
                                                                Disease Category
                                                            
                                                         </td>
                                                         <td style="width: 259px">
                                                              <asp:DropDownList ID="cbodcat" runat="server" Height="28px" Width="235px"></asp:DropDownList>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td style="width: 163px">
                                                              Diagnosis
                                                         </td>
                                                         <td colspan="4">
                                                             <asp:TextBox ID="txtdiag" runat="server" Width="306px"></asp:TextBox>
                                                         </td>
                                                     </tr>
                                                      <tr>
                                                        <td style="width: 163px">
                                                            Diagnosis Code
                                                           
                                                        </td>
                           
                                                        <td colspan="4">
                                                            <asp:TextBox ID="txtdiagcode" runat="server"></asp:TextBox> &nbsp;&nbsp;
                                                            <asp:Label ID="Label6" runat="server" Text="ICD-10"></asp:Label>&nbsp;&nbsp;
                                                             <asp:TextBox ID="Txticd10" runat="server" Width="73px"></asp:TextBox>   
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 163px">
                                                            Status diagnosis

                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtdiastatus" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td colspan="3" style="text-align:right">
                                                           
                                                        </td>
                                                        <td  style="text-align:right;width:200px ">
                                                         
                                                        </td>
                                                         <td  style="text-align:right;width:200px ">
                                                           
                                                        </td>
                                                         <td  style="text-align:right; ">
                                                            <asp:ImageButton ID="ImageButton1"  runat="server" ImageUrl="~/src/app_resources/imgs/addicon.jpg" Height="25px" Width="25px" />
                                  
                                                        </td>
                                                    </tr>
                     
                                                 </table>
                                                 </div>

                                                  
                                                        
                                               
                                             </div>
                                             <br />
                                            

                                             <div style="margin-top:20px" class="divs">

                                                 <asp:GridView ID="grddiag" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="attending"
                                                               HeaderText="Attending" SortExpression="attending"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField> 

                                                             <asp:BoundField DataField="diesetype"
                                                               HeaderText="Disease type" SortExpression="diesetype"  ReadOnly="false">
                                                                 <ItemStyle Width="120px" Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>       
                                  
                                                                    <asp:BoundField DataField="diagtype"
                                                               HeaderText="Diagnosis type" SortExpression="diagtype"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>     
                                   
                                                                    <asp:BoundField DataField="diagnosis"
                                                               HeaderText="Diagnosis" SortExpression="diagnosis"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>    
                                                     
                                                                    <asp:BoundField DataField="diagcode"
                                                               HeaderText="Diagnosis code" SortExpression="diagcode"  ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle"/>
                                                                  </asp:BoundField>         
                                                
                                                     
                                                                    <asp:BoundField DataField="icd10"
                                                               HeaderText="ICD 10" SortExpression="icd10" ReadOnly="false">
                                                                 <ItemStyle Width="100px"  Font-Size="Small"  HorizontalAlign="Center" VerticalAlign="Middle"/>
                                                                  </asp:BoundField>         
                                                                                  
                                                                    <asp:BoundField DataField="diagstatus"
                                                               HeaderText="Diagnosis Status" SortExpression="diagstatus"  ReadOnly="false">
                                                                 <ItemStyle Width="100px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                         </div>
                                       </asp:View>
                           
                           
                                        <asp:View ID="Viewpres" runat="server">
                                            <h3>Prescription</h3>
                                             <div>
                                                 <table style="border-spacing:7px">
                                                     <tr>
                                                         <td>
                                                             <asp:Label ID="Label1" runat="server" Text="Medicine"></asp:Label>
                                                         </td>
                                                         <td colspan="3">
                                                                                                                         
                                                               
                                                             <div class="autocomplete" style="width:300px;">  
                                                             <input id="myInput" type="text" name="myproducts" placeholder="Select Medicine" style="width: 391px"  class="autobox" autocomplete="off" />
                                                            </div>
                                                            
                                                           
                                                             
                                                         </td>
                            
                                                     </tr>
                                                       <tr>
                                                         <td>
                                                             <asp:Label ID="Label2" runat="server" Text="Dossage"></asp:Label>
                                                         </td>
                                                         <td>
                                                             <asp:TextBox ID="txtdosage" runat="server" TextMode="Number"></asp:TextBox> &nbsp;
                                                             <asp:DropDownList ID="cbodosage" runat="server" Height="16px" Width="118px"></asp:DropDownList>
                                                         </td>
                                                            <td>
                                                             <asp:Label ID="Label3" runat="server" Text="Frequency"></asp:Label>
                                                         </td>
                                                         <td>
                                                              <asp:DropDownList ID="cbofreq" runat="server" Height="16px" Width="210px"></asp:DropDownList>
                                                         </td>
                                                          


                                                     </tr>
                                                     <tr>
                                                         <td>
                                                            Duration
                                                         </td>
                                                         <td>
                                                             <asp:TextBox ID="txtduration" TextMode="Number" runat="server"></asp:TextBox>
                                                              <asp:DropDownList ID="cboduration" runat="server"></asp:DropDownList>
                                                         </td>
                                                         <td>
                                                             <asp:Label ID="Label4" runat="server" Text="Food Relation"></asp:Label>
                                                         </td>
                                                         <td>
                                                              <asp:DropDownList ID="cbofood" runat="server" Height="16px" Width="210px"></asp:DropDownList>
                                                         </td>
                                                     </tr>
                                                                    
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server" Text="Route"></asp:Label>
                                                        </td>                           
                                                       <td>
                                                              <asp:DropDownList ID="cboroute" runat="server" Height="16px" Width="210px"></asp:DropDownList>
                                                         </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                             <asp:Label ID="Label7" runat="server" Text="Instructions"></asp:Label>
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:TextBox ID="txtinst" runat="server" Width="520px"></asp:TextBox>
                                                        </td>
                                                        <td colspan="2" style="text-align:right; ">
                                                            <asp:ImageButton ID="imgpres"  runat="server" ImageUrl="~/src/app_resources/imgs/addicon.jpg" Height="25px" Width="25px" />
                                  
                                                        </td>
                                                    </tr>
                                               </table>
                                             </div>
                                            <div style="margin-top:10px">
                                                <asp:GridView ID="grdmedcurrent" runat="server" AutoGenerateColumns="False" style="border-style:inset;background-color:transparent;margin-top:10px"
                                                EnableViewState="False" BorderColor="#E7E7FF" DataKeyNames="id"
                                                   CellPadding="7" BackColor="White" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                                       <AlternatingRowStyle BackColor="#F7F7F7" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                       <Columns> 
                                                                                                                                                                                                                                          
                                                           <asp:BoundField DataField="dates"
                                                               HeaderText="Dates" SortExpression="dates"  ReadOnly="false">
                                                                 <ItemStyle Width="70px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                                  </asp:BoundField> 

                                                             <asp:BoundField DataField="mname"
                                                               HeaderText="Medicine " SortExpression="mname"  ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                                  </asp:BoundField>       
                                  
                                                                    <asp:BoundField DataField="dosage"
                                                               HeaderText="Dosage" SortExpression="dosage"  ReadOnly="false">
                                                                 <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                                  </asp:BoundField>     
                                   
                                                                    <asp:BoundField DataField="frequency"
                                                               HeaderText="Frequency" SortExpression="frequency"  ReadOnly="false">
                                                                 <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                                  </asp:BoundField>    

                                                           <asp:BoundField DataField="duration"
                                                               HeaderText="Duration" SortExpression="duration"  ReadOnly="false">
                                                                 <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                                  </asp:BoundField>    

                                                           <asp:BoundField DataField="Totaldose"
                                                               HeaderText="Total dose" SortExpression="Totaldose"  ReadOnly="false">
                                                                 <ItemStyle Width="70px"  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                                  </asp:BoundField>    
                                                                                                                
                                                                    <asp:BoundField DataField="foodrelation"
                                                               HeaderText="Food Relation" SortExpression="foodrelation"  ReadOnly="false">
                                                                 <ItemStyle Width="200px"   Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>         
                                                
                                                     
                                                                    <asp:BoundField DataField="route"
                                                               HeaderText="Route" SortExpression="route"  ReadOnly="false">
                                                                 <ItemStyle   Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                  </asp:BoundField>         
                                                                                  
                                                                    <asp:BoundField DataField="instructions"
                                                               HeaderText="Instructions" SortExpression="instructions" ItemStyle-Width="150" ReadOnly="false">
                                                                 <ItemStyle Width="150px" Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                                                  </asp:BoundField>    
                                                           
                                                           <asp:BoundField DataField="status"
                                                               HeaderText="Med status" SortExpression="status"  ReadOnly="false">
                                                                 <ItemStyle  Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle"  />
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


                                </asp:Panel>


                             <asp:Panel ID="pnlrefferal" runat="server">
                                   <asp:MultiView ID="MultiView3" runat="server" ActiveViewIndex="0">                           
                                        <asp:View ID="View1" runat="server">
                                             Referral is here
                                        </asp:View>
                                 </asp:MultiView>

                             </asp:Panel>

                            <asp:HiddenField ID="hddvmode" runat="server" />
                             <asp:HiddenField ID="hddpid" runat="server" />
                              <asp:HiddenField ID="hddinput" runat="server" />
                            <asp:HiddenField ID="hdddata" runat="server" />

                        </div>
                  </div>
                
  
    </div>

    
     <script type = "text/javascript">

         var mdsuccess = document.getElementById('myModal2');
         var mdconfirm = document.getElementById('myModalconfirm');
         var myModalconfirm2 = document.getElementById('myModalconfirm2');

         var modal = document.getElementById('myModal');
         var span = document.getElementsByClassName("close")[0];

         span.onclick = function () {            
                   modal.style.display = "none";            
                  document.getElementById('<%= btninvesti.ClientID%>').click();                            
         }
       
         function view_lab() {
             modal.style.display = "block";
         }


         function popup_alert_show() {
             mdconfirm.style.display = "block";
         }

         function popup_alert_close() {
             mdconfirm.style.display = "none";
         }

         function alert_show() {
             myModalconfirm2.style.display = "block";
         }

         function alert_close() {
             myModalconfirm2.style.display = "none";
         }

         function success_show() {
             mdsuccess.style.display = "block";
         }

         function success_close() {
             mdsuccess.style.display = "none";
         }


         



         function printDiv(divName) {
             var printContents = document.getElementById(divName).innerHTML;
             var originalContents = document.body.innerHTML;
             document.body.innerHTML = printContents;

             window.print();

             document.body.innerHTML = originalContents;
         }


          function dashresize() {             
              var heights = window.innerHeight;
              document.getElementById("dmains").style.height = heights - 200 + "px";             
          }
          resize();
          window.onresize = function () {
              dashresize();
          };

        </script>

    <script type = "text/javascript">
       

     function autocomplete(inp, arr) {
  
      var currentFocus;
      inp.addEventListener("input", function(e) {
          var a, b, i, val = this.value;
          closeAllLists();
          if (!val) { return false;}
          currentFocus = -1;
          a = document.createElement("DIV");
          a.setAttribute("id", this.id + "autocomplete-list");
          a.setAttribute("class", "autocomplete-items");
          this.parentNode.appendChild(a);
              for (i = 0; i < arr.length; i++) {
                if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                  b = document.createElement("DIV");
                  b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                  b.innerHTML += arr[i].substr(val.length);
                  b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                  b.addEventListener("click", function(e) {
                      inp.value = this.getElementsByTagName("input")[0].value;
                           closeAllLists();
                  });
                  a.appendChild(b);
                }
              }
          });
          inp.addEventListener("keydown", function(e) {
              var x = document.getElementById(this.id + "autocomplete-list");
              if (x) x = x.getElementsByTagName("div");
              if (e.keyCode == 40) {
                  currentFocus++;
                addActive(x);
              } else if (e.keyCode == 38) { //up
                   currentFocus--;
                   addActive(x);
              } else if (e.keyCode == 13) {
                e.preventDefault();
                if (currentFocus > -1) {
                  if (x) x[currentFocus].click();
                }
              }
          });
        function addActive(x) {          
            if (!x) return false;          
            removeActive(x);
            if (currentFocus >= x.length) currentFocus = 0;
            if (currentFocus < 0) currentFocus = (x.length - 1);            
            x[currentFocus].classList.add("autocomplete-active");
          }
          function removeActive(x) {           
            for (var i = 0; i < x.length; i++) {
              x[i].classList.remove("autocomplete-active");
            }
          }
          function closeAllLists(elmnt) {           
              var x = document.getElementsByClassName("autocomplete-items");             
            for (var i = 0; i < x.length; i++) {
              if (elmnt != x[i] && elmnt != inp) {
                  x[i].parentNode.removeChild(x[i]);
                 
              }
            }
          }
         

          document.addEventListener("click", function (e) {            
              if (document.getElementById("myInput").value != "") {
                 
                  var selected = document.getElementById("myInput").value
                  document.getElementById('<%= hddinput.ClientID%>').value = selected
                      
              }
              closeAllLists(e.target);
          });
   }

  
       

            var products =  [document.getElementById('<%= hdddata.ClientID%>').value] // [document.getElementById("hdddata").value];
            var myarray = JSON.parse(products);
             var mycontrol = document.getElementById("myInput")           
            autocomplete(mycontrol, myarray);
                  

</script>


</asp:Content>
