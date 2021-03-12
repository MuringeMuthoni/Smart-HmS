Public Class queue_doctors
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
        hddmode.Value = 0
        Get_queued()
        'Get_info()
    End Sub

    Private Sub Get_queued()
        Tab1.CssClass = "bttns_tabs_active"
        Tab2.CssClass = "bttns_tabs_inactive"
        Tab3.CssClass = "bttns_tabs_inactive"
        multiview1.ActiveViewIndex = 0
        Get_queue()
    End Sub

    Protected Sub Tab1_Click(sender As Object, e As EventArgs) Handles Tab1.Click
        Tab1.CssClass = "bttns_tabs_active "
        Tab2.CssClass = "bttns_tabs_inactive"
        Tab3.CssClass = "bttns_tabs_inactive"

        hddmode.Value = 0
        multiview1.ActiveViewIndex = 0
        Get_queue()
    End Sub

    Protected Sub Tab2_Click(sender As Object, e As EventArgs) Handles Tab2.Click
        Tab1.CssClass = "bttns_tabs_inactive"
        Tab2.CssClass = "bttns_tabs_active"
        Tab1.CssClass = "bttns_tabs_inactive"
        multiview1.ActiveViewIndex = 1
        hddmode.Value = 1
        Get_process()
    End Sub

    Protected Sub Tab3_Click(sender As Object, e As EventArgs) Handles Tab3.Click
        Tab1.CssClass = "bttns_tabs_inactive"
        Tab2.CssClass = "bttns_tabs_inactive"
        Tab3.CssClass = "bttns_tabs_active"
        multiview1.ActiveViewIndex = 2
        hddmode.Value = 2
        Get_completed()
    End Sub



    Private Sub Get_queue()
        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("qno")
            dt.Columns.Add("arrival")
            dt.Columns.Add("names")
            dt.Columns.Add("tel")
            dt.Columns.Add("age")
            dt.Columns.Add("gender")
            dt.Columns.Add("vitalstatus")



            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn2 As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconn2.ConnectionString = MyString
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
                    Dim sts As String = ""
                    Dim Scmd, cmd As New MySqlCommand
                    Dim Mydata, seldata As MySqlDataReader

                    Dim cont As Int16 = 0
                    Dim mode As Int16 = 0


Mwanzo:
                    cont = 0

                    If txttel.Text = "" Then
                        sts = "Select pid,logstime,qno,discharged,vitalstatus,id,names,tel from tbl_queue where status='pending' and names like '" & txtnames.Text & "%'"
                    Else
                        sts = "Select pid,logstime,qno,discharged,vitalstatus,id,names,tel from tbl_queue where status='pending' and tel = '" & txttel.Text & "'"
                    End If


                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read
                                Dim pid As Integer = Mydata.Item(0)
                                Dim arrival As Date = Mydata.Item(1)
                                Dim qno As Integer = Mydata.Item(2)
                                Dim discharged As Date = Mydata.Item(3)
                                Dim vitals As Date = Mydata.Item(4)
                                Dim ids As Integer = Mydata.Item(5)
                                Dim names As String = Mydata.Item(6)
                                Dim tel As String = Mydata.Item(7)

                                Dim age As String = ""
                                Dim gender As String = ""

                                sts = "Select colage,colgender  from tbl_patient where id =" & pid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            age = seldata.Item(0)
                                            gender = seldata.Item(1)
                                        End If
                                    End Using
                                End Using
                                Dim vital As String = "none"
                                Dim chkvital As Date = "#1/1/2020 12:00:00 AM#"
                                If vitals = chkvital Then
                                    vital = "Pending"
                                Else
                                    vital = vitals
                                End If


                                dt.Rows.Add(pid, qno, arrival, names, tel, age, gender, vital)



                                cont += 1

                            End While
                        End Using
                    End Using


                    If cont >= 1 Then
                        GridView0.DataSource = dt
                        GridView0.DataBind()
                        lblcount.Text = cont & " patients found"
                        nodata.Visible = False
                        filter.Visible = True
                        multiview1.ActiveViewIndex = 0
                    Else
                        filter.Visible = False
                        nodata.Visible = True
                    End If
                    mode = 1


                End Using
            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Private Sub Get_process()
        Try



            Dim dt2 As DataTable = New DataTable()
            dt2.Columns.Add("id")
            dt2.Columns.Add("qno")
            dt2.Columns.Add("arrival")
            dt2.Columns.Add("names")
            dt2.Columns.Add("tel")
            dt2.Columns.Add("age")
            dt2.Columns.Add("gender")



            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn2 As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconn2.ConnectionString = MyString
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
                    Dim sts As String = ""
                    Dim Scmd, cmd As New MySqlCommand
                    Dim Mydata, seldata As MySqlDataReader

                    Dim cont As Int16 = 0



