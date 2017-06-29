package com.ConnPool;

import java.util.List;

public class PageUtil {//分页
	private int total;//总条数
	private List rows;//每次从数据库读取的数据量
	private String pageStr;//封装  分页 导航 连接
	private  int allPage;//使用总条数计算出来的总页数
	private  int  page;//当前的条数
	private  int currPage;//当前页码
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	public String getPageStr() {
		if (getCurrPage()<1)setCurrPage(0);
		if(getCurrPage()>getAllPage())setCurrPage(getAllPage());
		int flag1=0;
		int flag2=0;
		flag1=getCurrPage()-1;
		flag2=getCurrPage()+1;
		if (flag1==0) {
			flag1=1;
		}
		if (flag2>getAllPage()) {
			flag2=getAllPage();
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<a  href='/Ordersystem/Ordersystem/wei_query1.action?currPage=1&pageSize="+getPage()+"'>首页</a>");
		sb.append("<a  href='/Ordersystem/Ordersystem/wei_query1.action?currPage="+flag1+"&pageSize="+getPage()+"'>上一页</a>");	
		sb.append("<a  href='/Ordersystem/Ordersystem/wei_query1.action?currPage="+flag2+"&pageSize="+getPage()+"'>下一页</a>");
		sb.append("<a  href='/Ordersystem/Ordersystem/wei_query1.action?currPage="+getAllPage()+"&pageSize="+getPage()+"'>尾页</a>");
		return sb.toString(); 	
		
	}
	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}
	public int getAllPage() {
		allPage=getTotal()/getPage();
		if(getTotal()%getPage()>0){
			allPage++;
		}
		return allPage;
	}
	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
}
