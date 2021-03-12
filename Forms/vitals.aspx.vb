Public Class vitals
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

    End Sub

    Protected Sub allergize1_Click(sender As Object, e As EventArgs) Handles allergize1.Click

    End Sub
    Protected Sub vitual1_Click1(sender As Object, e As EventArgs) Handles vitual1.Click
        MultiView1.ActiveViewIndex = 1

    End Sub

    Protected Sub allergize1_Click1(sender As Object, e As EventArgs) Handles allergize1.Click
        MultiView1.ActiveViewIndex = 0

    End Sub
    'Protected Sub Btnpost_Click(sender As Object, e As EventArgs) Handles Btnpost.Click

    'End Sub

    Protected Sub Btnsearch_Click(sender As Object, e As EventArgs) Handles Btnsearch.Click
        Getinfo()
    End Sub
    Private Sub Getinfo()
        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests

            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader
                Dim cmd As New MySqlCommand
                Dim Tcode As String = ""

                cmd.CommandText = "Select colfirstname,collastname,colage from tbl_patient where ID='" & Txtpatientregno.Text & "'"
                cmd.Connection = Myconn
                Using cmd
                    Mydata = cmd.ExecuteReader()
                    Using Mydata
                        If Mydata.Read Then
                            txtpatientfname.Text = Mydata.Item(0)
                            txlastname.Text = Mydata.Item(1)
                            txtpatienttype.Text = Mydata.Item(2)
                        End If
                    End Using
                End Using
            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        lblmsg.Text = ""
        If Txtsystolicbp.Text = "Please input the systolic Blood pressure before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtdiastolicbp.Text = "please input the diastolic Blood pressure before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txttxttemp.Text = "please insert the patients temparature before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtweight.Text = "please enter the patient's weight before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtheight.Text = "please enter the patients height before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtbmi.Text = "please enter the patients height before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtrespiratory.Text = "please enter the respiratory before before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtheart.Text = "please enter the Heart beat rate before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txturineoutput.Text = "please enter the urine output rate before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If TxtbpF.Text = "please enter the Blood sugar F before  you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If TxtbloodsugaR.Text = "please enter the Blood sugar R before  you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If TxtSpo.Text = "please enter the SPO before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtavpu.Text = "please enter the AVPU before  you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If

        If Txttrauma.Text = "please select the Trauma before  you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtmobility.Text = "please enter the mobility before  you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If

        If Txtmobility.Text = "please enter the oxygen supplement before  you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If

        If Txtcomments.Text = "please enter a comment before  you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If

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

                Tcmd.CommandText = "select id from tblnursevitals where colpatientreg='" & Txtpatientregno.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Not Mydata.Read Then
                        Mydata.Close()
                        cmd = New MySqlCommand
                        Using cmd
                            cmd.Connection = Myconn
                            cmd.CommandText = "INSERT INTO tbl_vituals" &
                                    "(colsystoliddp,coldiastolicdp,coltemp,colweight,colheight,colurineop,colbmi,colBSr,colSpo2,colAVPU,colTrauma,colMobility,colpatientid,colpatientname)" _
                                   & "VALUES(?0,?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13,?14,?15,?16)"
                            cmd.Parameters.AddWithValue("?0", Txtsystolicbp.Text)
                            cmd.Parameters.AddWithValue("?1", Txtdiastolicbp.Text)
                            cmd.Parameters.AddWithValue("?2", Txttxttemp.Text)
                            cmd.Parameters.AddWithValue("?3", Txtweight.Text)
                            cmd.Parameters.AddWithValue("?4", Txtheight.Text)
                            cmd.Parameters.AddWithValue("?5", Txtbmi.Text)
                            cmd.Parameters.AddWithValue("?6", Txtrespiratory.Text)
                            cmd.Parameters.AddWithValue("?7", Txtheart.Text)
                            cmd.Parameters.AddWithValue("?8", Txturineoutput.Text)
                            cmd.Parameters.AddWithValue("?9", TxtbpF.Text)
                            cmd.Parameters.AddWithValue("?10", TxtbloodsugaR.Text)
                            cmd.Parameters.AddWithValue("?11", TxtSpo.Text)
                            cmd.Parameters.AddWithValue("?12", Txtavpu.Text)
                            cmd.Parameters.AddWithValue("?13", Txttrauma.Text)
                            cmd.Parameters.AddWithValue("?14", Txtmobility.Text)
                            cmd.Parameters.AddWithValue("?15", Txtoxygen.Text)
                            cmd.Parameters.AddWithValue("?16", Txtcomments.Text)
                            cmd.ExecuteNonQuery()
                        End Using




                        lblmsg.ForeColor = Drawing.Color.Blue
                        'lblmsg.Text = "Success!!!!  "
                        'txtcname.Text = ""
                        'txtcperson.Text = ""
                        'txttel.Text = ""
                        'txtemail.Text = ""
                        'cboterm.Text = ""
                        'txtusername.Text = ""
                        'txttel.Text = ""

                    Else
                        lblmsg.Text = "Another client with same name exists "
                        lblmsg.ForeColor = Drawing.Color.Red

                    End If
                End Using


            End Using

            '    'Dynamic_tables()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
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
            dt.Columns.Add("paymentinfo")



            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim sts As String
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                sts = "Select id,colvisittype,colscore,coldatetime,colsbp,coldgp,coltemp,colrr from triagequeue where status='awaiting'"
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
            End Using

            If cont >= 1 Then
                GridView0.DataSource = dt
                GridView0.DataBind()
                ' nodata.Visible = False
            Else
                '  nodata.Visible = True
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


End Class