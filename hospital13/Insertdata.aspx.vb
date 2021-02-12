Public Class WebForm1
    Inherits System.Web.UI.Page
    Dim MySQLsts As String
    Dim MyConn, MyConnsel As MySqlConnection
    Public Sub get_configs()

        MySQLsts = "server=localhost;user id=Jujus;Password=Sage*2019*;persist security info=True;database=webdb"
        MyConn = New MySqlConnection(MySQLsts)
        MyConnsel = New MySqlConnection(MySQLsts)
        Try

            Using MyConnsel
                Using MyConn
                    If MyConn.State = ConnectionState.Closed Then MyConn.Open()
                    If MyConnsel.State = ConnectionState.Closed Then MyConnsel.Open()
                End Using
            End Using


        Catch ex As Exception
            Dim errormsg As String = ex.Message
            MsgBox("Server Error" & errormsg, "Error")
        End Try
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        get_configs()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Try
            ' Dim dates2 As Date = datepicker.Value.ToString("yyyy-MM-dd")
            Dim dates As Date = calender1.TodaysDate.ToShortDateString()
            Using MyConn
                If MyConn.State = ConnectionState.Closed Then MyConn.Open()
                'MyConn.Open()
                Dim command As MySqlCommand = New MySqlCommand
                command.Connection = MyConn
                command.CommandText = "insert into hospitali " &
                               "(names,age,kinname,kcontact,diagnosed,conditions,medication,pcontact,dday,kingender,apointday)" _
                                  & "value(?0,?1,?2,?3,?4,?5,?6,?7,?8,?9,?10)"
                command.Parameters.AddWithValue("?0", txtname.Text)
                command.Parameters.AddWithValue("?1", txtage.Text)
                command.Parameters.AddWithValue("?2", txtnextkin.Text)
                command.Parameters.AddWithValue("?3", txtcontact.Text)
                command.Parameters.AddWithValue("?4", txtdiagnosed.Text)
                command.Parameters.AddWithValue("?5", txtcondition.Text)
                command.Parameters.AddWithValue("?6", txtmedicine.Text)
                command.Parameters.AddWithValue("?7", txtpatiectcontact.Text)
                command.Parameters.AddWithValue("?8", dates)
                command.Parameters.AddWithValue("?9", kincbage.Text)
                command.Parameters.AddWithValue("?10", datepicker.Text)


                command.ExecuteNonQuery()
            End Using
            MsgBox("Record successfully inserted")


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        txtname.Text = ""
        txtage.Text = ""
        txtnextkin.Text = ""
        txtcontact.Text = ""
        txtdiagnosed.Text = ""
        txtcondition.Text = ""
        txtmedicine.Text = ""
        txtpatiectcontact.Text = ""

    End Sub
End Class