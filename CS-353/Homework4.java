package homework.pkg4;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Homework4 {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Wrong class!");
        }
        String url="jdbc:mysql://dijkstra2.ug.bcc.bilkent.edu.tr/" ;
        Connection con = null ;
        try{
            con = DriverManager.getConnection(url,"altaf.salemwala","1ss08dri");
        } catch (SQLException except ){
            System.out.println ( "Connection error");
        }
        Statement stmt = null;
        try {
            stmt = con.createStatement();
        } catch (SQLException ex) {
            System.out.println ( "Create statement error" );
        } catch (NullPointerException h) {
            System.out.println ( "Null error" );
        }
        try {
            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS altaf_salemwala");
        } catch (SQLException ex) {
            System.out.println ( "Create Database error" );
        }
        try {
            stmt.executeUpdate("USE altaf_salemwala");
        } catch (SQLException ex) {
            System.out.println ( "Use Database error" );
        }
        try {
            /*
            stmt.executeUpdate("DROP TABLE IF EXISTS ali");

            stmt.executeUpdate("CREATE TABLE ali(cid CHAR(12), " +
                    "name VARCHAR(50), bdate DATE, " +
                    "PRIMARY KEY(cid))ENGINE=innodb;");
            
            stmt.executeUpdate("INSERT INTO ali VALUES(\"j\", \"altf\", " +
                    "\"2012-01-01\")");
            */
            stmt.executeUpdate("DROP TABLE IF EXISTS owns");
            stmt.executeUpdate("DROP TABLE IF EXISTS customer");
            stmt.executeUpdate("DROP TABLE IF EXISTS account");

            stmt.executeUpdate("CREATE TABLE customer(cid CHAR(12), " +
                    "name VARCHAR(50), bdate DATE, address VARCHAR(50), " +
                    "city VARCHAR(20), nationality VARCHAR(20), " +
                    "PRIMARY KEY(cid))ENGINE=innodb;");
            stmt.executeUpdate("CREATE TABLE account(aid CHAR(8), " +
                    "branch VARCHAR(20), balance FLOAT, openDate DATE, " +
                    "PRIMARY KEY(aid))ENGINE=innodb;");
            stmt.executeUpdate("CREATE TABLE owns(cid CHAR(12), " +
                    "aid CHAR(8), PRIMARY KEY(aid, cid), " +
                    "FOREIGN KEY(cid) REFERENCES customer(cid) ON DELETE CASCADE, " +
                    "FOREIGN KEY(aid) REFERENCES account(aid) ON DELETE CASCADE)" +
                    "ENGINE=innodb;");
        } catch (SQLException ex) {
            System.out.println ("Error in dropping old tables and recreating");
        }
        
        ArrayList<String> cList = new ArrayList();
        cList.add("20000001 Cem 1980-10-10 Tunali ankara TC");
        cList.add("20000002 Asli 1985-09-08 nisantasi istanbul TC");
        cList.add("20000003 Ahmet 1995-02-11 Karsiyaka izmir TC");
        
        ArrayList<String> aList = new ArrayList();
        aList.add("A0000001 kizilay 2000.00 2009-01-01");
        aList.add("A0000002 bilkent 8000.00 2011-01-01");
        aList.add("A0000003 cankaya 4000.00 2012-01-01");
        aList.add("A0000004 sincan 1000.00 2012-01-01");
        aList.add("A0000005 tandogan 3000.00 2013-01-01");
        aList.add("A0000006 eryaman 5000.00 2015-01-01");
        aList.add("A0000007 umitkoy 6000.00 2017-01-01");
        
        ArrayList<String> oList = new ArrayList();
        oList.add("20000001 A0000001");
        oList.add("20000001 A0000002");
        oList.add("20000001 A0000003");
        oList.add("20000001 A0000004");
        oList.add("20000002 A0000002");
        oList.add("20000002 A0000003");
        oList.add("20000002 A0000005");
        oList.add("20000003 A0000006");
        oList.add("20000003 A0000007");
        
        for (String s: cList){
            try {
                String[] split = s.split(" ");
                stmt.executeUpdate("INSERT INTO customer VALUES(" +
                        "\"" + split[0] + "\", \"" + split[1] + "\", \"" +
                        split[2] + "\", \"" + split[3] + "\", \"" + split[4] +
                        "\", \"" + split[5] + "\")");
            } catch (SQLException ex) {
               System.out.println("Error inserting into customer");
            }
        }
        for (String s: aList){
            try {
                String[] split = s.split(" ");
                stmt.executeUpdate("INSERT INTO account VALUES(\"" +
                        split[0] + "\", \"" + split[1] + "\", " + split[2] +
                        ", \"" + split[3] + "\")");
            } catch (SQLException ex) {
               System.out.println("Error inserting into account");
            }
        }
        for (String s: oList){
            try {
                String[] split = s.split(" ");
                stmt.executeUpdate("INSERT INTO owns VALUES(\"" +
                        split[0] + "\", \"" + split[1] + "\")");
            } catch (SQLException ex) {
               System.out.println("Error inserting into owns");
            }
        }

        ResultSet rs;
        try {
            rs = stmt.executeQuery("SELECT * FROM customer");
            System.out.println("cid -- name -- bdate -- address -- city -- nationality");
            while ( rs.next() ) {
                String cid, name, bdate, address, city, nationality;
                cid = rs.getString(1);
                name = rs.getString(2);
                bdate = rs.getString(3);
                address = rs.getString(4);
                city = rs.getString(5);
                nationality = rs.getString(6);
                System.out.println(cid + " -- " + name + " -- " + bdate +
                        " -- " + address  + " -- " + city  + " -- " + nationality);
            }
        } catch (SQLException ex) {
            System.out.println("Error selecting from customer");
        }
        
        try {
            rs = stmt.executeQuery("SELECT * FROM account");
            System.out.println("aid -- branch -- balance -- opendate");
            while ( rs.next() ) {
                String aid, branch, opendate;
                float balance;
                aid = rs.getString(1);
                branch = rs.getString(2);
                balance = Float.valueOf(rs.getString(3));
                opendate = rs.getString(4);
                System.out.println(aid + " -- " + branch + " -- " + balance +
                        " -- " + opendate);
            }
        } catch (SQLException ex) {
            System.out.println("Error selecting from account");
        }
        
        try {
            rs = stmt.executeQuery("SELECT * FROM owns");
            System.out.println("cid -- aid");
            while ( rs.next() ) {
                String cid, aid;
                cid = rs.getString(1);
                aid = rs.getString(2);
                System.out.println(cid + " -- " + aid);
            }
        } catch (SQLException ex) {
            System.out.println("Error selecting from owns");
        }
    }
}