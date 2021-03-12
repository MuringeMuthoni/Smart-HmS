Imports System.IO

Public Class smartsys_errors
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not Request.IsAuthenticated Then
        '     Response.Redirect("~/signout.aspx")
        'End If
        Dim ErrMsg As String = Request.QueryString("var1")
        lbl.Text = "We are sorry, an error has occured. errocode: " & ErrMsg


    End Sub

    Private Sub LogError()
        If errorContext = "" Then errorContext = "None"
        If errorMsg <> "" Then
            Try
                Dim path As FileInfo
                Dim Fna As String = "Logs.txt"
                Dim Fil As String = "~/Logs/" & Fna
                path = New System.IO.FileInfo(System.Web.HttpContext.Current.Server.MapPath(Fil))
                If Not path.Exists Then
                    File.Create(path.FullName)
                Else
                    Try
                        Dim myStrea2 As StreamWriter
                        myStrea2 = File.AppendText(path.FullName)
                        myStrea2.WriteLine(errorContext & ": " & Now & ":- " & errorMsg)
                        myStrea2.Flush()
                        myStrea2.Close()
                    Catch exs As Exception
                    End Try
                End If
            Catch ex As Exception
            End Try
        End If


    End Sub



    Private Sub btnrefresh_Click(sender As Object, e As EventArgs) Handles btnrefresh.Click
        FormsAuthentication.SignOut()
        Response.Redirect("~/src/Forms/signout.aspx")
    End Sub


    Private Sub smartsys_errors_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            LogError()
        End If
    End Sub

    'Private Sub tm_log_Tick(sender As Object, e As EventArgs) Handles tm_log.Tick
    '    tm_log.Enabled = False
    '    LogError()
    'End Sub
End Class