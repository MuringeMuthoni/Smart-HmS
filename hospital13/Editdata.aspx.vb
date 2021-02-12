Imports System.Data
Imports System.Configuration
Imports MySql.Data.MySqlClient
Public Class Editdata
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
        loaddgv2()
        'get_configs()
        'MyConn.Open()
        'Dim cmd As MySqlCommand = New MySqlCommand("Select names As Patient_name,age,kinname As Kin_name,diagnosed,dday As last_checked,apointday As next_appointment_date,pcontact as patient_contacts from hospitali;", MyConn)
        'Dim dr As MySqlDataReader = cmd.ExecuteReader()
        'Dim dt As DataTable = New DataTable()
        'dt.Load(dr)
        'MyConn.Close()
        'DGVhistory.DataSource = dt
        'DGVhistory.DataBind()
    End Sub

    Private Sub Get_dt()
        Try


            Using MyConn
                If MyConn.State = ConnectionState.Closed Then MyConn.Open()

                Dim sts As String = "select names,medication,diagnosed,age,pcontact from hospitali where  names=  '" & txtsearch.Text & "'"

                Dim command As MySqlCommand = New MySqlCommand(sts, MyConn)
                Dim MyData As MySqlDataReader = command.ExecuteReader()

                Using MyData
                    If MyData.Read Then
                        txtname.Text = MyData.Item(0)
                        txtmedication.Text = MyData.Item(1)
                        txtdiagnosed.Text = MyData.Item(2)
                        txtage.Text = MyData.Item(3)
                        txtcontact.Text = MyData.Item(4)

                    End If
                End Using
            End Using


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub Button1_Click1(sender As Object, e As EventArgs) Handles Button1.Click, Button1.Click
        Get_dt()
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        'Try




        '    'Dim gg As Date = tdpdlo.Value.ToString("yyyy-MM-dd")
        '    'Dim hh As Date = tdpgood.Value.ToString("yyyy-MM-dd")
        '    Using MyConn
        '        If MyConn.State = ConnectionState.Closed Then MyConn.Open()
        '        Dim command As MySqlCommand
        '        command = New MySqlCommand("UPDATE hospitali SET names=?a, medication=?b,diagnosed=?c, age=?d,pcontact=?e WHERE names='" & txtname.Text & "'", MyConn)
        '        command.Parameters.AddWithValue("?a", txtname.Text)
        '        command.Parameters.AddWithValue("?b", txtmedication.Text)
        '        command.Parameters.AddWithValue("?c", txtdiagnosed.Text)
        '        command.Parameters.AddWithValue("?d", txtage.Text)
        '        command.Parameters.AddWithValue("?e", txtcontact.Text)

        '        command.ExecuteNonQuery()


        '    End Using

        'Catch ex As Exception
        '    MsgBox(ex.Message)
        'End Try
        'MsgBox("Record updated successfully")
        'txtname.Text = ""
        'txtmedication.Text = ""
        'txtdiagnosed.Text = ""
        'txtage.Text = ""
        'txtcontact.Text = ""
        'loaddgv()
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click

        'Try
        '    Using MyConn
        '        If MyConn.State = ConnectionState.Closed Then MyConn.Open()
        '        Dim command As MySqlCommand
        '        command = New MySqlCommand("DELETE  from  hospitali  WHERE names='" & txtname.Text & "'", MyConn)
        '        command.ExecuteNonQuery()
        '    End Using

        '    MsgBox("Record deleted successfully")

        '    txtname.Text = ""
        '    txtmedication.Text = ""
        '    txtdiagnosed.Text = ""
        '    txtage.Text = ""
        '    txtcontact.Text = ""

        'Catch ex As Exception
        '    MsgBox(ex.Message)
        'End Try
        'loaddgv()
    End Sub

    Protected Sub DGVhistory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DGVhistory.SelectedIndexChanged

    End Sub

    Private Sub loaddgv2()
        Dim conn As String = ConfigurationManager.ConnectionStrings("Mycon").ConnectionString
        Using Mycon As New MySqlConnection
            Mycon.ConnectionString = conn
            If Mycon.State = ConnectionState.Closed Then Mycon.Open()


            Dim cmd As MySqlCommand = New MySqlCommand("Select names As Patient_name,age,kinname As Kin_name,diagnosed,dday As last_checked,apointday As next_appointment_date,pcontact as patient_contacts from hospitali;", Mycon)
            Dim dr As MySqlDataReader = cmd.ExecuteReader()
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            Mycon.Close()

            DGVhistory.DataSource = dt
            DGVhistory.DataBind()

        End Using
    End Sub


End Class