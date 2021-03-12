Public Class Out_patient_billing
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        populatecbactivity()

        Get_info()
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
                            txtpatientlname.Text = Mydata.Item(1)
                            txtage.Text = Mydata.Item(2)

                        End If
                    End Using
                End Using
            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Private Sub Get_info()
        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("colactivity")
            dt.Columns.Add("colamounttype")
            dt.Columns.Add("colvalue")
            dt.Columns.Add("colservicename")
            dt.Columns.Add("coldoctor")
            dt.Columns.Add("colamount")
            dt.Columns.Add("coldiscount")
            dt.Columns.Add("colunit")
            dt.Columns.Add("colnetamount")
            dt.Columns.Add("colcopay")
            dt.Columns.Add("colcompanyamount")
            dt.Columns.Add("colpatientamo")
            dt.Columns.Add("colreceiveamo")
            dt.Columns.Add("colballance")
            dt.Columns.Add("colpatientreg")
            dt.Columns.Add("colpatientfname")
            dt.Columns.Add("colpatientlname")



            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim sts As String
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                sts = "Select id,colactivity,colamounttype,colvalue,colservicename,coldoctor,colamount,coldiscount,colunit,colnetamount,colcopay,colcompanyamount,colpatientamo,colreceiveamo,colballance,colpatientreg,colpatientfname,colpatientlname from tbl_outpatientbilling where colstatus='paid'"
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7), Mydata.Item(8), Mydata.Item(9), Mydata.Item(10), Mydata.Item(11), Mydata.Item(12), Mydata.Item(13), Mydata.Item(14), Mydata.Item(15), Mydata.Item(16), Mydata.Item(17))
                            cont += 1

                        End While
                    End Using
                End Using
            End Using


            If cont >= 1 Then
                Grdoutpatientbilling.DataSource = dt
                Grdoutpatientbilling.DataBind()
                'nodata.Visible = False
            Else
                ' nodata.Visible = True
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles Btnsave.Click

    End Sub

    Protected Sub Btnsearch_Click(sender As Object, e As EventArgs) Handles Btnsearch.Click
        Getinfo()
    End Sub

    Protected Sub Btncheckvitals_Click(sender As Object, e As EventArgs) Handles Btncheckvitals.Click
        Response.Redirect("~/src/Forms/vitals.aspx")
    End Sub

    Protected Sub btnsave_Click1(sender As Object, e As EventArgs) Handles btnsave.Click

        lblmsg.Text = ""
        If Txtpatientregno.Text = "" Then
            lblmsg.Text = "Please enter the Patient Reg No before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If cbactivity.Text = "" Then
            lblmsg.Text = "Please select activity before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If cbamounttype.Text = "" Then
            lblmsg.Text = "please enter the amount type before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If txtValue.Text = "" Then
            lblmsg.Text = "please enter the value before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtservicename.Text = "" Then
            lblmsg.Text = "please enter the service name before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtdoc.Text = "" Then
            lblmsg.Text = "please enter the  doctor name  before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtamo.Text = "" Then
            lblmsg.Text = "please enter the amount  before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtdiscount.Text = "" Then
            lblmsg.Text = "please enter the discount before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtunit.Text = "" Then
            lblmsg.Text = "please enter the unit before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtnetamount.Text = "" Then
            lblmsg.Text = "please enter the Net Amount before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If txtcopay.Text = "" Then
            lblmsg.Text = "please enter the co-pay before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtcompanyamo.Text = "" Then
            lblmsg.Text = "please enter the Company amo  before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If
        If Txtpatientamo.Text = "" Then
            lblmsg.Text = "please enter the  patient Amo  before you proceed."
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

                Tcmd.CommandText = "select id from tbl_outpatientbilling where colpatientreg='" & Txtpatientregno.Text & "' and colactivity='" & cbactivity.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Not Mydata.Read Then
                        Mydata.Close()

                        Console.WriteLine(Now.ToLongTimeString)
                        Dim regdate As String = Now.ToString("yyyy-MM-dd")
                        cmd = New MySqlCommand
                        Using cmd
                            cmd.Connection = Myconn
                            cmd.CommandText = "INSERT INTO tbl_outpatientbilling" &
                            "(colactivity,colamounttype,colvalue,colservicename,coldoctor,colamount,coldiscount,colunit,colnetamount,colcopay,colcompanyamount,colpatientamo,colreceiveamo,colballance,colpatientreg,colpatientfname,colpatientlname,coldate)" _
                           & "VALUES(?0,?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13,?14,?15,?16,?17)"

                            cmd.Parameters.AddWithValue("?0", cbactivity.Text)
                            cmd.Parameters.AddWithValue("?1", cbamounttype.Text)
                            cmd.Parameters.AddWithValue("?2", txtValue.Text)
                            cmd.Parameters.AddWithValue("?3", Txtservicename.Text)
                            cmd.Parameters.AddWithValue("?4", Txtdoc.Text)
                            cmd.Parameters.AddWithValue("?5", Txtamo.Text)
                            cmd.Parameters.AddWithValue("?6", Txtdiscount.Text)
                            cmd.Parameters.AddWithValue("?7", Txtunit.Text)
                            cmd.Parameters.AddWithValue("?8", Txtnetamount.Text)
                            cmd.Parameters.AddWithValue("?9", txtcopay.Text)
                            cmd.Parameters.AddWithValue("?10", Txtcompanyamo.Text)
                            cmd.Parameters.AddWithValue("?11", Txtpatientamo.Text)
                            cmd.Parameters.AddWithValue("?12", txtrecieveamo.Text)
                            cmd.Parameters.AddWithValue("?13", TxtBalance.Text)
                            cmd.Parameters.AddWithValue("?14", Txtpatientregno.Text)
                            cmd.Parameters.AddWithValue("?15", txtpatientfname.Text)
                            cmd.Parameters.AddWithValue("?16", txtpatientlname.Text)
                            cmd.Parameters.AddWithValue("?17", regdate)
                            cmd.ExecuteNonQuery()
                        End Using




                        lblmsg.ForeColor = Drawing.Color.Blue
                        lblmsg.Text = "Success!!!!  "


                        cbactivity.Text = ""
                        cbamounttype.Text = ""
                        txtValue.Text = ""
                        Txtservicename.Text = ""
                        txtage.Text = ""
                        Txtdoc.Text = ""
                        txtage.Text = ""
                        Txtamo.Text = ""
                        Txtdiscount.Text = ""
                        Txtunit.Text = ""
                        Txtnetamount.Text = ""
                        txtcopay.Text = ""
                        Txtcompanyamo.Text = ""
                        Txtpatientamo.Text = ""
                        txtrecieveamo.Text = ""
                        TxtBalance.Text = ""
                        Txtpatientregno.Text = ""
                        txtpatientfname.Text = ""
                        txtpatientlname.Text = ""
                        txtage.Text = ""
                    Else
                        lblmsg.Text = "This is a duplicate entry"
                        lblmsg.ForeColor = Drawing.Color.Red

                    End If
                End Using


            End Using

            'Dynamic_tables()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Private Sub populatecbactivity()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colactivity FROM tbl_costsetup")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbactivity.DataSource = cmd.ExecuteReader()
                cbactivity.DataTextField = "colactivity"
                cbactivity.DataBind()
                con.Close()
            End Using
        End Using
        cbactivity.Items.Insert(0, New ListItem("--Select Activity--", "0"))
        populatecbamountype()
    End Sub
    Private Sub populatecbamountype()

    End Sub

    Protected Sub cbactivity_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbactivity.SelectedIndexChanged
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colamounttype FROM tbl_costsetup where colactivity='" & cbactivity.Text & "'")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbamounttype.DataSource = cmd.ExecuteReader()
                cbamounttype.DataTextField = "colamounttype"
                cbamounttype.DataBind()
                con.Close()
            End Using
        End Using
        cbamounttype.Items.Insert(0, New ListItem(" ", "0"))
    End Sub

    'Private Sub cbactivity_Init(sender As Object, e As EventArgs) Handles cbactivity.Init
    '    Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
    '    Using con As New MySqlConnection(constr)
    '        Using cmd As New MySqlCommand("SELECT colamounttype FROM tbl_costsetup where colactivity='" & cbactivity.Text & "'")
    '            cmd.CommandType = CommandType.Text
    '            cmd.Connection = con
    '            con.Open()
    '            cbamounttype.DataSource = cmd.ExecuteReader()
    '            cbamounttype.DataTextField = "colamounttype"
    '            cbamounttype.DataBind()
    '            con.Close()
    '        End Using
    '    End Using
    '    cbamounttype.Items.Insert(0, New ListItem(" ", "0"))
    'End Sub
End Class