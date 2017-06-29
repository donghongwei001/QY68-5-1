package com.dong.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.ordersystem.dao.impl.Userdaoimpl;
import com.ordersystem.domain.User;

public class dongAction {
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session=ServletActionContext.getRequest().getSession();
	private User u;
	public String save(){
		String user=request.getParameter("u.user");
		
		String pass=request.getParameter("u.pass");
		session.setAttribute("pass", pass);
		session.setAttribute("user", user);
		new Userdaoimpl().save(u);
		return "ok";
	}
	public String update(){
		return "ok";
	}
	public User getU() {
		return u;
	}
	public void setU(User u) {
		this.u = u;
	}
	
}
