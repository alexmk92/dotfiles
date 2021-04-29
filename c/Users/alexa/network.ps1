If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
  $arguments = "& '" + $myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

$remoteport = bash.exe -c "ifconfig eth0 | grep 'inet '"
$found = $remoteport -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';

if ( $found ) {
  $remoteport = $matches[0];

  $ports = @(2222, 22001, 3306);

  Invoke-Expression "netsh interface portproxy reset";

  for ( $i = 0; $i -lt $ports.length; $i++ ) {
    $port = $ports[$i];
    Invoke-Expression "netsh interface portproxy add v4tov4 listenport=$port connectport=$port connectaddress=$remoteport";
  }

  Invoke-Expression "netsh interface portproxy show v4tov4";
}
