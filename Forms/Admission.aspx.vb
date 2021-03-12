Public Class Admission
    Inherits System.Web.UI.Page
    Dim checkarrivalmethod As String
    Dim checktypeofpatient As String
    Dim checktypeofpatient3 As String
    Dim checktypeofpatient2 As String


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
        radiobt()
        If Not Page.IsPostBack Then
            bindtime()
            radiobt()
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
    Private Sub radiobt()
        If cbambulatory.Checked = True Then
            cbambwithaid.Checked = False
            cbwheelchair.Checked = False
            cbstrecher.Checked = False
        ElseIf cbambwithaid.Checked = True Then
            cbwheelchair.Checked = False
            cbstrecher.Checked = False
            cbambulatory.Checked = False
        ElseIf cbwheelchair.Checked = True Then
            cbstrecher.Checked = False
            cbambulatory.Checked = False
            cbambwithaid.Checked = False
        ElseIf cbstrecher.Checked = True Then
            cbambulatory.Checked = False
            cbambwithaid.Checked = False
            cbwheelchair.Checked = False

        End If
    End Sub
    Protected Sub btnsearch_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        Try

            If cbambulatory.Checked = True Then
                checkarrivalmethod = "ambulatory"
            ElseIf cbambwithaid.Checked = True Then
                checkarrivalmethod = "ambulatory with aid"
            ElseIf cbwheelchair.Checked = True Then
                checkarrivalmethod = "Wheel Chair"
            ElseIf cbstrecher.Checked = True Then
                checkarrivalmethod = "Strecher"
            End If



            If cb_NHIS.Checked = True Then
                checktypeofpatient = "NHIS"
            ElseIf cb_paying.Checked = True Then
                checktypeofpatient = "Paying"
            ElseIf cb_others.Checked = True Then
                checktypeofpatient = "Others"
            End If


            If cb_patient.Checked = True Then
                checktypeofpatient2 = "Patient"
            ElseIf cbothers.Checked = True Then
                checktypeofpatient2 = "Others"
            ElseIf rdunabl_History.Checked = True Then
                checktypeofpatient2 = "Unable to Obtain History"
            End If
            ''''''

            If cbyes.Checked = True Then
                checktypeofpatient3 = "Yes"
            ElseIf cb_No.Checked = True Then
                checktypeofpatient3 = "No"
            End If
            ''
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                Dim Tcmd, Mcmd, cmd As New MySqlCommand
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Tcmd = New MySqlCommand
                Tcmd.Connection = Myconn

                cmd = New MySqlCommand
                Using cmd
                    cmd.Connection = Myconn
                    cmd.CommandText = "INSERT INTO tbl_admission" &
                "(colpatientname,colregno,colmodeofarrival,colreferral,coladmittingmedicaldoctor,coltimenotified,colprivisionaldiagnosis,colnameofadmittingnurse,colranksignature,coltypeofpatient,colothertypeofpatient,coltypeofpatient2,colorientationtoward)" _
               & "VALUES(?0,?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12)"
                    cmd.Parameters.AddWithValue("?0", Lblpatientname.Text)
                    cmd.Parameters.AddWithValue("?1", lblregno.Text)
                    cmd.Parameters.AddWithValue("?2", checkarrivalmethod)
                    cmd.Parameters.AddWithValue("?3", txtreferral.Text)
                    cmd.Parameters.AddWithValue("?4", txtadmittingmedicaldoctor.Text)
                    cmd.Parameters.AddWithValue("?5", ddlTimeFrom.Text)
                    cmd.Parameters.AddWithValue("?6", txtprivisionaldiagnosis.Text)
                    cmd.Parameters.AddWithValue("?7", txtadmitting_nurse.Text)
                    cmd.Parameters.AddWithValue("?8", txtrank_signature.Text)
                    cmd.Parameters.AddWithValue("?9", checktypeofpatient)
                    cmd.Parameters.AddWithValue("?10", txtother_typeofpatient.Text)
                    cmd.Parameters.AddWithValue("?11", checktypeofpatient2)
                    cmd.Parameters.AddWithValue("?12", checktypeofpatient3)

                    cmd.ExecuteNonQuery()
                End Using




                'lblmsg.ForeColor = Drawing.Color.Blue
                'lblmsg.Text = "Success!!!!  "
                'Txtregnosearch.Text = ""

                txtreferral.Text = ""
                txtadmittingmedicaldoctor.Text = ""
                ddlTimeFrom.Text = ""
                txtprivisionaldiagnosis.Text = ""
                txtadmitting_nurse.Text = ""
                txtrank_signature.Text = ""
                txtother_typeofpatient.Text = ""

                'Else
                'lblmsg.Text = "Another client with same name exists "
                'lblmsg.ForeColor = Drawing.Color.Red

                'End If
            End Using



        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub
End Class