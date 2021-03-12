Public Class queue2
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

        If Not IsPostBack Then
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Dim Mydata As MySqlDataReader
                cbotype.Items.Add("")
                Tcmd.CommandText = "select fname from tbl_feetype" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    While Mydata.Read
                        cbotype.Items.Add(Mydata.Item(0))
                    End While
                End Using


                cbonames.Items.Add("")
                Tcmd.CommandText = "select colnames from tbl_patient" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    While Mydata.Read
                        cbonames.Items.Add(Mydata.Item(0))
                    End While
                End Using

            End Using


            cbostype.Items.Add("Names")
            cbostype.Items.Add("Id no.")
            cbostype.Items.Add("Tel")

        End If
        Get_info()
    End Sub


    Protected Sub cbotype_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbotype.SelectedIndexChanged
        If cbotype.Text <> "" Then
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Dim Mydata As MySqlDataReader
                cbotype.Items.Add("")
                Tcmd.CommandText = "select amount,id from tbl_feetype where fname='" & cbotype.Text & "'" ' and colid='" & Txtpatientid.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Mydata.Read Then
                        txtamount.Text = Mydata.Item(0)
                        hddfid.Value = Mydata.Item(1)
                        hddamo.Value = Mydata.Item(0)


                    End If
                End Using

            End Using

            If cbotype.Text = "Consultation" Then
                trqueu.Visible = True
            Else
                trqueu.Visible = False
            End If
        End If

    End Sub

    Protected Sub cbostype_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbostype.SelectedIndexChanged
        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Tcmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()


            Dim Mydata As MySqlDataReader
            Tcmd = New MySqlCommand
            cbonames.Items.Clear()
            cbonames.Items.Add("")
            cbonames.Text = ""
            If cbostype.Text = "Names" Then
                Tcmd.CommandText = "select colnames from tbl_patient" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
            ElseIf cbostype.Text = "Id no." Then
                Tcmd.CommandText = "select colid from tbl_patient" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"

            ElseIf cbostype.Text = "Tel" Then
                Tcmd.CommandText = "select coltel from tbl_patient" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"

            End If

            Tcmd.Connection = Myconn
            Mydata = Tcmd.ExecuteReader()
            Using Mydata
                While Mydata.Read
                    cbonames.Items.Add(Mydata.Item(0))
                End While
            End Using

        End Using

    End Sub



    Protected Sub cbonames_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbonames.SelectedIndexChanged
        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Tcmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()


            Dim Mydata As MySqlDataReader
            Tcmd = New MySqlCommand

            If cbostype.Text = "Names" Then
                Tcmd.CommandText = "select id from tbl_patient where colnames='" & cbonames.Text & "'" ' and colid='" & Txtpatientid.Text & "'"
            ElseIf cbostype.Text = "Id no." Then
                Tcmd.CommandText = "select id from tbl_patient where colid='" & cbonames.Text & "'" ' and colid='" & Txtpatientid.Text & "'"

            ElseIf cbostype.Text = "Tel" Then
                Tcmd.CommandText = "select id from tbl_patient where coltel='" & cbonames.Text & "'" ' and colid='" & Txtpatientid.Text & "'"

            End If

            Tcmd.Connection = Myconn
            Mydata = Tcmd.ExecuteReader()
            Using Mydata
                If Mydata.Read Then
                    Dim pid As String = Mydata.Item(0)
                    hddpid.Value = Mydata.Item(0)
                End If
            End Using

        End Using

    End Sub


    Protected Sub Btnactivitysave_Click(sender As Object, e As EventArgs) Handles Btnactivitysave.Click
        LblmsgA.Text = ""
        If txtftype.Text = "" Then
            LblmsgA.Text = "Please enter the activity type before you proceed."
            Exit Sub
        Else
            LblmsgA.Text = ""
        End If

        If Txtcost.Text = "" Then
            LblmsgA.Text = "please enter the cost before you proceed."
            Exit Sub
        Else
            LblmsgA.Text = ""
        End If
        Dim count As Int16 = 0
        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn
                Dim Mydata As MySqlDataReader

                Tcmd.CommandText = "select id from tbl_feetype where fname='" & txtftype.Text & "'" ' and amount='" & txtamount.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Not Mydata.Read Then
                        Mydata.Close()

                        cmd = New MySqlCommand
                        Using cmd
                            cmd.Connection = Myconn
                            cmd.CommandText = "INSERT INTO tbl_feetype" &
                            "(fname,amount)" _
                           & "VALUES(?1,?2)"

                            cmd.Parameters.AddWithValue("?1", txtftype.Text)
                            cmd.Parameters.AddWithValue("?2", Txtcost.Text)
                            cmd.ExecuteNonQuery()
                        End Using
                        LblmsgA.ForeColor = Drawing.Color.Blue
                        LblmsgA.Text = "Success!!!!  "
                        txtftype.Text = ""
                        Txtcost.Text = ""
                        count = 1

                        cbotype.Items.Add(txtftype.Text)



                    Else
                        LblmsgA.Text = "This is a duplicate of the same product "
                        LblmsgA.ForeColor = Drawing.Color.Red
                        count = 2
                    End If
                End Using


            End Using

            'Dynamic_tables()

        Catch ex As Exception
            LblmsgA.Text = ex.Message & ""
            'MsgBox(ex.Message)
        End Try

        If count = 1 Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "Closeme2();", True)
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "relauch2();", True)
        End If


    End Sub


    Private Sub Get_info()
        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("qno")
            dt.Columns.Add("arrival")
            dt.Columns.Add("names")
            dt.Columns.Add("tel")
            dt.Columns.Add("age")
            dt.Columns.Add("gender")





            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn2 As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconn2.ConnectionString = MyString
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
                    Dim sts As String
                    Dim Scmd, cmd As New MySqlCommand
                    Dim Mydata, seldata As MySqlDataReader
                    sts = "Select id,pid,logstime,qno from tbl_queue where status='pending'"
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read
                                Dim pid As Integer = Mydata.Item(1)
                                Dim arrival As Date = Mydata.Item(2)
                                Dim qno As Integer = Mydata.Item(3)


                                Dim names As String = ""
                                Dim tel As String = ""
                                Dim age As String = ""
                                Dim gender As String = ""

                                sts = "Select colnames,coltel,colage,colgender  from tbl_patient where id =" & pid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            names = seldata.Item(0)
                                            tel = seldata.Item(1)
                                            age = seldata.Item(2)
                                            gender = seldata.Item(3)
                                        End If
                                    End Using
                                End Using


                                dt.Rows.Add(Mydata.Item(0), qno, arrival, names, tel, age, gender)
                                cont += 1

                            End While
                        End Using
                    End Using
                End Using
            End Using

            If cont >= 1 Then
                GridView0.DataSource = dt
                GridView0.DataBind()
                nodata.Visible = False
            Else
                nodata.Visible = True
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub


    Protected Sub grdData_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs)
        GridView0.PageIndex = e.NewPageIndex
        Get_info()

    End Sub

    Protected Sub Grid10_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView0.RowCommand

        'Try
        Dim currentCommand As String = e.CommandName
        Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument.ToString())
        Dim ss As String = (GridView0.DataKeys(currentRowIndex).Value)


        If currentCommand = "view" Then
            Response.Redirect("~/src/Forms/vitals.aspx?var1=" & ss)
        End If


        'Response.Redirect("~/dy_subcon_edit.aspx?var1=" & ss)

    End Sub




    Protected Sub GridView0_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView0.SelectedIndexChanged

    End Sub

    Protected Sub Btnpost_Click(sender As Object, e As EventArgs) Handles Btnpost.Click
        LblmsgP.Text = ""
        If hddamo.Value = 0 Then
            LblmsgP.Text = "Please enter payment amount"
            Exit Sub
        End If
        If hddpid.Value = 0 Then
            LblmsgP.Text = "Please enter patient amount"
            Exit Sub
        End If
        Dim success As Int16 = 0
        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

            Try



                Dim cmd As New MySqlCommand
                Dim fid As String = hddfid.Value
                Dim pid As String = hddpid.Value
                cmd = New MySqlCommand
                Using cmd
                    cmd.Connection = Myconn
                    cmd.CommandText = "INSERT INTO tbl_transaction" &
                                "(fid,pid,amount)" _
                               & "VALUES(?1,?2,?3)"

                    cmd.Parameters.AddWithValue("?1", fid)
                    cmd.Parameters.AddWithValue("?2", pid)
                    cmd.Parameters.AddWithValue("?3", hddamo.Value)
                    cmd.ExecuteNonQuery()
                End Using

                If chkqueue.Checked = True Then
                    Dim sts As String
                    Dim Scmd As New MySqlCommand
                    Dim Mydata As MySqlDataReader
                    Dim leo As String = Now.ToString("yyyy-MM-dd")
                    sts = "Select id from tbl_queue where pid = '" & pid & "' and logstime like '" & leo & "%'"
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            If Not Mydata.Read Then
                                Mydata.Close()

                                Dim count As Int16
                                sts = "Select count(id) from tbl_queue where logstime like '" & leo & "%'"
                                Scmd = New MySqlCommand
                                Scmd.CommandText = sts
                                Scmd.Connection = Myconn
                                Using Scmd
                                    Mydata = Scmd.ExecuteReader()
                                    Using Mydata
                                        If Mydata.Read Then
                                            If Not IsDBNull(Mydata.Item(0)) Then
                                                count = Mydata.Item(0) + 1
                                            Else
                                                count = 1
                                            End If
                                        Else
                                            count = 1
                                        End If
                                    End Using
                                End Using

                                sts = "Select colnames,coltel from tbl_patient where id = " & pid '& "'" ' and logstime like '" & leo & "%'"
                                Scmd = New MySqlCommand
                                Scmd.CommandText = sts
                                Scmd.Connection = Myconn
                                Using Scmd
                                    Mydata = Scmd.ExecuteReader()
                                    Using Mydata
                                        If Mydata.Read Then
                                            Dim names As String = Mydata.Item(0)
                                            Dim tel As String = Mydata.Item(1)
                                            Mydata.Close()

                                            cmd = New MySqlCommand
                                            Using cmd
                                                cmd.Connection = Myconn
                                                cmd.CommandText = "INSERT INTO tbl_queue" &
                                                    "(pid,qno,names,tel)" _
                                                   & "VALUES(?0,?1,?2,?3)"
                                                cmd.Parameters.AddWithValue("?0", pid)
                                                cmd.Parameters.AddWithValue("?1", count)
                                                cmd.Parameters.AddWithValue("?2", names)
                                                cmd.Parameters.AddWithValue("?3", tel)
                                                cmd.ExecuteNonQuery()
                                            End Using
                                        End If
                                    End Using
                                End Using

                            End If
                        End Using
                    End Using


                End If

            Catch ex As Exception
                success = 1
                Dim exs As String = ex.Message
                LblmsgP.Text = ex.Message
            End Try



        End Using

        If success = 1 Then
            LblmsgP.ForeColor = Drawing.Color.Red
            LblmsgP.Text = "error"
        Else
            LblmsgP.ForeColor = Drawing.Color.Blue
            LblmsgP.Text = ""
            txtftype.Text = ""
            Txtcost.Text = ""
            hddamo.Value = ""
            hddfid.Value = ""
            hddpid.Value = ""
            cbonames.Text = ""
            cbotype.Text = ""
            chkqueue.Checked = False
            txtamount.Text = ""

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "Closeme();", True)
        End If

    End Sub





End Class