package com.hsinghsu.test.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {  
	  
    private static final long serialVersionUID = 8013816027944871760L;  
    private String username;// 登录用户名  
    private String password;// 登录密码  
    private String prePage;// 登录前页面  
    HttpSession session=ServletActionContext.getRequest().getSession();
    public String execute() throws Exception {  
          
        if (null != username && null != password && username.equals("hsing") && password.equals("hsu")) {  
  
            ActionContext ctx = ActionContext.getContext();  
              session = (HttpSession) ctx.getSession();  
              
            //保存用户信息session  
            ((ActionContext) session).put("user", getUsername());  
  
            // 获取跳转到登陆界面之前的页面地址，由拦截器提供  
            prePage = (String) ((ActionContext) session).get("prePage");  
  
            // 清除session中的数据  
            session.removeValue("prePage");  
  
            if (null == prePage) {  
                return "usercenter";// 不是拦截器跳转到登陆页面的，直接访问的登陆页面  
            } else {  
                return SUCCESS;// 是拦截器跳转到登陆登录前页面  
            }  
  
        } else {  
            return INPUT;  
        }  
    }  
  
    public void setUsername(String username) {  
        this.username = username;  
    }  
  
    public String getUsername() {  
        return this.username;  
    }  
  
    public void setPassword(String password) {  
        this.password = password;  
    }  
  
    public String getPassword() {  
        return this.password;  
    }  
  
    public String getPrePage() {  
        return prePage;  
    }  
  
    public void setPrePage(String prePage) {  
        this.prePage = prePage;  
    }  
}  
