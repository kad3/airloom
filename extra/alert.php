<?php

$password='sa3tHJ3/KuYvI'; #default password is "password"
$salt='salt';

if($_POST['edit'] && crypt($_POST['pw'],$salt)==$password){
  $open = fopen("alert.txt","w+");
  $text = $_POST['list'];
  fwrite($open, $text);
  fclose($open);
}

$file = file("alert.txt");
print "<form action=\"".$PHP_SELF."\" method=\"post\">";
print "<textarea name=\"list\" cols=\"30\" rows=\"30\">";
foreach($file as $text) {
  print $text;
}
print "</textarea><br />";
print "pw: <input type=\"password\" name=\"pw\"><br />";
print "<input name=\"edit\" type=\"submit\" value=\"Edit\" /></form>";

?>
