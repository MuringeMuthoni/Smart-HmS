Imports System.Net.Mail

Module Module1
    Public Umako As String = "hakuna"
    Public Uid As String
    Public RegisterdCom As String = "SMARTSYS TEST HOSPITAL "
    Public errorMsg As String = ""
    Public TechnicalMsg As String = ""
    Public errorContext As String = ""
    Public Vstate As Int16
    Public UserName As String = ""
    Public LOGGED_RIGHTS, Sys_Mode As String
    Public CompanyName, MasterCode, Subcode As String
    Public CancelReg As String = ""
    Public GANI, Gapi As Int16
    Public Audit_Id As String = ""
    Public CurrentTable As String = ""
    Public MasterPage As String
    Public View_current As Int16 = 0
    Public I As Double
    Public Count, CarNo As Int16
    Public TrackCode(10) As String
    Public TrackIds(10) As String
    Public RefreshRuns, RefreshRuns2 As Int16
    Public SqlSts1, SqlSts2, StrCount, StrArray As String
    Public StrAll, StrOn, StrOff As String
    Public SingleCode As String
    Public LstSelmode As Int16 ' either whole account or sub account
    Public subAcc As String
    Public MDataSET As New DataSet()


    Public Sub Send_error_Mails()


        Try


            Dim MailAddress As String
            MailAddress = "tonykaigai@gmail.com"

            Dim Smtp_Server As New SmtpClient
            Dim e_mail As New MailMessage()
            Smtp_Server.UseDefaultCredentials = False
            Smtp_Server.Credentials = New Net.NetworkCredential("sales.pontypridd@gmail.com", "smsquery[2014]")
            Smtp_Server.Port = 587
            Smtp_Server.EnableSsl = True
            Smtp_Server.Host = "smtp.gmail.com"

            Dim Msgbody As String = errorMsg
            e_mail = New MailMessage()
            e_mail.From = New MailAddress("sales.pontypridd@gmail.com")
            e_mail.To.Add(MailAddress)
            e_mail.Subject = "Error Message"
            e_mail.IsBodyHtml = False
            e_mail.Body = Msgbody
            Smtp_Server.Send(e_mail)


        Catch ex As Exception
            'Synconn2.Close()
            'Synconn.Close()
        End Try



    End Sub









    Public Sub Send_Service_text(ByVal Serv_id As String, ByVal Msg As String, ByVal MsgType As String)

        Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
        Dim MyString As String = prests
        Dim Status As String = ""
        Dim Feedback As String = ""

        Try


            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()
                Dim MyData As MySqlDataReader
                Dim cmd, cmd2 As New MySqlCommand

                Dim email_message As String = ""
                Dim email_dest As String = ""
                Dim email_subject As String = ""
                Dim simu As String = ""
                cmd = New MySqlCommand
                If MsgType = "Quotation" Then
                    cmd.CommandText = "select ucode from tbl_quotation where r_id='" & Serv_id & "'"
                ElseIf MsgType = "Service_reply" Then
                    cmd.CommandText = "select ucode from tblservice_request where id='" & Serv_id & "'"
                Else
                    cmd.CommandText = "select sup_id from tblservices_allocation where serv_id='" & Serv_id & "'"
                End If

                cmd.Connection = Myconn
                Using cmd
                    MyData = cmd.ExecuteReader()
                    Using MyData
                        If MyData.Read Then
                            Dim ids As String = MyData.Item(0)
                            MyData.Close()

                            cmd = New MySqlCommand
                            If MsgType = "Quotation" Then
                                cmd.CommandText = "select phone,email from app_users where ucode=" & ids
                                email_subject = "Quotation"
                                email_message = "We have generated a quotation for your service request. Kindly login to your app for more details"
                            ElseIf MsgType = "Service_reply" Then
                                cmd.CommandText = "select phone,email from app_users where ucode=" & ids
                                email_subject = "Service Reply"
                                email_message = "We have made a response to your service request. Kindly login to your app for more details"
                            Else
                                cmd.CommandText = "select tel,email from tblservice_suppliers where id=" & ids
                                'email_subject = "Alert"
                                'email_message = "We have made a response to your service request. Kindly login to your app for more details"
                            End If

                            cmd.Connection = Myconn
                            Using cmd
                                MyData = cmd.ExecuteReader()
                                Using MyData
                                    If MyData.Read Then
                                        simu = MyData.Item(0)
                                        email_dest = MyData.Item(1)
                                        MyData.Close()

                                        cmd2 = New MySqlCommand
                                        Using cmd2
                                            cmd2.Connection = Myconn
                                            cmd2.CommandText = "INSERT INTO sms" &
                                                                        "(simu,message,msgtype)" _
                                                                       & "VALUES(?0,?1,?2)"
                                            cmd2.Parameters.AddWithValue("?0", simu)
                                            cmd2.Parameters.AddWithValue("?1", Msg)
                                            cmd2.Parameters.AddWithValue("?2", MsgType)
                                            cmd2.ExecuteNonQuery()
                                        End Using

                                    End If
                                End Using
                            End Using

                            If MsgType = "Quotation" OrElse MsgType = "Service_reply" Then
                                sending_main(email_dest, email_message, email_subject, simu)
                            End If

                        End If
                    End Using
                End Using

            End Using

        Catch ex As Exception
            Dim ss As String = ex.Message
        End Try
    End Sub



    Public Sub sending_main(ByVal destination As String, ByVal Msgs As String, ByVal subject As String, ByVal recepient As String)

        Try
            Dim mmMessage As New MailMessage()

            Dim ncSMTPDetails As New System.Net.NetworkCredential()
            Dim SMTP As New SmtpClient()

            Dim strSenderEmail As String = "support@netbizltd.co.ke"
            Dim strSender As String = "Netbiz Support"
            Dim strSenderPassword = "MojoMojo@234"

            Dim strRecipientEmail As String = destination
            Dim strRecipient As String = recepient

            Dim strSMTPHost As String = "mail.netbizltd.co.ke"
            Dim strSMTPPort As String = "587"

            '-- Build Message
            mmMessage.From = New MailAddress(strSenderEmail, strSender)
            mmMessage.To.Add(New MailAddress(strRecipientEmail, strRecipient))

            mmMessage.IsBodyHtml = False
            mmMessage.Priority = MailPriority.Normal

            mmMessage.Subject = subject
            mmMessage.Body = Msgs

            '-- Define Authenticated User
            ncSMTPDetails.UserName = strSenderEmail
            ncSMTPDetails.Password = strSenderPassword

            '-- Send Message
            SMTP.UseDefaultCredentials = False
            SMTP.Credentials = ncSMTPDetails
            SMTP.Host = strSMTPHost
            SMTP.Port = strSMTPPort

            SMTP.DeliveryMethod = SmtpDeliveryMethod.Network

            SMTP.Send(mmMessage)

        Catch Err As Exception
            Dim eers As String = Err.Message

            Try
                Send_mail("Sending mail error " & eers)
            Catch ex As Exception
            End Try

        End Try


    End Sub



    Private Sub Send_mail(ByVal errorinfo As String)
        Try

            Dim SendingEmail As String = "sconixk@gmail.com"


            Dim Smtp_Server As New SmtpClient
            Dim e_mail As New MailMessage()
            Smtp_Server.UseDefaultCredentials = False
            Smtp_Server.Credentials = New Net.NetworkCredential(SendingEmail, "AfriB$@2020")
            'Smtp_Server.Credentials = New Net.NetworkCredential("quatrixltd@gmail.com", "Tederetha@2018")
            Smtp_Server.Port = 587
            Smtp_Server.EnableSsl = True
            Smtp_Server.Host = "smtp.gmail.com"

            Dim Msgbody As String = errorinfo
            e_mail.IsBodyHtml = True
            e_mail = New MailMessage()
            e_mail.From = New MailAddress(SendingEmail, "Netbiz Site")
            e_mail.To.Add("tonykabugu@gmail.com")
            e_mail.Subject = "Site error log"
            e_mail.IsBodyHtml = True
            e_mail.Body = Msgbody
            Smtp_Server.Send(e_mail)

        Catch error_t As Exception
            Dim eers As String = error_t.Message
            fallback_text(eers)
            'lblwait.Text = ""
            'lblmsgs.Text = "Success dispatching but the email didn't go"
            'MsgBox(error_t.ToString)
        End Try
    End Sub



    Private Sub fallback_text(ByVal err As String)

        Dim prests As String = ConfigurationManager.ConnectionStrings("Compconn").ConnectionString
        Dim MyString As String = prests
        Dim Status As String = ""
        Dim Feedback As String = ""

        Try


            Using Myconn As New MySqlConnection
                Myconn.ConnectionString = MyString
                If Myconn.State = ConnectionState.Closed Then Myconn.Open()

                Dim cmd2 As New MySqlCommand
                cmd2 = New MySqlCommand
                Using cmd2
                    cmd2.Connection = Myconn
                    cmd2.CommandText = "INSERT INTO sms" &
                                         "(simu,message,msgtype)" _
                                          & "VALUES(?0,?1,?2)"
                    cmd2.Parameters.AddWithValue("?0", "254722296417")
                    cmd2.Parameters.AddWithValue("?1", err)
                    cmd2.Parameters.AddWithValue("?2", "Error_message")
                    cmd2.ExecuteNonQuery()
                End Using

            End Using

        Catch ex As Exception
            Dim ss As String = ex.Message
        End Try



    End Sub




End Module
