$dbServers = @("MySQLDatabaseServer","PostgreSQLDatabaseServer")
$webServers = @("ApacheWebServer","NginxWebServer","LiteSpeedWebServer")
$storageServers = @("DropboxStorageServer")


$server = "StorageServer2"

if ($server -eq $dbServers) {
  Write-Host "This server exists as one of the database servers"
}
elseif ($server -eq $webServers) {
  Write-Host "This server exists as one of the web servers"
}
elseif ($server -eq $storageServers) {
  Write-Host "This server exists as one of the storage servers"
}
else {
 switch ($server) {
  {$server.Contains("Database")} {
    $dbServers += $server
  }
  {$server.Contains("Web")} {
    $webServers += $server
  }
  {$server.Contains("Storage")} {
    $storageServers += $server
  }
  default {
    Write-Host "This server seems to be new as it doesn't belong to one of the server groups below"
  }
 }
}

foreach ($element in $dbServers) {
  Write-Host "Database Servers: $element"
}
foreach ($element in $webServers) {
  Write-Host "Web Servers: $element"
}
foreach ($element in $storageServers) {
  Write-Host "Storage Servers: $element"
}

