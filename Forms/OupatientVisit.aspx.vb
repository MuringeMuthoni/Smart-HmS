Public Class OupatientVisit
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
            Drpvisittype.Items.Add("Select")
            Drpvisittype.Items.Add("Antenatal Visit")
            Drpvisittype.Items.Add("Day Surgery Visit")
            Drpvisittype.Items.Add("General Visit")
            Drpvisittype.Items.Add("Investigation/Procedure Visit")
            Drpvisittype.Items.Add("Mental Health Visit")
            Drpvisittype.Items.Add("Postnatal Visit")

            Drpdepartment.Items.Add("Select")
            Drpdepartment.Items.Add("GENERAL OPD")

        End If
        Get_infopending()
        'Get_docinfo()
        'Get_nurseinfo()
    End Sub


    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles Btnsave.Click

        lblmsg.Text = ""
        If Drpvisittype.Text = "Please enter the first name before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If txtdescription.Text = "Please enter the second name before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Drpdepartment.Text = "please enter the contact person name before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtnurse.Text = "please enter the age before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtdoc.Text = "please enter the  occupation before you proceed." Then
            lblmsg.Text = ""
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtregno.Text = "please enter the  language  before you proceed." Then
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

                Tcmd.CommandText = "select id from tbloutpatient where colpatientregno='" & Txtregno.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Not Mydata.Read Then
                        Mydata.Close()

                        Console.WriteLine(Now.ToLongTimeString)
                        Dim regdate As String = Now.ToString("yyyy-MM-dd")
                        cmd = New MySqlCommand
                        Using cmd
                            cmd.Connection = Myconn
                            cmd.CommandText = "INSERT INTO tbloutpatient" &
                            "(colvisittype,coldescription,coldepartment,colnurse,coldoctor,colpatientregno)" _
                           & "VALUES(?1,?2,?3,?4,?5,?6)"

                            cmd.Parameters.AddWithValue("?1", Drpvisittype.Text)
                            cmd.Parameters.AddWithValue("?2", txtdescription.Text)
                            cmd.Parameters.AddWithValue("?3", Drpdepartment.Text)
                            cmd.Parameters.AddWithValue("?4", Txtnurse.Text)
                            cmd.Parameters.AddWithValue("?5", Txtdoc.Text)
                            cmd.Parameters.AddWithValue("?6", Txtregno.Text)

                            cmd.ExecuteNonQuery()
                        End Using




                        lblmsg.ForeColor = Drawing.Color.Blue
                        lblmsg.Text = "Success!!!!  "


                        Drpvisittype.Text = ""
                        txtdescription.Text = ""
                        Drpdepartment.Text = ""
                        Txtnurse.Text = ""
                        Txtdoc.Text = ""
                        Txtregno.Text = ""

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

    Private Sub Get_infopending()
        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("colvisittype")
            dt.Columns.Add("coldescription")
            dt.Columns.Add("coldepartment")
            dt.Columns.Add("colnurse")
            dt.Columns.Add("coldoctor")
            dt.Columns.Add("colpatientregno")



            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim sts As String
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                sts = "Select id,colvisittype,coldescription,coldepartment,colnurse,coldoctor,colpatientregno from tbloutpatient where colstatus ='pending'"
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6))
                            cont += 1

                        End While
                    End Using
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

    'Private Sub Get_docinfo()
    '    Try
    '        Dim positions As String = "Doctors"
    '        Dim cont As Int16 = 0
    '        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
    '        Dim MyString As String = prests
    '        Using Myconn As New MySqlConnection
    '            Myconn.ConnectionString = MyString
    '            If Myconn.State = ConnectionState.Closed Then Myconn.Open()
    '            Dim sts As String
    '            Dim Scmd As New MySqlCommand
    '            Dim Mydata As MySqlDataReader
    '            sts = "Select id,username from tblusers where department='" & positions & "'"
    '            Scmd = New MySqlCommand
    '            Scmd.CommandText = sts
    '            Scmd.Connection = Myconn
    '            Using Scmd
    '                Mydata = Scmd.ExecuteReader()
    '                Using Mydata
    '                    If Mydata.Read Then
    '                        DpoDoctor.Text = Mydata.Item(0)
    '                        '' Mydata = seldata.Item(1)
    '                    End If
    '                End Using
    '                'Using Mydata
    '                '    While Mydata.Read
    '                '        DpoDoctor.Text = Mydata.Item(0)
    '                '    End While
    '                'End Using
    '            End Using
    '        End Using
    '    Catch ex As Exception
    '        MsgBox(ex.Message)
    '    End Try

    'End Sub


    'Private Sub Get_nurseinfo()
    '    Try
    '        Dim positions As String = "Nurse"
    '        Dim cont As Int16 = 0
    '        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
    '        Dim MyString As String = prests
    '        Using Myconn As New MySqlConnection
    '            Myconn.ConnectionString = MyString
    '            If Myconn.State = ConnectionState.Closed Then Myconn.Open()
    '            Dim sts As String
    '            Dim Scmd As New MySqlCommand
    '            Dim Mydata As MySqlDataReader
    '            sts = "Select id,username from tblusers where department='" & positions & "'"
    '            Scmd = New MySqlCommand
    '            Scmd.CommandText = sts
    '            Scmd.Connection = Myconn
    '            Using Scmd
    '                Mydata = Scmd.ExecuteReader()
    '                Using Mydata
    '                    While Mydata.Read
    '                        DpoNurse.Text = Mydata.Item(0)
    '                    End While
    '                End Using
    '            End Using
    '        End Using
    '    Catch ex As Exception
    '        MsgBox(ex.Message)
    '    End Try

    'End Sub


End Class