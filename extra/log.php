<?php

if($_GET['password']=="password"){
  $date = getdate();
  $id = $_GET['id'];
  $ip = $_GET['ip'];
  $timestamp = date("y-m-d H:i:s");
  $update= "$timestamp / $id / $ip\n";
  $log = fopen("log.txt","a");
  fwrite($log,$update);
  fclose($log);
  print $update;
}

?>
