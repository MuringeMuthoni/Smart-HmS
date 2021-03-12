Public Class admission2
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

        populatedpfloorname()
        populatebedcategory()
        populatebedno()
        populateward()
    End Sub

    Protected Sub Btnclose_Click(sender As Object, e As EventArgs) Handles Btnclose.Click
        ClientScript.RegisterClientScriptBlock(Me.GetType(), "CloseWindowScript", "window.close();", True)
    End Sub

    Protected Sub btnclose2_Click(sender As Object, e As EventArgs) Handles btnclose2.Click
        ClientScript.RegisterClientScriptBlock(Me.GetType(), "CloseWindowScript", "window.close();", True)

    End Sub

    Protected Sub btnclose1_Click(sender As Object, e As EventArgs) Handles btnclose1.Click
        ClientScript.RegisterClientScriptBlock(Me.GetType(), "CloseWindowScript", "window.close();", True)

    End Sub

    Protected Sub btnsavedata_Click(sender As Object, e As EventArgs) Handles btnsavedata.Click
        'Dim illness As String = TextArea1.InnerText
        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Tcmd, Mcmd, cmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

            Tcmd = New MySqlCommand
            Tcmd.Connection = Myconn

            cmd = New MySqlCommand
            Using cmd
                cmd.Connection = Myconn
                cmd.CommandText = "INSERT INTO tbl_admlist" &
            "(colpatientname,colpatienttel,coladdress,colgender,colfloorname,colward,colbedno,coldoctor,coladmdate,colbedcategory,coladmcost,colillness,regno,colmiddlename,collastname)" _
           & "VALUES(?0,?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13,?14)"
                cmd.Parameters.AddWithValue("?0", txtpatientname.Text)
                cmd.Parameters.AddWithValue("?1", txtpatienttel.Text)
                cmd.Parameters.AddWithValue("?2", txtaddress.Text)
                cmd.Parameters.AddWithValue("?3", txtogender.Text)
                cmd.Parameters.AddWithValue("?4", cbfloorname.Text)
                cmd.Parameters.AddWithValue("?5", cbward.Text)
                cmd.Parameters.AddWithValue("?6", cbbedno.Text)
                cmd.Parameters.AddWithValue("?7", txtdoctor.Text)
                cmd.Parameters.AddWithValue("?8", Datepicker1.Text)
                cmd.Parameters.AddWithValue("?9", cbbedcategory.Text)
                cmd.Parameters.AddWithValue("?10", txtcost.Text)
                cmd.Parameters.AddWithValue("?11", TextArea1.InnerText)
                cmd.Parameters.AddWithValue("?12", txtregno.Text)
                cmd.Parameters.AddWithValue("?12", txtmiddlename.Text)
                cmd.Parameters.AddWithValue("?12", txtlastname.Text)

                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    Protected Sub btnsavepop_Click(sender As Object, e As EventArgs) Handles btnsavepop.Click
        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Tcmd, Mcmd, cmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

            Tcmd = New MySqlCommand
            Tcmd.Connection = Myconn

            cmd = New MySqlCommand
            Using cmd
                cmd.Connection = Myconn
                cmd.CommandText = "INSERT INTO tbl_setupbedcategory" &
            "(colbedcategory)" _
           & "VALUES(?0)"
                cmd.Parameters.AddWithValue("?0", txtroom.Text)

                cmd.ExecuteNonQuery()
            End Using
        End Using
        populatebedcategory()
    End Sub
    Private Sub populatebedcategory()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colbedcategory FROM tbl_setupbedcategory")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbbedcategory.DataSource = cmd.ExecuteReader()
                cbbedcategory.DataTextField = "colbedcategory"
                cbbedcategory.DataBind()
                con.Close()
            End Using
        End Using
        cbbedcategory.Items.Insert(0, New ListItem("--Select Bed Category--", "0"))
    End Sub
    Private Sub populatedpfloorname()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colfloorname FROM tbl_setupfloorname")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbfloorname.DataSource = cmd.ExecuteReader()
                cbfloorname.DataTextField = "colfloorname"
                cbfloorname.DataBind()
                con.Close()
            End Using
        End Using
        cbfloorname.Items.Insert(0, New ListItem("--Select Floor Name--", "0"))
    End Sub
    Private Sub populatebedno()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colbedno FROM tbl_setupbedno")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbbedno.DataSource = cmd.ExecuteReader()
                cbbedno.DataTextField = "colbedno"
                cbbedno.DataBind()
                con.Close()
            End Using
        End Using
        cbbedno.Items.Insert(0, New ListItem("--Select Bed No--", "0"))
    End Sub
    Private Sub populateward()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colward FROM tbl_setupward")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbward.DataSource = cmd.ExecuteReader()
                cbward.DataTextField = "colward"
                cbward.DataBind()
                con.Close()
            End Using
        End Using
        cbward.Items.Insert(0, New ListItem("--Select Ward--", "0"))
    End Sub
    Protected Sub btnsavefloorname_Click(sender As Object, e As EventArgs) Handles btnsavefloorname.Click
        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Tcmd, Mcmd, cmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

            Tcmd = New MySqlCommand
            Tcmd.Connection = Myconn

            cmd = New MySqlCommand
            Using cmd
                cmd.Connection = Myconn
                cmd.CommandText = "INSERT INTO tbl_setupfloorname" &
            "(colfloorname)" _
           & "VALUES(?0)"
                cmd.Parameters.AddWithValue("?0", txtfloorname.Text)

                cmd.ExecuteNonQuery()
            End Using
        End Using
        populatedpfloorname()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Tcmd, Mcmd, cmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

            Tcmd = New MySqlCommand
            Tcmd.Connection = Myconn

            cmd = New MySqlCommand
            Using cmd
                cmd.Connection = Myconn
                cmd.CommandText = "INSERT INTO tbl_setupward" &
            "(colward)" _
           & "VALUES(?0)"
                cmd.Parameters.AddWithValue("?0", txtward.Text)

                cmd.ExecuteNonQuery()
            End Using
        End Using
        populateward()
    End Sub

    Protected Sub btnsavebedno_Click(sender As Object, e As EventArgs) Handles btnsavebedno.Click
        Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Dim MyString As String = prests
        Using Myconn As New MySqlConnection
            Myconn.ConnectionString = MyString
            Dim Tcmd, Mcmd, cmd As New MySqlCommand
            If Myconn.State = ConnectionState.Closed Then Myconn.Open()

            Tcmd = New MySqlCommand
            Tcmd.Connection = Myconn

            cmd = New MySqlCommand
            Using cmd
                cmd.Connection = Myconn
                cmd.CommandText = "INSERT INTO tbl_setupbedno" &
            "(colbedno)" _
           & "VALUES(?0)"
                cmd.Parameters.AddWithValue("?0", txtbedno.Text)

                cmd.ExecuteNonQuery()
            End Using
        End Using
        populatebedno()
    End Sub
    Private Sub Get_info()
        Try



            Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
            Dim MyString As String = prests

            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim Mydata As MySqlDataReader
                Dim cmd As New MySqlCommand
                Dim Tcode As String = ""

                cmd.CommandText = "Select colregistrationno,colfirstname,colmiddlename,collastname,colemail,colgender,coltel from tbl_patient where colregistrationno='" & txtsearch.Text & "'"
                cmd.Connection = Myconn
                Using cmd
                    Mydata = cmd.ExecuteReader()
                    Using Mydata
                        If Mydata.Read Then
                            ' lblphone.Text = "Not Available"
                            txtregno.Text = Mydata.Item(0)
                            txtpatientname.Text = Mydata.Item(1)
                            txtmiddlename.Text = Mydata.Item(2)
                            txtlastname.Text = Mydata.Item(3)
                            txtaddress.Text = Mydata.Item(4)
                            txtogender.Text = Mydata.Item(5)
                            txtpatienttel.Text = Mydata.Item(6)

                            'hddp.Value = Mydata.Item(3) & "," & Mydata.Item(2)
                            'hddd.Value = Mydata.Item(5) & "," & Mydata.Item(4)
                        End If
                    End Using
                End Using

                'Dim cmd2 As New MySqlCommand
                'cmd2 = New MySqlCommand("UPDATE tblrequest SET checkStatus=?1 WHERE id='" & Hdd.Value & "'", Myconn)
                'cmd2.Parameters.AddWithValue("?1", "Checked")
                'cmd2.ExecuteNonQuery()

                'tm_solo.Enabled = True


            End Using

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub imgpatientsearch_Click(sender As Object, e As ImageClickEventArgs) Handles imgpatientsearch.Click
        Get_info()
    End Sub
End Class