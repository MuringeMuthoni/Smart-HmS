Public Class meds_issue
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
        hddstatus.Value = Request.QueryString("var2")
        Hddid.Value = Request.QueryString("var1")



        If Request.QueryString("var2") = "Awaiting payment" Then
            imgcheckout.Visible = False
        Else
            imgcheckout.Visible = True
        End If

        Get_info()
    End Sub



    Protected Sub grdInv_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand

        'Try
        Dim currentCommand As String = e.CommandName
        Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument.ToString())
        Dim ss As String = (GridView1.DataKeys(currentRowIndex).Value)
        hddmid.Value = ss

        If currentCommand = "edit" Then
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
                    Dim Mydata As MySqlDataReader
                    Dim Maxid As Int16 = 0

                    Dim pname As String = ""
                    Dim Totaldose As Int16 = 0
                    Dim proname As String = ""
                    sts = "Select mname,Totaldose from tbl_meds_prescription where id=" & ss
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            If Mydata.Read Then
                                proname = Mydata.Item(0)
                                lblMname.Text = Mydata.Item(0)
                                lblRtotal.Text = Mydata.Item(1)
                                Txtissued.Text = Mydata.Item(1)
                            End If
                        End Using
                    End Using

                    Dim sp As Double = 0
                    sts = "Select Unitsp from tbl_products where ProductName='" & proname & "'"
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            If Mydata.Read Then
                                sp = Mydata.Item(0)
                            End If
                        End Using
                    End Using


                    lbltcost.Text = sp
                    lblTotal.Text = Val(Txtissued.Text) * sp


                End Using
            End Using

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
        End If




    End Sub

    'Private Sub get_product()

    '    Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
    '    Dim MyString As String = prests
    '    Using Myconn2 As New MySqlConnection
    '        Using Myconn As New MySqlConnection
    '            Myconn.ConnectionString = MyString
    '            Myconn2.ConnectionString = MyString
    '            If Myconn.State = ConnectionState.Closed Then Myconn.Open()
    '            If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()

    '            Dim sts As String
    '            Dim Scmd, cmd As New MySqlCommand
    '            Dim Mydata As MySqlDataReader
    '            Dim Maxid As Int16 = 0


    '            sts = "Select sp from tbl_meds_prescription where pname=" & hddmid.Value
    '            Scmd = New MySqlCommand
    '            Scmd.CommandText = sts
    '            Scmd.Connection = Myconn
    '            Using Scmd
    '                Mydata = Scmd.ExecuteReader()
    '                Using Mydata
    '                    While Mydata.Read

    '                    End While
    '                End Using
    '            End Using


    '        End Using
    '    End Using

    'End Sub


    Private Sub Get_info()

        If Hddid.Value = "" Then
            Exit Sub
        End If
        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("Medicine")
            dt.Columns.Add("Dosage")
            dt.Columns.Add("Frequency")
            dt.Columns.Add("Duration")
            dt.Columns.Add("TotalQty")
            dt.Columns.Add("foodrelation")
            dt.Columns.Add("instructions")
            dt.Columns.Add("Issued")
            dt.Columns.Add("cost")
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
                    Dim Mydata As MySqlDataReader
                    Dim Maxid As Int16 = 0

                    Dim Totalcost As Double
                    sts = "Select distinct id,mname,dosage,frequency,duration,Totaldose,foodrelation,instructions,Issued,cost from tbl_meds_prescription where qid=" & Hddid.Value
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read

                                dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7), Mydata.Item(8), Mydata.Item(9))
                                cont += 1

                                Totalcost += Mydata.Item(9)
                            End While
                        End Using
                    End Using


                    sts = "Select pid from tbl_meds_prescription where qid=" & Hddid.Value
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            If Mydata.Read Then
                                Dim pid As Int16 = Mydata.Item(0)
                                Mydata.Close()

                                sts = "Select colnames from tbl_patient where id=" & pid
                                Scmd = New MySqlCommand
                                Scmd.CommandText = sts
                                Scmd.Connection = Myconn
                                Using Scmd
                                    Mydata = Scmd.ExecuteReader()
                                    Using Mydata
                                        If Mydata.Read Then
                                            lblname.Text = Mydata.Item(0)
                                        End If
                                    End Using
                                End Using



                            End If
                        End Using
                    End Using

                    lblcost.Text = FormatNumber(Totalcost, 2)


                End Using
            End Using

            If cont >= 1 Then
                GridView1.DataSource = dt
                GridView1.DataBind()
            End If


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    'Private Sub grdrequest_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdrequest.RowDataBound
    '    Select Case e.Row.RowType
    '        Case DataControlRowType.DataRow
    '            Dim priority As String = DirectCast(DataBinder.Eval(e.Row.DataItem, "status"), String)
    '            Select Case priority
    '                Case "Processing"
    '                    e.Row.ForeColor = Drawing.Color.Green
    '                Case "Pending"
    '                    e.Row.ForeColor = Drawing.Color.Red
    '                Case Else
    '                    e.Row.ForeColor = Drawing.Color.Black
    '            End Select
    '    End Select

    'End Sub






    Protected Sub bttncompute_Click(sender As Object, e As EventArgs) Handles bttncompute.Click
        lblTotal.Text = Val(Txtissued.Text) * Val(lbltcost.Text)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
    End Sub

    Private Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing

    End Sub

    Protected Sub imgcheckout_Click(sender As Object, e As ImageClickEventArgs) Handles imgcheckout.Click
        'Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
        'Dim MyString As String = prests
        'Using Myconn As New MySqlConnection
        '    Myconn.ConnectionString = MyString
        '    Dim Mcmd, Tcmd As New MySqlCommand
        '    If Myconn.State = ConnectionState.Closed Then Myconn.Open()

        '    Mcmd = New MySqlCommand("UPDATE tbl_meds_prescription Set " &
        '                                              " status=?0 " &
        '                                              " WHERE qid=" & Hddid.Value, Myconn)
        '    Mcmd.Parameters.AddWithValue("?0", "Awaiting payment")
        '    Mcmd.ExecuteNonQuery()


        '    Console.Write(lblTotal.Text)
        'End Using

        'Load_inv()

        If hddstatus.Value = "pending" Then
            Lblconmessage.Text = "Change status of the prescription to awaiting payment?"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "confirm_message();", True)
            'ElseIf hddstatus.Value = "Paid" Then
            '    Lblconmessage.Text = "Change status of the prescription to issued?"
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "confirm_message();", True)
        ElseIf hddstatus.Value = "Paid" Then
            Lblconmessage.Text = "Change status of the prescription to issued?"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "confirm_message();", True)
        End If


    End Sub

    Protected Sub btnsave_Click(sender As Object, e As ImageClickEventArgs) Handles btnsave.Click
        lblTotal.Text = Val(Txtissued.Text) * Val(lbltcost.Text)

        Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Mcmd, Tcmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

            Mcmd = New MySqlCommand("UPDATE tbl_meds_prescription Set " &
                                                      " issued=?0, cost=?1 " &
                                                      " WHERE id=" & hddmid.Value, Myconn)
            Mcmd.Parameters.AddWithValue("?0", Val(Txtissued.Text))
            Mcmd.Parameters.AddWithValue("?1", Val(lblTotal.Text))
            Mcmd.ExecuteNonQuery()


            Console.Write(lblTotal.Text)
        End Using

        'Load_inv()
        lblmsg.Text = "Success Computing cost"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "ShowMessage();", True)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("~/src/Forms/meds_requests.aspx")
    End Sub



    Protected Sub btncancel_Click(sender As Object, e As EventArgs) Handles btncancel.Click
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "confirm_close();", True)
        Get_info()
    End Sub

    Protected Sub brnproceed_Click(sender As Object, e As EventArgs) Handles brnproceed.Click

        'endelea
        Dim status As String = ""
        If hddstatus.Value = "pending" Then
            status = "Awaiting payment"
        ElseIf hddstatus.Value = "Paid" Then
            status = "Issued"
        End If

        Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
        Dim MyString As String = prests

        Using Myconn2 As New MySqlConnection
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Myconn2.ConnectionString = MyString
                Dim Mcmd, Tcmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
                Dim sts As String
                Dim Scmd, cmd As New MySqlCommand
                Dim Mydata, seldata As MySqlDataReader
                Dim Maxid As Int16 = 0

                sts = "Select mname,Totaldose from tbl_meds_prescription where qid=" & Hddid.Value
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn2
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            Dim pname As String = Mydata.Item(0)
                            Dim unitsold As Integer = Mydata.Item(1)



                            cmd = New MySqlCommand
                            cmd.CommandText = "Select UnitsAvailable,BatchQtty,UnitBp from tbl_products where ProductName='" & pname & "'"
                            cmd.Connection = Myconn
                            Using Scmd
                                seldata = cmd.ExecuteReader()
                                Using seldata
                                    If seldata.Read Then
                                        Dim preunits As Double = seldata.Item(0)
                                        Dim batchqtty As Double = seldata.Item(1)
                                        Dim unitbp As Double = seldata.Item(2)
                                        seldata.Close()

                                        Dim unitsavailable As Double = preunits - unitsold
                                        Dim packavail As Double = unitsavailable / batchqtty
                                        Dim stockvalue = unitsavailable * unitbp

                                        cmd = New MySqlCommand("UPDATE tbl_products Set " &
                                                 " UnitsAvailable=?1,QttyHand=?2,StockValue=?3 " &
                                                  " WHERE ProductName='" & pname & "'", Myconn)

                                        cmd.Parameters.AddWithValue("?1", unitsavailable)
                                        cmd.Parameters.AddWithValue("?2", packavail)
                                        cmd.Parameters.AddWithValue("?3", stockvalue)
                                        cmd.ExecuteNonQuery()


                                    End If
                                End Using

                            End Using


                        End While
                    End Using
                End Using



                Mcmd = New MySqlCommand("UPDATE tbl_meds_prescription Set " &
                                        " status=?0 " &
                                        " WHERE qid=" & Hddid.Value, Myconn)
                Mcmd.Parameters.AddWithValue("?0", status)
                Mcmd.ExecuteNonQuery()


            End Using
        End Using


        Response.Redirect("~/src/Forms/meds_requests.aspx")

        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "confirm_close();", True)
        'Get_info()
    End Sub
End Class