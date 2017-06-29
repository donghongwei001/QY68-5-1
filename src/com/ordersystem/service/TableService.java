package com.ordersystem.service;

import java.util.ArrayList;
import java.util.List;

import com.ordersystem.dao.impl.TableImpl;
import com.ordersystem.domain.TableBean;
import com.ordersystem.domain.Table_indent;
import com.ordersystem.domain.ser_tabBean;

public class TableService {
	TableImpl tq = new TableImpl();
	
	/**
	 * 
	 * 方法功能说明：  查询所有桌子信息
	 */
	public List<TableBean> seleA() {
		return tq.seleall();
	}
	
	public List<TableBean> selezhuohao(String table_id) {
		return tq.ss(table_id);
	}
	
	public List<Table_indent> selwaiter() {
		return tq.selewaiter();
	}
	
	public void addtable( TableBean tb,ser_tabBean st) {
		tq.addzhuo(tb,st);
	}
	/**
	 * 方法功能说明： 修改桌子信息
	 */
	public void updatee(TableBean tb,ser_tabBean st,String tb_id) {
		tq.update(tb,st,tb_id);
	}
	
	public void seleid(TableBean tb,ser_tabBean st,String id) {
		tq.deltable(tb,st, id);
	}
	public int seidcar(String tbname) {
		int fll = tq.sltbname(tbname);
		return fll;
	}
	
	public List<TableBean> findonetab(String id) {
		// TODO Auto-generated method stub
		String sql = "select * from table_table,ser_tab where table_id=fk_table_id and table_id="+id;
		return tq.findonetb(sql);
	}
}
