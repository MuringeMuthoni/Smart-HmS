Public Class PatientQueue
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
        If Not Page.IsPostBack Then
            bindtime()

        End If
    End Sub
    Private Sub bindtime()
        Dim StartTime As DateTime = DateTime.ParseExact("00:00", "HH:mm", Nothing)
        Dim EndTime As DateTime = DateTime.ParseExact("23:55", "HH:mm", Nothing)

        Dim Interval As New TimeSpan(0, 1, 0)
        ddlTimeFrom.Items.Clear()
        While StartTime <= EndTime
            ddlTimeFrom.Items.Add(StartTime.ToShortTimeString())
            StartTime = StartTime.Add(Interval)
        End While
        ddlTimeFrom.Items.Insert(0, New ListItem("--Select--", "0"))
    End Sub



    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click

        lblmsg.Text = ""
        If txtqueueno.Text = "" Then
            lblmsg.Text = "Please enter the queue no before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If txtregno.Text = "" Then
            lblmsg.Text = "Please enter the reg no before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Datepicker1.Text = "" Then
            lblmsg.Text = "please enter the day name before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If ddlTimeFrom.Text = "" Then
            lblmsg.Text = "please select  the time before you proceed"
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtfromroom.Text = "" Then
            lblmsg.Text = "please enter from what room  patient is from before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txttoroom.Text = "" Then
            lblmsg.Text = "please enter  what room  patient is going to  before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtdoctor.Text = "" Then
            lblmsg.Text = "please enter the doctor's name  before you proceed."
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
                Tcmd.CommandText = "select id from tblqueue where colqueueno='" & txtqueueno.Text & "' and colregno='" & txtregno.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Not Mydata.Read Then
                        Mydata.Close()

                        Console.WriteLine(Now.ToLongTimeString)
                        Dim regdate As String = Now.ToString("yyyy-MM-dd")
                        cmd = New MySqlCommand
                        Using cmd
                            cmd.Connection = Myconn
                            cmd.CommandText = "INSERT INTO tblqueue" &
                            "(colqueueno,colregno,coldate,coltime,colfrom,colto,coldoctor)" _
                           & "VALUES(?1,?2,?3,?4,?5,?6,?7)"
                            cmd.Parameters.AddWithValue("?1", txtqueueno.Text)
                            cmd.Parameters.AddWithValue("?2", txtregno.Text)
                            cmd.Parameters.AddWithValue("?3", Datepicker1.Text)
                            cmd.Parameters.AddWithValue("?4", ddlTimeFrom.Text)
                            cmd.Parameters.AddWithValue("?5", Txtfromroom.Text)
                            cmd.Parameters.AddWithValue("?6", Txttoroom.Text)
                            cmd.Parameters.AddWithValue("?7", Txtdoctor.Text)
                            cmd.ExecuteNonQuery()
                        End Using




                        lblmsg.ForeColor = Drawing.Color.Blue
                        lblmsg.Text = "Success!!!!  "


                        txtqueueno.Text = ""
                        txtregno.Text = ""
                        Datepicker1.Text = ""
                        Datepicker1.Text = ""
                        ddlTimeFrom.Text = ""
                        Txtfromroom.Text = ""
                        Txttoroom.Text = ""
                        Txtdoctor.Text = ""

                    Else
                        lblmsg.Text = "Another client with same name exists "
                        lblmsg.ForeColor = Drawing.Color.Red

                    End If
                End Using


            End Using

            'Dynamic_tables()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

End Class