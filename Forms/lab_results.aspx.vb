Public Class lab_results
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
        Load_inv()

    End Sub

    Private Sub Load_inv()

        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("logstime")
            dt.Columns.Add("pnames")
            dt.Columns.Add("requestname")
            dt.Columns.Add("status")


            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn2 As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconn2.ConnectionString = MyString
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()
                    Dim sts As String
                    Dim Scmd, cmd As New MySqlCommand
                    Dim Mydata, seldata As MySqlDataReader
                    Dim Maxid As Int16 = 0

                    Dim siku As String = Now.ToString("yyyy-MM-dd")

                    sts = "Select distinct qid,pid from tbl_labrequests where status='Finalized' and logstime like '" & siku & "'"
                    Scmd = New MySqlCommand
                    Scmd.CommandText = sts
                    Scmd.Connection = Myconn
                    Using Scmd
                        Mydata = Scmd.ExecuteReader()
                        Using Mydata
                            While Mydata.Read
                                Dim qid As Int16 = Mydata.Item(0)
                                Dim pid As Int16 = Mydata.Item(1)

                                Dim names As String = ""
                                sts = "Select colnames from tbl_patient where id=" & pid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            names = seldata.Item(0)
                                        End If
                                    End Using
                                End Using

                                Dim githaa As String = ""
                                Dim status As String = ""
                                sts = "Select pid,logstime,status from tbl_labrequests where qid=" & qid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        If seldata.Read Then
                                            Dim sk As Date = seldata.Item(1)
                                            githaa = sk.ToString("dd-MMM-yy") & " " & sk.ToString("HH:mm:ss")
                                            status = seldata.Item(2)
                                        End If
                                    End Using
                                End Using

                                Dim requestname As String = ""
                                sts = "Select requestname from tbl_labrequests where qid=" & qid
                                cmd = New MySqlCommand
                                cmd.CommandText = sts
                                cmd.Connection = Myconn2
                                Using cmd
                                    seldata = cmd.ExecuteReader()
                                    Using seldata
                                        While seldata.Read
                                            requestname &= seldata.Item(0) & ","
                                        End While
                                    End Using
                                End Using


                                dt.Rows.Add(qid, githaa, names, requestname, status)
                                cont += 1


                            End While
                        End Using
                    End Using

                End Using

                If cont >= 1 Then
                    grdrequest.DataSource = dt
                    grdrequest.DataBind()
                    nodata.Visible = False
                Else
                    nodata.Visible = True
                End If

            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub


End Class