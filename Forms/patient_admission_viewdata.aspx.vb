Public Class patient_admission_viewdata
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Get_completed()
        cbostype.Items.Add("Names")
        cbostype.Items.Add("Id no.")
        cbostype.Items.Add("Tel")
        Get_info()
    End Sub
    'Private Sub Get_completed()
    '    Try




    '        Dim dt As DataTable = New DataTable()
    '        dt.Columns.Add("id")
    '        dt.Columns.Add("colregno")
    '        dt.Columns.Add("coladmdate")
    '        dt.Columns.Add("colbedcategory")
    '        dt.Columns.Add("colfloor")
    '        'dt.Columns.Add("colward")
    '        'dt.Columns.Add("colbedno")
    '        'dt.Columns.Add("colbillcategory")
    '        'dt.Columns.Add("colvisittype")
    '        'dt.Columns.Add("colclinic")
    '        'dt.Columns.Add("coladmittingdoc")
    '        'dt.Columns.Add("colkinrelation")
    '        'dt.Columns.Add("colkinname")
    '        'dt.Columns.Add("colkinaddress")
    '        'dt.Columns.Add("colsurburb")

    '        'dt.Columns.Add("colcity")
    '        'dt.Columns.Add("colcountry")
    '        'dt.Columns.Add("colpostcode")
    '        'dt.Columns.Add("colpayer")
    '        'dt.Columns.Add("colsponsor")
    '        'dt.Columns.Add("colpatientname")
    '        'dt.Columns.Add("colpatientcontact")
    '        'dt.Columns.Add("colgender")

    '        'dt.Columns.Add("colage")
    '        'dt.Columns.Add("colpatientaddress")

    '        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
    '        Dim MyString As String = prests
    '        Using Myconn2 As New MySqlConnection
    '            Using Myconn As New MySqlConnection
    '                Myconn.ConnectionString = MyString
    '                Myconn2.ConnectionString = MyString
    '                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
    '                If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
    '                Dim sts As String = ""
    '                Dim Scmd, cmd As New MySqlCommand
    '                Dim Mydata, seldata As MySqlDataReader

    '                Dim cont As Int16 = 0
    '                Dim mode As Int16 = 0


    '                'Mwanzo:
    '                cont = 0

    '                If txttelephone.Text = "" Then
    '                    sts = "Select id,coladmdate,colregno,colpatientname,colpatientcontact,colage,colgender,colfloor,colward,colbedno,colbedcategory,colbillcategory,coladmittingdoc,colpayer from tbl_patient_admission '"
    '                Else
    '                    sts = "Select id,coladmdate,colregno,colpatientname,colpatientcontact,colage,colgender,colfloor,colward,colbedno,colbedcategory,colbillcategory,coladmittingdoc,colpayer from tbl_patient_admission where colpatientcontact='" & txttelephone.Text & "%'"
    '                End If


    '                Scmd = New MySqlCommand
    '                Scmd.CommandText = sts
    '                Scmd.Connection = Myconn
    '                Using Scmd
    '                    Mydata = Scmd.ExecuteReader()
    '                    Using Mydata
    '                        While Mydata.Read
    '                            Dim ano As Integer = Mydata.Item(0)
    '                            Dim admdate As Date = Mydata.Item(1)
    '                            Dim regno As String = Mydata.Item(2)
    '                            Dim names As String = Mydata.Item(3)
    '                            Dim tel As Integer = Mydata.Item(4)
    '                            Dim age As Integer = Mydata.Item(5)
    '                            Dim gender As String = Mydata.Item(6)
    '                            Dim floorname As String = Mydata.Item(7)
    '                            Dim ward As String = Mydata.Item(8)
    '                            Dim bedno As String = Mydata.Item(9)
    '                            Dim bedcategory As String = Mydata.Item(10)
    '                            Dim billingcategory As String = Mydata.Item(11)
    '                            Dim doctor As String = Mydata.Item(12)
    '                            Dim payer As String = Mydata.Item(13)
    '                            Dim address As String = Mydata.Item(14)

    '                            dt.Rows.Add(ano, admdate, regno, names, names, tel, age, gender, floorname, ward, bedno, bedcategory, billingcategory, doctor, payer, address)


    '                            'sts = "Select colage,colgender  from tbl_patient where id =" & pid
    '                            'cmd = New MySqlCommand
    '                            'cmd.CommandText = sts
    '                            'cmd.Connection = Myconn2
    '                            'Using cmd
    '                            '    seldata = cmd.ExecuteReader()
    '                            '    Using seldata
    '                            '        If seldata.Read Then
    '                            '            age = seldata.Item(0)
    '                            '            gender = seldata.Item(1)
    '                            '        End If
    '                            '    End Using
    '                            'End Using


    '                            'Dim vital As String = "none"
    '                            'Dim chkvital As Date = "#1/1/2020 12:00:00 AM#"
    '                            'If vitals = chkvital Then
    '                            '    vital = "Pending"
    '                            'Else
    '                            '    vital = vitals
    '                            'End If






    '                            cont += 1

    '                        End While
    '                    End Using
    '                End Using



    '                If cont >= 1 Then
    '                    GridView2.DataSource = dt
    '                    GridView2.DataBind()
    '                    'lblcount.Text = cont & " patients found"
    '                    'nodata3.Visible = False
    '                    'Filter.Visible = True
    '                    'Else
    '                    '    Filter.Visible = False
    '                    '    nodata3.Visible = True
    '                End If

    '            End Using
    '        End Using



    '    Catch ex As Exception
    '        MsgBox(ex.Message)
    '    End Try

    'End Sub


    Private Sub Get_info()
        Try
            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("colpatientname")
            dt.Columns.Add("colpatientcontact")
            dt.Columns.Add("colgender")
            dt.Columns.Add("colfloor")
            dt.Columns.Add("colward")
            dt.Columns.Add("colbedcategory")
            dt.Columns.Add("colbedno")
            dt.Columns.Add("colclinic")



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
                If cbostype.Text = "" Then
                    sts = "Select id,colpatientname,colpatientcontact,colgender,colfloor,colward,colbedcategory,colbedno,colclinic from tbl_patient_admission  order by colpatientcontact desc"


                ElseIf cbostype.Text = "Names" Then
                    sts = "Select id,colpatientname,colpatientcontact,colgender,colfloor,colward,colbedcategory,colbedno,colclinic  from tbl_patient_admission where colpatientname='" & txtsearch.Text & "%' order by colpatientcontact desc"

                ElseIf cbostype.Text = "Tel" Then
                    sts = "Select id,colpatientname,colpatientcontact,colgender,colfloor,colward,colbedcategory,colbedno,colclinic  from tbl_patient_admission where colpatientcontact='" & txtsearch.Text & "' order by colregdate desc"

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