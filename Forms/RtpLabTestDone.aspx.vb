Public Class RtpLabTestDone
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
        Try

            Dim dt As DataTable = New DataTable()

            dt.Columns.Add("id")
            dt.Columns.Add("logsupdated")
            dt.Columns.Add("requestname")
            dt.Columns.Add("cost")

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
                    'cbodiagnosis.Items.Add("")
                    'Scmd = New MySqlCommand
                    'Scmd.Connection = Myconn
                    'Scmd.CommandText = "select distinct logstime from tbl_treatments" ' where colnames='" & txtnames.Text & "' and colid='" & Txtpatientid.Text & "'"
                    'Mydata = Scmd.ExecuteReader()
                    'Using Mydata
                    '    While Mydata.Read
                    '        cbodiagnosis.Items.Add(Mydata.Item(0))
                    '    End While
                    'End Using

                    Scmd = New MySqlCommand
                    Scmd.Connection = Myconn
                    Scmd.CommandText = "select Max(id) from tbl_labrequests  order by logstime asc"
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            maxid = Mydata.Item(0)
                        End While
                    End Using
                End If
                sts = "Select id,logsupdated,requestname,cost from tbl_labrequests  order by logstime asc"
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            cont += 1
                            Dim letsconvert As Date = Mydata.Item(1)
                            Dim siku As String = letsconvert.ToString("yyyy-MM-dd")
                            dt.Rows.Add(Mydata.Item(0), siku, Mydata.Item(2), Mydata.Item(3))



                        End While
                    End Using
                End Using

            End Using


            If cont >= 1 Then
                grdrequest.DataSource = dt
                grdrequest.DataBind()
                nodata.Visible = False
                lbltestdone.Text = FormatNumber(cont, 0)
            Else
                lbltestdone.Text = FormatNumber(cont, 0)
                nodata.Visible = True
            End If


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub


End Class