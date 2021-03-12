Public Class RtpPatientTreated
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
            Load_patientstreated()

        End If
        'Get_info()
    End Sub


    Private Sub Load_patientstreated()
        Dim maxid As String = ""
        Dim letstakedate As Date
        Dim siku As String = ""
        Dim tuone As String = ""
        Try

            Dim dt As DataTable = New DataTable()


            dt.Columns.Add("dates")
            dt.Columns.Add("no")


            Dim cont As Int16 = 0
            Dim totalSales As Double = 0
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



                    Scmd = New MySqlCommand
                    Scmd.Connection = Myconn2
                    Scmd.CommandText = "select distinct dates from tbl_treatments "
                    seldata = Scmd.ExecuteReader()
                    Using seldata
                        While seldata.Read
                            letstakedate = seldata.Item(0)
                            siku = letstakedate.ToString("yyyy-MM-dd")

                            Dim Pno As Int16 = 0
                            cmd = New MySqlCommand
                            cmd.CommandText = "Select count(id) from tbl_treatments where dates like '" & siku & "%'"
                            cmd.Connection = Myconn
                            Using cmd
                                Mydata = cmd.ExecuteReader()
                                Using Mydata
                                    If Mydata.Read Then
                                        If Not IsDBNull(Mydata.Item(0)) Then
                                            Pno = Mydata.Item(0)
                                        End If

                                    End If
                                End Using
                            End Using


                            dt.Rows.Add(Pno, siku)
                            cont += 1
                        End While

                    End Using


                End Using
            End Using

            If cont >= 1 Then
                grdrequest.DataSource = dt
                grdrequest.DataBind()
                nodata.Visible = False
                lblincomecount.Text = FormatNumber(cont, 0)
            Else
                lblincomecount.Text = FormatNumber(cont, 0)
                nodata.Visible = True
            End If


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub


End Class