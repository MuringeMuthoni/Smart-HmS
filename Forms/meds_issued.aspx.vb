Public Class meds_issued
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
            dt.Columns.Add("Medicine")
            dt.Columns.Add("Meds")
            dt.Columns.Add("cost")

            Dim cont As Int16 = 0
            Dim totalSales As Double = 0
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


                    sts = "Select distinct qid,pid from tbl_meds_prescription where status='Issued'"
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

                                Dim meds As Int16 = 0
                                sts = "Select count(id) from tbl_meds_prescription where qid=" & qid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            If Not IsDBNull(seldata.Item(0)) Then
                                                meds = seldata.Item(0)
                                            End If

                                        End If
                                    End Using
                                End Using

                                Dim siku As String = ""
                                sts = "Select logstime from tbl_meds_prescription where qid=" & qid
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

                                Dim cost As Double = 0
                                sts = "Select sum(cost) from tbl_meds_prescription where qid=" & qid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            If Not IsDBNull(seldata.Item(0)) Then
                                                cost = seldata.Item(0)
                                            End If

                                        End If
                                    End Using
                                End Using


                                dt.Rows.Add(qid, siku, names, meds, FormatNumber(cost, 2))
                                cont += 1
                                totalSales += cost

                            End While
                        End Using
                    End Using

                End Using
            End Using

            If cont >= 1 Then
                grdrequest.DataSource = dt
                grdrequest.DataBind()
                nodata.Visible = False
                lblsales.Text = "Total Sales: " & FormatNumber(totalSales, 2)
            Else
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
            Get_info()

            'Response.Redirect("~/src/Forms/meds_issue.aspx?var1=" & ss)

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
        End If




    End Sub

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
                    sts = "Select distinct id,mname,dosage,frequency,duration,Totaldose,Issued,cost from tbl_meds_prescription where qid=" & Hddid.Value
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read

                                dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7))
                                cont += 1

                                Totalcost += Mydata.Item(7)
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

    Private Sub grdrequest_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles grdrequest.RowEditing

    End Sub





End Class