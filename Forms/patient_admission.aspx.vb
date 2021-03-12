Public Class patient_admission
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        populatecbsearch()
        populatecbward()
        populatecbbedcategory()
        populatecbbedno()
        populatecbclinic()
        populatevisittype()
        populatefloor()
        populatedoctor()
        populatebillcategory()
    End Sub

    Protected Sub imgpatientsearch_Click(sender As Object, e As ImageClickEventArgs) Handles imgpatientsearch.Click

    End Sub
    Private Sub populatecbsearch()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colnames FROM tbl_patient")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbsearch.DataSource = cmd.ExecuteReader()
                cbsearch.DataTextField = "colnames"
                cbsearch.DataBind()
                con.Close()
            End Using
        End Using
        cbsearch.Items.Insert(0, New ListItem("--Select Names--", "0"))
    End Sub
    Private Sub populatecbward()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colname FROM tbl_wardsetup")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbward.DataSource = cmd.ExecuteReader()
                cbward.DataTextField = "colname"
                cbward.DataBind()
                con.Close()
            End Using
        End Using
        cbward.Items.Insert(0, New ListItem("--Select Ward--", "0"))
    End Sub
    Private Sub populatecbbedcategory()
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
        cbbedcategory.Items.Insert(0, New ListItem("--Select bedcategory--", "0"))
    End Sub
    Private Sub populatecbclinic()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colclinicname FROM tbl_setupclinic")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Cbclinic.DataSource = cmd.ExecuteReader()
                Cbclinic.DataTextField = "colclinicname"
                Cbclinic.DataBind()
                con.Close()
            End Using
        End Using
        Cbclinic.Items.Insert(0, New ListItem("--Select Clinic Type--", "0"))
    End Sub
    Private Sub populatecbbedno()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colbedno FROM tbl_setupbedno")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Cbbedno.DataSource = cmd.ExecuteReader()
                Cbbedno.DataTextField = "colbedno"
                Cbbedno.DataBind()
                con.Close()
            End Using
        End Using
        Cbbedno.Items.Insert(0, New ListItem("--Select Bed No.--", "0"))
    End Sub
    Private Sub populatevisittype()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colvisitname FROM tbl_setupvisittype")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbvisittype.DataSource = cmd.ExecuteReader()
                cbvisittype.DataTextField = "colvisitname"
                cbvisittype.DataBind()
                con.Close()
            End Using
        End Using
        cbvisittype.Items.Insert(0, New ListItem("--Select Visit Type--", "0"))
    End Sub
    Private Sub populatefloor()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colfloorname FROM tbl_setupfloorname")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbfloor.DataSource = cmd.ExecuteReader()
                cbfloor.DataTextField = "colfloorname"
                cbfloor.DataBind()
                con.Close()
            End Using
        End Using
        cbfloor.Items.Insert(0, New ListItem("--Select Floor--", "0"))
    End Sub
    Private Sub populatedoctor()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT docname FROM tbl_setupdoctors")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbadimittingdoc.DataSource = cmd.ExecuteReader()
                cbadimittingdoc.DataTextField = "docname"
                cbadimittingdoc.DataBind()
                con.Close()
            End Using
        End Using
        cbadimittingdoc.Items.Insert(0, New ListItem("--Select Doctor--", "0"))
    End Sub
    Private Sub populatebillcategory()
        Dim constr As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT colbillcategory FROM tbl_setupbillcategory")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                cbbillcategory.DataSource = cmd.ExecuteReader()
                cbbillcategory.DataTextField = "colbillcategory"
                cbbillcategory.DataBind()
                con.Close()
            End Using
        End Using
        cbbillcategory.Items.Insert(0, New ListItem("--Select bill category--", "0"))
    End Sub


    Protected Sub cbsearch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbsearch.SelectedIndexChanged
        'labelpatientname.Text = cbsearch.SelectedIndex
        'If cbsearch.SelectedIndex = True Then
        '    labelpatientname.Text = cbsearch.Text
        'End If
        '    Dim prests As String = ConfigurationManager.ConnectionStrings("Myconn").ConnectionString
        '    Dim MyString As String = prests
        '    Using Myconn As New MySqlConnection
        '        Myconn.ConnectionString = MyString
        '        Dim Tcmd As New MySqlCommand
        '        If Myconn.State = ConnectionState.Closed Then Myconn.Open()


        '        Dim Mydata As MySqlDataReader
        '        Tcmd = New MySqlCommand


        '        Tcmd.CommandText = "select id from tbl_patient where colnames='" & cbonames.Text & "'" ' and colid='" & Txtpatientid.Text & "'"


        '        Tcmd.Connection = Myconn
        '        Mydata = Tcmd.ExecuteReader()
        '        Using Mydata
        '            If Mydata.Read Then
        '                Dim pid As String = Mydata.Item(0)
        '                hddpid.Value = Mydata.Item(0)
        '            End If
        '        End Using

        '    End Using
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
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
                cmd.CommandText = "INSERT INTO tbl_patient_admission" &
            "(colregno,coladmdate,colbedcategory,colfloor,colward,colbedno,colbillcategory,colvisittype,colclinic,coladmittingdoc,colkinrelation,colkinname,colkinaddress,colsurburb,colcity,colcountry,colpostcode,colkinmobile,colpayer,colsponsor,colpatientname,colpatientcontact,colgender,colage,colpatientaddress)" _
           & "VALUES(?0,?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13,?14,?15,?16,?17,?18,?19,?20,?21,?22,?23,?24)"
                cmd.Parameters.AddWithValue("?0", labelregno.Text)
                cmd.Parameters.AddWithValue("?1", txtadmissiondate.Text)
                cmd.Parameters.AddWithValue("?2", cbbedcategory.Text)
                cmd.Parameters.AddWithValue("?3", cbfloor.Text)
                cmd.Parameters.AddWithValue("?4", cbward.Text)
                cmd.Parameters.AddWithValue("?5", Cbbedno.Text)
                cmd.Parameters.AddWithValue("?6", cbbillcategory.Text)
                cmd.Parameters.AddWithValue("?7", cbvisittype.Text)
                cmd.Parameters.AddWithValue("?8", Cbclinic.Text)
                cmd.Parameters.AddWithValue("?9", cbadimittingdoc.Text)
                cmd.Parameters.AddWithValue("?10", cbkinrelation.Text)
                cmd.Parameters.AddWithValue("?11", txtkinname.Text)
                cmd.Parameters.AddWithValue("?12", txtaddress.Text)
                cmd.Parameters.AddWithValue("?13", txtsurburb.Text)
                cmd.Parameters.AddWithValue("?14", txtcity.Text)
                cmd.Parameters.AddWithValue("?15", txtcountry.Text)
                cmd.Parameters.AddWithValue("?16", txtpostCode.Text)
                cmd.Parameters.AddWithValue("?17", txtkinmobile.Text)
                cmd.Parameters.AddWithValue("?18", txtpayer.Text)
                cmd.Parameters.AddWithValue("?19", txtsponsor.Text)
                cmd.Parameters.AddWithValue("?20", cbsearch.Text)
                cmd.Parameters.AddWithValue("?21", txtcontact.Text)
                cmd.Parameters.AddWithValue("?22", cbgender.Text)
                cmd.Parameters.AddWithValue("?23", txtage.Text)
                cmd.Parameters.AddWithValue("?24", txtpatientaddress.Text)


                cmd.ExecuteNonQuery()
            End Using
        End Using
        txtadmissiondate.Text = ""
        txtpatientaddress.Text = ""
        txtadmissiondate.Text = ""
        txtage.Text = ""
        txtcontact.Text = ""
        cbkinrelation.Text = ""
        txtkinname.Text = ""
        txtaddress.Text = ""
        txtsurburb.Text = ""
        txtcity.Text = ""
        txtcountry.Text = ""
        txtpostCode.Text = ""
        txtkinmobile.Text = ""
        txtpayer.Text = ""
        txtsponsor.Text = ""
        cbsearch.Text = ""


    End Sub
End Class