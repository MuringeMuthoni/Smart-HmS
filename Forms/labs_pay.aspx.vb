Public Class labs_pay
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
            cbotype.Items.Add("Select")
            cbotype.Items.Add("Cash")
            cbotype.Items.Add("Mpesa")
            cbotype.Items.Add("Card")
            cbotype.Items.Add("Insurance")
        End If

        Load_inv()

    End Sub

    Private Sub Load_inv()

        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("logstime")
            dt.Columns.Add("mname")
            dt.Columns.Add("count")
            dt.Columns.Add("cost")
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



                    sts = "Select distinct qid,pid,status from tbl_labrequests where status='Pending'"
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read
                                Dim qid As Int16 = Mydata.Item(0)
                                Dim pid As Int16 = Mydata.Item(1)
                                Dim status As String = Mydata.Item(2)

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

                                Dim count As Int16 = 0
                                sts = "Select count(id) from tbl_labrequests where qid=" & qid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            If Not IsDBNull(seldata.Item(0)) Then
                                                count = seldata.Item(0)
                                            End If

                                        End If
                                    End Using
                                End Using

                                Dim costs As Double = 0
                                sts = "Select sum(cost) from tbl_labrequests where qid=" & qid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            If Not IsDBNull(seldata.Item(0)) Then
                                                costs = seldata.Item(0)
                                            End If

                                        End If
                                    End Using
                                End Using

                                Dim siku As String = ""
                                sts = "Select logstime from tbl_labrequests where qid=" & qid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then

                                            Dim sk As Date = seldata.Item(0)
                                            siku = sk.ToString("dd-MM-yyy") & " " & sk.ToString("HH:mm")

                                        End If
                                    End Using
                                End Using


                                dt.Rows.Add(qid, siku, names, count, FormatNumber(costs, 2), status)
                                cont += 1


                            End While
                        End Using
                    End Using

                End Using
            End Using

            If cont >= 1 Then
                grdrequest.DataSource = dt
                grdrequest.DataBind()
                nodata.Visible = False
                isdata.Visible = True
            Else
                isdata.Visible = False
                nodata.Visible = True
            End If


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

        If currentCommand = "edit" Then
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim Mydata As MySqlDataReader
                Dim cmd As New MySqlCommand
                Dim cost As Double = 0
                cmd = New MySqlCommand
                cmd.CommandText = "Select sum(cost) from tbl_labrequests where qid = " & Hddid.Value
                cmd.Connection = Myconn
                Using cmd
                    Mydata = cmd.ExecuteReader()
                    Using Mydata
                        If Mydata.Read Then
                            If Not IsDBNull(Mydata.Item(0)) Then
                                txtamount.Text = Mydata.Item(0)
                            End If

                        End If
                    End Using
                End Using
            End Using

            'Get_info()

            'Response.Redirect("~/src/Forms/meds_issue.aspx?var1=" & ss)

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
        End If




    End Sub



    'Private Sub grdrequest_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdrequest.RowDataBound
    '    Select Case e.Row.RowType
    '        Case DataControlRowType.DataRow
    '            Dim priority As String = DirectCast(DataBinder.Eval(e.Row.DataItem, "status"), String)
    '            Select Case priority
    '                Case "pending"
    '                    e.Row.ForeColor = Drawing.Color.Red
    '                Case "Awaiting payment"
    '                    e.Row.ForeColor = Drawing.Color.Green
    '                Case Else
    '                    e.Row.ForeColor = Drawing.Color.Black
    '            End Select
    '    End Select

    'End Sub

    Private Sub grdrequest_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles grdrequest.RowEditing

    End Sub




    Protected Sub Btnpost_Click(sender As Object, e As EventArgs) Handles Btnpost.Click
        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim Mydata As MySqlDataReader
                Dim cmd As New MySqlCommand
                cmd = New MySqlCommand("UPDATE tbl_labrequests Set " &
                                                  " status=?0 " &
                                                  " WHERE qid=" & Hddid.Value, Myconn)
                cmd.Parameters.AddWithValue("?0", "Paid")
                cmd.ExecuteNonQuery()


                cmd = New MySqlCommand
                cmd.CommandText = "Select pid from tbl_queue where id = " & Hddid.Value
                cmd.Connection = Myconn
                Using cmd
                    Mydata = cmd.ExecuteReader()
                    Using Mydata
                        If Mydata.Read Then
                            Dim pid As Int16 = Mydata.Item(0)
                            Mydata.Close()
                            cmd = New MySqlCommand
                            Using cmd
                                cmd.Connection = Myconn
                                cmd.CommandText = "INSERT INTO tbl_transaction" &
                                            "(fid,pid,amount,description,paytype)" _
                                           & "VALUES(?1,?2,?3,?4,?5)"

                                cmd.Parameters.AddWithValue("?1", Hddid.Value)
                                cmd.Parameters.AddWithValue("?2", pid)
                                cmd.Parameters.AddWithValue("?3", txtamount.Text)
                                cmd.Parameters.AddWithValue("?4", "lab payments")
                                cmd.Parameters.AddWithValue("?5", cbotype.Text)
                                cmd.ExecuteNonQuery()
                            End Using

                        End If
                    End Using
                End Using





            End Using


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        Load_inv()
    End Sub
End Class