Public Class CostSetUp
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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Tcmd, Mcmd, cmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

            Tcmd = New MySqlCommand
            Tcmd.Connection = Myconn

            cmd = New MySqlCommand
            Using cmd
                cmd.Connection = Myconn
                cmd.CommandText = "INSERT INTO tbl_costsetup" &
            "(colactivity,colamounttype,colcost)" _
           & "VALUES(?0,?1,?2)"
                cmd.Parameters.AddWithValue("?0", txtactivity.Text)
                cmd.Parameters.AddWithValue("?1", txtamounttype.Text)
                cmd.Parameters.AddWithValue("?2", txtcost.Text)
                cmd.ExecuteNonQuery()
            End Using
        End Using
        Get_info()
    End Sub
    Private Sub Get_info()
        Try

            Dim dt As DataTable = New DataTable()
            dt.Columns.Add("id")
            dt.Columns.Add("colactivity")
            dt.Columns.Add("colamounttype")
            dt.Columns.Add("colcost")

            Dim cont As Int16 = 0

            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests
            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim sts As String
                Dim Scmd As New MySqlCommand
                Dim Mydata As MySqlDataReader
                sts = "Select id,colactivity,colamounttype,colcost from tbl_costsetup"
                Scmd = New MySqlCommand
                Scmd.CommandText = sts
                Scmd.Connection = Myconn
                Using Scmd
                    Mydata = Scmd.ExecuteReader()
                    Using Mydata
                        While Mydata.Read
                            dt.Rows.Add(Mydata.Item(0), Mydata.Item(1), Mydata.Item(2), Mydata.Item(3))
                            cont += 1

                        End While
                    End Using
                End Using
            End Using


            If cont >= 1 Then
                CostGrid.DataSource = dt
                CostGrid.DataBind()
            Else
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub
End Class