$path =  (pwd).path
if (!(Test-Path $path\data))
{
    New-Item -ItemType directory -Path $path\data
}
Invoke-Expression "docker run -d --rm --name couch-bak -p 5988:5984 -v $path\local\local.ini:/opt/couchdb/etc/local.d/local.ini -v $path\data:/opt/couchdb/data klaemo/couchdb:latest"
Start-Process -FilePath "http://127.0.0.1:5988/_utils"
write-host "Leave this open and migrate your data in the openning admin page"
write-host "Press any key to continue to remove the temp container"
[void][System.Console]::ReadKey($true)
Invoke-Expression "docker stop couch-bak"