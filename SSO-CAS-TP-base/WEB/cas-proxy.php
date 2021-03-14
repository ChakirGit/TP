<?php
require_once('cas-config.php');
require_once('CAS-1.3.8/CAS.php');
//phpCAS::setDebug(); // Voir /tmp/phpCAS.log
//phpCAS::setVerbose(true);
phpCAS::proxy(CAS_VERSION_2_0,CAS_HOST,CAS_PORT,CAS_URL);
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
printf("<h2>Proxy</h2>\n");
printf("<p>User : [<a href='?logout=' title='Déconnexion'>%s</a>]</p>\n",phpCAS::getUser());
printf("<hr/>\n");
$service='http://localhost/cas/cas-client-proxyfied.php';
if (phpCAS::serviceWeb($service,$err_code,$output)) {
  echo $output;
}
printf("<hr/>\n");
?>
