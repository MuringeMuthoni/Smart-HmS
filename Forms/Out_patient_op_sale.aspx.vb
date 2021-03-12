Public Class Out_patient_op_sale
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
        If Not IsPostBack Then
            Dpoissuesale.Items.Add("Married")
            Dpoissuesale.Items.Add("Single")
            Dpoissuesale.Items.Add("Female")
            Dpoissuesale.Items.Add("Male")
        End If
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)

    End Sub
End Class