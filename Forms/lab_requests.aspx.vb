Public Class lab_requests
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

        Load_inv()
        Get_info()
    End Sub

    Private Sub Load_inv()

        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("logstime")
            dt.Columns.Add("pnames")
            dt.Columns.Add("requestname")
            dt.Columns.Add("status")


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
                    Dim Maxid As Int16 = 0


                    sts = "Select distinct qid,pid from tbl_labrequests where status<>'Finalized' and status<>'Pending'"
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read
                                Dim qid As Int16 = Mydata.Item(0)
                                Dim pid As Int16 = Mydata.Item(1)

                                Dim names As String = ""
                                sts = "Select colnames from tbl_patient where id=" & pid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            names = seldata.Item(0)
                                        End If
                                    End Using
                                End Using

                                lblname.Text = names

                                Dim githaa As String = ""
                                Dim status As String = ""
                                sts = "Select pid,logstime,status from tbl_labrequests where qid=" & qid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            Dim sk As Date = seldata.Item(1)
                                            githaa = sk.ToString("dd-MMM-yy") & " " & sk.ToString("HH:mm:ss")
                                            status = seldata.Item(2)
                                        End If
                                    End Using
                                End Using

                                Dim requestname As String = ""
                                sts = "Select requestname from tbl_labrequests where qid=" & qid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        While seldata.Read
                                            requestname &= seldata.Item(0) & ","
                                        End While
                                    End Using
                                End Using


                                dt.Rows.Add(qid, githaa, names, requestname, status)
                                cont += 1



                            End While
                        End Using
                    End Using

                End Using

                If cont >= 1 Then
                    grdrequest.DataSource = dt
                    grdrequest.DataBind()
                    nodata.Visible = False
                Else
                    nodata.Visible = True
                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub


    Protected Sub grdInv_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdrequest.RowCommand

        'Try
        Dim currentCommand As String = e.CommandName
        Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument.ToString())
        Dim ss As String = (grdrequest.DataKeys(currentRowIndex).Value)
        Hddid.Value = ss

        If currentCommand = "acknowledge" Then

            Try
                Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
                Dim MyString As String = prests
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Dim cmd As New MySqlCommand
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                    cmd = New MySqlCommand("UPDATE tbl_labrequests Set " &
                                                      " status=?0 " &
                                                      " WHERE qid=" & ss, Myconn)
                    cmd.Parameters.AddWithValue("?0", "Processing")
                    cmd.ExecuteNonQuery()
                End Using



            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

            Load_inv()

            lblmsg.Text = "Success acknowledging!"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "ShowMessage();", True)


        ElseIf currentCommand = "edit" Then
            Get_info()
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
        End If




    End Sub

    Private Sub grdrequest_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdrequest.RowDataBound
        Select Case e.Row.RowType
            Case DataControlRowType.DataRow
                Dim priority As String = DirectCast(DataBinder.Eval(e.Row.DataItem, "status"), String)
                Select Case priority
                    Case "Processing"
                        e.Row.ForeColor = Drawing.Color.Green
                    Case "Pending"
                        e.Row.ForeColor = Drawing.Color.Red
                    Case Else
                        e.Row.ForeColor = Drawing.Color.Black
                End Select
        End Select

    End Sub

    Private Sub grdrequest_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles grdrequest.RowEditing

    End Sub


    Private Sub Get_info()

        If Hddid.Value = "" Then
            Exit Sub
        End If

        'Dim Search_reg As String = Replace(TxtSearch.Text, "'", "")
        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
            Dim MyString As String = prests

            Using Myconnsel As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconnsel.ConnectionString = MyString
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconnsel.State = ConnectionState.Closed Then Myconnsel.Open()
                    Dim Seldata As MySqlDataReader
                    Dim cmd, Cmds, JCmd, Tcmd, Mcmd As New MySqlCommand
                    Dim count As Integer

                    Dim tblRows As Integer = 10
                    Dim tblCols As Integer = 6
                    Dim tbl As Table = New Table()
                    Dim tc As TableCell = New TableCell()
                    Dim tr As TableRow = New TableRow()
                    Dim Pnlreg As Panel = New Panel()
                    Dim Pnl_progress As Panel = New Panel()
                    Dim Pnl_ As Panel = New Panel()
                    Dim txtBox1 As TextBox = New TextBox()
                    Dim Lnkmore As LinkButton = New LinkButton
                    Dim btn As Button = New Button
                    Dim Cbo As DropDownList = New DropDownList


                    PlcW.Controls.Clear()


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
                        txtBox1.ForeColor = Drawing.Color.White
                        'txtBox1.CssClass = "tabtext"
                        tc.BackColor = Drawing.Color.Navy
                        tc.Controls.Add(txtBox1)
                        tc.BorderStyle = BorderStyle.None
                        tr.Cells.Add(tc)

                    Next j
                    tbl.Rows.Add(tr)
                    tbl.BorderStyle = BorderStyle.Inset



                    JCmd.CommandText = "select  requestname,results,units,Refrange,intepratation,impression,id from tbl_labrequests where qid=" & Hddid.Value
                    JCmd.Connection = Myconnsel
                    Using JCmd
                        Seldata = JCmd.ExecuteReader()
                        Using Seldata
                            While Seldata.Read
                                count += 1
                                Dim ids As Int16 = Seldata.Item(6)

                                Dim Text As TextBox = CType(PlcW.FindControl("txtname_" & Hddid.Value), TextBox)
                                If Not IsNothing(Text) Then
                                    GoTo Mwisho
                                End If

                                tc = New TableCell()
                                tr = New TableRow()
                                tr.BorderStyle = BorderStyle.None

                                For j As Integer = 0 To tblCols - 1
                                    tc = New TableCell()
                                    If j = 0 Then
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = Seldata.Item(0)
                                        txtBox1.Width = 200
                                        txtBox1.ReadOnly = True
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 5
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        txtBox1.BackColor = Drawing.Color.Silver

                                        'txtBox1.CssClass = "tabtext"
                                        txtBox1.ID = "txtname_" & ids
                                        tc.Controls.Add(txtBox1)


                                    ElseIf j = 1 Then
                                        Dim tosho As String = Seldata.Item(1)
                                        If Seldata.Item(1) = "Pending" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 200
                                        txtBox1.ReadOnly = False
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.White
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        txtBox1.ID = "txtresult_" & ids
                                        tc.Controls.Add(txtBox1)

                                        tc.Controls.Add(New LiteralControl(" <br>;"))

                                        btn = New Button
                                        btn.ID = "btt1_" & ids
                                        btn.Text = "Update"
                                        btn.CommandName = Hddid.Value & ";" & txtBox1.Text
                                        btn.BackColor = Drawing.Color.Black
                                        btn.ForeColor = Drawing.Color.Lime
                                        btn.Width = 100
                                        AddHandler btn.Click, AddressOf Launch_result
                                        tc.Controls.Add(btn)

                                        tc.Controls.Add(New LiteralControl(" &nbsp;&nbsp;"))


                                    ElseIf j = 2 Then
                                        Dim tosho As String = Seldata.Item(2)
                                        If Seldata.Item(2) = "none" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 120
                                        txtBox1.ReadOnly = False
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.White
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        txtBox1.ID = "txtunits_" & ids
                                        tc.Controls.Add(txtBox1)

                                        tc.Controls.Add(New LiteralControl(" <br>;"))

                                        btn = New Button
                                        btn.ID = "btt2_" & ids
                                        btn.Text = "Update"
                                        btn.CommandName = Hddid.Value & ";" & txtBox1.Text
                                        btn.BackColor = Drawing.Color.Black
                                        btn.ForeColor = Drawing.Color.Lime
                                        btn.Width = 100
                                        AddHandler btn.Click, AddressOf Launch_units
                                        tc.Controls.Add(btn)

                                        tc.Controls.Add(New LiteralControl(" &nbsp;&nbsp;"))

                                    ElseIf j = 3 Then
                                        Dim tosho As String = Seldata.Item(3)
                                        If Seldata.Item(3) = "none" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 130
                                        txtBox1.ReadOnly = False
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.White
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        txtBox1.ID = "txtrange_" & ids
                                        tc.Controls.Add(txtBox1)

                                        tc.Controls.Add(New LiteralControl(" <br>;"))




                                        btn = New Button
                                        btn.ID = "btt3_" & ids
                                        btn.Text = "Update"
                                        btn.CommandName = Hddid.Value & ";" & txtBox1.Text
                                        btn.BackColor = Drawing.Color.Black
                                        btn.ForeColor = Drawing.Color.Lime
                                        btn.Width = 100
                                        AddHandler btn.Click, AddressOf Launch_Refrange
                                        tc.Controls.Add(btn)

                                        tc.Controls.Add(New LiteralControl(" &nbsp;&nbsp;"))


                                    ElseIf j = 4 Then
                                        Dim tosho As String = Seldata.Item(4)
                                        If Seldata.Item(4) = "none" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 200
                                        txtBox1.ReadOnly = False
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.White
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        txtBox1.ID = "txtint_" & ids
                                        tc.Controls.Add(txtBox1)

                                        tc.Controls.Add(New LiteralControl(" <br>;"))



                                        btn = New Button
                                        btn.ID = "btt4_" & ids
                                        btn.Text = "Update"
                                        btn.CommandName = ids & ";" & txtBox1.Text
                                        btn.BackColor = Drawing.Color.Black
                                        btn.ForeColor = Drawing.Color.Lime
                                        btn.Width = 100
                                        AddHandler btn.Click, AddressOf Launch_intepratation
                                        tc.Controls.Add(btn)

                                        tc.Controls.Add(New LiteralControl(" &nbsp;&nbsp;"))

                                    ElseIf j = 5 Then
                                        Dim tosho As String = Seldata.Item(5)
                                        If Seldata.Item(5) = "none" Then
                                            tosho = ""
                                        End If
                                        txtBox1 = New TextBox()
                                        txtBox1.Text = tosho
                                        txtBox1.Width = 200
                                        txtBox1.ReadOnly = False
                                        txtBox1.TextMode = TextBoxMode.MultiLine
                                        txtBox1.Rows = 4
                                        txtBox1.BackColor = Drawing.Color.White
                                        txtBox1.BorderStyle = BorderStyle.None
                                        txtBox1.ForeColor = Drawing.Color.Black
                                        txtBox1.ID = "txtimpre_" & ids
                                        tc.Controls.Add(txtBox1)

                                        tc.Controls.Add(New LiteralControl(" <br>;"))




                                        btn = New Button
                                        btn.ID = "btt5_" & ids
                                        btn.Text = "Update"
                                        btn.CommandName = ids & ";" & txtBox1.Text
                                        btn.BackColor = Drawing.Color.Black
                                        btn.ForeColor = Drawing.Color.Lime
                                        btn.Width = 100
                                        AddHandler btn.Click, AddressOf Launch_impression
                                        tc.Controls.Add(btn)

                                        tc.Controls.Add(New LiteralControl(" &nbsp;&nbsp;"))

                                    End If

                                    tc.BorderStyle = BorderStyle.Groove
                                    tc.VerticalAlign = VerticalAlign.Bottom
                                    tc.BorderWidth = 1
                                    tr.Cells.Add(tc)
                                    tc.BackColor = Drawing.Color.WhiteSmoke
                                    tr.BackColor = Drawing.Color.Gray

                                Next

                                tbl.Rows.Add(tr)
                                tbl.BorderStyle = BorderStyle.Groove

                                count += 1


