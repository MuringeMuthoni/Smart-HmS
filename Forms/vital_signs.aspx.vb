Public Class vital_signs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Hddqid.Value = Request.QueryString("var1")
        Get_info()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)

    End Sub





    Private Sub Save_Trans()
        lblmsg.Text = ""
        If Txtsystolicbp.Text = "" Then
            lblmsg.Text = "Please enter the systolic Bp before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtdiastolicbp.Text = "" Then
            lblmsg.Text = "Please enter the diastolic bp before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txttemp.Text = "" Then
            lblmsg.Text = "please enter the patient's temp before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtweight.Text = "" Then
            lblmsg.Text = "please enter the patient's weight before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txthheight.Text = "" Then
            lblmsg.Text = "please enter the  patient's height before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtbmi.Text = "" Then
            lblmsg.Text = "please enter the  BMI before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If

        If TxtbloodsugarF.Text = "" Then
            lblmsg.Text = "please enter the bloodsugar F  before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If


        If Txtcomments.Text = "" Then
            lblmsg.Text = "please enter a comment assigned to the patient before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        Dim count As Int16
        Try


            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                'Tcmd = New MySqlCommand
                'Tcmd.Connection = Myconn
                'Dim Mydata As MySqlDataReader

                '  Tcmd.CommandText = "select id from tbl_patient where colpatientreg='" & txtmiddlename.Text & "' and colid='" & Txtpatientid.Text & "'"
                'Mydata = Tcmd.ExecuteReader()
                'Using Mydata
                '    If Not Mydata.Read Then
                '        Mydata.Close()

                'Console.WriteLine(Now.ToLongTimeString)
                Dim regdate As String = Now.ToString("yyyy-MM-dd")
                cmd = New MySqlCommand
                Using cmd
                    cmd.Connection = Myconn
                    cmd.CommandText = "INSERT INTO tbl_vitals" &
                                    "(sysbp,diabp,temps,weight,height,bmi,resprate,heartrate,bloodsuga,comments,pid,qid)" _
                                   & "VALUES(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12)"

                    cmd.Parameters.AddWithValue("?1", Txtsystolicbp.Text)
                    cmd.Parameters.AddWithValue("?2", Txtdiastolicbp.Text)
                    cmd.Parameters.AddWithValue("?3", Txttemp.Text)
                    cmd.Parameters.AddWithValue("?4", Txtweight.Text)
                    cmd.Parameters.AddWithValue("?5", Txthheight.Text)
                    cmd.Parameters.AddWithValue("?6", Txtbmi.Text)
                    cmd.Parameters.AddWithValue("?7", Txtrep.Text)
                    cmd.Parameters.AddWithValue("?8", Txtheart.Text)
                    cmd.Parameters.AddWithValue("?9", TxtbloodsugarF.Text)
                    cmd.Parameters.AddWithValue("?10", Txtcomments.Text)
                    cmd.Parameters.AddWithValue("?11", hddpid.Value)
                    cmd.Parameters.AddWithValue("?12", Hddqid.Value)
                    cmd.ExecuteNonQuery()
                End Using

                Dim vttime As String = Now.ToString("yyyy-MM-dd") & " " & Now.ToString("HH:mm:ss")
                Dim cmd2 As New MySqlCommand
                cmd2 = New MySqlCommand("UPDATE tbl_queue SET vitalstatus=?1 WHERE id='" & Hddqid.Value & "'", Myconn)
                cmd2.Parameters.AddWithValue("?1", vttime)
                cmd2.ExecuteNonQuery()

                count = 1

                lblmsg.ForeColor = Drawing.Color.Blue
                lblmsg.Text = "Success!!!!  "
                Txtsystolicbp.Text = ""
                Txtdiastolicbp.Text = ""
                Txttemp.Text = ""
                Txtweight.Text = ""
                Txthheight.Text = ""
                Txtbmi.Text = ""
                Txtrep.Text = ""
                Txtheart.Text = ""
                TxtbloodsugarF.Text = ""
                Txtcomments.Text = ""

                'Else
                '    lblmsg.Text = "Another client with same name exists "
                '    lblmsg.ForeColor = Drawing.Color.Red

                'End If
                'End Using


            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        If count = 1 Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "Closeme();", True)
        End If


    End Sub
    Private Sub Get_info()
        Try



            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests

            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader
                Dim cmd As New MySqlCommand
                Dim Tcode As String = ""

                cmd.CommandText = "Select pid from tbl_queue where id=" & Hddqid.Value '& " order by logstime desc"
                cmd.Connection = Myconn
                Using cmd
                    Mydata = cmd.ExecuteReader()
                    Using Mydata
                        If Mydata.Read Then
                            Dim pid As Integer = Mydata.Item(0)
                            hddpid.Value = pid
                            Mydata.Close()
                            cmd.CommandText = "Select colnames,colgender,colage from tbl_patient where id=" & pid
                            cmd.Connection = Myconn
                            Using cmd
                                Mydata = cmd.ExecuteReader()
                                Using Mydata
                                    If Mydata.Read Then
                                        lblnames.Text = Mydata.Item(0)
                                        lblgender_age.Text = Mydata.Item(1) & " " & Mydata.Item(2) & " years"
                                    End If
                                End Using
                            End Using

                            Dim count As Int16 = 0
                            cmd.CommandText = "Select logstime from tbl_queue where pid=" & pid & " order by logstime desc"
                            cmd.Connection = Myconn
                            Using cmd
                                Mydata = cmd.ExecuteReader()
                                Using Mydata
                                    While Mydata.Read
                                        count += 1
                                        If count = 1 Then
                                            lblqueue_time.Text = "Queue time " & Mydata.Item(0)
                                        ElseIf count = 2 Then
                                            Dim sklast As Date = Mydata.Item(0)
                                            lbllastvisit.Text = "Last Visit" & sklast.ToString("dd-MM-yy")
                                            Mydata.Close()
                                            Exit While
                                        End If
                                    End While


                                End Using
                            End Using


                        End If
                    End Using
                End Using

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub


    Private Sub vital_signs_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
        End If
    End Sub

    Private Sub bttnSetup_ServerClick(sender As Object, e As EventArgs) Handles bttnSetup.ServerClick
        Save_Trans()
    End Sub

    Protected Sub btnsaved_Click(sender As Object, e As EventArgs) Handles btnsaved.Click
        Response.Redirect("~/src/Forms/queue_all.aspx?")
    End Sub
End Class