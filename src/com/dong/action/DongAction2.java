package com.dong.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.daofactory.DaoFactory;

public class DongAction2{
	
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session=ServletActionContext.getRequest().getSession();
	public String save(){
		String user=request.getParameter("username");
		
		String pass=request.getParameter("password");
		session.setAttribute("pass", pass);
		session.setAttribute("user", user);
		
		return "ok";
	}
	



	public String dengluyanzheng(){
		
		
		return null;
	}
}
