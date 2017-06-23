Set myMail=CreateObject("CDO.Message")
myMail.Subject="Subject Line here"
myMail.From="test@email.com"
myMail.To="test@email.com"
myMail.TextBody="Body of the email"
myMail.Configuration.Fields.Update
myMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
Mymail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate")=1
Mymail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername")="username" 
Mymail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword")="password"
myMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="smtp.mailserver.com"
myMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=587
myMail.Configuration.Fields.Update
myMail.Send
set myMail=nothing
