Imports System.Data
Imports System.Configuration
Imports MySql.Data.MySqlClient
Public Class Viewdata
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
        BindGrid()
        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
        'MyConn.Open()
        'Dim cmd As MySqlCommand = New MySqlCommand("Select names As Patient_name,age,kinname As Kin_name,diagnosed,dday As last_checked,apointday As next_appointment_date,pcontact as patient_contacts from hospitali;", MyConn)
        'Dim dr As MySqlDataReader = cmd.ExecuteReader()
        'Dim dt As DataTable = New DataTable()
        'dt.Load(dr)
        'MyConn.Close()
        'GridView1.DataSource = dt
        'GridView1.DataBind()
    End Sub
    Private Sub BindGrid()

        Dim MySQLsts As String = "server=localhost;user id=Jujus;Password=Sage*2019*;persist security info=True;database=webdb"
        Using con As New MySqlConnection(MySQLsts)
            Using cmd As New MySqlCommand("SELECT * FROM customers")
                Using sda As New MySqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Protected Sub Insert(sender As Object, e As EventArgs) Handles btnAdd.Click
        Dim name As String = txtName.Text
        Dim Contact As String = txtContact.Text
        Dim constr As String = "server=localhost;user id=Jujus;Password=Sage*2019*;persist security info=True;database=webdb"
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("INSERT INTO Customers (Name, Contact) VALUES (@Name, @Contact)")
                Using sda As New MySqlDataAdapter()
                    cmd.Parameters.AddWithValue("@Name", name)
                    cmd.Parameters.AddWithValue("@Contact", Contact)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            End Using
        End Using
        Me.BindGrid()
    End Sub
    Protected Sub OnRowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        Me.BindGrid()
    End Sub
    Protected Sub OnRowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)
        Dim customerId As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim name As String = TryCast(row.FindControl("txtName"), TextBox).Text
        Dim Contact As String = TryCast(row.FindControl("txtContact"), TextBox).Text
        Dim constr As String = "server=localhost;user id=Jujus;Password=Sage*2019*;persist security info=True;database=webdb"
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("UPDATE Customers SET Name = @Name, Contact = @Contact WHERE CustomerId = @CustomerId")

                'Command = New MySqlCommand("UPDATE hospitali SET names=?a, medication=?b,diagnosed=?c, age=?d,pcontact=?e WHERE names='" & txtName.Text & "'", MyConn)

                'Using cmd As New MySqlCommand("UPDATE Customers SET Name = ?a,  Contact = ?b, WHERE CustomerId = @CustomerId")

                Using sda As New MySqlDataAdapter()
                    cmd.Parameters.AddWithValue("@CustomerId", customerId)
                    cmd.Parameters.AddWithValue("@Name", name)
                    cmd.Parameters.AddWithValue("@Contact", Contact)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            End Using
        End Using
        GridView1.EditIndex = -1
        Me.BindGrid()
    End Sub
    Protected Sub OnRowCancelingEdit(sender As Object, e As EventArgs)
        GridView1.EditIndex = -1
        Me.BindGrid()
    End Sub
    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim customerId As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = "server=localhost;user id=Jujus;Password=Sage*2019*;persist security info=True;database=webdb"
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("DELETE FROM Customers WHERE CustomerId = @CustomerId")
                Using sda As New MySqlDataAdapter()
                    cmd.Parameters.AddWithValue("@CustomerId", customerId)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            End Using
        End Using
        Me.BindGrid()
    End Sub
    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow AndAlso e.Row.RowIndex <> GridView1.EditIndex Then
            TryCast(e.Row.Cells(2).Controls(2), LinkButton).Attributes("onclick") = "return confirm('Do you want to delete this row?');"
        End If
    End Sub

End Class