import java.sql.*;
// Christophe BORELLY - IUT de Beziers - 2006-11-07 - 2017-02-23
//javac -cp mariadb-java-client-1.5.4.jar CBJDBC.java
//java -cp mariadb-java-client-1.5.4.jar:. CBJDBC
//javac -cp mysql-connector-java-5.1.40-bin.jar CBJDBC.java
//java -cp mysql-connector-java-5.1.40-bin.jar:. CBJDBC
public class CBJDBC {
  public static void main(String[] args) {
    Connection conn=null;
    Statement stmt=null;
    //String DRIVER="com.mysql.jdbc.Driver";
    String DRIVER="org.mariadb.jdbc.Driver";
    String DB_URL="jdbc:mysql://localhost:3306/iut";
    String USER="iut";
    String PASS="iutPass";
    String SQL="SELECT * FROM users LIMIT 5";
    System.out.println("JAVA JDBC client...");
    if (args.length>0) {
        if (args.length%2==0) {
          for (int i=0;i<args.length;i+=2) {
            if (args[i].equals("-c")) DRIVER=args[i+1];
            if (args[i].equals("-d")) DB_URL=args[i+1];
            if (args[i].equals("-u")) USER=args[i+1];
            if (args[i].equals("-p")) PASS=args[i+1];
            if (args[i].equals("-s")) SQL=args[i+1];
          }
        } else {
          System.err.println("Usage: java CBJDBC [-c DRIVER] [-d DB_URL]");
          System.err.println("           [-u USER] [-p PASS] [-s SQL]");
          System.err.println("Default values:");
          System.err.println(" DRIVER="+DRIVER);
          System.err.println(" DB_URL="+DB_URL);
          System.err.println(" USER="+USER);
          System.err.println(" PASS="+PASS);
          System.err.println(" SQL="+SQL);
          //System.err.println("With MySQL connector");
          //System.err.println(" DRIVER=com.mysql.jdbc.Driver");
          //System.err.println("With mariadb java client 1.5.4");
          //System.err.println(" DB_URL=jdbc:mysql://localhost/bibli?localSocket=/var/run/mysql/mysql.sock");
          System.exit(1);
        }
    }
    try {
      System.out.println("Loading driver: "+DRIVER);
      Class.forName(DRIVER);
      System.out.println("Connecting to database...");
      System.out.printf("%s\n",DB_URL);
      System.out.printf("%s@%s\n",USER,PASS);
      conn=DriverManager.getConnection(DB_URL,USER,PASS);
      System.out.println("Creating statement...");
      stmt=conn.createStatement();
      System.out.println("Execute query: "+SQL);
      ResultSet rs=stmt.executeQuery(SQL);
      ResultSetMetaData rsmd=rs.getMetaData();
      int numberOfColumns=rsmd.getColumnCount();
      while(rs.next()) {
        for (int i=1;i<=numberOfColumns;i++) {
          String key=rsmd.getColumnName(i);// Start from 1
          String val=rs.getString(i);
          if (i>1) System.out.printf(",");
          System.out.printf("%s:%s",key,val);
        }
        System.out.println();
      }
      rs.close();
      stmt.close();
      conn.close();
    } catch(SQLException se) {
      //Handle errors for JDBC
      se.printStackTrace();
    } catch(Exception e) {
      //Handle errors for Class.forName
      e.printStackTrace();
    } finally {
      try {
         if(stmt!=null) stmt.close();
         if(conn!=null) conn.close();
      } catch(SQLException se){
         se.printStackTrace();
      }
    }
    System.out.println("Goodbye!");
  }
}
