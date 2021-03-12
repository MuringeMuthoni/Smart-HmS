Imports System.IO

Public Class lab_master
    Inherits System.Web.UI.MasterPage

    Private Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Context.Session IsNot Nothing Then
            If Session.IsNewSession Then
                Dim newSessionIdCookie As HttpCookie = Request.Cookies("ASP.NET_SessionId")
                If newSessionIdCookie IsNot Nothing Then
                    Dim newSessionIdCookieValue As String = newSessionIdCookie.Value
                    If newSessionIdCookieValue <> String.Empty Then
                        ' This means Session was timed Out and New Session was started
                        Response.Redirect("~/src/Forms/signout.aspx")
                    End If
                    'H:\Current projects\CLOUD-HIMS\CLOUD-HIMS\src\Forms\signout.aspx
                End If
            End If
        End If
    End Sub

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
        CompanyName = Session("companyname")
        UserName = Session("Loggedin")
        If CompanyName = Nothing Then
            Session.Clear()
            Session.RemoveAll()
            Session.Abandon()
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        If Session("companyname") = "" Then
            Session.Clear()
            Session.RemoveAll()
            Session.Abandon()
            Response.Redirect("~/src/Forms/signout.aspx")
        End If

        If Not IsPostBack Then
            lblclient.Text = CompanyName
            lbldepart.Text = LOGGED_RIGHTS

            Dim dt As DataTable = Me.BindMenuData(0)
            DynamicMenuControlPopulation(dt, 0, Nothing)

        End If

        If Session("Loggedin") Is Nothing Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If
        If IsNothing(Session("Subcode")) Then
            Response.Redirect("~/src/Forms/signout.aspx")
        End If

    End Sub


    Protected Function BindMenuData(ByVal parentmenuId As Integer) As DataTable
        Try
            Dim ds As DataSet = New DataSet()
            Dim dt As DataTable
            Dim dr As DataRow
            Dim menu As DataColumn
            Dim pMenu As DataColumn
            Dim title As DataColumn
            Dim description As DataColumn
            Dim URL As DataColumn
            dt = New DataTable()
            menu = New DataColumn("MenuId", Type.[GetType]("System.Int32"))
            pMenu = New DataColumn("ParentId", Type.[GetType]("System.Int32"))
            title = New DataColumn("Title", Type.[GetType]("System.String"))
            description = New DataColumn("Description", Type.[GetType]("System.String"))
            URL = New DataColumn("URL", Type.[GetType]("System.String"))
            dt.Columns.Add(menu)
            dt.Columns.Add(pMenu)
            dt.Columns.Add(title)
            dt.Columns.Add(description)
            dt.Columns.Add(URL)
            dr = dt.NewRow()




            Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
            Dim MyString As String = prests

            Using Myconn2 As New MySqlConnection
                Using Myconn As New MySqlConnection
                    Myconn.ConnectionString = MyString
                    Myconn2.ConnectionString = MyString
                    If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                    If Myconn2.State = ConnectionState.Closed Then Myconn2.Open()

                    Dim seldata As MySqlDataReader
                    Dim cmd, jcmd As New MySqlCommand


                    Dim MyData As MySqlDataReader
                    Dim Cmd2 As New MySqlCommand
                    Dim sts As String
                    Dim count As Int16 = 0
                    sts = "Select id,department from  tblusers where username='" & Session("Username") & "'"
                    cmd = New MySqlCommand
                    cmd.CommandText = sts
                    cmd.Connection = Myconn
                    Using cmd
                        MyData = cmd.ExecuteReader()
                        Using MyData
                            If MyData.Read Then
                                Dim userid As Integer = MyData.Item(0)
                                Dim depart As String = MyData.Item(1)
                                MyData.Close()

                                jcmd = New MySqlCommand
                                jcmd.CommandText = "Select MenuId,Parentid,names,Description,url from menuitems"
                                jcmd.Connection = Myconn2
                                Using jcmd
                                    seldata = jcmd.ExecuteReader()
                                    Using seldata
                                        While seldata.Read
                                            Dim menuid As String = seldata.Item(0)
                                            Dim Parentid As String = seldata.Item(1)
                                            Dim names As String = seldata.Item(2)
                                            Dim menudesc As String = seldata.Item(3)
                                            Dim menuurl As String = seldata.Item(4)

                                            Dim status As String = "Denied"

                                            sts = "Select allowed from tblusermenu where menuid=" & menuid & " and userid=" & userid
                                            cmd = New MySqlCommand
                                            cmd.CommandText = sts
                                            cmd.Connection = Myconn
                                            Using cmd
                                                MyData = cmd.ExecuteReader()
                                                Using MyData
                                                    If MyData.Read Then
                                                        status = MyData.Item(0)
                                                    End If
                                                End Using
                                            End Using

                                            If count > 0 Then
                                                dr = dt.NewRow()
                                            End If
                                            dr("MenuId") = menuid
                                            dr("ParentId") = Parentid
                                            dr("Title") = names
                                            dr("Description") = menudesc
                                            If menuurl <> "none" Then
                                                dr("URL") = menuurl
                                            End If
                                            dt.Rows.Add(dr)

                                            'If depart = "Admin" Then
                                            '    If status <> "Denied" Then
                                            '        dr("MenuId") = menuid
                                            '        dr("ParentId") = Parentid
                                            '        dr("Title") = names
                                            '        dr("Description") = menudesc
                                            '        If menuurl <> "none" Then
                                            '            dr("URL") = menuurl
                                            '        End If
                                            '        dt.Rows.Add(dr)
                                            '    End If
                                            'ElseIf depart = "Super_Admin" Then

                                            '    dr("MenuId") = menuid
                                            '    dr("ParentId") = Parentid
                                            '    dr("Title") = names
                                            '    dr("Description") = menudesc
                                            '    If menuurl <> "none" Then
                                            '        dr("URL") = menuurl
                                            '    End If
                                            '    dt.Rows.Add(dr)
                                            'End If
                                            count += 1

                                        End While

                                    End Using
                                End Using
                            End If

                        End Using
                    End Using
                End Using
            End Using


            ds.Tables.Add(dt)
            Dim dv = ds.Tables(0).DefaultView
            dv.RowFilter = "ParentId='" & parentmenuId & "'"
            Dim ds1 As DataSet = New DataSet()
            Dim newdt = dv.ToTable()


            Return newdt

        Catch ex As Exception
            errorMsg = ex.Message
            errorContext = "Login "
            Response.Redirect("~/src/Forms/smartsys_errors.aspx?var1=" & errorMsg)
        End Try




    End Function



    Protected Sub DynamicMenuControlPopulation(ByVal dt As DataTable, ByVal parentMenuId As Integer, ByVal parentMenuItem As MenuItem)
        Dim currentPage As String = Path.GetFileName(Request.Url.AbsolutePath)

        For Each row As DataRow In dt.Rows
            Dim menuItem As MenuItem = New MenuItem With {
                .Value = row("MenuId").ToString(),
                .Text = row("Title").ToString(),
                .NavigateUrl = row("URL").ToString(),
                .Selected = row("URL").ToString().EndsWith(currentPage, StringComparison.CurrentCultureIgnoreCase)
            }

            If parentMenuId = 0 Then
                Menu1.Items.Add(menuItem)
                Dim dtChild As DataTable = Me.BindMenuData(Integer.Parse(menuItem.Value))
                DynamicMenuControlPopulation(dtChild, Integer.Parse(menuItem.Value), menuItem)
            Else
                parentMenuItem.ChildItems.Add(menuItem)
                Dim dtChild As DataTable = Me.BindMenuData(Integer.Parse(menuItem.Value))
                DynamicMenuControlPopulation(dtChild, Integer.Parse(menuItem.Value), menuItem)
            End If
        Next
    End Sub

    'Private Sub btndash_ServerClick(sender As Object, e As EventArgs) Handles btndash.ServerClick

    'End Sub



    'Private Sub BtnMgtUsers_ServerClick(sender As Object, e As EventArgs) Handles BtnMgtUsers.ServerClick
    '    Response.Redirect("~/src/Forms/Patient_New.aspx")
    'End Sub


End Class