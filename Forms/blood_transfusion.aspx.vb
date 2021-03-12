Public Class blood_transfusion
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
            BindTime()
        End If
    End Sub
    Private Sub BindTime()
        'Set start time (00:00 means 12:00 AM)
        Dim StartTime As DateTime = DateTime.ParseExact("00:00", "HH:mm", Nothing)
        'Set end time (23:55 means 11:55 PM)
        Dim EndTime As DateTime = DateTime.ParseExact("23:55", "HH:mm", Nothing)
        'Set 5 minutes interval
        Dim Interval As New TimeSpan(0, 5, 0)
        'To set 1 hour interval
        'Dim Interval As New TimeSpan(1, 0, 0)
        ddlTimeFrom.Items.Clear()
        ddlTimeTo.Items.Clear()
        While StartTime <= EndTime
            ddlTimeFrom.Items.Add(StartTime.ToShortTimeString())
            ddlTimeTo.Items.Add(StartTime.ToShortTimeString())
            StartTime = StartTime.Add(Interval)
        End While
        ddlTimeFrom.Items.Insert(0, New ListItem("--Select--", "0"))
        ddlTimeTo.Items.Insert(0, New ListItem("--Select--", "0"))

    End Sub
End Class