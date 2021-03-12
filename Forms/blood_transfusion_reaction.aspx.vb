Public Class blood_transfusion_reaction
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

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)

    End Sub
    Private Sub bindtime()
        Dim StartTime As DateTime = DateTime.ParseExact("00:00", "HH:mm", Nothing)
        Dim EndTime As DateTime = DateTime.ParseExact("23:55", "HH:mm", Nothing)

        Dim Interval As New TimeSpan(0, 1, 0)
        ddlTimeFrom.Items.Clear()
        While StartTime <= EndTime
            ddlTimeFrom.Items.Add(StartTime.ToShortTimeString())
            DropDownList1.Items.Add(StartTime.ToShortTimeString())
            DropDownList2.Items.Add(StartTime.ToShortTimeString())
            StartTime = StartTime.Add(Interval)
        End While
        ddlTimeFrom.Items.Insert(0, New ListItem("--Select--", "0"))
        DropDownList1.Items.Insert(0, New ListItem("--Select--", "0"))
        DropDownList2.Items.Insert(0, New ListItem("--Select--", "0"))
    End Sub

End Class