Mwisho:



                            End While

                        End Using
                    End Using




                    PlcW.Controls.Add(tbl)



                End Using
            End Using


        Catch ex As Exception
            errorMsg = ex.Message
            Response.Redirect("~/Designs/Errors.aspx")
        End Try

    End Sub


    Private Sub Launch_impression(ByVal sender As Object, ByVal e As EventArgs)
        Dim btn As IButtonControl = DirectCast(sender, IButtonControl)
        Dim Sta As String = btn.CommandName

        Dim Status As String() = Sta.Split(";")
        Dim ids As String = Status(0)

        Try


            Dim txttexbox As TextBox = CType(PlcW.FindControl("txtimpre_" & ids), TextBox)
            If Not IsNothing(txttexbox) Then
                If txttexbox.Text <> "" Then
                    Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
                    Dim MyString As String = prests
                    Using Myconn As New MySqlConnection
                        Myconn.ConnectionString = MyString
                        Dim Mcmd, Tcmd As New MySqlCommand
                        If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                        Mcmd = New MySqlCommand("UPDATE tbl_labrequests SET impression='" & txttexbox.Text & "'  WHERE id='" & ids & "'", Myconn) '4
                        Mcmd.ExecuteNonQuery()

                    End Using

                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
    End Sub


    Private Sub Launch_intepratation(ByVal sender As Object, ByVal e As EventArgs)
        Dim btn As IButtonControl = DirectCast(sender, IButtonControl)
        Dim Sta As String = btn.CommandName

        Dim Status As String() = Sta.Split(";")
        Dim ids As String = Status(0)

        Try


            Dim txttexbox As TextBox = CType(PlcW.FindControl("txtint_" & ids), TextBox)
            If Not IsNothing(txttexbox) Then
                If txttexbox.Text <> "" Then
                    Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
                    Dim MyString As String = prests
                    Using Myconn As New MySqlConnection
                        Myconn.ConnectionString = MyString
                        Dim Mcmd, Tcmd As New MySqlCommand
                        If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                        Mcmd = New MySqlCommand("UPDATE tbl_labrequests SET intepratation='" & txttexbox.Text & "'  WHERE id='" & ids & "'", Myconn) '4
                        Mcmd.ExecuteNonQuery()

                    End Using

                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
    End Sub


    Private Sub Launch_Refrange(ByVal sender As Object, ByVal e As EventArgs)
        Dim btn As IButtonControl = DirectCast(sender, IButtonControl)
        Dim Sta As String = btn.CommandName

        Dim Status As String() = Sta.Split(";")
        Dim ids As String = Status(0)

        Try


            Dim txttexbox As TextBox = CType(PlcW.FindControl("txtrange_" & ids), TextBox)
            If Not IsNothing(txttexbox) Then
                If txttexbox.Text <> "" Then
                    Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
                    Dim MyString As String = prests
                    Using Myconn As New MySqlConnection
                        Myconn.ConnectionString = MyString
                        Dim Mcmd, Tcmd As New MySqlCommand
                        If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                        Mcmd = New MySqlCommand("UPDATE tbl_labrequests SET Refrange='" & txttexbox.Text & "'  WHERE id='" & ids & "'", Myconn) '4
                        Mcmd.ExecuteNonQuery()

                    End Using

                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
    End Sub


    Private Sub Launch_units(ByVal sender As Object, ByVal e As EventArgs)
        Dim btn As IButtonControl = DirectCast(sender, IButtonControl)
        Dim Sta As String = btn.CommandName

        Dim Status As String() = Sta.Split(";")
        Dim ids As String = Status(0)

        Try


            Dim txttexbox As TextBox = CType(PlcW.FindControl("txtunits_" & ids), TextBox)
            If Not IsNothing(txttexbox) Then
                If txttexbox.Text <> "" Then
                    Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
                    Dim MyString As String = prests
                    Using Myconn As New MySqlConnection
                        Myconn.ConnectionString = MyString
                        Dim Mcmd, Tcmd As New MySqlCommand
                        If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                        Mcmd = New MySqlCommand("UPDATE tbl_labrequests SET units='" & txttexbox.Text & "'  WHERE id='" & ids & "'", Myconn) '4
                        Mcmd.ExecuteNonQuery()

                    End Using

                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
    End Sub


    Private Sub Launch_result(ByVal sender As Object, ByVal e As EventArgs)
        Dim btn As IButtonControl = DirectCast(sender, IButtonControl)
        Dim Sta As String = btn.CommandName

        Dim Status As String() = Sta.Split(";")
        Dim ids As String = Status(0)

        Try


            Dim txttexbox As TextBox = CType(PlcW.FindControl("txtresult_" & ids), TextBox)
            If Not IsNothing(txttexbox) Then
                If txttexbox.Text <> "" Then
                    Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
                    Dim MyString As String = prests
                    Using Myconn As New MySqlConnection
                        Myconn.ConnectionString = MyString
                        Dim Mcmd, Tcmd As New MySqlCommand
                        If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                        Mcmd = New MySqlCommand("UPDATE tbl_labrequests SET results='" & txttexbox.Text & "'  WHERE id='" & ids & "'", Myconn) '4
                        Mcmd.ExecuteNonQuery()

                    End Using

                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As ImageClickEventArgs) Handles btnsave.Click

        If chkcomplete.Checked = True Then
            Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Mcmd, Tcmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Mcmd = New MySqlCommand("UPDATE tbl_labrequests SET status='Finalized', results='Available'  WHERE qid=" & Hddid.Value, Myconn) '4
                Mcmd.ExecuteNonQuery()

            End Using

            Load_inv()
            lblmsg.Text = "Success Finalizing the result"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "ShowMessage();", True)
        End If

    End Sub
End Class