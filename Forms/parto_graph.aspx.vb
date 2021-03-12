Public Class parto_graph
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Button1_Click1(sender As Object, e As EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Button2_Click1(sender As Object, e As EventArgs) Handles Button2.Click
        MultiView1.ActiveViewIndex = 1

    End Sub
End Class