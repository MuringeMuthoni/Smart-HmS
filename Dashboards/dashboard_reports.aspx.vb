Public Class dashboard_reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.IsAuthenticated Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        CompanyName = Session("companyname")
        If CompanyName = "" Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        If Session("Loggedin") Is Nothing Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        If IsNothing(Session("Subcode")) Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        ' Get_info()
    End Sub

    Private Sub dashboard_receiption_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
        End If
    End Sub

    Protected Sub ImageButton8_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton8.Click

        Response.Redirect("~/src/Forms/RtpIncome.aspx")

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub ImageButton7_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton7.Click


        'Response.Redirect("~/src/Forms/PatientQueue.aspx")

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Response.Redirect("~/src/Forms/Rtpdiseasestreated.aspx")

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub ImageButton9_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton9.Click

        Response.Redirect("~/src/Forms/RtpPatientTreated.aspx")
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub

    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click

        Response.Redirect("~/src/Forms/RtpLabTestDone.aspx")
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
    End Sub
End Class