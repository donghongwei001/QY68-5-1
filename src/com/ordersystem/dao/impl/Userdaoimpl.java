package com.ordersystem.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import com.daofactory.Connpool;
import com.ordersystem.domain.User;



public class Userdaoimpl {
	Connpool conn=new Connpool();
	
	public void save(User u){
		
		Connection connection=conn.getConnection();
		try {
			PreparedStatement pre=connection.prepareStatement("insert into cus_table(cus_name,cus_psw) values(?,?)");
			pre.setObject(1, u.getUser());
			pre.setObject(2, u.getPass());
			pre.executeUpdate();
			System.out.println("1");
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			conn.close();
		}
	}
	public ArrayList executeQuery(String sql){
		Connection con=conn.getConnection();
		ResultSet rs=null;
		ArrayList tableList=new ArrayList();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ResultSetMetaData rsm=rs.getMetaData();
			int cols=rsm.getColumnCount();
			while(rs.next()){
				ArrayList rowList=new ArrayList();
				for(int i=1;i<=cols;i++){

					rowList.add(rs.getObject(i));	
				}
				tableList.add(rowList);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return tableList;
	}
}
