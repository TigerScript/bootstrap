$source = 'http://go.microsoft.com/fwlink/?LinkId=717507'
$destination = "$env:temp\wmf5.msu"
$webclient = New-Object Net.webclient
$webclient.DownloadFile($source,$destination)
Start-Process "$destination" -ArgumentList '/quiet' -nonewwindow -wait

