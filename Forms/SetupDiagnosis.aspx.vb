﻿Public Class SetupDiagnosis
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
        End If
    End Sub




    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click

        lblmsg.Text = ""
        If txtdiagnosis.Text = "" Then
            lblmsg.Text = "Please enter the Diagnosis  before you proceed."
            Exit Sub
        Else
            lblmsg.Text = ""
        End If

        If txtdiagnosiscode.Text = "" Then
            lblmsg.Text = "please enter the specialist before you proceed"
            Exit Sub
        Else
            lblmsg.Text = ""
        End If

        If TxtICD.Text = "" Then
            lblmsg.Text = "please enter the telephone before you proceed"
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

                Tcmd.CommandText = "select id from tbl_setupdiagnosis where coldiagnosis='" & txtdiagnosis.Text & "'"
                Mydata = Tcmd.ExecuteReader()
                Using Mydata
                    If Not Mydata.Read Then
                        Mydata.Close()

                        Dim fcode As Integer
                        Tcmd.CommandText = "select count(id) from tbl_setupdiagnosis" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
                        Mydata = Tcmd.ExecuteReader()
                        Using Mydata
                            If Mydata.Read Then
                                If Not IsDBNull(Mydata.Item(0)) Then
                                    fcode = Mydata.Item(0) + 1
                                End If
                            End If
                        End Using

                        Dim leo As String = Now.ToString("yyyy-MM-dd")
                        Dim mwaka As String = Now.ToString("yyyy")
                        Dim ncode As String = fcode & "" & mwaka

                        cmd = New MySqlCommand
                        Using cmd
                            cmd.Connection = Myconn
                            cmd.CommandText = "INSERT INTO tbl_setupdiagnosis" &
                            "(coldiagnosis,coldiagnosiscode,colicd)" _
                           & "VALUES(?1,?2,?3)"
                            cmd.Parameters.AddWithValue("?1", txtdiagnosis.Text)
                            cmd.Parameters.AddWithValue("?2", txtdiagnosiscode.Text)
                            cmd.Parameters.AddWithValue("?3", TxtICD.Text)
                            cmd.ExecuteNonQuery()
                        End Using
                        lblmsg.ForeColor = Drawing.Color.Blue
                        lblmsg.Text = "Success!!!!  "
                        txtdiagnosis.Text = ""
                        txtdiagnosiscode.Text = ""
                        TxtICD.Text = ""

                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "Closeme();", True)
                    Else
                        lblmsg.Text = "Another diagnosis with same name exists "
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
            dt.Columns.Add("coldiagnosis")
            dt.Columns.Add("coldiagnosiscode")
            dt.Columns.Add("colicd")


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

                sts = "Select id,coldiagnosis,coldiagnosiscode,colicd from tbl_setupdiagnosis "


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
                lblcount.Text = FormatNumber(cont, 0) & " Diagnosis Found"
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub




End Class