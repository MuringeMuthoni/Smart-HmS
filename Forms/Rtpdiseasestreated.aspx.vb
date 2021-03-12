Public Class Rtpdiseasestreated
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
            Load_DIAGNOSIS()
            ' Get_info()
        End If
        'Get_info()
    End Sub


    Private Sub Load_DIAGNOSIS()
        Dim sumdiagnosis As String = ""
        Try

            Dim dt As DataTable = New DataTable()

            dt.Columns.Add("id")
            dt.Columns.Add("diagnosis")
            dt.Columns.Add("diagcode")
            dt.Columns.Add("icd10")
            dt.Columns.Add("logstime")

            'If cbo.Text = "" Then
            '    lblmsg.Text = "Please select the diagnosis"
            '    Exit Sub
            'End If

            'lblmsg.Visible = False
            'If datepicker.Text = "" Then
            '    lblmsg.Text = "Please select the Start dates before you proceed"
            '    lblmsg.Visible = True
            '    Exit Sub
            'End If

            'If datepicker2.Text = "" Then
            '    lblmsg.Text = "Please select the End dates before you proceed"
            '    lblmsg.Visible = True
            '    Exit Sub
            'End If

            'Dim j1 As String = datepicker.Text
            'Dim Muthenya1, Mweli1, Mwaka1 As String
            'Dim std1 As String = j1
            'Mweli1 = std1.Substring(3, 2)
            'Muthenya1 = std1.Substring(0, 2)
            'Mwaka1 = std1.Substring(6, 4)
            'Dim dispsk As String = std1.Substring(6, 4) & "-" & std1.Substring(3, 2) & "-" & std1.Substring(0, 2)
            'Dim siku_disp As String = std1.Substring(0, 2) & "-" & std1.Substring(3, 2) & "-" & std1.Substring(6, 4)


            'Dim j2 As String = datepicker2.Text
            'Dim Muthenya2, Mweli2, Mwaka2 As String
            'Dim std2 As String = j2
            'Mweli2 = std2.Substring(3, 2)
            'Muthenya2 = std2.Substring(0, 2)
            'Mwaka2 = std2.Substring(6, 4)
            'Dim dispsk2 As String = std2.Substring(6, 4) & "-" & std2.Substring(3, 2) & "-" & std2.Substring(0, 2)
            'Dim siku_disp2 As String = std2.Substring(0, 2) & "-" & std2.Substring(3, 2) & "-" & std2.Substring(6, 4)

            Dim cont As Int16 = 0
            Dim totalSales As Double = 0
            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()



                Dim sts As String
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader


                If Not IsPostBack Then
                    cbo.Items.Add("")
                    Scmd = New MySqlCommand
                    Scmd.Connection = Myconn
                    Scmd.CommandText = "select distinct diagnosis from tbl_diagnosis" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            cbo.Items.Add(Mydata.Item(0))
                        End While
                    End Using
                End If
                'txtdate.Text = "Start Date: " & siku_disp
                'txtdate2.Text = "End Date: " & siku_disp2

                Dim SDate As String = datepicker.Text
                Dim EDate As String = datepicker2.Text

                '    Scmd = New MySqlCommand
                '    Scmd.Connection = Myconn
                '    Scmd.CommandText = "select Max(id) from tbl_diagnosis  order by logstime asc"
                '    Mydata = Scmd.ExecuteReader()
                '    Using Mydata
                '        While Mydata.Read
                '            sumdiagnosis = Mydata.Item(0)
                '        End While
                '    End Using
                'End If
                If cbo.Text = "" Then
                    sts = "Select id,diagnosis,diagcode,icd10,logstime from tbl_diagnosis  order by logstime asc"

                Else
                    sts = "Select id,diagnosis,diagcode,icd10,logstime from tbl_diagnosis where diagnosis like '" & cbo.Text & "' and logstime  between '" & SDate & "' and '" & EDate & "' order by logstime ASC"

                End If

                '  sts = "Select id,diagnosis,diagcode,icd10,logstime from tbl_diagnosis  order by logstime asc"
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            cont += 1
                            Dim letsconvert As Date = Mydata.Item(4)
                                Dim siku As String = letsconvert.ToString("yyyy-MM-dd")

                                dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), siku)
                            cont += 1


                        End While
                    End Using
                End Using

            End Using


            If cont >= 1 Then
                grdrequest.DataSource = dt
                grdrequest.DataBind()
                nodata.Visible = False
                lblmsg.Text = FormatNumber(cont, 0)
            Else
                lblmsg.Text = FormatNumber(cont, 0)
                nodata.Visible = True
            End If


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    'Private Sub Load_DIAGNOSIS_viadate()
    '    Dim sumdiagnosis As String = ""
    '    Try

    '        Dim dt As DataTable = New DataTable()

    '        dt.Columns.Add("id")
    '        dt.Columns.Add("diagnosis")
    '        dt.Columns.Add("diagcode")
    '        dt.Columns.Add("icd10")
    '        dt.Columns.Add("logstime")


    '        Dim cont As Int16 = 0
    '        Dim totalSales As Double = 0
    '        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
    '        Dim MyString As String = prests
    '        Using Myconn As New MySqlConnection
    '            Myconn.ConnectionString = MyString
    '            If Myconn.State = ConnectionState.Closed Then Myconn.Open()



    '            Dim sts As String
    '            Dim Scmd As New MySqlCommand
    '            Dim Mydata As MySqlDataReader


    '            If Not IsPostBack Then
    '                cbodiagnosis.Items.Add("")
    '                Scmd = New MySqlCommand
    '                Scmd.Connection = Myconn
    '                Scmd.CommandText = "select distinct diagnosis from tbl_diagnosis" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
    '                Mydata = Scmd.ExecuteReader()
    '                Using Mydata
    '                    While Mydata.Read
    '                        cbodiagnosis.Items.Add(Mydata.Item(0))
    '                    End While
    '                End Using

    '                Scmd = New MySqlCommand
    '                Scmd.Connection = Myconn
    '                Scmd.CommandText = "select Max(id) from tbl_diagnosis  order by logstime asc"
    '                Mydata = Scmd.ExecuteReader()
    '                Using Mydata
    '                    While Mydata.Read
    '                        sumdiagnosis = Mydata.Item(0)
    '                    End While
    '                End Using
    '            End If
    '            Dim SDate As String = txtfrom.Text
    '            Dim EDate As String = Txtto.Text



    '            sts = "Select id,diagnosis,diagcode,icd10,logstime from tbl_diagnosis  where logstime  between  '" & SDate & "' and '" & EDate & "'"
    '            '  sts = "Select id,diagnosis,diagcode,icd10,logstime from tbl_diagnosis  order by logstime asc"
    '            Scmd = New MySqlCommand
    '            Scmd.CommandText = sts
    '            Scmd.Connection = Myconn
    '            Using Scmd
    '                Mydata = Scmd.ExecuteReader()
    '                Using Mydata
    '                    While Mydata.Read
    '                        cont += 1
    '                        Dim letsconvert As Date = Mydata.Item(4)
    '                        Dim siku As String = letsconvert.ToString("yyyy-MM-dd")

    '                        dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), siku)
    '                        cont += 1


    '                    End While
    '                End Using
    '            End Using

    '        End Using


    '        If cont >= 1 Then
    '            grdrequest.DataSource = dt
    '            grdrequest.DataBind()
    '            nodata.Visible = False
    '            lblincomecount.Text = FormatNumber(cont, 0)
    '        Else
    '            lblincomecount.Text = FormatNumber(cont, 0)
    '            nodata.Visible = True
    '        End If


    '    Catch ex As Exception
    '        MsgBox(ex.Message)
    '    End Try
    '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    'End Sub

    'Protected Sub Btndate_Click(sender As Object, e As EventArgs) Handles Btndate.Click
    '    Load_DIAGNOSIS_viadate()
    'End Sub


    Private Sub Get_info()
        Try
            If cbo.Text = "" Then
                lblmsg.Text = "Please select the diagnosis"
                Exit Sub
            End If

            lblmsg.Visible = False
            If datepicker.Text = "" Then
                lblmsg.Text = "Please select the Start dates before you proceed"
                lblmsg.Visible = True
                Exit Sub
            End If

            If datepicker2.Text = "" Then
                lblmsg.Text = "Please select the End dates before you proceed"
                lblmsg.Visible = True
                Exit Sub
            End If



            Dim j1 As String = datepicker.Text
            Dim Muthenya1, Mweli1, Mwaka1 As String
            Dim std1 As String = j1
            Mweli1 = std1.Substring(3, 2)
            Muthenya1 = std1.Substring(0, 2)
            Mwaka1 = std1.Substring(6, 4)
            Dim dispsk As String = std1.Substring(6, 4) & "-" & std1.Substring(3, 2) & "-" & std1.Substring(0, 2)
            Dim siku_disp As String = std1.Substring(0, 2) & "-" & std1.Substring(3, 2) & "-" & std1.Substring(6, 4)


            Dim j2 As String = datepicker2.Text
            Dim Muthenya2, Mweli2, Mwaka2 As String
            Dim std2 As String = j2
            Mweli2 = std2.Substring(3, 2)
            Muthenya2 = std2.Substring(0, 2)
            Mwaka2 = std2.Substring(6, 4)
            Dim dispsk2 As String = std2.Substring(6, 4) & "-" & std2.Substring(3, 2) & "-" & std2.Substring(0, 2)
            Dim siku_disp2 As String = std2.Substring(0, 2) & "-" & std2.Substring(3, 2) & "-" & std2.Substring(6, 4)



            'Dim sk As Date = "#" & std1.Substring(3, 2) & "/" & std1.Substring(0, 2) & "/" & std1.Substring(6, 4) & "#"

            txtdate.Text = "Start Date: " & siku_disp
            txtdate2.Text = "End Date: " & siku_disp2

            Dim SDate As String = dispsk
            Dim EDate As String = dispsk2


            Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
            Dim MyString As String = prests

            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim myDataAdapter As MySqlDataAdapter
                Dim myDataSet As DataSet
                Dim sts As String
                sts = "Select id,diagnosis,diagcode,icd10,logstime from tbl_diagnosis where diagnosis like '" & cbo.Text & "' and logstime  between '" & SDate & "' and '" & EDate & "' order by logstime ASC"
                Dim Jdata As MySqlDataReader
                Dim Tcmd As New MySqlCommand
                Using Tcmd
                    Tcmd.Connection = Myconn
                    Tcmd.CommandText = sts
                    Jdata = Tcmd.ExecuteReader()
                    Using Jdata
                        If Not Jdata.Read Then
                            lblmsg.Visible = True
                        Else
                            lblmsg.Visible = False
                            Jdata.Close()
                            myDataAdapter = New MySqlDataAdapter(sts, Myconn)
                            myDataSet = New DataSet()
                            myDataAdapter.Fill(myDataSet, "test")
                            grdrequest.DataSource = myDataSet.Tables(0)
                            grdrequest.DataBind()
                        End If
                    End Using

                End Using
            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub BtnPlay_Click(sender As Object, e As EventArgs) Handles BtnPlay.Click
        Load_DIAGNOSIS()
    End Sub
End Class