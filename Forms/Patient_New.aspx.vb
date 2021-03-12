Public Class Patient_New
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
            Dpomaritalstatus.Items.Add("")
            Dpomaritalstatus.Items.Add("Married")
            Dpomaritalstatus.Items.Add("Single")
            Dpomaritalstatus.Items.Add("Child")
            Dpogender.Items.Add("")
            Dpogender.Items.Add("Female")
            Dpogender.Items.Add("Male")


            cbotype.Items.Add("")
            cbotype.Items.Add("Names")
            cbotype.Items.Add("Tel")

            Get_info()
        End If

    End Sub




    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click

        lblmsg.Text = ""
        If txtnames.Text = "" Then
            lblmsg.Text = "Please enter the patient's name before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If



        If txtemail.Text = "" Then
            lblmsg.Text = "please enter the email before you proceed"
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If txtpatientphone.Text = "" Then
            lblmsg.Text = "please enter the patient phone before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtpatientid.Text = "" Then
            lblmsg.Text = "Please enter the patient's id before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If txthome.Text = "" Then
            lblmsg.Text = "Please enter patient's home address before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If

        'If Txtregnosearch.Text = "please enter the registration number assigned to the patient before you proceed." Then
        '    lblmsg.Text = ""
        '    Exit Sub
        'Else
        '    lblmsg.Text = ""
        'End If
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

                Tcmd.CommandText = "select ID from tbl_patient where colnames='" & txtnames.Text & "' and id='" & Txtpatientid.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Not Mydata.Read Then
                        Mydata.Close()

                        Dim ccode As Integer
                        Tcmd.CommandText = "select count(id) from tbl_patient" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
                        Mydata = Tcmd.ExecuteReader()
                        Using Mydata
                            If Mydata.Read Then
                                If Not IsDBNull(Mydata.Item(0)) Then
                                    ccode = Mydata.Item(0) + 1
                                End If
                            End If
                        End Using

                        Dim leo As String = Now.ToString("yyyy-MM-dd")
                        Dim mwaka As String = Now.ToString("yyyy")
                        Dim ncode As String = ccode & "" & mwaka

                        cmd = New MySqlCommand
                        Using cmd
                            cmd.Connection = Myconn
                            cmd.CommandText = "INSERT INTO tbl_patient" &
                            "(colregdate,colnames,colage,colgender,maritalstatus,colemail,coltel,nationalid,location,pcode)" _
                           & "VALUES(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10)"

                            cmd.Parameters.AddWithValue("?1", leo)
                            cmd.Parameters.AddWithValue("?2", txtnames.Text)
                            cmd.Parameters.AddWithValue("?3", txtage.Text)
                            cmd.Parameters.AddWithValue("?4", Dpogender.Text)
                            cmd.Parameters.AddWithValue("?5", Dpomaritalstatus.Text)
                            cmd.Parameters.AddWithValue("?6", txtemail.Text)
                            cmd.Parameters.AddWithValue("?7", txtpatientphone.Text)
                            cmd.Parameters.AddWithValue("?8", Txtpatientid.Text)
                            cmd.Parameters.AddWithValue("?9", txthome.Text)
                            cmd.Parameters.AddWithValue("?10", ncode)
                            cmd.ExecuteNonQuery()
                        End Using




                        lblmsg.ForeColor = Drawing.Color.Blue
                        lblmsg.Text = "Success!!!!  "

                        txthome.Text = ""
                        txtnames.Text = ""
                        txtage.Text = ""
                        Dpogender.Text = ""
                        Dpomaritalstatus.Text = ""
                        txtemail.Text = "N/A"
                        txtpatientphone.Text = ""
                        Txtpatientid.Text = ""
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "Closeme();", True)
                    Else
                        lblmsg.Text = "Another client with same name exists "
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

    Private Sub Patient_New_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)


        End If

        Get_info()
    End Sub

    'Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
    '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "ReceiveFunds();", True)

    '    'Response.Redirect("~/src/Forms/Out_patient_billing.aspx")
    'End Subhddpid.Value =










    Private Sub Get_info()
        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("ID")
            dt.Columns.Add("pcode")
            dt.Columns.Add("colnames")
            dt.Columns.Add("coltel")
            dt.Columns.Add("colemail")
            dt.Columns.Add("colage")
            dt.Columns.Add("colgender")
            dt.Columns.Add("location")
            dt.Columns.Add("maritalstatus")



            Dim leo As String = Now.ToString("yyyy-MM-dd")
            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim sts As String = ""
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                If cbotype.Text = "" Then
                    sts = "Select ID,pcode,colnames,coltel,colemail,colage,colgender,location,maritalstatus from tbl_patient  order by colregdate desc"


                ElseIf cbotype.Text = "Names" Then
                    sts = "Select ID,pcode,colnames,coltel,colemail,colage,colgender,location,maritalstatus from tbl_patient where colnames like '" & txtsearch.Text & "%' order by colregdate desc"

                ElseIf cbotype.Text = "Tel" Then
                    sts = "Select ID,pcode,colnames,coltel,colemail,colage,colgender,location,maritalstatus from tbl_patient where coltel='" & txtsearch.Text & "' order by colregdate desc"

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
                                dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7), Mydata.Item(8))
                            End If

                        End While
                    End Using
                End Using
            End Using

            If cont >= 1 Then
                Grdnewpatients.DataSource = dt
                Grdnewpatients.DataBind()
                lblcount.Text = FormatNumber(cont, 0) & " Patients found"
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub btngo_Click(sender As Object, e As EventArgs) Handles btngo.Click
        Get_info()
    End Sub
End Class