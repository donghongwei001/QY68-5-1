package com.ConnPool;

import java.sql.Connection;

import org.apache.commons.dbcp.BasicDataSource;

public class ConnPool {
	private static BasicDataSource dataSource=null;
	public static BasicDataSource getDataSource() {
		return dataSource;
	}
	public static void setDataSource(BasicDataSource dataSource) {
		ConnPool.dataSource = dataSource;
	}
	static{
		dataSource=new BasicDataSource();
		dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		dataSource.setUrl("jdbc:sqlserver://localhost:1433;DatabaseName=orderdb");
		dataSource.setUsername("sa");
		dataSource.setPassword("123456");
	}
	public static Connection getConnection(){
		try{
			return dataSource.getConnection();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public static void close(){
		try{
			dataSource.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
