Public Class RtpPatient
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
        Get_info()
    End Sub
    Private Sub Get_info()
        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("colregdate")
            dt.Columns.Add("colfirstname")
            dt.Columns.Add("colmiddlename")
            dt.Columns.Add("colDOB")
            dt.Columns.Add("colage")
            dt.Columns.Add("colgender")
            dt.Columns.Add("colemail")
            dt.Columns.Add("coltel")
            dt.Columns.Add("colnokname")
            dt.Columns.Add("colnoktel")
            dt.Columns.Add("cplnokrelation")


            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim sts As String
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                sts = "Select id,colregdate,colfirstname,colmiddlename,colDOB,colage,colgender,colemail,coltel,colnokname,colnoktel,cplnokrelation from tbl_patient"
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3), Mydata.Item(4), Mydata.Item(5), Mydata.Item(6), Mydata.Item(7), Mydata.Item(8), Mydata.Item(9), Mydata.Item(10), Mydata.Item(11))
                            cont += 1

                        End While
                    End Using
                End Using
            End Using

            If cont >= 1 Then
                GridView0.DataSource = dt
                GridView0.DataBind()

            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnBill_Click(sender As Object, e As EventArgs) Handles btnBill.Click
        Response.Redirect("~/src/Forms/Out_patient_billing.aspx")
    End Sub
End Class