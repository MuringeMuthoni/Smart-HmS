Public Class signedout
    Inherits System.Web.UI.Page

    Private Sub signout_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        FormsAuthentication.SignOut()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub btnSign_Click(sender As Object, e As EventArgs) Handles btnSign.Click
        FormsAuthentication.RedirectToLoginPage()
    End Sub

    Private Sub signout_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache)
            HttpContext.Current.Response.Cache.SetNoServerCaching()
            HttpContext.Current.Response.Cache.SetNoStore()
            Session.Abandon()
        End If
    End Sub

    Private Sub signout_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        '
        If Not IsPostBack Then
            Dim i As Int16 = 0

            'Dim el As System.Web.UI.WebControls.AuthenticateEventArgs  Handles Login1.Authenticate
            'el.Authenticated = False
        Else
            FormsAuthentication.SignOut()
            Dim i As Int16 = 0
        End If
    End Sub

End Class