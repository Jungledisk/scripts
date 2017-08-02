# Preback script to create mysql dump zip file. Add zip file location to backup job.

# Directory where mysql dumps are stored.
$backupPath = "C:\backups\" # Verify this path
$date = Get-Date -UFormat "%m-%d-%Y_%H%M"
$backupDir = $backupPath + $date
New-Item $backupDir -type Directory

# Prepares filenames for backup
$backupFile = $backupDir + "\backup.sql"
$backupFileZip = $backupDir + ".zip"

# Verify mysqldump path in your system.
$mysqldump = "'C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump.exe'"
$mysqlUser = "[username]"
$mysqlPassword = "[password]"


$cmd = "& " + $mysqldump + " -u " + $mysqlUser + " -p" + $mysqlPassword + "  --all-databases > " + $backupFile
$cmdCompress = "& Add-Type -Assembly System.IO.Compression.FileSystem`n[io.compression.zipfile]::CreateFromDirectory('" + $backupDir + "', '" + $backupFileZip + "')"
$cmdDelete = "& Remove-Item " + $backupDir + " -recurse"

invoke-expression $cmd
invoke-expression $cmdCompress
invoke-expression $cmdDelete