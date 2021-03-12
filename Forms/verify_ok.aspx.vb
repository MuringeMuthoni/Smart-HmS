Public Class verify_ok
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.IsAuthenticated Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If

    End Sub



    Private Sub Verify_ok_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If IsNothing(LOGGED_RIGHTS) Then
            Response.Redirect("~/src/Forms/login.aspx")
        End If
        If Request.IsAuthenticated Then
            'Dim db As String = Session("dbname")
            If LOGGED_RIGHTS = "Receiption" Then
                Response.Redirect("~/src/Dashboards/dashboard_receiption.aspx")
                'ElseIf LOGGED_RIGHTS = "Super_Admin" Then
                'H:\Current projects\CLOUD-HIMS\CLOUD-HIMS\src\Dashboards\dashboard_receiption.aspx
                '    Response.Redirect("~/homeG.aspx")
                'ElseIf LOGGED_RIGHTS = "Admin" Then
                '    Response.Redirect("~/homeG.aspx")
                'ElseIf LOGGED_RIGHTS = "Marketing" Then
                '    Response.Redirect("~/homeG.aspx")
                'H:\Current projects\CLOUD-HIMS\CLOUD-HIMS\Dashboards\dashboard_receiption.aspx
            ElseIf LOGGED_RIGHTS = "Nurse" Then
                Response.Redirect("~/src/Dashboards/dashboard_nurse.aspx")
            ElseIf LOGGED_RIGHTS = "Doctors" Then
                Response.Redirect("~/src/Dashboards/dashboard_doctor.aspx")


            ElseIf LOGGED_RIGHTS = "Lab" Then

                Response.Redirect("~/src/Dashboards/lab_dashboard.aspx")

            ElseIf LOGGED_RIGHTS = "Pharmacy" Then

                Response.Redirect("~/src/Dashboards/pharmacy_dashboard.aspx")

            ElseIf LOGGED_RIGHTS = "Report" Then

                Response.Redirect("~/src/Dashboards/dashboard_reports.aspx")

            ElseIf LOGGED_RIGHTS.ToUpper = "OUTPATIENT" Then

                Response.Redirect("~/src/Dashboards/dashboard_outpatient.aspx")

            ElseIf LOGGED_RIGHTS.ToUpper = "ADMIN" Then

                Response.Redirect("~/src/Dashboards/dashboard_admin.aspx")

            Else
                Response.Redirect("~/src/Forms/verify_off.aspx")

                '    Response.Redirect("~/home_super_mgt.aspx")
                'ElseIf LOGGED_RIGHTS = "Super_tracking" Then
                '    Response.Redirect("~/home_tracking.aspx")
                'ElseIf LOGGED_RIGHTS.ToUpper = "SUB" Then
                '    Response.Redirect("~/home_sub.aspx")
                'Else
                '    Response.Redirect("~/homeG.aspx")
            End If



        End If
    End Sub
End Class