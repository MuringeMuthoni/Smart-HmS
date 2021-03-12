Imports System.Web.Script.Serialization

Public Class inventory_purchases
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
            Load_categories()

        End If
        Load_inventory()
    End Sub




    Private Sub Load_categories()

        Try



            Dim cont As Int16 = 0
            Dim totalSales As Double = 0
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()




                Dim Scmd, pcmd, Tcmd As New MySqlCommand
                Dim Mydata As MySqlDataReader



                cbocategory.Items.Add("")
                Scmd = New MySqlCommand
                Scmd.Connection = Myconn
                Scmd.CommandText = "select distinct CategoryName from tbl_products" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
                Mydata = Scmd.ExecuteReader()
                Using Mydata
                    While Mydata.Read
                        cbocategory.Items.Add(Mydata.Item(0))
                    End While
                End Using

                'cboproname.Items.Add("")
                'pcmd = New MySqlCommand
                'pcmd.Connection = Myconn
                'pcmd.CommandText = "select distinct ProductName from tbl_products where CategoryName='" & cbocategory.Text & "'"
                'Mydata = pcmd.ExecuteReader()
                'Using Mydata
                '    While Mydata.Read
                '        cboproname.Items.Add(Mydata.Item(0))
                '    End While
                'End Using


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


            End Using


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

            Lblconmessage.Text = "You are about to remove this entry from your purchases. Proceed?"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "popup_alert_show();", True)
            'popu the lab results window that can be printable
        End If




    End Sub

    Private Sub procced()

        Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Mcmd, Tcmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

            Mcmd = New MySqlCommand("delete from tbl_product_purchases  WHERE id='" & Hddid.Value & "'", Myconn) '4
            Mcmd.ExecuteNonQuery()

        End Using
        Load_inventory()
    End Sub



    Protected Sub imgsave_Click(sender As Object, e As ImageClickEventArgs) Handles imgsave.Click
        save_inventory()


    End Sub

    Private Sub save_inventory()

        If hddinput.Value = "" Then
            lblmsg2.Text = "Please select product name before you proceed"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "alert_show();", True)
            Exit Sub
        End If
        Dim success As Int16 = 0

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
                Tcmd.CommandText = "select id from tbl_product_purchases where colproduct='" & hddinput.Value & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Not Mydata.Read Then
                        Mydata.Close()

                        Dim totalamo As Double = Val(txtpack.Text) * Val(txtpbp.Text)

                        cmd = New MySqlCommand
                        Using cmd
                            cmd.Connection = Myconn
                            cmd.CommandText = "INSERT INTO tbl_product_purchases" &
                                                        "(colcategory,colproduct,colpackbp,colpackqty,Totalamo,userid)" _
                                                       & "VALUES(?0,?1,?2,?3,?4,?5)"
                            cmd.Parameters.AddWithValue("?0", cbocategory.Text)
                            cmd.Parameters.AddWithValue("?1", hddinput.Value)
                            cmd.Parameters.AddWithValue("?2", txtpbp.Text)
                            cmd.Parameters.AddWithValue("?3", txtpack.Text)
                            cmd.Parameters.AddWithValue("?4", totalamo)
                            cmd.Parameters.AddWithValue("?5", Session("did"))
                            cmd.ExecuteNonQuery()
                        End Using



                        success = 1
                    Else
                        success = 2
                    End If
                End Using

            End Using

        Catch ex As Exception
            success = 3
            MsgBox(ex.Message)
        End Try

        If success = 1 Then
            Load_inventory()
            hddinput.Value = ""
            txtpack.Text = ""
            txtpbp.Text = ""
            lblmsg.Text = "Success adding this entry to the list"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "ShowMessage();", True)
        ElseIf success = 2 Then
            hddinput.Value = ""
            lblmsg2.Text = "Sorry, the item is aready in the list"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "alert_show();", True)
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
        End If



    End Sub
    Private Sub Load_inventory()

        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("colcategory")
            dt.Columns.Add("colproduct")
            dt.Columns.Add("colpackbp")
            dt.Columns.Add("colpackqty")
            dt.Columns.Add("Totalamo")


            'colcategory, colproduct, colpackbp, colpackqty, Totalamo


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

                sts = "Select id,colcategory, colproduct, colpackbp, colpackqty, Totalamo  from tbl_product_purchases where userid='" & Session("did") & "' and  status<>'Finalized' "
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5))
                            cont += 1
                        End While
                    End Using
                End Using


                If cont >= 1 Then
                    grdrequest.DataSource = dt
                    grdrequest.DataBind()
                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub cbocategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbocategory.SelectedIndexChanged

        hdddata.Value = ""
        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()


            Dim Scmd, pcmd, Tcmd As New MySqlCommand
            Dim Mydata As MySqlDataReader
            Dim DataArray() As String = {}
            Dim singleitem As String
            Tcmd = New MySqlCommand
            If cbocategory.Text <> "" Then
                Tcmd.CommandText = "Select ProductName  from tbl_products where CategoryName='" & cbocategory.Text & "' and status='ok' order by ProductName asc"
            Else
                Tcmd.CommandText = "Select ProductName  from tbl_products where status='ok' order by ProductName asc"

            End If
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
        End Using

    End Sub

    Protected Sub btnproceed_Click(sender As Object, e As EventArgs) Handles btnproceed.Click
        procced()
    End Sub


    Private Sub update_inv()


        Dim success As Int16 = 0

        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn2 As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconn2.ConnectionString = MyString
                    Dim Tcmd, Mcmd, cmd As New MySqlCommand
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
                    Dim Mydata, seldata As MySqlDataReader
                    Dim pnames As String = ""
                    Dim tel As String = ""


                    Dim Maxid As Int16 = 0
                    Tcmd = New MySqlCommand
                    Tcmd.Connection = Myconn2
                    Tcmd.CommandText = "select colcategory,colproduct,colpackbp,colpackqty,id from tbl_product_purchases where userid='" & Session("did") & "'"
                    Mydata = Tcmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            Dim pname As String = Mydata.Item(1)
                            Dim pbp As Integer = Mydata.Item(2)
                            Dim qttnow As Integer = Mydata.Item(3)
                            Dim ids As Integer = Mydata.Item(4)

                            cmd = New MySqlCommand
                            cmd.Connection = Myconn
                            cmd.CommandText = "select ProductCode,QttyHand,BatchQtty,UnitsAvailable,UnitBp from tbl_products where ProductName='" & pname & "'"
                            seldata = cmd.ExecuteReader()
                            Using seldata
                                If seldata.Read Then
                                    Dim pcode As Integer = seldata.Item(0)
                                    Dim QttyHand As Integer = seldata.Item(1)
                                    Dim BatchQtty As Integer = seldata.Item(2)
                                    Dim UnitsPavail As Integer = seldata.Item(3)
                                    Dim unibppre As Integer = seldata.Item(4)
                                    seldata.Close()

                                    Dim unitsnow As Double = BatchQtty * qttnow
                                    Dim unitbp As Double = pbp / BatchQtty
                                    Dim unitavail As Double = UnitsPavail + unitsnow
                                    Dim Qtthandnow As Double = QttyHand + qttnow
                                    Dim prestockvalue As Double = unibppre * UnitsPavail
                                    Dim stockvaluenow As Double = unitsnow * unitbp
                                    Dim Currentvalue As Double = prestockvalue + stockvaluenow

                                    cmd = New MySqlCommand("UPDATE tbl_products Set " &
                                                     " UnitBp=?0,UnitsAvailable=?1,QttyHand=?2,StockValue=?3 " &
                                                     " WHERE ProductCode=" & pcode, Myconn)
                                    cmd.Parameters.AddWithValue("?0", unitbp)
                                    cmd.Parameters.AddWithValue("?1", unitavail)
                                    cmd.Parameters.AddWithValue("?2", Qtthandnow)
                                    cmd.Parameters.AddWithValue("?3", Currentvalue)
                                    cmd.ExecuteNonQuery()

                                    Mcmd = New MySqlCommand("delete from tbl_product_purchases  WHERE id='" & ids & "'", Myconn) '4
                                    Mcmd.ExecuteNonQuery()

                                    success = 1
                                End If
                            End Using

                        End While
                    End Using

                End Using
            End Using

        Catch ex As Exception
            success = 3
            MsgBox(ex.Message)
        End Try

        If success = 1 Then

            'lblmsg.Text = "Success adding this entry to the list"
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "ShowMessage();", True)
            Response.Redirect("~/src/Dashboards/pharmacy_dashboard.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
        End If



    End Sub

    Protected Sub btnsave_Click(sender As Object, e As ImageClickEventArgs) Handles btnsave.Click
        lblconmsg.Text = "You are about to finalize this purchase. proceed?"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "confirm_pop();", True)
        update_inv()

    End Sub

    Protected Sub btnproPur_Click(sender As Object, e As EventArgs) Handles btnproPur.Click
        update_inv()
    End Sub
End Class