require ["variables", "imap4flags", "vnd.dovecot.execute"];

# Mails vom DX-Robot von pe1nwl, also konkret im Wesentlichen Aurora-Warnungen
if header :contains "From" "pe1nwl@gooddx.net" {
	if header :matches "Subject" "*" { set "subject" "${1}"; }
	if execute :output "dapnet" "dapnetdx.sh" ["${subject}"]
	{
		setflag "\\Seen";	
	}
}

# Unwetterwarnungen vom DWD
if header :contains "From" "DWD-NewsletterAdmin_WU@newsletter.dwd.de" {
	if header :matches "Subject" "*" { set "subject" "${1}"; }
	if execute :output "dapnet" "dapnetwx.sh" ["${subject}"]
	{
		setflag "\\Seen";	
	}
}