Mwanzo:

                    If txttel.Text = "" Then
                        sts = "Select pid,logstime,qno,discharged,vitalstatus,id,names,tel from tbl_queue where status='Processing' and names like '" & txtnames.Text & "%'"
                    Else
                        sts = "Select pid,logstime,qno,discharged,vitalstatus,id,names,tel from tbl_queue where status='Processing' and tel = '" & txttel.Text & "'"
                    End If


                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read
                                Dim pid As Integer = Mydata.Item(0)
                                Dim arrival As Date = Mydata.Item(1)
                                Dim qno As Integer = Mydata.Item(2)
                                Dim discharged As Date = Mydata.Item(3)
                                Dim vitals As Date = Mydata.Item(4)
                                Dim ids As Integer = Mydata.Item(5)
                                Dim names As String = Mydata.Item(6)
                                Dim tel As String = Mydata.Item(7)

                                Dim age As String = ""
                                Dim gender As String = ""

                                sts = "Select colage,colgender  from tbl_patient where id =" & pid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            age = seldata.Item(0)
                                            gender = seldata.Item(1)
                                        End If
                                    End Using
                                End Using
                                Dim vital As String = "none"
                                Dim chkvital As Date = "#1/1/2020 12:00:00 AM#"
                                If vitals = chkvital Then
                                    vital = "Pending"
                                Else
                                    vital = vitals
                                End If

                                dt2.Rows.Add(pid, qno, arrival, names, tel, age, gender)



                                cont += 1

                            End While
                        End Using
                    End Using



                    If cont >= 1 Then
                        GridView1.DataSource = dt2
                        GridView1.DataBind()
                        lblcount.Text = cont & " patients found"
                        nodata2.Visible = False
                        filter.Visible = True
                        multiview1.ActiveViewIndex = 1
                    Else
                        filter.Visible = False
                        nodata2.Visible = True
                    End If




                End Using
            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Private Sub Get_completed()
        Try




            Dim dt3 As DataTable = New DataTable()
            dt3.Columns.Add("id")
            dt3.Columns.Add("qno")
            dt3.Columns.Add("arrival")
            dt3.Columns.Add("names")
            dt3.Columns.Add("tel")
            dt3.Columns.Add("age")
            dt3.Columns.Add("gender")
            dt3.Columns.Add("discharged")

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn2 As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconn2.ConnectionString = MyString
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
                    Dim sts As String = ""
                    Dim Scmd, cmd As New MySqlCommand
                    Dim Mydata, seldata As MySqlDataReader

                    Dim cont As Int16 = 0
                    Dim mode As Int16 = 0


Mwanzo:
                    cont = 0

                    If txttel.Text = "" Then
                        sts = "Select pid,logstime,qno,discharged,vitalstatus,id,names,tel from tbl_queue where status='Completed' and names like '" & txtnames.Text & "%'"
                    Else
                        sts = "Select pid,logstime,qno,discharged,vitalstatus,id,names,tel from tbl_queue where status='Completed' and tel = '" & txttel.Text & "'"
                    End If


                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read
                                Dim pid As Integer = Mydata.Item(0)
                                Dim arrival As Date = Mydata.Item(1)
                                Dim qno As Integer = Mydata.Item(2)
                                Dim discharged As Date = Mydata.Item(3)
                                Dim vitals As Date = Mydata.Item(4)
                                Dim ids As Integer = Mydata.Item(5)
                                Dim names As String = Mydata.Item(6)
                                Dim tel As String = Mydata.Item(7)

                                Dim age As String = ""
                                Dim gender As String = ""

                                sts = "Select colage,colgender  from tbl_patient where id =" & pid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            age = seldata.Item(0)
                                            gender = seldata.Item(1)
                                        End If
                                    End Using
                                End Using
                                Dim vital As String = "none"
                                Dim chkvital As Date = "#1/1/2020 12:00:00 AM#"
                                If vitals = chkvital Then
                                    vital = "Pending"
                                Else
                                    vital = vitals
                                End If


                                dt3.Rows.Add(pid, qno, arrival, names, tel, age, gender, discharged)




                                cont += 1

                            End While
                        End Using
                    End Using



                    If cont >= 1 Then
                        GridView2.DataSource = dt3
                        GridView2.DataBind()
                        lblcount.Text = cont & " patients found"
                        nodata3.Visible = False
                        filter.Visible = True
                        multiview1.ActiveViewIndex = 2
                    Else
                        filter.Visible = False
                        nodata3.Visible = True
                    End If

                End Using
            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub GridView0_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView0.RowCommand

        'Try
        Dim currentCommand As String = e.CommandName
        Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument.ToString())
        Dim ss As String = (GridView0.DataKeys(currentRowIndex).Value)


        If currentCommand = "view" Then
            Response.Redirect("~/src/Forms/Doctors_processing.aspx?var1=" & ss)
        End If


        'Response.Redirect("~/dy_subcon_edit.aspx?var1=" & ss)

    End Sub


    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand

        'Try
        Dim currentCommand As String = e.CommandName
        Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument.ToString())
        Dim ss As String = (GridView1.DataKeys(currentRowIndex).Value)


        If currentCommand = "view" Then
            Response.Redirect("~/src/Forms/Doctors_processing.aspx?var1=" & ss)
        End If


        'Response.Redirect("~/dy_subcon_edit.aspx?var1=" & ss)

    End Sub



    Protected Sub Btnsearch_Click(sender As Object, e As EventArgs) Handles Btnsearch.Click


        If hddmode.Value = 0 Then
            Get_queue()
        ElseIf hddmode.Value = 1 Then
            Get_process()
        ElseIf hddmode.Value = 2 Then
            Get_completed()
        End If

    End Sub

    Protected Sub btngo_Click(sender As Object, e As EventArgs) Handles btngo.Click

        If hddmode.Value = 0 Then
            Get_queue()
        ElseIf hddmode.Value = 1 Then
            Get_process()
        ElseIf hddmode.Value = 2 Then
            Get_completed()
        End If

    End Sub

    Protected Sub GridView0_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView0.SelectedIndexChanged

    End Sub

    'Protected Sub Btnreport_Click(sender As Object, e As EventArgs) Handles Btnreport.Click
    '    Response.Redirect("~/src/Forms/PatientQueue.aspx")
    'End Sub
    'Protected Sub GridView0_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView0.SelectedIndexChanged

    '    Response.Redirect("~/src/Forms/DoctorPatientAction.aspx")
    'End Sub
End Class