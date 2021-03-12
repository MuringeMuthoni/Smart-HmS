Public Class bed_transfer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        populatebillcategory()
        populatecbward()
        populatecbbedno()
        populatecbbedcategory()
    End Sub
    Private Sub populatecbbedcategory()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colbedcategory FROM tbl_setupbedcategory")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbbedcategory.DataSource = cmd.ExecuteReader()
                cbbedcategory.DataTextField = "colbedcategory"
                cbbedcategory.DataBind()
                con.Close()
            End Using
        End Using
        cbbedcategory.Items.Insert(0, New ListItem("--Select bedcategory--", "0"))
    End Sub
    Private Sub populatecbbedno()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colbedno FROM tbl_setupbedno")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Cbbedno.DataSource = cmd.ExecuteReader()
                Cbbedno.DataTextField = "colbedno"
                Cbbedno.DataBind()
                con.Close()
            End Using
        End Using
        Cbbedno.Items.Insert(0, New ListItem("--Select Bed No.--", "0"))
    End Sub
    Private Sub populatebillcategory()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colbillcategory FROM tbl_setupbillcategory")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbbillcategory.DataSource = cmd.ExecuteReader()
                cbbillcategory.DataTextField = "colbillcategory"
                cbbillcategory.DataBind()
                con.Close()
            End Using
        End Using
        cbbillcategory.Items.Insert(0, New ListItem("--Select bill category--", "0"))
    End Sub
    Private Sub populatecbward()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colname FROM tbl_wardsetup")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbward.DataSource = cmd.ExecuteReader()
                cbward.DataTextField = "colname"
                cbward.DataBind()
                con.Close()
            End Using
        End Using
        cbward.Items.Insert(0, New ListItem("--Select Ward--", "0"))
    End Sub
End Class