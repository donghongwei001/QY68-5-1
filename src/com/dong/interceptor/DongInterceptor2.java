package com.dong.interceptor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.daofactory.DaoFactory;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.ordersystem.dao.impl.Userdaoimpl;

public class DongInterceptor2 extends MethodFilterInterceptor{
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request=ServletActionContext.getRequest();
		String user=request.getParameter("username");
		String pass=request.getParameter("password");
		
		ArrayList tableList=new Userdaoimpl().executeQuery("select cus_name,cus_psw from cus_table");
		for (int i = 0; i < tableList.size(); i++) {
			ArrayList list=(ArrayList) tableList.get(i);
			if (user.equals(list.get(0))&&pass.equals(list.get(1))) {
					/*Object[]params=new Object[]{user};
					ArrayList list2=new DaoFactory().execQuery("select order_status  from cus_table,order_table where cus_table.cus_id=order_table.order_fk_cusid and cus_name=? and order_table.order_status=11", params);
					if (list2==null) {*/
						String resultp=arg0.invoke();
						return resultp;
					/*}*/
					
			}
		}
		return "login";
	}
}
