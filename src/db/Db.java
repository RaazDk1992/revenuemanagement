package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Db {
	private static final String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/inventory?useUnicode=true&characterEncoding=utf8";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static final String MAX_POOL = "250";
	// init connection object
	private Connection connection;
	// init properties object
	private Properties properties;
	
	public Db(){
		
	}
	private Properties getProperties() {
	    if (properties == null) {
	        properties = new Properties();
	        properties.setProperty("user", USERNAME);
	        properties.setProperty("password", PASSWORD);
	        properties.setProperty("MaxPooledStatements", MAX_POOL);
	    }
	    return properties;
	}
	public Connection connect() {
	    if (connection == null) {
	        try {
	            Class.forName(DATABASE_DRIVER).newInstance();
	            connection = DriverManager.getConnection(DATABASE_URL,"root","");
	        } catch (ClassNotFoundException | SQLException | InstantiationException| IllegalAccessException e) {
	            
	            e.printStackTrace();
	        }
	    }
	//    System.err.println(connection);
	    return connection;
	}
}
