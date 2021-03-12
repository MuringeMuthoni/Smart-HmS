Public Class SetupBed
    Inherits System.Web.UI.Page


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
            Get_info()
            get_floor()
        End If
    End Sub




    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click

        lblmsg.Text = ""
        If txtbednames.Text = "" Then
            lblmsg.Text = "Please enter the Bed's Name before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If

        If Dpoward.Text = "" Then
            lblmsg.Text = "please select the ward's name before you proceed"
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtdesc.Text = "" Then
            lblmsg.Text = "please select description before you proceed"
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtcategory.Text = "" Then
            lblmsg.Text = "please enter category before you proceed"
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

                Tcmd.CommandText = "select id from tbl_setupbed where colbedname='" & txtbednames.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Not Mydata.Read Then
                        Mydata.Close()

                        Dim wcode As Integer
                        Tcmd.CommandText = "select count(id) from tbl_setupbed" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
                        Mydata = Tcmd.ExecuteReader()
                        Using Mydata
                            If Mydata.Read Then
                                If Not IsDBNull(Mydata.Item(0)) Then
                                    wcode = Mydata.Item(0) + 1
                                End If
                            End If
                        End Using

                        Dim leo As String = Now.ToString("yyyy-MM-dd")
                        Dim mwaka As String = Now.ToString("yyyy")
                        Dim ncode As String = wcode & "" & mwaka

                        cmd = New MySqlCommand
                        Using cmd
                            cmd.Connection = Myconn
                            cmd.CommandText = "INSERT INTO tbl_setupbed" &
                            "(colbedname,colwardname,colcategory,coldescription)" _
                           & "VALUES(?1,?2,?3,?4)"
                            cmd.Parameters.AddWithValue("?1", txtbednames.Text)
                            cmd.Parameters.AddWithValue("?2", Dpoward.Text)
                            cmd.Parameters.AddWithValue("?3", Txtdesc.Text)
                            cmd.Parameters.AddWithValue("?4", Txtcategory.Text)
                            cmd.ExecuteNonQuery()
                        End Using
                        lblmsg.ForeColor = Drawing.Color.Blue
                        lblmsg.Text = "Success!!!!  "
                        txtbednames.Text = ""
                        Dpoward.Text = ""
                        Txtdesc.Text = ""
                        Txtcategory.Text = ""
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "Closeme();", True)
                    Else
                        lblmsg.Text = "Another bed with same name exists "
                        lblmsg.ForeColor = Drawing.Color.Red
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "newpatient();", True)
                    End If
                End Using


            End Using

            'Dynamic_tables()

        Catch ex As Exception
            lblmsg.Text = "error " & ex.Message
            lblmsg.ForeColor = Drawing.Color.Red
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "newpatient();", True)
        End Try
    End Sub



    Private Sub Get_info()
        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("colbedname")
            dt.Columns.Add("colwardname")
            dt.Columns.Add("colcategory")
            dt.Columns.Add("coldescription")


            Dim leo As String = Now.ToString("yyyy-MM-dd")
            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim sts As String
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                If txtsnames.Text = "" Then
                    sts = "Select id,colbedname,colwardname,colcategory,coldescription from tbl_wardsetup "
                Else
                    sts = "Select id,colname,coldescription,colfloor from tbl_wardsetup where colname like '%" & txtsnames.Text & "' order by colname desc"
                End If

                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            cont += 1

                            If cont < 20 Then
                                dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3))
                            End If

                        End While
                    End Using
                End Using
            End Using

            If cont >= 1 Then
                Grdnewpatients.DataSource = dt
                Grdnewpatients.DataBind()
                lblcount.Text = FormatNumber(cont, 0) & " Floors Found"
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub Btnsearch_Click(sender As Object, e As EventArgs) Handles Btnsearch.Click
        Get_info()
    End Sub
    Private Sub get_floor()
        Try
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader
                Dpoward.Items.Add("Select")
                Tcmd = New MySqlCommand
                Tcmd.CommandText = "Select colname  from tbl_wardsetup where status='ok' order by colfloorname asc"
                Tcmd.Connection = Myconn
                Using Tcmd
                    Mydata = Tcmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            Dpoward.Items.Add(Mydata.Item(0))
                        End While
                    End Using
                End Using
            End Using
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub



End Class