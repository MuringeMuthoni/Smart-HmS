Public Class NewQueue
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.IsAuthenticated Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        CompanyName = Session("companyname")
        If CompanyName = "" Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        If Session("Department") Is Nothing Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        If IsNothing(Session("did")) Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        If Not Page.IsPostBack Then
            bindtime()

        End If
    End Sub
    Private Sub bindtime()
        Dim StartTime As DateTime = DateTime.ParseExact("00:00", "HH:mm", Nothing)
        Dim EndTime As DateTime = DateTime.ParseExact("23:55", "HH:mm", Nothing)

        Dim Interval As New TimeSpan(0, 1, 0)
        ddlTimeFrom.Items.Clear()
        While StartTime <= EndTime
            ddlTimeFrom.Items.Add(StartTime.ToShortTimeString())
            StartTime = StartTime.Add(Interval)
        End While
        ddlTimeFrom.Items.Insert(0, New ListItem("--Select--", "0"))
    End Sub

    Protected Sub Btnreport_Click(sender As Object, e As EventArgs) Handles Btnreport.Click
        Response.Redirect("~/src/Forms/visit_center.aspx")
    End Sub
End Class