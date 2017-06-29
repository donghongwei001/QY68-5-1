package com.dong.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.daofactory.DaoFactory;
import com.opensymphony.xwork2.ModelDriven;
import com.ordersystem.domain.EmpBeam;
import com.ordersystem.domain.TableBean;
import com.ordersystem.domain.Table_indent;
import com.ordersystem.domain.ser_tabBean;
import com.ordersystem.service.TableService;



public class TableAction extends BaseAction {
	/*	HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		TableService ts=new TableService();
		public String selezhuo() {
			String table_id = super.getparameter("zhuohao");
			List<TableBean> li=ts.selezhuohao(table_id);
			super.setsession("list", li);
			System.out.println("11111");
			return "ss";
		}
		
		public String seleAll() { 
			List<TableBean> li=ts.seleA();
			super.setsession("list", li);
			
			try {
				request.getRequestDispatcher("/admin/products/table_list.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "ss";
		}
		*//**
		 * 用json得到查出的服务员的
		 *//*
		public String sewaiter() {
			List<Table_indent> li=ts.selwaiter();
			String str = com.alibaba.fastjson.JSON.toJSONString(li);
			super.write(str);
			return null;*/
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	TableService ts=new TableService();
	/**
	 * 方法功能说明：  根据桌号查询桌子信息
	 */
	public String selezhuo() {
		String table_id = super.getparameter("zhuohao");
		List<TableBean> li=ts.selezhuohao(table_id);
		super.setsession("list", li);
		System.out.println("11111");
		return "ss";
	}

	public String seleAll() { 
		List<TableBean> li=ts.seleA();
		super.setsession("list", li);
		try {
			request.getRequestDispatcher("/admin/products/table_list.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "ss";
	}
	/**
	 * 用json得到查出的服务员的
	 */
	public String sewaiter() {
		List<Table_indent> li=ts.selwaiter();
		String str = com.alibaba.fastjson.JSON.toJSONString(li);
		super.write(str);
		return null;
	}

	/**
	 * 
	 * 方法功能说明： 增加桌子 
	 */
	public String addzhuozi() {
		int table_state=8;
		TableBean tb=new TableBean();
		ser_tabBean st=new ser_tabBean();
		String pnum = super.getparameter("pnum");      //获得可供餐人数
		String emp_fk_pos_id=super.getparameter("emp_fk_pos_id"); //获得选中后服务员的 ID
		String table_name=super.getparameter("table_name"); //获得添加桌子的name
		try {
			tb.setTable_Capacity(Integer.parseInt(pnum));
			tb.setTable_state(String.valueOf(table_state));
			tb.setTable_name(table_name);
			st.setFk_emp_id(Integer.parseInt(emp_fk_pos_id));
		} catch (Exception e) {
			// TODO: handle exception
		}
		ts.addtable(tb,st);
		seleAll();			//返回餐桌页面并重新查询
		return "ss";
	}

	public EmpBeam getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 
	 * 方法功能说明： 餐桌信息编辑时获得桌子ID
	 * @throws UnsupportedEncodingException 
	 */
	public String seid() throws UnsupportedEncodingException {
		String id=super.getparameter("tabled");
		List<TableBean> onetb = ts.findonetab(id);
		System.out.println(onetb.get(0).getFk_emp_id());
		super.setsession("tab", onetb.get(0));
		return "up";
	}

	/** 
	 * 方法功能说明：  修改桌子信息
	 *people:获取修改后的可供餐人数
	 *t_name:修改后的桌子名字
	 *emp_fk_pos_id:修改后的服务员ID
	 *tb_id:获取桌子ID 
	 */
	public String updatezhuozi(){
		System.out.println(request.getRequestURI());
		TableBean tb=new TableBean();
		ser_tabBean st=new ser_tabBean();
		String tb_id=super.getparameter("id");
		String people=super.getparameter("people");
		String t_name=super.getparameter("t_name");
		String emp_fk_pos_id=super.getparameter("emp_fk_pos_id");
		try {
			tb.setTable_Capacity(Integer.parseInt(people));
			tb.setTable_name(t_name);
			st.setFk_emp_id(Integer.parseInt(emp_fk_pos_id));
		} catch (Exception e) {
			// TODO: handle exception
		}
		ts.updatee(tb,st,tb_id);
		seleAll();
		return "ss";
	}
	
	/** 
	 * 方法功能说明：  删除餐桌
	 * id:要删除的桌子的id
	 */
	public String del(){
		System.out.println(request.getRequestURI());
		String id=super.getparameter("tab");
		TableBean tb=new TableBean();
		ser_tabBean st=new ser_tabBean();
		ts.seleid(tb, st, id);
		seleAll();
		return "ss";
	}
	
	/** 
	 * 方法功能说明：  编辑桌子信息失焦查询桌子名称是否存在
	 * 
	 */
	public String sltbname() {
		String tbname=super.getparameter("tbname");
		int flag=ts.seidcar(tbname);
		if (flag>0) {
			super.write("false");
		}else super.write("true");
		return null;
	}
	
}
