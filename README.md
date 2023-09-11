<h1 align="center">Filtering a new server from groups of preexisting servers</h1>

<p align="center">
<img src="https://github.com/Mwajiduddin/Mwajiduddin/blob/main/images/powershell_icon.png" height="15%" width="15%" />
</p>

<h2>Overview</h2>
This script utilizes variables, arrays, if, else, elseif, switch, and foreach statements to filter the inputted server name into a category of servers based on its name. To do this input a server name to the $server variable in the script and based on its name, if it contains a specific word it will be designated to one of the server category otherwise it will state that the server doesn't belong to one of them. So in this example, I've selected "StorageServer2" as a server name for the $server variable and since it contains the word "Storage" in it, it gets categorized as one of a storage server.
Download the script file or copy it from down below.


<details> 
  <summary> <h4>Powershell script</h4> </summary>
  
```Powershell
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

``` 
</details>
