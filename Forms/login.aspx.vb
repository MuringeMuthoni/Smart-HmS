Public Class login
    Inherits System.Web.UI.Page

    Dim Dbname As String = ""
    Dim Specialcode As String = ""
    Private Sub dashboard_receiption_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Script", "dashresize();", True)
        End If
    End Sub

    Private Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate

        'Dim ss As Int16 = "mimi"

        Uid = Login1.UserName
        Dim i As Integer
        Dim Password As String = Login1.Password
        Dim Result As String = ""
        For i = 1 To Len(Password)
            Result = Result & Chr(Asc(Mid(Password, i, 1)) + 3)
        Next
        Dim Pass As String = Result

        Dim companytype As String = ""
        'Dim Ids As Integer
        Dim isauthen As Int16 = 0
        Dim sts As String = "select companyName,mastercode,Department,subcode,status,id from tblusers where username =?a and password=?p"
        Try

            Dim MyString As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim Myconn As MySqlConnection = New MySqlConnection(MyString)
            Using Myconn
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim Parm1, Parm2 As New MySqlParameter
                Using mMySqlCommand As New MySqlCommand
                    With mMySqlCommand
                        .Connection = Myconn
                        .CommandType = CommandType.Text
                        .CommandText = sts
                        With Parm1
                            .ParameterName = "?a"
                            .Direction = ParameterDirection.Input
                            .MySqlDbType = MySqlDbType.VarChar
                            .Size = 50
                            .Value = Uid
                        End With
                        With Parm2
                            .ParameterName = "?p"
                            .Direction = ParameterDirection.Input
                            .MySqlDbType = MySqlDbType.VarChar
                            .Size = 50
                            .Value = Pass
                        End With
                        .Parameters.Add(Parm2)
                        .Parameters.Add(Parm1)
                        Dim DsData As MySqlDataReader
                        DsData = mMySqlCommand.ExecuteReader()
                        Using DsData
                            If DsData.HasRows Then
                                If DsData.Read Then
                                    CompanyName = DsData.Item(0)
                                    MasterCode = DsData.Item(1)
                                    LOGGED_RIGHTS = DsData.Item(2)
                                    Subcode = DsData.Item(3)
                                    Session("accstatus") = DsData.Item(4)
                                    Dim ids As String = DsData.Item(5)
                                    DsData.Close()
                                    Session("did") = ids



                                    'If LOGGED_RIGHTS = "receiption" Then
                                    e.Authenticated = True
                                    isauthen = 1
                                    'Else
                                    '    e.Authenticated = False
                                    '    isauthen = 0
                                    'End If


                                Else
                                    Myconn.Close()
                                    e.Authenticated = False
                                    isauthen = 0

                                End If

                            End If
                        End Using
                    End With
                End Using



            End Using

            'Session("Scode") = Specialcode
            Session("Username") = Uid
            Session("Subcode") = Subcode
            Session("Mastercode") = MasterCode
            Session("companyname") = CompanyName
            Session("Department") = LOGGED_RIGHTS


        Catch ex As Exception
            e.Authenticated = False
            errorMsg = ex.Message
            errorContext = "Login "
            Response.Redirect("~/src/Forms/smartsys_errors.aspx?var1=" & errorMsg)
            'H:\Current projects\CLOUD-HIMS\CLOUD-HIMS\src\Forms\smartsys_errors.aspx
        End Try

        If e.Authenticated = False Then
            Response.Redirect("~/src/Forms/verify_off.aspx")
        End If

    End Sub




    Private Sub Login1_Load(sender As Object, e As EventArgs) Handles Login1.Load
        If Not IsPostBack Then
            'PNLLOG.Visible = True
            'PNLLOGGIN.Visible = True
            'PNLSUCCESS.Visible = False
        End If

    End Sub

    Private Sub Login1_LoggedIn(ByVal sender As Object, ByVal e As System.EventArgs) Handles Login1.LoggedIn


        Session("Loggedin") = Login1.UserName
        Session("companyname") = CompanyName
        UserName = Login1.UserName

        If Session("accstatus") = "Active" Then
            Response.Redirect("~/src/Forms/verify_ok.aspx")
        Else
            Response.Redirect("~/src/Forms/verify_suspended.aspx")
        End If




    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    'Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click

    '    Dim strRequest As String = "~/apps/smartlogistics.apk" ' Request.QueryString("file") '-- if something was passed to the file querystring
    '    If strRequest <> "" Then 'get absolute path of the file
    '        Dim path As String = Server.MapPath(strRequest) 'get file object as FileInfo
    '        Dim file As System.IO.FileInfo = New System.IO.FileInfo(path) '-- if the file exists on the server
    '        If file.Exists Then 'set appropriate headers
    '            Response.Clear()
    '            Response.AddHeader("Content-Disposition", "attachment; filename=" & file.Name)
    '            Response.AddHeader("Content-Length", file.Length.ToString())
    '            Response.ContentType = "application/octet-stream"
    '            Response.WriteFile(file.FullName)
    '            Response.End() 'if file does not exist
    '        Else
    '            Response.Write("This file does not exist.")
    '        End If 'nothing in the URL as HTTP GET
    '    Else
    '        Response.Write("Please provide a file to download.")
    '    End If

    'End Sub
End Class