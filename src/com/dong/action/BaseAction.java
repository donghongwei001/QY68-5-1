package com.dong.action;

import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class BaseAction {
	public void setRequestAttr(String key,Object value){
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(key,value);
	}
	public String getparameter(String name){
		HttpServletRequest request=ServletActionContext.getRequest();
		return request.getParameter(name);
	}
	public void write(String str){
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("html/text;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(str);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	public void setsession(String key,Object value){
		Map<String, Object> sessionMap=ActionContext.getContext().getSession();
		sessionMap.put(key, value);
	}
	public Object getsessionName(String key){
		Map<String, Object> sessionMap=ActionContext.getContext().getSession();
		return sessionMap.get(key);
	}
}
