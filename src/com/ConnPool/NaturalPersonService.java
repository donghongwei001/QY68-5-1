package com.ConnPool;

import java.util.List;



public class NaturalPersonService {
		private NaturalPersonDao persondao=new NaturalPersonDao();
		public PageUtil select(Integer currPage,Integer pageSize){
			currPage =currPage==null?1:currPage;
			pageSize = pageSize==null?5:pageSize;
			int startIndex=(currPage-1)*pageSize;
			List list = persondao.queryPerson(startIndex, pageSize);
			int total=persondao.getCount();
			PageUtil util=new PageUtil();
			util.setRows(list);
			util.setTotal(total);
			util.setPage(pageSize);
			util.setCurrPage(currPage);
			return util;
			
		}
}
