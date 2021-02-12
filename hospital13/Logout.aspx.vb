Public Class Logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub logout_Click(sender As Object, e As EventArgs) Handles logout.Click
        SurroundingSub()
    End Sub
    Private Sub SurroundingSub()
        FormsAuthentication.SignOut()
        Response.Redirect("Login.aspx")
    End Sub
End Class