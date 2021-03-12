Imports System.Web.Script.Serialization

Public Class Doctors_processing
    Inherits System.Web.UI.Page
    Private Sub dashboard_receiption_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete

        If Not IsPostBack Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.IsAuthenticated Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        CompanyName = Session("companyname")
        If CompanyName = "" Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        If Session("Department") Is Nothing Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        If IsNothing(Session("did")) Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If

        MultiView1.ActiveViewIndex = 0
        MultiView2.Visible = False
        MultiView3.Visible = False
        If Not IsPostBack Then
            hddpid.Value = Request.QueryString("var1")
            get_patient()
            Load_elergies()
            'Dponurseforms.Items.Add("")
            'Dponurseforms.Items.Add("ER Nurse Note")
            'Dponurseforms.Items.Add("History and Examination")
            'Dponurseforms.Items.Add("Medical History")
            'Dponurseforms.Items.Add("Social history")
            'Dponurseforms.Items.Add("Triage/Emergency unit Admission Form 1")
            'Dponurseforms.Items.Add("Triage/Emergency unit Admission Form 2")
        End If
    End Sub

    Protected Sub Btnmedicalrecords_Click(sender As Object, e As EventArgs) Handles Btnmedicalrecords.Click
        Pnlconsultation.Visible = False
        Pnlmedicalrecords.Visible = True
        pnlrefferal.Visible = False
        MultiView1.Visible = True
        MultiView2.Visible = False
        MultiView3.Visible = False
        Btnmedicalrecords.CssClass = "bttns_tabs_active "
        BtnConsultation.CssClass = "bttns_tabs_inactive"
        bttnrefal.CssClass = "bttns_tabs_inactive"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub




    Protected Sub BtnDiagnosis_Click1(sender As Object, e As EventArgs) Handles BtnDiagnosis.Click
        MultiView1.ActiveViewIndex = 3
        Btnalergies.CssClass = "bttns_link_inactive"
        btnimmun.CssClass = "bttns_link_inactive"
        Btnhealthissues.CssClass = "bttns_link_inactive"
        BtnDiagnosis.CssClass = "bttns_link_active"
        Btnmedication.CssClass = "bttns_link_inactive"
        BtnTestresults.CssClass = "bttns_link_inactive"
        BtnvisitHis.CssClass = "bttns_link_inactive"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub Btnhealthissues_Click(sender As Object, e As EventArgs) Handles Btnhealthissues.Click
        MultiView1.ActiveViewIndex = 2
        Btnalergies.CssClass = "bttns_link_inactive"
        btnimmun.CssClass = "bttns_link_inactive"
        Btnhealthissues.CssClass = "bttns_link_active"
        BtnDiagnosis.CssClass = "bttns_link_inactive"
        Btnmedication.CssClass = "bttns_link_inactive"
        BtnTestresults.CssClass = "bttns_link_inactive"
        BtnvisitHis.CssClass = "bttns_link_inactive"
        BtnvisitHis.CssClass = "bttns_link_inactive"

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub Btnmedication_Click1(sender As Object, e As EventArgs) Handles Btnmedication.Click
        MultiView1.ActiveViewIndex = 4
        Btnalergies.CssClass = "bttns_link_inactive"
        btnimmun.CssClass = "bttns_link_inactive"
        Btnhealthissues.CssClass = "bttns_link_inactive"
        BtnDiagnosis.CssClass = "bttns_link_inactive"
        Btnmedication.CssClass = "bttns_link_active"
        BtnTestresults.CssClass = "bttns_link_inactive"
        BtnvisitHis.CssClass = "bttns_link_inactive"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub BtnTestresults_Click1(sender As Object, e As EventArgs) Handles BtnTestresults.Click
        MultiView1.ActiveViewIndex = 5
        Btnalergies.CssClass = "bttns_link_inactive"
        btnimmun.CssClass = "bttns_link_inactive"
        Btnhealthissues.CssClass = "bttns_link_inactive"
        BtnDiagnosis.CssClass = "bttns_link_inactive"
        Btnmedication.CssClass = "bttns_link_inactive"
        BtnTestresults.CssClass = "bttns_link_active"
        BtnvisitHis.CssClass = "bttns_link_inactive"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub BtnvisitHis_Click(sender As Object, e As EventArgs) Handles BtnvisitHis.Click
        MultiView1.ActiveViewIndex = 6
        Btnalergies.CssClass = "bttns_link_inactive"
        btnimmun.CssClass = "bttns_link_inactive"
        Btnhealthissues.CssClass = "bttns_link_inactive"
        BtnDiagnosis.CssClass = "bttns_link_inactive"
        Btnmedication.CssClass = "bttns_link_inactive"
        BtnTestresults.CssClass = "bttns_link_inactive"
        BtnvisitHis.CssClass = "bttns_link_active"
        VisitHistory()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Private Sub VisitHistory()


        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("vdate")
            dt.Columns.Add("doc")
            dt.Columns.Add("diag")
            dt.Columns.Add("tests")

            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Using Myconn2 As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconn2.ConnectionString = MyString
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()

                    Dim sts As String
                    Dim Scmd, cmd As New MySqlCommand
                    Dim Mydata, seldata As MySqlDataReader
                    Dim Maxid As Int16 = 0
                    Scmd = New MySqlCommand
                    Scmd.Connection = Myconn2
                    Scmd.CommandText = "select id,logstime,pid,qid,did from tbl_treatments where pid=" & hddpid.Value
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            Dim ids As Int16 = Mydata.Item(0)
                            Dim sk As Date = Mydata.Item(1)
                            Dim siku As String = sk.ToString("dd-MMM-yy")
                            Dim pids As Int16 = Mydata.Item(2)
                            Dim Qids As Int16 = Mydata.Item(3)
                            Dim did As Int16 = Mydata.Item(4)

                            Dim doc As String = ""
                            sts = "Select username from tblusers where id=" & did
                            cmd = New MySqlCommand
                            cmd.CommandText = sts
                            cmd.Connection = Myconn
                            Using cmd
                                seldata = cmd.ExecuteReader()
                                Using seldata
                                    If seldata.Read Then
                                        doc = seldata.Item(0)
                                    End If
                                End Using
                            End Using

                            Dim diagnosis As String = ""
                            sts = "Select diagnosis from tbl_diagnosis where qid=" & Qids
                            cmd = New MySqlCommand
                            cmd.CommandText = sts
                            cmd.Connection = Myconn
                            Using cmd
                                seldata = cmd.ExecuteReader()
                                Using seldata
                                    While seldata.Read
                                        diagnosis &= seldata.Item(0) & ", "
                                    End While
                                End Using
                            End Using

                            Dim tests As String = ""
                            sts = "Select requestname from tbl_labrequests where qid=" & Qids
                            cmd = New MySqlCommand
                            cmd.CommandText = sts
                            cmd.Connection = Myconn
                            Using cmd
                                seldata = cmd.ExecuteReader()
                                Using seldata
                                    While seldata.Read
                                        tests &= seldata.Item(0) & ", "
                                    End While
                                End Using
                            End Using


                            dt.Rows.Add(ids, siku, doc, diagnosis, tests)
                            cont += 1

                        End While

                    End Using
                End Using



                If cont >= 1 Then
                    grdvhis.DataSource = dt
                    grdvhis.DataBind()
                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub



    Protected Sub Grid10_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdvhis.RowCommand

        'Try
        Dim currentCommand As String = e.CommandName
        Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument.ToString())
        Dim ss As String = (grdvhis.DataKeys(currentRowIndex).Value)


        If currentCommand = "view" Then

            'popu the lab results window that can be printable
        End If


        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)

    End Sub


    Protected Sub BtnConsultation_Click(sender As Object, e As EventArgs) Handles BtnConsultation.Click, BtnConsultation.Click
        Pnlconsultation.Visible = True
        Pnlmedicalrecords.Visible = False
        pnlrefferal.Visible = False
        MultiView1.Visible = False
        MultiView2.Visible = True
        MultiView3.Visible = False
        MultiView2.ActiveViewIndex = 0

        Btnmedicalrecords.CssClass = "bttns_tabs_inactive"
        BtnConsultation.CssClass = "bttns_tabs_active"
        bttnrefal.CssClass = "bttns_tabs_inactive"

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub Btnreferal_Click(sender As Object, e As EventArgs) Handles BtnConsultation.Click, bttnrefal.Click
        Pnlconsultation.Visible = False
        Pnlmedicalrecords.Visible = False
        pnlrefferal.Visible = True
        MultiView1.Visible = False
        MultiView2.Visible = False
        MultiView3.Visible = True
        MultiView3.ActiveViewIndex = 0

        Btnmedicalrecords.CssClass = "bttns_tabs_inactive"
        BtnConsultation.CssClass = "bttns_tabs_inactive"
        bttnrefal.CssClass = "bttns_tabs_active"

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub BtnAllergies_Click(sender As Object, e As EventArgs) Handles BtnAllergies.Click
        bttalegies()
    End Sub

    Private Sub bttalegies()

        MultiView2.ActiveViewIndex = 4
        MultiView1.Visible = False
        MultiView2.Visible = True
        MultiView3.Visible = False
        Btntriage.CssClass = "bttns_link_inactive"
        Btnn1complaint.CssClass = "bttns_link_inactive"
        Btncurrentmedication.CssClass = "bttns_link_inactive"
        BtnAllergies.CssClass = "bttns_link_active"
        btnnowdiag.CssClass = "bttns_link_inactive"
        btninvesti.CssClass = "bttns_link_inactive"
        Load_elergies()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Private Sub Loadbtnallergies()
        MultiView2.ActiveViewIndex = 4
        MultiView1.Visible = False
        MultiView2.Visible = True
        MultiView3.Visible = False
        Btntriage.CssClass = "bttns_link_inactive"
        Btnn1complaint.CssClass = "bttns_link_inactive"
        Btncurrentmedication.CssClass = "bttns_link_inactive"
        BtnAllergies.CssClass = "bttns_link_active"
        btnnowdiag.CssClass = "bttns_link_inactive"
        btninvesti.CssClass = "bttns_link_inactive"
        Load_elergies()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub Btncurrentmedication_Click(sender As Object, e As EventArgs) Handles Btncurrentmedication.Click
        btncurrent()
    End Sub

    Private Sub btncurrent()
        MultiView2.ActiveViewIndex = 3
        MultiView1.Visible = False
        MultiView2.Visible = True
        MultiView3.Visible = False
        Btntriage.CssClass = "bttns_link_inactive"
        Btnn1complaint.CssClass = "bttns_link_inactive"
        Btncurrentmedication.CssClass = "bttns_link_active"
        BtnAllergies.CssClass = "bttns_link_inactive"
        btnnowdiag.CssClass = "bttns_link_inactive"
        btninvesti.CssClass = "bttns_link_inactive"
        btnPres.CssClass = "bttns_link_inactive"
        Load_meds_current()
        Load_meds_current_outside()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)

    End Sub

    Protected Sub Btnn1complaint_Click(sender As Object, e As EventArgs) Handles Btnn1complaint.Click
        bttcomplains()
        get_complains()
    End Sub

    Private Sub bttcomplains()
        MultiView2.ActiveViewIndex = 1
        MultiView1.Visible = False
        MultiView2.Visible = True
        MultiView3.Visible = False
        Btntriage.CssClass = "bttns_link_inactive"
        Btnn1complaint.CssClass = "bttns_link_active"
        Btncurrentmedication.CssClass = "bttns_link_inactive"
        BtnAllergies.CssClass = "bttns_link_inactive"
        btnPres.CssClass = "bttns_link_inactive"

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub



    Protected Sub Btnalergies_Click(sender As Object, e As EventArgs) Handles Btnalergies.Click
        MultiView2.Visible = False
        MultiView1.ActiveViewIndex = 0
        Btnalergies.CssClass = "bttns_link_active"
        btnimmun.CssClass = "bttns_link_inactive"
        Btnhealthissues.CssClass = "bttns_link_inactive"
        BtnDiagnosis.CssClass = "bttns_link_inactive"
        Btnmedication.CssClass = "bttns_link_inactive"
        BtnTestresults.CssClass = "bttns_link_inactive"
        BtnvisitHis.CssClass = "bttns_link_inactive"
        BtnvisitHis.CssClass = "bttns_link_inactive"
        Load_elergies()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub btnimmun_Click(sender As Object, e As EventArgs) Handles btnimmun.Click
        MultiView1.ActiveViewIndex = 1
        MultiView2.Visible = False
        Btnalergies.CssClass = "bttns_link_inactive"
        btnimmun.CssClass = "bttns_link_active"
        Btnhealthissues.CssClass = "bttns_link_inactive"
        BtnDiagnosis.CssClass = "bttns_link_inactive"
        Btnmedication.CssClass = "bttns_link_inactive"
        BtnTestresults.CssClass = "bttns_link_inactive"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub Btntriage_Click(sender As Object, e As EventArgs) Handles Btntriage.Click
        MultiView1.Visible = False
        MultiView2.Visible = True
        MultiView3.Visible = False
        MultiView2.ActiveViewIndex = 0
        Btntriage.CssClass = "bttns_link_active"
        Btnn1complaint.CssClass = "bttns_link_inactive"
        btninvesti.CssClass = "bttns_link_inactive"
        Btncurrentmedication.CssClass = "bttns_link_inactive"
        BtnAllergies.CssClass = "bttns_link_inactive"
        btnnowdiag.CssClass = "bttns_link_inactive"
        btnPres.CssClass = "bttns_link_inactive"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub btnnowdiag_Click(sender As Object, e As EventArgs) Handles btnnowdiag.Click
        getdiagnosis()
    End Sub
    Private Sub getdiagnosis()
        MultiView1.Visible = False
        MultiView2.Visible = True
        MultiView3.Visible = False
        MultiView2.ActiveViewIndex = 5
        Btntriage.CssClass = "bttns_link_inactive"
        Btnn1complaint.CssClass = "bttns_link_inactive"
        btninvesti.CssClass = "bttns_link_inactive"
        Btncurrentmedication.CssClass = "bttns_link_inactive"
        BtnAllergies.CssClass = "bttns_link_inactive"
        btnnowdiag.CssClass = "bttns_link_active"
        btnPres.CssClass = "bttns_link_inactive"
        Load_diagnosis()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub
    Private Sub get_patient()

        cboattending.Items.Add("")
        cboattending.Items.Add("Emergency")
        cboattending.Items.Add("Acute")
        cboattending.Items.Add("Chronic")
        cboattending.Items.Add("Follow up")

        cbotype.Items.Add("")
        cbotype.Items.Add("Provisional")
        cbotype.Items.Add("Pricipal")

        cbodcat.Items.Add("")
        cbodcat.Items.Add("Primary")
        cbodcat.Items.Add("Secondary")

        cbodosage.Items.Add("Select")
        cbodosage.Items.Add("mg")
        cbodosage.Items.Add("Tablet(s)")


        cbofood.Items.Add("Select")
        cbofood.Items.Add("Before dinner")
        cbofood.Items.Add("After dinner")
        cbofood.Items.Add("With meal")
        cbofood.Items.Add("After meals")
        cbofood.Items.Add("Before breakfast")
        cbofood.Items.Add("After breakfast")

        cboduration.Items.Add("Select")
        cboduration.Items.Add("Days")
        cboduration.Items.Add("Weeks")
        cboduration.Items.Add("Months")

        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader






                cbolab.Items.Add("Select")
                Tcmd = New MySqlCommand
                Tcmd.CommandText = "Select lname  from tbl_labservices where status='ok' order by lname asc"
                Tcmd.Connection = Myconn
                Using Tcmd
                    Mydata = Tcmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            cbolab.Items.Add(Mydata.Item(0))
                        End While
                    End Using
                End Using

                Dim DataArray() As String = {}
                Dim singleitem As String
                Tcmd = New MySqlCommand
                Tcmd.CommandText = "Select ProductName  from tbl_products where status='ok' order by ProductName asc"
                Tcmd.Connection = Myconn
                Using Tcmd
                    Mydata = Tcmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            singleitem = Mydata.Item(0)
                            DataArray = DataArray.Concat({singleitem}).ToArray
                        End While
                    End Using
                End Using

                Dim json As String = New JavaScriptSerializer().Serialize(DataArray)
                hdddata.Value = json

                cbofreq.Items.Clear()
                cbofreq.Items.Add("Select")
                Tcmd = New MySqlCommand
                Tcmd.CommandText = "Select description  from tbl_meds_frequency" ' where id =" & hddpid.Value
                Tcmd.Connection = Myconn
                Using Tcmd
                    Mydata = Tcmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            cbofreq.Items.Add(Mydata.Item(0))
                        End While
                    End Using
                End Using


                cboroute.Items.Clear()
                cboroute.Items.Add("Select")
                Tcmd = New MySqlCommand
                Tcmd.CommandText = "Select description  from tbl_meds_route" ' where id =" & hddpid.Value
                Tcmd.Connection = Myconn
                Using Tcmd
                    Mydata = Tcmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            cboroute.Items.Add(Mydata.Item(0))
                        End While
                    End Using
                End Using

                Dim names As String = ""
                Tcmd = New MySqlCommand
                Tcmd.CommandText = "Select colnames,colage,colgender  from tbl_patient where id =" & hddpid.Value
                Tcmd.Connection = Myconn
                Using Tcmd
                    Mydata = Tcmd.ExecuteReader()
                    Using Mydata
                        If Mydata.Read Then
                            names = Mydata.Item(0) & ",   " & Mydata.Item(1) & "  " & Mydata.Item(2)
                        End If
                    End Using
                End Using

                Dim Maxid As Int16 = 0
                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Tcmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()
                        End If
                    End If
                End Using

                Tcmd.CommandText = "select status from tbl_queue where status='pending' and id=" & Maxid
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        Mydata.Close()

                        cmd = New MySqlCommand("UPDATE tbl_queue SET " &
                                                   " status=?0 " &
                                                   " WHERE id=" & Maxid, Myconn)
                        cmd.Parameters.AddWithValue("?0", "Processing")
                        cmd.ExecuteNonQuery()


                    End If
                End Using


                lblnames.Text = names


                Tcmd.CommandText = "select sysbp,diabp,temps,weight,height,bmi,resprate,heartrate,bloodsuga,comments from tbl_vitals where pid=" & hddpid.Value '& "'" ' and colid='" & Txtpatientid.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        Txtsystolicbp.Text = Mydata.Item(0)
                        Txtdiastolicbp.Text = Mydata.Item(1)
                        Txttemp.Text = Mydata.Item(2)
                        Txtweight.Text = Mydata.Item(3)
                        Txthheight.Text = Mydata.Item(4)
                        Txtbmi.Text = Mydata.Item(5)
                        Txtrep.Text = Mydata.Item(6)
                        Txtheart.Text = Mydata.Item(7)
                        TxtbloodsugarF.Text = Mydata.Item(8)
                        Txtcomments.Text = Mydata.Item(9)

                    End If
                End Using


                Tcmd = New MySqlCommand
                Tcmd.CommandText = "Select complains  from tbl_complains where id =" & Maxid
                Tcmd.Connection = Myconn
                Using Tcmd
                    Mydata = Tcmd.ExecuteReader()
                    Using Mydata
                        If Mydata.Read Then
                            txtprecomplains.InnerText = Mydata.Item(0)
                        End If
                    End Using
                End Using




            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnsave_Click(sender As Object, e As ImageClickEventArgs) Handles btnsave.Click

        'Lblconfmsg.Text = "You are about to release this patient. Proceed?"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "alert_show();", True)

    End Sub

    Private Sub save_treatment()


        Try


                Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
                Dim MyString As String = prests
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Dim Tcmd, Mcmd, cmd As New MySqlCommand
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    Dim Mydata As MySqlDataReader
                    Dim pnames As String = ""
                    Dim tel As String = ""
                    Tcmd = New MySqlCommand
                    Tcmd.CommandText = "Select colnames,colage,colgender  from tbl_patient where id =" & hddpid.Value
                    Tcmd.Connection = Myconn
                    Using Tcmd
                        Mydata = Tcmd.ExecuteReader()
                        Using Mydata
                            If Mydata.Read Then
                                pnames = Mydata.Item(0)
                                tel = Mydata.Item(2)
                            End If
                        End Using
                    End Using

                    Dim Maxid As Int16 = 0
                    Tcmd = New MySqlCommand
                    Tcmd.Connection = Myconn
                    Tcmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                    Mydata = Tcmd.ExecuteReader()
                    Using Mydata
                        If Mydata.Read Then
                            If Not IsDBNull(Mydata.Item(0)) Then
                                Maxid = Mydata.Item(0)
                                Mydata.Close()


                                Tcmd = New MySqlCommand
                                Tcmd.CommandText = "Select id  from tbl_treatments where id =" & Maxid
                                Tcmd.Connection = Myconn
                                Using Tcmd
                                    Mydata = Tcmd.ExecuteReader()
                                    Using Mydata
                                        If Not Mydata.Read Then
                                            Mydata.Close()

                                            cmd = New MySqlCommand("UPDATE tbl_queue SET " &
                                                   " status=?0 " &
                                                   " WHERE id=" & Maxid, Myconn)
                                            cmd.Parameters.AddWithValue("?0", "Completed")
                                            cmd.ExecuteNonQuery()

                                            Dim siku As String = Now.ToString("yyyy-MM-dd")
                                            cmd = New MySqlCommand
                                            Using cmd
                                                cmd.Connection = Myconn
                                                cmd.CommandText = "INSERT INTO tbl_treatments" &
                                                                    "(qid,pid,did,status,dates)" _
                                                                   & "VALUES(?0,?1,?2,?3,?4)"

                                                cmd.Parameters.AddWithValue("?0", Maxid)
                                                cmd.Parameters.AddWithValue("?1", hddpid.Value)
                                                cmd.Parameters.AddWithValue("?2", Session("did"))
                                                cmd.Parameters.AddWithValue("?3", "Completed")
                                                cmd.Parameters.AddWithValue("?4", siku)
                                                cmd.ExecuteNonQuery()
                                            End Using

                                        Else
                                            Mydata.Close()

                                            cmd = New MySqlCommand("UPDATE tbl_queue SET " &
                                                  " status=?0 " &
                                                  " WHERE id=" & Maxid, Myconn)
                                            cmd.Parameters.AddWithValue("?0", "Completed")
                                            cmd.ExecuteNonQuery()


                                        cmd = New MySqlCommand("UPDATE tbl_treatments SET " &
                                                " status=?0 " &
                                                " WHERE id=" & Maxid, Myconn)
                                        cmd.Parameters.AddWithValue("?0", "Completed")
                                            cmd.ExecuteNonQuery()




                                        End If
                                    End Using
                                End Using



                            End If
                        End If
                    End Using
                End Using



            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "success_show();", True)





    End Sub

    Protected Sub btninvesti_Click(sender As Object, e As EventArgs) Handles btninvesti.Click
        bttlabrequest()
    End Sub

    Private Sub bttlabrequest()

        MultiView2.ActiveViewIndex = 2
        MultiView1.Visible = False
        MultiView2.Visible = True
        MultiView3.Visible = False
        Btntriage.CssClass = "bttns_link_inactive"
        Btnn1complaint.CssClass = "bttns_link_inactive"
        btninvesti.CssClass = "bttns_link_active"
        Btncurrentmedication.CssClass = "bttns_link_inactive"
        BtnAllergies.CssClass = "bttns_link_inactive"
        btnnowdiag.CssClass = "bttns_link_inactive"
        btnPres.CssClass = "bttns_link_inactive"
        Load_inv()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub btnPres_Click(sender As Object, e As EventArgs) Handles btnPres.Click
        btt_pres_clicked()

    End Sub

    Private Sub btt_pres_clicked()
        MultiView2.ActiveViewIndex = 6
        MultiView1.Visible = False
        MultiView2.Visible = True
        MultiView3.Visible = False
        Btntriage.CssClass = "bttns_link_inactive"
        Btnn1complaint.CssClass = "bttns_link_inactive"
        btninvesti.CssClass = "bttns_link_inactive"
        Btncurrentmedication.CssClass = "bttns_link_inactive"
        BtnAllergies.CssClass = "bttns_link_inactive"
        btnnowdiag.CssClass = "bttns_link_inactive"
        btnPres.CssClass = "bttns_link_active"
        Load_meds_current()

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)

    End Sub

    Private Sub save_diagnosis()



        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader
                Dim pnames As String = ""
                Dim tel As String = ""

                Dim Maxid As Int16 = 0
                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Tcmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()

                            cmd = New MySqlCommand
                            Using cmd
                                cmd.Connection = Myconn
                                cmd.CommandText = "INSERT INTO tbl_diagnosis" &
                                                "(qid,pid,attending,diesetype,diagtype,diagnosis,diagcode,icd10,diagstatus)" _
                                               & "VALUES(?0,?1,?2,?3,?4,?5,?6,?7,?8)"
                                cmd.Parameters.AddWithValue("?0", Maxid)
                                cmd.Parameters.AddWithValue("?1", hddpid.Value)
                                cmd.Parameters.AddWithValue("?2", cboattending.Text)
                                cmd.Parameters.AddWithValue("?3", cbodcat.Text)
                                cmd.Parameters.AddWithValue("?4", cbotype.Text)
                                cmd.Parameters.AddWithValue("?5", txtdiag.Text)
                                cmd.Parameters.AddWithValue("?6", txtdiagcode.Text)
                                cmd.Parameters.AddWithValue("?7", Txticd10.Text)
                                cmd.Parameters.AddWithValue("?8", txtdiastatus.Text)

                                cmd.ExecuteNonQuery()
                            End Using


                        End If
                    End If
                End Using
            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        Load_diagnosis()

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Private Sub Load_diagnosis()

        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("attending")
            dt.Columns.Add("diesetype")
            dt.Columns.Add("diagtype")
            dt.Columns.Add("diagnosis")
            dt.Columns.Add("diagcode")
            dt.Columns.Add("icd10")
            dt.Columns.Add("diagstatus")




            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim sts As String
                Dim Scmd, cmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                Dim Maxid As Int16 = 0
                Scmd = New MySqlCommand
                Scmd.Connection = Myconn
                Scmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Scmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()


                            sts = "Select id,attending, diesetype, diagtype, diagnosis, diagcode, icd10, diagstatus from tbl_diagnosis where qid=" & Maxid
                            Scmd = New MySqlCommand
                            Scmd.CommandText = sts
                            Scmd.Connection = Myconn
                            Using Scmd
                                Mydata = Scmd.ExecuteReader()
                                Using Mydata
                                    While Mydata.Read

                                        dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7))
                                        cont += 1

                                    End While
                                End Using
                            End Using

                        End If
                    End If
                End Using



                If cont >= 1 Then
                    grddiag.DataSource = dt
                    grddiag.DataBind()
                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub save_diagnosis(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        If cboattending.Text = "" Then
            hddvmode.Value = "Diagnosis Attendance"
            Lblconmessage.Text = "Please insert diagnosis Attendance before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (cbotype.Text = "") Then
            hddvmode.Value = "Disease Type"
            Lblconmessage.Text = "Please insert  Disease Type before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (cbodcat.Text = "") Then
            hddvmode.Value = "Disease Category"
            Lblconmessage.Text = "Please insert  Disease Category before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (txtdiag.Text = "") Then
            hddvmode.Value = "  Diagno"
            Lblconmessage.Text = "Please insert  Diagnosis before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (Txticd10.Text = "") Then
            hddvmode.Value = "ICD-10"
            Lblconmessage.Text = "Please insert ICD-10 before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (txtdiastatus.Text = "") Then
            hddvmode.Value = "Status diagnosis"
            Lblconmessage.Text = "Please insert Status diagnosis before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        Else
            save_diagnosis()
            getdiagnosis()
        End If





    End Sub

    Protected Sub imgaddinv_Click(sender As Object, e As ImageClickEventArgs) Handles imgaddinv.Click
        If cbolab.Text = "Select" Then
            hddvmode.Value = "Lab Request"
            Lblconmessage.Text = "Please select  Lab Request before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
            bttlabrequest()
        Else
            save_inv()
        End If

    End Sub


    Private Sub save_inv()



        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader
                Dim pnames As String = ""
                Dim tel As String = ""

                Dim cost As Double = 0
                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Tcmd.CommandText = "select cost from tbl_labservices where lname='" & cbolab.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        cost = Mydata.Item(0)
                    End If
                End Using


                Dim Maxid As Int16 = 0
                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Tcmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()

                            cmd = New MySqlCommand
                            Using cmd
                                cmd.Connection = Myconn
                                cmd.CommandText = "INSERT INTO tbl_labrequests" &
                                                    "(qid,pid,requestname,cost)" _
                                                   & "VALUES(?0,?1,?2,?3)"
                                cmd.Parameters.AddWithValue("?0", Maxid)
                                cmd.Parameters.AddWithValue("?1", hddpid.Value)
                                cmd.Parameters.AddWithValue("?2", cbolab.Text)
                                cmd.Parameters.AddWithValue("?3", cost)
                                cmd.ExecuteNonQuery()
                            End Using


                        End If
                    End If
                End Using

                cbolab.Text = "Select"
                cost = 0

            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        bttlabrequest()

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Private Sub Load_inv()

        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("requestname")
            dt.Columns.Add("Results")
            dt.Columns.Add("cost")


            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim sts As String
                Dim Scmd, cmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                Dim Maxid As Int16 = 0
                Scmd = New MySqlCommand
                Scmd.Connection = Myconn
                Scmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Scmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()


                            sts = "Select id,requestname, Results,cost from tbl_labrequests where qid=" & Maxid
                            Scmd = New MySqlCommand
                            Scmd.CommandText = sts
                            Scmd.Connection = Myconn
                            Using Scmd
                                Mydata = Scmd.ExecuteReader()
                                Using Mydata
                                    While Mydata.Read
                                        Dim cost As Double = Mydata.Item(3)
                                        dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), FormatNumber(cost, 2))
                                        cont += 1

                                    End While
                                End Using
                            End Using

                        End If
                    End If
                End Using



                If cont >= 1 Then
                    grdInv.DataSource = dt
                    grdInv.DataBind()
                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub



    Private Sub save_alergies()



        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                cmd = New MySqlCommand
                Using cmd
                    cmd.Connection = Myconn
                    cmd.CommandText = "INSERT INTO tbl_elergies" &
                                                    "(pid,descri)" _
                                                   & "VALUES(?0,?1)"
                    cmd.Parameters.AddWithValue("?0", hddpid.Value)
                    cmd.Parameters.AddWithValue("?1", txtalergies.Text)
                    cmd.ExecuteNonQuery()
                End Using


            End Using

            txtalergies.Text = ""

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        Loadbtnallergies()

        'Load_elergies()

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Private Sub Load_elergies()

        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("descri")



            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim sts As String
                Dim Scmd, cmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                Dim Maxid As Int16 = 0



                sts = "Select id,descri from tbl_elergies where pid=" & hddpid.Value
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read

                            dt.Rows.Add(Mydata.Item(0), Mydata.Item(1))
                            cont += 1

                        End While
                    End Using
                End Using




                If cont >= 1 Then
                    grdallegy.DataSource = dt
                    grdallegy.DataBind()

                    grdalergy.DataSource = dt
                    grdalergy.DataBind()
                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnalergy_Click(sender As Object, e As ImageClickEventArgs) Handles btnalergy.Click
        If txtcomp.Text = "" Then
            hddvmode.Value = "Alegies"
            Lblconmessage.Text = "Successful"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        End If
        save_alergies()
    End Sub

    Protected Sub imgpres_Click(sender As Object, e As ImageClickEventArgs) Handles imgpres.Click
        If txtdosage.Text = "" Then
            hddvmode.Value = "PreDosag"
            Lblconmessage.Text = "Please insert Dosage before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (cbodosage.Text = "") Then
            hddvmode.Value = "predosage"
            Lblconmessage.Text = "Please select Dosage before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (cbofreq.Text = "") Then
            hddvmode.Value = "preFrequency"
            Lblconmessage.Text = "Please insert  Frequency before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (txtduration.Text = "") Then
            hddvmode.Value = "  preDuration"
            Lblconmessage.Text = "Please insert Duration before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (txtduration.Text = "") Then
            hddvmode.Value = "selectpreDuration"
            Lblconmessage.Text = "Please select Duration before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (cbofood.Text = "") Then
            hddvmode.Value = "Food Duration"
            Lblconmessage.Text = "Please insert Food Duration diagnosis before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (cboroute.Text = "") Then
            hddvmode.Value = "preroute"
            Lblconmessage.Text = "Please select Route diagnosis before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (txtinst.Text = "") Then
            hddvmode.Value = "preinstruction"
            Lblconmessage.Text = "Please insert Instruction before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        Else
            save_meds()
            btt_pres_clicked()
        End If
    End Sub

    Private Sub save_meds()



        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim sts As String
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                Dim Maxid As Int16 = 1
                Dim qtyperday As Int16
                Scmd = New MySqlCommand
                Scmd.Connection = Myconn
                Scmd.CommandText = "select qty from tbl_meds_frequency where description='" & cbofreq.Text & "'"
                Mydata = Scmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        qtyperday = Mydata.Item(0)
                    End If
                End Using


                Scmd = New MySqlCommand
                Scmd.Connection = Myconn
                Scmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Scmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()

                            Dim dosage As String = txtdosage.Text & " " & cbodosage.Text
                            Dim dailydose As Int16 = txtdosage.Text * qtyperday


                            cboduration.Items.Add("Days")
                            cboduration.Items.Add("Weeks")
                            cboduration.Items.Add("Months")

                            Dim qty As Int16
                            If cboduration.SelectedIndex = 1 Then
                                qty = dailydose * Val(txtduration.Text)
                            ElseIf cboduration.SelectedIndex = 1 Then
                                qty = (dailydose * Val(txtduration.Text)) * 7
                            ElseIf cboduration.SelectedIndex = 2 Then
                                qty = (dailydose * Val(txtduration.Text)) * 30
                            End If

                            Dim duration As String = Val(txtduration.Text) & " " & cboduration.Text

                            cmd = New MySqlCommand
                            Using cmd
                                cmd.Connection = Myconn
                                cmd.CommandText = "INSERT INTO tbl_meds_prescription" &
                                                    "(pid,qid,mname,dosage,frequency,foodrelation,route,instructions,Totaldose,duration)" _
                                                   & "VALUES(?0,?1,?2,?3,?4,?5,?6,?7,?8,?9)"
                                cmd.Parameters.AddWithValue("?0", hddpid.Value)
                                cmd.Parameters.AddWithValue("?1", Maxid)
                                cmd.Parameters.AddWithValue("?2", hddinput.Value)
                                cmd.Parameters.AddWithValue("?3", dosage)
                                cmd.Parameters.AddWithValue("?4", cbofreq.Text)
                                cmd.Parameters.AddWithValue("?5", cbofood.Text)
                                cmd.Parameters.AddWithValue("?6", cboroute.Text)
                                cmd.Parameters.AddWithValue("?7", txtinst.Text)
                                cmd.Parameters.AddWithValue("?8", qty)
                                cmd.Parameters.AddWithValue("?9", duration)
                                cmd.ExecuteNonQuery()
                            End Using

                        End If
                    End If
                End Using


            End Using

            hddinput.Value = ""
            cbofreq.Text = "Select"
            cbofood.Text = "Select"
            cboroute.Text = "Select"
            txtinst.Text = ""
            cboduration.Text = "Select"

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        btt_pres_clicked()


        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub


    Private Sub Load_meds_current()

        Try


            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("dates")
            dt.Columns.Add("mname")
            dt.Columns.Add("dosage")
            dt.Columns.Add("frequency")
            dt.Columns.Add("duration")
            dt.Columns.Add("Totaldose")
            dt.Columns.Add("foodrelation")
            dt.Columns.Add("route")
            dt.Columns.Add("instructions")
            dt.Columns.Add("status")



            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim sts As String
                Dim Scmd, cmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                Dim Maxid As Int16 = 0
                Scmd = New MySqlCommand
                Scmd.Connection = Myconn
                Scmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Scmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()

                            sts = "Select id,logstime,mname,dosage,frequency,duration,Totaldose,foodrelation,route,instructions,status from tbl_meds_prescription where pid=" & hddpid.Value & " and qid=" & Maxid
                            Scmd = New MySqlCommand
                            Scmd.CommandText = sts
                            Scmd.Connection = Myconn
                            Using Scmd
                                Mydata = Scmd.ExecuteReader()
                                Using Mydata
                                    While Mydata.Read
                                        Dim sk As Date = Mydata.Item(1)
                                        Dim siku As String = sk.ToString("dd-MMM-yy")
                                        dt.Rows.Add(Mydata.Item(0), siku, Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7), Mydata.Item(8), Mydata.Item(9), Mydata.Item(10))
                                        cont += 1

                                    End While
                                End Using
                            End Using

                        End If
                    End If
                End Using



                If cont >= 1 Then
                    grdmedcurrent.DataSource = dt
                    grdmedcurrent.DataBind()

                    grdcmeds.DataSource = dt
                    grdcmeds.DataBind()

                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub


    Private Sub Load_meds_previous()

        Try


            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("dates")
            dt.Columns.Add("mname")
            dt.Columns.Add("dosage")
            dt.Columns.Add("frequency")
            dt.Columns.Add("duration")
            dt.Columns.Add("Totaldose")
            dt.Columns.Add("foodrelation")
            dt.Columns.Add("route")
            dt.Columns.Add("instructions")
            dt.Columns.Add("status")

            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim sts As String
                Dim Scmd, cmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                Dim Maxid As Int16 = 0
                Scmd = New MySqlCommand
                Scmd.Connection = Myconn
                Scmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Scmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()

                            '"(pid,qid,mname,dosage,frequency,foodrelation,route,instructions)" _

                            sts = "Select id,logstime,mname,dosage,frequency,duration,Totaldose,foodrelation,route,instructions,status from tbl_meds_prescription where pid=" & hddpid.Value & " and qid<>" & Maxid
                            Scmd = New MySqlCommand
                            Scmd.CommandText = sts
                            Scmd.Connection = Myconn
                            Using Scmd
                                Mydata = Scmd.ExecuteReader()
                                Using Mydata
                                    While Mydata.Read
                                        Dim sk As Date = Mydata.Item(1)
                                        Dim siku As String = sk.ToString("dd-MMM-yy")
                                        dt.Rows.Add(Mydata.Item(0), siku, Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7), Mydata.Item(8), Mydata.Item(9), Mydata.Item(10))
                                        cont += 1

                                    End While
                                End Using
                            End Using

                        End If
                    End If
                End Using



                If cont >= 1 Then
                    grdpremeds.DataSource = dt
                    grdpremeds.DataBind()
                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub


    Private Sub Load_meds_current_outside()

        Try


            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("mname")
            dt.Columns.Add("dosage")
            dt.Columns.Add("duration")
            dt.Columns.Add("route")


            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim sts As String
                Dim Scmd, cmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                Dim Maxid As Int16 = 0

                Scmd = New MySqlCommand
                Scmd.Connection = Myconn
                Scmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Scmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()

                            sts = "Select id,mname,dosage,duration,route from tbl_meds_outside where qid=" & Maxid
                            Scmd = New MySqlCommand
                            Scmd.CommandText = sts
                            Scmd.Connection = Myconn
                            Using Scmd
                                Mydata = Scmd.ExecuteReader()
                                Using Mydata
                                    While Mydata.Read

                                        dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4))
                                        cont += 1

                                    End While
                                End Using
                            End Using
                        End If
                    End If
                End Using

                If cont >= 1 Then
                    grdcmedsout.DataSource = dt
                    grdcmedsout.DataBind()

                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub


    Protected Sub imgcomplain_Click(sender As Object, e As ImageClickEventArgs) Handles imgcomplain.Click
        'If txtcomplains.InnerText = "" Then
        '    hddvmode.Value = "Complains"
        '    Lblconmessage.Text = "Please insert  Complains before you proceed"
        '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        '    bttcomplains()
        'Else
        save_complains()
        'End If

    End Sub

    Protected Sub save_complains()

        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader


                Dim Maxid As Int16 = 0
                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Tcmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()


                            cmd = New MySqlCommand
                            Using cmd
                                cmd.Connection = Myconn
                                cmd.CommandText = "INSERT INTO tbl_complains" &
                                                    "(qid,pid,complains,did)" _
                                                   & "VALUES(?0,?1,?2,?3)"

                                cmd.Parameters.AddWithValue("?0", Maxid)
                                cmd.Parameters.AddWithValue("?1", hddpid.Value)
                                cmd.Parameters.AddWithValue("?2", txtcomp.Text)
                                cmd.Parameters.AddWithValue("?3", Session("did"))
                                cmd.ExecuteNonQuery()
                            End Using


                        End If
                    End If
                End Using
            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        Dim prev As String = txtcomplains.InnerText
        txtcomplains.InnerText = prev & vbCrLf & txtcomp.Text
        txtcomp.Text = ""

        bttcomplains()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub


    Protected Sub get_complains()

        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader


                Dim Maxid As Int16 = 0
                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Tcmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()


                            cmd = New MySqlCommand
                            cmd.CommandText = "select complains from tbl_complains where qid=" & Maxid
                            cmd.Connection = Myconn
                            Using cmd
                                Mydata = cmd.ExecuteReader()
                                Using Mydata
                                    While Mydata.Read
                                        txtprecomplains.InnerText &= Mydata.Item(0) & vbCrLf
                                    End While

                                End Using
                            End Using


                        End If
                    End If
                End Using
            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub imgcmedic_Click(sender As Object, e As ImageClickEventArgs) Handles imgcmedic.Click

        If txtmname.Text = "" Then
            hddvmode.Value = "Medicine"
            Lblconmessage.Text = "Please insert  Medicine name before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (txtmdose.Text = "") Then
            hddvmode.Value = "Medicine Dose"
            Lblconmessage.Text = "Please insert  Dose before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (txtmdur.Text = "") Then
            hddvmode.Value = "Medicine Duration"
            Lblconmessage.Text = "Please insert  Duration before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        ElseIf (txmroute.Text = "") Then
            hddvmode.Value = "Medicine Route"
            Lblconmessage.Text = "Please insert  Route before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
        Else
            save_current_meds()
        End If




    End Sub

    Protected Sub save_current_meds()

        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader


                Dim Maxid As Int16 = 0
                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Tcmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        If Not IsDBNull(Mydata.Item(0)) Then
                            Maxid = Mydata.Item(0)
                            Mydata.Close()


                            cmd = New MySqlCommand
                            Using cmd
                                cmd.Connection = Myconn
                                cmd.CommandText = "INSERT INTO tbl_meds_outside" &
                                                    "(pid,mname,dosage,duration,route,qid)" _
                                                   & "VALUES(?0,?1,?2,?3,?4,?5)"
                                cmd.Parameters.AddWithValue("?0", hddpid.Value)
                                cmd.Parameters.AddWithValue("?1", txtmname.Text)
                                cmd.Parameters.AddWithValue("?2", txtmdose.Text)
                                cmd.Parameters.AddWithValue("?3", txtmdur.Text)
                                cmd.Parameters.AddWithValue("?4", txmroute.Text)
                                cmd.Parameters.AddWithValue("?5", Maxid)
                                cmd.ExecuteNonQuery()
                            End Using


                        End If
                    End If
                End Using
            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        txtmname.Text = ""
        txtmdose.Text = ""
        txtmdur.Text = ""
        txmroute.Text = ""
        btncurrent()

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub


    Protected Sub grdInv_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdInv.RowCommand

        'Try
        Dim currentCommand As String = e.CommandName
        Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument.ToString())
        Dim ss As String = (grdInv.DataKeys(currentRowIndex).Value)


        If currentCommand = "view" Then
            get_lab_results()
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "view_lab();", True)
            'popu the lab results window that can be printable
        End If




    End Sub


    Private Sub get_lab_results()

        'lblmsg.Visible = False

        Try
            Plc1.Controls.Clear()

            Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
            Dim MyString As String = prests

            Using Myconn2 As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Using Myconnsel As New MySqlConnection
                        Myconn.ConnectionString = MyString
                        Myconnsel.ConnectionString = MyString
                        Myconn2.ConnectionString = MyString
                        If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                        If Myconnsel.State = ConnectionState.Closed Then Myconnsel.Open()
                        If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
                        Dim Seldata As MySqlDataReader
                        Dim cmd, Cmd2, Jcmd As New MySqlCommand


                        Dim Cmds As New MySqlCommand
                        Dim tblRows As Integer = 10
                        Dim tblCols As Integer = 6
                        Dim tbl As Table = New Table()
                        Plc1.Controls.Add(tbl)
                        Dim tc As TableCell = New TableCell()
                        Dim txtBox1 As TextBox = New TextBox()
                        Dim tr As TableRow = New TableRow()
                        Dim Btn As Button = New Button()
                        Dim Btn2 As Button = New Button()
                        Dim Cale As Calendar = New Calendar()
                        Dim Lnk As LinkButton = New LinkButton()
                        'Dim Cbo As DropDownList = New DropDownList
                        Dim x As Integer


                        For j As Integer = 0 To tblCols - 1
                            tc = New TableCell()
                            txtBox1 = New TextBox()

                            If j = 0 Then
                                txtBox1.Text = "Request Type"
                            ElseIf j = 1 Then
                                txtBox1.Text = "Results"
                            ElseIf j = 2 Then
                                txtBox1.Text = "Unit"
                                txtBox1.Width = 120
                            ElseIf j = 3 Then
                                txtBox1.Text = "Reference Range"
                                txtBox1.Width = 130
                            ElseIf j = 4 Then
                                txtBox1.Text = "Interpretation"

                            ElseIf j = 5 Then
                                txtBox1.Text = "Impression"
                            End If
                            txtBox1.ReadOnly = True
                            txtBox1.BackColor = Drawing.Color.Transparent
                            txtBox1.BorderStyle = BorderStyle.None
                            txtBox1.ForeColor = Drawing.Color.Black
                            'txtBox1.CssClass = "tabtext"
                            tc.Controls.Add(txtBox1)
                            tc.BorderStyle = BorderStyle.None
                            tr.Cells.Add(tc)

                        Next j
                        tbl.Rows.Add(tr)
                        tbl.BorderStyle = BorderStyle.None


                        Dim i As Int16

                        Dim Maxid As Int16 = 0
                        Jcmd = New MySqlCommand
                        Jcmd.Connection = Myconn
                        Jcmd.CommandText = "select max(id) from tbl_queue where pid=" & hddpid.Value
                        Seldata = Jcmd.ExecuteReader()
                        Using Seldata
                            If Seldata.Read Then
                                If Not IsDBNull(Seldata.Item(0)) Then
                                    Maxid = Seldata.Item(0)
                                End If
                            End If
                        End Using


                        Cmd2 = New MySqlCommand
                        Cmd2.CommandText = "select  requestname,results,units,Refrange,intepratation,impression from tbl_labrequests where qid=" & Maxid
                        Cmd2.Connection = Myconnsel
                        Seldata = Cmd2.ExecuteReader()
                        Using Seldata
                            While Seldata.Read

                                i += 1

                                tc = New TableCell()
                                tr = New TableRow()
                                tr.BorderStyle = BorderStyle.None
                                Btn = New Button
                                For j As Integer = 0 To tblCols - 1
                                    tc = New TableCell()
                                    txtBox1 = New TextBox()
                                    x += 1
                                    'chk = New CheckBox
                                    If j = 0 Then
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = Seldata.Item(0)
                                        txtBox1.Width = 200
                                        txtBox1.ReadOnly = True
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        txtBox1.BackColor = Drawing.Color.Silver


                                        tc.Controls.Add(txtBox1)
                                    ElseIf j = 1 Then
                                        Dim tosho As String = Seldata.Item(1)
                                        If Seldata.Item(1) = "Pending" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 200
                                        txtBox1.ReadOnly = True
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.Silver
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black

                                        tc.Controls.Add(txtBox1)

                                    ElseIf j = 2 Then
                                        Dim tosho As String = Seldata.Item(2)
                                        If Seldata.Item(2) = "none" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 120
                                        txtBox1.ReadOnly = True
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.Silver
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        tc.Controls.Add(txtBox1)

                                    ElseIf j = 3 Then
                                        Dim tosho As String = Seldata.Item(3)
                                        If Seldata.Item(3) = "none" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 130
                                        txtBox1.ReadOnly = True
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.Silver
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        tc.Controls.Add(txtBox1)

                                    ElseIf j = 4 Then
                                        Dim tosho As String = Seldata.Item(4)
                                        If Seldata.Item(4) = "none" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 200
                                        txtBox1.ReadOnly = True
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.Silver
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        tc.Controls.Add(txtBox1)


                                    ElseIf j = 5 Then
                                        Dim tosho As String = Seldata.Item(5)
                                        If Seldata.Item(5) = "none" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 200
                                        txtBox1.ReadOnly = True
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.Silver
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black

                                        tc.Controls.Add(txtBox1)
                                    End If

                                    tc.BackColor = Drawing.Color.Azure
                                    tc.BorderStyle = BorderStyle.Groove
                                    tc.VerticalAlign = VerticalAlign.Bottom
                                    tc.BorderWidth = 1
                                    tr.Cells.Add(tc)

                                Next j
                                'tr.BorderStyle = BorderStyle.Double
                                tbl.Rows.Add(tr)

                            End While
                        End Using

                    End Using


                End Using
            End Using



        Catch ex As Exception
            errorMsg = ex.Message
            Response.Redirect("~/Designs/Errors.aspx")
        End Try

    End Sub

    Protected Sub btncancel_Click(sender As Object, e As EventArgs) Handles btncancel.Click

        If hddvmode.Value = "Alegies" Then
            bttalegies()
        ElseIf hddvmode.Value = "complains" Then
            Loadbtnallergies()
        ElseIf hddvmode.Value = "Medicine" Then
            btncurrent()
        ElseIf hddvmode.Value = "Medicine Dose" Then
            btncurrent()
        ElseIf hddvmode.Value = "Medicine Duration" Then
            btncurrent()
        ElseIf hddvmode.Value = "Medicine Route" Then
            btncurrent()
        ElseIf hddvmode.Value = "Diagnosis Attendance" Then
            getdiagnosis()
        ElseIf hddvmode.Value = "Disease Type" Then
            getdiagnosis()
        ElseIf hddvmode.Value = "Disease Category" Then
            getdiagnosis()
        ElseIf hddvmode.Value = "Diagno" Then
            getdiagnosis()
        ElseIf hddvmode.Value = "ICD-10" Then
            getdiagnosis()
        ElseIf hddvmode.Value = "Status diagnosis" Then
            getdiagnosis()
        ElseIf hddvmode.Value = "PreDosag" Then
            btt_pres_clicked()
        ElseIf hddvmode.Value = "predosage" Then
            btt_pres_clicked()
        ElseIf hddvmode.Value = "preFrequency" Then
            btt_pres_clicked()
        ElseIf hddvmode.Value = "preDuration" Then
            btt_pres_clicked()
        ElseIf hddvmode.Value = "selectpreDuration" Then
            btt_pres_clicked()
        ElseIf hddvmode.Value = "Food Duration" Then
            btt_pres_clicked()
        ElseIf hddvmode.Value = "preroute" Then
            btt_pres_clicked()
        ElseIf hddvmode.Value = "preinstruction" Then
            btt_pres_clicked()
        End If
    End Sub

    Protected Sub chkcomplete_CheckedChanged(sender As Object, e As EventArgs) Handles chkcomplete.CheckedChanged
        If chkcomplete.Checked = True Then
            btnsave.Visible = True
        Else
            btnsave.Visible = False
        End If
    End Sub

    Protected Sub btnproceed_Click(sender As Object, e As EventArgs) Handles btnproceed.Click
        save_treatment()
    End Sub

    Protected Sub btnclose_Click(sender As Object, e As EventArgs) Handles btnclose.Click

        Response.Redirect("~/src/Forms/queue_doctors.aspx")
    End Sub

    'Protected Sub txtmedicine_TextChanged(sender As Object, e As EventArgs) Handles txtmedicine.TextChanged
    '    Dim searchword As String = txtmedicine.Text
    '    plcmeds.Controls.Clear()
    '    If searchword <> "" Then

    '        If searchword.Length > 2 Then
    '            search_meds(searchword)
    '        End If

    '    End If
    'End Sub

    'Private Sub search_meds(ByVal searchword)



    '    'lblmsg.Visible = False

    '    Try
    '        plcmeds.Controls.Clear()

    '        Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
    '        Dim MyString As String = prests


    '        Using Myconn As New MySqlConnection
    '            Myconn.ConnectionString = MyString
    '            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

    '            Dim Seldata As MySqlDataReader
    '            Dim cmd, Cmd2, Jcmd As New MySqlCommand


    '            Dim Cmds As New MySqlCommand
    '            Dim tblRows As Integer = 5
    '            Dim tblCols As Integer = 1
    '            Dim tbl As Table = New Table()
    '            plcmeds.Controls.Add(tbl)
    '            Dim tc As TableCell = New TableCell()
    '            Dim txtBox1 As TextBox = New TextBox()
    '            Dim tr As TableRow = New TableRow()
    '            Dim Btn As Button = New Button()
    '            Dim Btn2 As Button = New Button()
    '            Dim Cale As Calendar = New Calendar()
    '            Dim Lnk As LinkButton = New LinkButton()
    '            'Dim Cbo As DropDownList = New DropDownList
    '            Dim x As Integer


    '            For j As Integer = 0 To tblCols - 1
    '                tc = New TableCell()
    '                txtBox1 = New TextBox()

    '                If j = 0 Then
    '                    txtBox1.Text = ""
    '                End If
    '                txtBox1.ReadOnly = True
    '                txtBox1.BackColor = Drawing.Color.Transparent
    '                txtBox1.BorderStyle = BorderStyle.None
    '                txtBox1.ForeColor = Drawing.Color.Black
    '                'txtBox1.CssClass = "tabtext"
    '                tc.Controls.Add(txtBox1)
    '                tc.BorderStyle = BorderStyle.None
    '                tr.Cells.Add(tc)

    '            Next j
    '            tbl.Rows.Add(tr)
    '            tbl.BorderStyle = BorderStyle.None


    '            Cmd2 = New MySqlCommand
    '            Cmd2.CommandText = "select  ProductName from tbl_products where ProductName like'" & searchword & "%'"
    '            Cmd2.Connection = Myconn
    '            Seldata = Cmd2.ExecuteReader()
    '            Using Seldata
    '                While Seldata.Read

    '                    I += 1

    '                    tc = New TableCell()
    '                    tr = New TableRow()
    '                    tr.BorderStyle = BorderStyle.None
    '                    Btn = New Button
    '                    For j As Integer = 0 To tblCols - 1
    '                        tc = New TableCell()
    '                        txtBox1 = New TextBox()
    '                        x += 1
    '                        'chk = New CheckBox
    '                        If j = 0 Then
    '                            txtBox1 = New TextBox()
    '                            txtBox1.Text = Seldata.Item(0)
    '                            txtBox1.Width = 200
    '                            txtBox1.ReadOnly = True
    '                            txtBox1.TextMode = TextBoxMode.SingleLine
    '                            txtBox1.BorderStyle = BorderStyle.None
    '                            txtBox1.ForeColor = Drawing.Color.Black
    '                            txtBox1.BackColor = Drawing.Color.Silver

    '                            tc.Controls.Add(txtBox1)

    '                        End If

    '                        tc.BackColor = Drawing.Color.Azure
    '                        tc.BorderStyle = BorderStyle.Groove
    '                        tc.VerticalAlign = VerticalAlign.Bottom
    '                        tc.BorderWidth = 1
    '                        tr.Cells.Add(tc)

    '                    Next j
    '                    'tr.BorderStyle = BorderStyle.Double
    '                    tbl.Rows.Add(tr)

    '                End While
    '            End Using

    '        End Using


    '    Catch ex As Exception
    '        errorMsg = ex.Message
    '        Response.Redirect("~/Designs/Errors.aspx")
    '    End Try

    '    btt_pres_clicked()
    'End Sub
End Class