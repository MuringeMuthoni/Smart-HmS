Public Class SmartLogin
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        GET_credentials()
    End Sub


    Private Sub GET_credentials()

        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests

        Try
            Using Myconn2 As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconn2.ConnectionString = MyString
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
                    Dim Cmd, Jcmd As MySqlCommand
                    Dim Mydata, seldata As MySqlDataReader
                    Cmd = New MySqlCommand
                    Dim StrSql As String
                    StrSql = "Select id,coldepartment from tbl_login where colusername='" & Txtusername.Text & "' and colpassword='" & Txtpassword.Text & "'"
                    Cmd.CommandText = StrSql
                    Cmd.Connection = Myconn
                    Using Cmd
                        Mydata = Cmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read
                                Dim userid As String = Mydata.Item(0)
                                Dim userdepartment As String = Mydata.Item(1)
                                Dim sts As String = "Select colUsername, coltel,colusertype from tblusers where coluserid='" & userid & "'"
                                Jcmd = New MySqlCommand
                                Jcmd.CommandText = sts
                                Jcmd.Connection = Myconn2
                                Using Jcmd
                                    seldata = Jcmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            Dim colUsername As String = seldata.Item(0)
                                            Dim coltel As String = seldata.Item(1)
                                            Dim colusertype As String = seldata.Item(2)
                                        End If
                                    End Using
                                    If (userdepartment = "Doctor") Then
                                        Dim Tcmd As MySqlCommand = New MySqlCommand
                                        Tcmd.Connection = Myconn
                                        Tcmd.CommandText = "select coldocsname from tbl_docs where coluserid ='" & userid & "'"
                                        Dim Mydataa As MySqlDataReader = Tcmd.ExecuteReader()
                                        Using Mydataa
                                            If Mydataa.Read Then
                                                Session("companyname") = Mydata.Item(0)
                                            Else
                                                Session("companyname") = "none"
                                            End If
                                        End Using
                                    ElseIf (userdepartment = "Admin") Then
                                        Dim Tcmd As MySqlCommand = New MySqlCommand
                                        Tcmd.Connection = Myconn
                                        Tcmd.CommandText = "select coladminname from tbl_admin where coluserid ='" & userid & "'"
                                        Dim Mydataa As MySqlDataReader = Tcmd.ExecuteReader()
                                        Using Mydataa
                                            If Mydataa.Read Then
                                                Session("companyname") = Mydata.Item(0)
                                            Else
                                                Session("companyname") = "none"
                                            End If
                                        End Using
                                    ElseIf (userdepartment = "Finance") Then
                                        Dim Tcmd As MySqlCommand = New MySqlCommand
                                        Tcmd.Connection = Myconn
                                        Tcmd.CommandText = "select colaccountname from tbl_financedetails where coluserid ='" & userid & "'"
                                        Dim Mydataa As MySqlDataReader = Tcmd.ExecuteReader()
                                        Using Mydataa
                                            If Mydataa.Read Then
                                                Session("companyname") = Mydata.Item(0)
                                            Else
                                                Session("companyname") = "none"
                                            End If
                                        End Using
                                    ElseIf (userdepartment = "Pharmacy") Then
                                        Dim Tcmd As MySqlCommand = New MySqlCommand
                                        Tcmd.Connection = Myconn
                                        Tcmd.CommandText = "select colpharmistname from tbl_pharmacist where coluserid ='" & userid & "'"
                                        Dim Mydataa As MySqlDataReader = Tcmd.ExecuteReader()
                                        Using Mydataa
                                            If Mydataa.Read Then
                                                Session("companyname") = Mydata.Item(0)
                                            Else
                                                Session("companyname") = "none"
                                            End If
                                        End Using
                                    ElseIf (userdepartment = "Reception") Then
                                        Dim Tcmd As MySqlCommand = New MySqlCommand
                                        Tcmd.Connection = Myconn
                                        Tcmd.CommandText = "select colReceptionistname from tbl_receptionist where userid ='" & userid & "'"
                                        Dim Mydataa As MySqlDataReader = Tcmd.ExecuteReader()
                                        Using Mydataa
                                            If Mydataa.Read Then
                                                Session("companyname") = Mydata.Item(0)
                                            Else
                                                Session("companyname") = "none"
                                            End If
                                        End Using
                                    End If
                                End Using

                            End While
                        End Using
                    End Using
                End Using
            End Using



        Catch ex As Exception
            ' errorContext = "Home All"
            ' errorMsg = ex.Message
            Response.Redirect("~/smartsys_errors.aspx")
        End Try

    End Sub


End Class