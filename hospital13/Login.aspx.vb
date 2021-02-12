Public Class ContactUs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.IsPostBack Then
            txtpassword.Attributes("value") = txtpassword.Text
        End If
    End Sub

    Protected Sub Enter_Click(sender As Object, e As EventArgs) Handles Enter.Click
        Dim usr As String = txtUserName.Text '.Trim().ToUpper()
        Dim psswrd As String = txtpassword.Text

        If usr = "Gatonga" AndAlso psswrd = "Gatonga" Then
            'If usr = "123" And psswrd = "123" Then

            FormsAuthentication.SetAuthCookie(usr, False)
            Dim retrnUrl As String = Request.QueryString("returnUrl")

            If Not String.IsNullOrEmpty(retrnUrl) Then
                Response.Redirect(retrnUrl)
            Else
                Response.Redirect("Insertdata.aspx")
            End If
        Else
            Label1.Text = "User name or password is wrong"
        End If


    End Sub


End Class