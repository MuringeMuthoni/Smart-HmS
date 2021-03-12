Public Class inventory
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

        '
        If Not IsPostBack Then
            Load_inv()
        End If
        'Get_info()
    End Sub


    Private Sub Load_inv()

        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("ProductCode")
            dt.Columns.Add("CategoryName")
            dt.Columns.Add("ProductName")
            dt.Columns.Add("UnitBp")
            dt.Columns.Add("PackBp")
            dt.Columns.Add("Unitsp")
            dt.Columns.Add("Margin")
            dt.Columns.Add("BatchQtty")
            dt.Columns.Add("UnitsAvailable")
            dt.Columns.Add("QttyHand")
            dt.Columns.Add("StockValue")

            Dim cont As Int16 = 0
            Dim totalSales As Double = 0
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()



                Dim sts As String
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader


                If Not IsPostBack Then
                    cbonames.Items.Add("")
                    Scmd = New MySqlCommand
                    Scmd.Connection = Myconn
                    Scmd.CommandText = "select distinct CategoryName from tbl_products" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            cbonames.Items.Add(Mydata.Item(0))
                        End While
                    End Using

                End If

                If cbonames.Text = "" Then
                    sts = "Select ProductCode,CategoryName,ProductName,UnitBp,PackBp,Unitsp,Margin,BatchQtty,UnitsAvailable,QttyHand,StockValue from tbl_products where ProductName like '" & txtnames.Text & "%' and status='ok' order by ProductName asc"
                Else
                    sts = "Select ProductCode,CategoryName,ProductName,UnitBp,PackBp,Unitsp,Margin,BatchQtty,UnitsAvailable,QttyHand,StockValue from tbl_products where CategoryName='" & cbonames.Text & "' and ProductName like '" & txtnames.Text & "%' and status='ok' order by ProductName asc"


                End If
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read

                            dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7), Mydata.Item(8), Mydata.Item(9), Mydata.Item(10))
                            cont += 1


                        End While
                    End Using
                End Using

            End Using


            If cont >= 1 Then
                grdrequest.DataSource = dt
                grdrequest.DataBind()
                nodata.Visible = False
                lblsales.Text = FormatNumber(cont, 0)
            Else
                lblsales.Text = FormatNumber(cont, 0)
                nodata.Visible = True
            End If


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub




    Protected Sub grdInv_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdrequest.RowCommand

        'Try
        Dim currentCommand As String = e.CommandName
        Dim currentRowIndex As Integer = Int32.Parse(e.CommandArgument.ToString())
        Dim ss As String = (grdrequest.DataKeys(currentRowIndex).Value)
        Hddid.Value = ss




        If currentCommand = "view" Then
            Get_info()

            'Response.Redirect("~/src/Forms/meds_issue.aspx?var1=" & ss)

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "edit_results();", True)
        End If




    End Sub

    Private Sub Get_info()

        If Hddid.Value = "" Then
            Exit Sub
        End If

        lblpname.Text = "product name"
        'Try

        '    Dim dt As DataTable = New DataTable()
        '    dt.Columns.Add("id")
        '    dt.Columns.Add("Medicine")
        '    dt.Columns.Add("Dosage")
        '    dt.Columns.Add("Frequency")
        '    dt.Columns.Add("Duration")
        '    dt.Columns.Add("TotalQty")
        '    dt.Columns.Add("Issued")
        '    dt.Columns.Add("cost")
        '    Dim cont As Int16 = 0

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

        '            Dim Totalcost As Double
        '            sts = "Select distinct id,mname,dosage,frequency,duration,Totaldose,Issued,cost from tbl_meds_prescription where qid=" & Hddid.Value
        '            Scmd = New MySqlCommand
        '            Scmd.CommandText = sts
        '            Scmd.Connection = Myconn
        '            Using Scmd
        '                Mydata = Scmd.ExecuteReader()
        '                Using Mydata
        '                    While Mydata.Read

        '                        dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7))
        '                        cont += 1

        '                        Totalcost += Mydata.Item(7)
        '                    End While
        '                End Using
        '            End Using

        '            sts = "Select pid from tbl_meds_prescription where qid=" & Hddid.Value
        '            Scmd = New MySqlCommand
        '            Scmd.CommandText = sts
        '            Scmd.Connection = Myconn
        '            Using Scmd
        '                Mydata = Scmd.ExecuteReader()
        '                Using Mydata
        '                    If Mydata.Read Then
        '                        Dim pid As Int16 = Mydata.Item(0)
        '                        Mydata.Close()

        '                        sts = "Select colnames from tbl_patient where id=" & pid
        '                        Scmd = New MySqlCommand
        '                        Scmd.CommandText = sts
        '                        Scmd.Connection = Myconn
        '                        Using Scmd
        '                            Mydata = Scmd.ExecuteReader()
        '                            Using Mydata
        '                                If Mydata.Read Then
        '                                    lblname.Text = Mydata.Item(0)
        '                                End If
        '                            End Using
        '                        End Using



        '                    End If
        '                End Using
        '            End Using

        '            lblcost.Text = FormatNumber(Totalcost, 2)
        '        End Using
        '    End Using

        '    If cont >= 1 Then
        '        GridView1.DataSource = dt
        '        GridView1.DataBind()
        '    End If


        'Catch ex As Exception
        '    MsgBox(ex.Message)
        'End Try

    End Sub

    Private Sub grdrequest_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdrequest.RowDataBound
        Select Case e.Row.RowType
            Case DataControlRowType.DataRow
                Dim priority As String = DirectCast(DataBinder.Eval(e.Row.DataItem, "UnitsAvailable"), String)
                Select Case priority
                    Case > 0
                        e.Row.ForeColor = Drawing.Color.Green
                    Case Else
                        e.Row.ForeColor = Drawing.Color.Red
                End Select
        End Select

    End Sub

    Private Sub grdrequest_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles grdrequest.RowEditing

    End Sub

    Protected Sub cbonames_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbonames.SelectedIndexChanged
        Load_inv()
    End Sub

    Protected Sub Btnsearch_Click(sender As Object, e As EventArgs) Handles Btnsearch.Click
        Load_inv()
    End Sub
End Class