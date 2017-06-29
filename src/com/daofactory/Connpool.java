package com.daofactory;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbcp.BasicDataSource;

public class Connpool {
	public static BasicDataSource getDataSource() {
		return dataSource;
	}
	public static void setDataSource(BasicDataSource dataSource) {
		Connpool.dataSource = dataSource;
	}
	private static BasicDataSource dataSource=null;
	static{
		
		dataSource=new BasicDataSource();
		dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		dataSource.setUrl("jdbc:sqlserver://localhost:1433; DatabaseName=orderdb");
		dataSource.setUsername("sa");
		dataSource.setPassword("123456");
		
	}
	public Connection getConnection(){

		try {
			if (dataSource!=null) {
				return dataSource.getConnection();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void close(){
		try {
			dataSource.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
