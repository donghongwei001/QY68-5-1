package com.dong.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.struts2.ServletActionContext;

import com.daofactory.Connpool;
import com.daofactory.DaoFactory;
import com.ordersystem.dao.impl.Userdaoimpl;
import com.ordersystem.domain.CustBean;
import com.ordersystem.domain.CustBean_indent;
import com.ordersystem.domain.OrderBean;
import com.ordersystem.domain.RoleBean;
import com.ordersystem.service.CustService;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.xml.internal.messaging.saaj.packaging.mime.util.QEncoderStream;

public class CustAction extends BaseAction{
	Connpool cp = new Connpool();
	QueryRunner qr = new QueryRunner(cp.getDataSource());
	private CustBean_indent c;
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpSession session=ServletActionContext.getRequest().getSession();
	CustService ce=new CustService();
	public String xiaofeixq(){
		String cus_id = super.getparameter("cus_id");
		List<CustBean_indent> li=ce.shop(cus_id);
		super.setRequestAttr("list", li);
		return "successs";
	}

	public void selectuser() {
		String user=request.getParameter("name");
		List<CustBean> cb = ce.showCust(user);
		super.setsession("list", cb);
		try {
			request.getRequestDispatcher("/admin/products/cust_list.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String showAllCust(){
		List<CustBean> cb = ce.showAllCust();
		super.setsession("list", cb);
		System.out.println(request.getRequestURI());
		try { 
			request.getRequestDispatcher("/admin/products/cust_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	//权限管理
	public String quanxian(){
		System.out.println(request.getRequestURI());
		List<Object> query = null;
		try {
			query = qr.query("select role_name from role_table", new ColumnListHandler(1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("list", query);
		try {
			response.sendRedirect("/Ordersystem/admin/products/show_right.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//角色管理
	public String jiaose(){
		System.out.println(request.getRequestURI());
		List<RoleBean> query = null;
		try {
			query = qr.query("select role_id, role_name,code_name from role_table ,code_table where role_table.role_mark=code_table.code_id",new BeanListHandler<RoleBean>(RoleBean.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("list", query);
		try {
			response.sendRedirect("/Ordersystem/admin/products/money_edit.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private String rolename;
	private String zhuangtai;

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public String getZhuangtai() {
		return zhuangtai;
	}

	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	
	
	//角色验证
	public String checkrole(){
		try {
			Integer query = (Integer) qr.query("select role_id from role_table where role_name='"+getRolename()+"' ", new ScalarHandler(1));
			query=query==null?0:query;
			response.getWriter().print(query);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//增加角色
	public String addrole(){
		System.out.println(request.getRequestURI());
		
		try {
				String rolename=request.getParameter("rolename");
				String zhuangtai=request.getParameter("zhuangtai");
				Object[]params=new Object[]{rolename,zhuangtai};
				int flag=new DaoFactory().executeUpdate("insert into role_table(role_name,role_mark) values(?,?) ", params);
				
				response.sendRedirect("/Ordersystem/Ordersystem/cust_jiaose.action");
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	//修改角色状态
	public String changerole(){
		System.out.println(request.getRequestURI());
		String id=request.getParameter("id");
		try {
			String query = (String) qr.query("select role_mark from role_table where role_id='"+id+"' ", new ScalarHandler(1));
			int index=Integer.parseInt(query);
			index=index==14?15:14;
			System.out.println(index);
			Object[]params=new Object[]{index,id};
			int flag=new DaoFactory().executeUpdate("update role_table set role_mark=? where role_id=?", params);
			System.out.println(flag);
			if(index==14){
				//Object[]params1=new Object[]{id};
				int flag2=new DaoFactory().executeUpdate("delete from role_right where role_right_roleid='"+id+"'", null);
				System.out.println(flag2);		
			}
			response.sendRedirect("/Ordersystem/Ordersystem/cust_jiaose.action");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	private String quanxianname;
	
	public String getQuanxianname() {
		return quanxianname;
	}

	public void setQuanxianname(String quanxianname) {
		this.quanxianname = quanxianname;
	}

	//角色权限回填
	public String xiugaijuese(){
		String name=request.getParameter("quanxianname");
		session.setAttribute("quanxianname",name);
		String str = "";
		try {
			List<Object> query = qr.query("select o.right_id from role_table t,role_right r,right_table o where t.role_id=r.role_right_roleid and r.role_right_rightid=o.right_id and t.role_name='"+name+"'",new ColumnListHandler(1));
			for (int i=0;i<query.size();i++) {
				if(i>0){
					str+=",";
				}
				str+=query.get(i);
			}
			response.getWriter().write(str);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//修改角色权限
	public String xiugaiquanxian(){
		System.out.println(request.getRequestURI());
		String name=(String) session.getAttribute("quanxianname");
		try {
			Integer id = (Integer) qr.query("select role_id from role_table where role_name='"+name+"' ", new ScalarHandler(1));
			System.out.println(id);
			Object[]params=new Object[]{id};
			int index=new DaoFactory().executeUpdate("delete from role_right where role_right_roleid=?", params);
			System.out.println(index);
			String[] names=request.getParameterValues("box");
			for (int i = 0; i < names.length; i++) {
				Object[]params1=new Object[]{id,names[i]};
				int flag=new DaoFactory().executeUpdate("insert into role_right values(?,?)", params1);
				System.out.println(flag);
			}
			response.sendRedirect("/Ordersystem/admin/products/show_right.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return null;
	}
	
	
	//退出系统
	public String tuichu(){
		try {session.invalidate();
			response.sendRedirect("/Ordersystem/admin/login/denglu.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
