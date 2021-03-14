import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.BasicAttribute;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.ModificationItem;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Hashtable;
import java.io.Console;
// Christophe BORELLY - IUT de Beziers - 2006-11-07 - 2017-02-23
/**
java -Djavax.net.ssl.trustStore=/etc/cas/trustStore \
-Djavax.net.ssl.trustStorePassword=changeit \
-Djavax.net.ssl.trustStoreType=JKS \
-Djavax.net.debug=ssl \
 CBLDAPSearch
*/
public class CBLDAPSearch {
  public static void main(String[] args) throws Exception {
    String HOST="ldaps://ldap.borelly.net:636/";
    String BASE="OU=people,DC=borelly,DC=net";
    String FILTER="(objectClass=shadowAccount)";
    String ATTRIBUTES[]={"uid","cn","uidNumber","gidNumber","homeDirectory"};
    String BINDDN=null;
    String BINDPW=null;
    System.out.println("JAVA LDAPSearch client...");
    if (args.length>0) {
        if (args.length%2==0) {
          for (int i=0;i<args.length;i+=2) {
            if (args[i].equals("-h")) HOST=args[i+1];
            if (args[i].equals("-b")) BASE=args[i+1];
            if (args[i].equals("-f")) FILTER=args[i+1];
            if (args[i].equals("-a")) ATTRIBUTES=args[i+1].split(",");
            if (args[i].equals("-d")) BINDDN=args[i+1];
          }
        } else {
          System.err.println("Usage: java CBLDAPSearch [-h HOST] [-b BASE]");
          System.err.println("       [-f FILTER] [-a ATTRIBUTES] [-d BINDDN]");
          System.exit(1);
        }
    }
    System.out.println("HOST="+HOST);
    System.out.println("BASE="+BASE);
    System.out.println("FILTER="+FILTER);
    System.out.println("ATTRIBUTES="+Arrays.toString(ATTRIBUTES));
    Hashtable<String,String> env=new Hashtable<String,String>();
    env.put(Context.INITIAL_CONTEXT_FACTORY,"com.sun.jndi.ldap.LdapCtxFactory");
    env.put(Context.SECURITY_AUTHENTICATION,"simple");
    if (BINDDN!=null) {
      System.out.println("BINDDN="+BINDDN);
      env.put(Context.SECURITY_PRINCIPAL,BINDDN);
      Console con=System.console();
      if (con==null) {
        System.err.println("ERROR: no console!");
        System.exit(1);
      }
      char data[]=con.readPassword("Password: ");
      BINDPW=new String(data);
      env.put(Context.SECURITY_CREDENTIALS,BINDPW);
    }
    env.put(Context.PROVIDER_URL,HOST);
    DirContext ctx=new InitialDirContext(env);
    SearchControls ctrl=new SearchControls();
    ctrl.setSearchScope(SearchControls.SUBTREE_SCOPE);
    ctrl.setReturningAttributes(ATTRIBUTES);
    NamingEnumeration s=ctx.search(BASE,FILTER,ctrl);
    while (s.hasMore()) {
      SearchResult r=(SearchResult)s.next();
      System.out.println("**********************");
      System.out.println(r.getNameInNamespace());
      showAttributes(r.getAttributes());
    }
  }
  public static void showAttributes(Attributes answer) throws Exception {
    String value=null;
    NamingEnumeration a=answer.getAll();
    while (a.hasMore()) {
      Attribute attr=(Attribute)a.next();
      String attributeName=attr.getID();
      System.out.print("attribute: "+attributeName);
      NamingEnumeration e=attr.getAll();
      while (e.hasMore()) {
        Object val=e.next();
        if (attributeName.equals("userPassword")) {
          value=new String((byte[])val);
        }
        else value=(String)val;
        System.out.println(" ["+value+"]");
      }
    }
  }
}
