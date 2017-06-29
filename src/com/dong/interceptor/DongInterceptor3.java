package com.dong.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.struts2.ServletActionContext;

import com.daofactory.Connpool;
import com.daofactory.DaoFactory;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.ordersystem.dao.impl.Userdaoimpl;

public class DongInterceptor3 extends MethodFilterInterceptor{
	
	
	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request=ServletActionContext.getRequest();
		String user=request.getParameter("username");
		String pass=request.getParameter("password");
		ArrayList tableList=new Userdaoimpl().executeQuery("select account_number,account_psw from account where account_status=15");
		for (int i = 0; i < tableList.size(); i++) {
			ArrayList list=(ArrayList) tableList.get(i);
			if (user.equals(list.get(0))&&pass.equals(list.get(1))) {
				//ArrayList list2=new DaoFactory().execQuery("select right_url from account a,emp_table e,role_right r,right_table o where a.account_fk_emp_id=e.emp_id and e.emp_fk_pos_id=r.role_right_roleid and r.role_right_rightid=o.right_id and a.account_number='"+user+"'", null);
				
					String resultp=arg0.invoke();
					return resultp;
			}
		}
		return "login";
	}
	
	
}
