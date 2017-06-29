package com.dong.interceptor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.ordersystem.dao.impl.Userdaoimpl;

public class DongInterceptor extends MethodFilterInterceptor{
	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request=ServletActionContext.getRequest();
		String user=request.getParameter("u.user");
		String pass=request.getParameter("u.pass");
		int index=0;
		
		ArrayList tableList=new Userdaoimpl().executeQuery("select cus_name,cus_psw from cus_table");
		for (int i = 0; i < tableList.size(); i++) {
			ArrayList list=(ArrayList) tableList.get(i);
			if (user.equals(list.get(0))) {
				index=1;
					
			}
		}
		if (user==""||pass=="") {
			index=1;
		}
		if (index==0) {
			
			String result=arg0.invoke();
			return result;
		}
		return "login";
	}
	
}
