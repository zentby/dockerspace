$path =  (pwd).path
Invoke-Expression "docker run -d --name couch-bak -p 5988:5984 -v $path\local.ini:/opt/couchdb/etc/local.d/local.ini -v $path\data:/opt/couchdb/data klaemo/couchdb:latest"
$command = 'docker inspect -f "{{ .NetworkSettings.Networks.bridge.Gateway }}" couch-bak'
$ip = Invoke-Expression $command
write-host "CouchDB Server IP: $ip"
Start-Process -FilePath "http://127.0.0.1:5988/_utils"
write-host "Leave this open and migrate your data in the openning admin page"
write-host "Press any key to continue to remove the temp container"
[void][System.Console]::ReadKey($true)
Invoke-Expression "docker rm -f couch-bak"