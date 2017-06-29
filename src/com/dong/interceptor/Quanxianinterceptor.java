package com.dong.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class Quanxianinterceptor extends MethodFilterInterceptor{
	
	
	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		// TODO Auto-generated method stub
		System.out.println(request.getSession().getAttribute("quanxian"));
		List<Object> list=(List) request.getSession().getAttribute("quanxian");
		try {
			for (int i = 0; i < list.size(); i++) {
				
				if (list.get(i).equals(request.getRequestURI())) {
					String resultp=arg0.invoke();
					return resultp;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			return "lanjie";
		}
		return "lanjie";
		
		
		
	}
	
}
