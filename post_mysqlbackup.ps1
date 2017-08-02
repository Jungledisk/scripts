# Post backup script to clear out mysqldumps after the set retention period.

# Directory where the sql backups are stored. Verify this path.
$backupDir = "C:\backups"

# Number of days to keep sql dumps
$retention = 7

Get-ChildItem $backupDir | ForEach-Object {
	$fileDate = [datetime]$_.lastwritetime
	
	if ($fileDate -lt (Get-Date).AddDays(-$retention)) {
		Remove-Item $backupDir\$_ -recurse
	}
}
