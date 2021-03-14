<?php
require_once('cas-config.php');
require_once('CAS-1.3.8/CAS.php');
//phpCAS::setDebug(); // Voir /tmp/phpCAS.log
//phpCAS::setVerbose(true);
phpCAS::client(SAML_VERSION_1_1,CAS_HOST,CAS_PORT,CAS_URL);
//phpCAS::setNoCasServerValidation();
phpCAS::setCasServerCACert(CAS_CERT);
phpCAS::forceAuthentication();
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
$href='http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
if (isset($_REQUEST['logout'])) {
  phpCAS::logout();
  //phpCAS::logout(array('url'=>$href));
  //phpCAS::logoutWithRedirectService($href);
  exit(0);
}
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
printf("<p>User : [<a href='?logout=' title='Déconnexion'>%s</a>]</p>\n",phpCAS::getUser());
printf("<p>%s</p>\n",$href);

printf("<h3>User Attributes</h3><ul>\n");
foreach (phpCAS::getAttributes() as $key => $value) {
  if (is_array($value)) {
    echo '<li>',$key,':<ol>'.PHP_EOL;
    foreach ($value as $item) {
      echo '<li><strong>',$item,'</strong></li>'.PHP_EOL;
    }
    echo '</ol></li>'.PHP_EOL;
  } else {
    echo '<li>',$key,': <strong>',$value,'</strong></li>'.PHP_EOL;
  }
}
printf("</ul>\n");

printf("<pre>\n");
var_dump($_SESSION);
printf("</pre>\n");
printf("<pre>\n");
var_dump($_COOKIE);
printf("</pre>\n");
?>
