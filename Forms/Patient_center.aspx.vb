Public Class Patient_center
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Btnaddnewpatient_Click(sender As Object, e As EventArgs) Handles Btnaddnewpatient.Click
        Response.Redirect("~/src/Forms/Patient_New.aspx")
    End Sub
End Class