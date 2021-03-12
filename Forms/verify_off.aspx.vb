Public Class verify_off
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub btnrefresh_Click(sender As Object, e As EventArgs) Handles btnrefresh.Click
        FormsAuthentication.SignOut()
        FormsAuthentication.RedirectToLoginPage()
    End Sub


    Protected Sub Unnamed1_Click(sender As Object, e As EventArgs)
        FormsAuthentication.RedirectToLoginPage()
    End Sub
End Class