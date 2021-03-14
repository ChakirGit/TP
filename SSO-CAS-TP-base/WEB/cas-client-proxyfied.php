<?php
require_once('cas-config.php');
require_once('CAS-1.3.8/CAS.php');
//phpCAS::setDebug(); // Voir /tmp/phpCAS.log
//phpCAS::setVerbose(true);
phpCAS::client(CAS_VERSION_2_0,CAS_HOST,CAS_PORT,CAS_URL);
//phpCAS::setNoCasServerValidation();
phpCAS::setCasServerCACert(CAS_CERT);
phpcas::allowProxyChain(new CAS_ProxyChain_Any()); // When acces by proxy
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
printf("<pre>\n");
var_dump($_SESSION);
printf("</pre>\n");
printf("<pre>\n");
var_dump($_COOKIE);
printf("</pre>\n");
?>
