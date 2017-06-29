package com.dong.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DefaultEditorKit.InsertBreakAction;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.ConnPool.NaturalPersonService;

import com.ConnPool.PageUtil;
import com.alibaba.fastjson.JSON;
import com.daofactory.Connpool;
import com.daofactory.DaoFactory;
import com.opensymphony.xwork2.ActionSupport;
import com.ordersystem.dao.impl.Userdaoimpl;
import com.ordersystem.domain.CaipinBean;
import com.ordersystem.domain.DisheBean;
import com.ordersystem.domain.GouwucheBean;
import com.ordersystem.domain.OrderBean;
import com.ordersystem.domain.OverOrderBean;
import com.ordersystem.domain.TableBean;
import com.ordersystem.entity.MyFormat;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.xml.internal.ws.message.StringHeader;

@ParentPackage("struts-default")

public class dongAction4 extends ActionSupport{
	private String value;
	//private Dongchaxun dongchaxun;

	Connpool cp = new Connpool();
	QueryRunner qr = new QueryRunner(cp.getDataSource());
	/*HttpServletRequest request=ServletActionContext.getRequest();
	public String save() throws ParseException{
	String shijian1=request.getParameter("shijiankuang1");
	String shijian2=request.getParameter("shijiankuang2");

	Object[] objects=new Object[]{shijian1,shijian2};
	ArrayList list =new DaoFactory().execQuery("select COUNT(*), sum(order_money) from order_table where order_time between ? and ? ", objects);
	request.setAttribute("list", list);*/
	private NaturalPersonService personService=new NaturalPersonService();

	HttpServletRequest request=ServletActionContext.getRequest();	
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpSession session=ServletActionContext.getRequest().getSession();


	//财务统计查询

	@Action("fenye")
	public String save() throws ServletException, IOException{
		System.out.println("11");
		String user=(String) session.getAttribute("user");
		System.out.println(user);
		List<Object> query = null;
		try {
			query = qr.query("select right_url from account a,emp_table e,role_right r,right_table o where a.account_fk_emp_id=e.emp_id and e.emp_fk_pos_id=r.role_right_roleid and r.role_right_rightid=o.right_id and a.account_status=15 and a.account_number='"+user+"'", new ColumnListHandler(1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(query.size());
		System.out.println(request.getRequestURI());
		for (int i = 0; i < query.size(); i++) {
			if (query.get(i).equals(request.getRequestURI())) {
				String shijian2=MyFormat.getDateformat().format(new Date());
				String shijian=MyFormat.getDateFormata().format(new Date());
				String shijian1=shijian+" 00:00:00";


				Object[]params=new Object[]{shijian1,shijian2};
				ArrayList list=new DaoFactory().execQuery("select count(*) ,sum(order_money) from order_table where order_time between ? and ?", params);
				session.setAttribute("list", list);
				response.sendRedirect("/Ordersystem/admin/products/money_list.jsp");
				return null;
			}
		}
		response.sendRedirect("/Ordersystem/lanjie.jsp");
		return null;
	}
	private String nameha;
	private String passha;




	public String getNameha() {
		return nameha;
	}


	public void setNameha(String nameha) {
		this.nameha = nameha;
	}


	public String getPassha() {
		return passha;
	}


	public void setPassha(String passha) {
		this.passha = passha;
	}

	//前台验证登录



	//前台注册验证
	@Action("zhuce")
	public String update(){
		System.out.println(getValue());
		HttpServletResponse response = ServletActionContext.getResponse(); 

		response.setContentType("text/html;charset=UTF-8"); 
		try {
			Object[]params =new Object[]{getValue()};
			ArrayList tableList=new DaoFactory().execQuery("select * from cus_table where cus_name=?",params);
			System.out.println(getValue());
			System.out.println(tableList.size());
			if (tableList.size()!=0) {
				String haha="ture";
				//String jsonstr=JSON.toJSONString(haha);
				response.getWriter().print(haha);
			}else {
				String haha="false";
				//String jsonstr=JSON.toJSONString(haha);
				response.getWriter().print(haha);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;

	}


	public String getValue() {
		return value;
	}


	public void setValue(String value) {
		this.value = value;
	}


	/*public Dongchaxun getDongchaxun() {
		return dongchaxun;
	}





	public void setDongchaxun(Dongchaxun dongchaxun) {
		this.dongchaxun = dongchaxun;
	}*/




	//财务查询
	@Action("chaxun")
	public String query(){
		String shijian1=request.getParameter("shijiankuang1");
		String shijian2=request.getParameter("shijiankuang2");
		try {
			if (!shijian1.equals("")&&!shijian2.equals("")) {
				Object[] objects=new Object[]{shijian1,shijian2};
				ArrayList list =new DaoFactory().execQuery("select count(*), sum(order_money) from order_table where order_time between ? and ?", objects);
				session.setAttribute("list1", list);
				response.sendRedirect("/Ordersystem/admin/products/money_list.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;

	}






	//订单时间查询
	@Action(value = "dongdingdan", results = { @Result(name = "error", location = "/admin/products/order_list.jsp") })
	public String dingdan(){

		HttpServletRequest request=ServletActionContext.getRequest();
		String shijian3=request.getParameter("shijiankuang3");
		String shijian4=request.getParameter("shijiankuang4");
		String name=request.getParameter("ordername");
		if (name==""&&(shijian3!=""&&shijian4!="")) {
			String sql = "select order_id,order_time,order_fk_tabid,order_money,order_fk_empid,order_fk_cusid,order_dt_score,oeder_dt_mark from order_table where order_time >=? and order_time<=?";
			//ArrayList tableList=new Userdaoimpl().executeQuery(sql);
			QueryRunner qr = new QueryRunner(cp.getDataSource());
			List<OrderBean> tableList = null;
			try {

				tableList = qr.query(sql, new BeanListHandler<OrderBean>(OrderBean.class),shijian3,shijian4);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("List1", tableList);


		}
		if (name!=""&&(shijian3==""&&shijian4=="")) {//select order_id,order_time,order_fk_tabid,order_money,order_fk_empid,order_fk_cusid,order_dt_score,oeder_dt_mark from order_table where order_id=?
			String sql = "select order_id,order_time,order_fk_tabid,order_money,emp_name,cus_name,order_dt_score,oeder_dt_mark,code_name from order_table ,cus_table,emp_table,code_table  where order_table.order_fk_cusid=cus_table.cus_id and order_table.order_fk_empid=emp_table.emp_id and order_table.order_status=code_table.code_id and order_id=?";
			//ArrayList tableList=new Userdaoimpl().executeQuery(sql);
			QueryRunner qr = new QueryRunner(cp.getDataSource());
			List<OrderBean> tableList = null;
			try {

				tableList = qr.query(sql, new BeanListHandler<OrderBean>(OrderBean.class),name);


			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			session.setAttribute("List1", tableList);

		}

		try {
			response.sendRedirect("/Ordersystem/admin/products/order_list.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	//订单分页

	//登录选桌
	@Action("dengluyan")
	public String dengluyanzheng() throws IOException{

		int flag=0;
		ArrayList list=new Userdaoimpl().executeQuery("select *  from cus_table");
		for (int i = 0; i < list.size(); i++) {
			ArrayList list1=(ArrayList) list.get(i);
			if (list1.get(1).equals(getNameha())&&list1.get(2).equals(getPassha())) {
				flag=1;
			}
		}

		response.getWriter().print(flag);

		return null;
	}


	@Action("shanchu")
	public String shanchu(){
		String name=request.getParameter("id");

		System.out.println(name);
		return null;
	}

	//加载菜品
	@Action("findfood")
	public String findfood() throws IOException{
		String id=request.getParameter("id");

		QueryRunner qr = new QueryRunner(cp.getDataSource());
		List<DisheBean> list1=null;
		try {
			list1 = qr.query("select food_id, food_name,food_price,food_pic from food_table where food_fk_dishes_id=? order by food_id asc", new BeanListHandler<DisheBean>(DisheBean.class),id);
			session.setAttribute("list1", list1);
			ArrayList list2=new Userdaoimpl().executeQuery("select count(*) from food_table where food_fk_dishes_id=1");
			session.setAttribute("list2", list2);
			response.sendRedirect("mainfood.jsp");
			System.out.println(list1.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	//所搜菜


	@Action("sousuocai")      
	public String sousuocai(){
		String foodname=request.getParameter("foodname");
		System.out.println(foodname);
		QueryRunner qr = new QueryRunner(cp.getDataSource());
		List<DisheBean> list1=null;

		try {
			list1 = qr.query("select food_id, food_name,food_price,food_pic from food_table where food_name like ?", new BeanListHandler<DisheBean>(DisheBean.class),"%"+foodname+"%");
			session.setAttribute("list1", list1);
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}





	//菜品详情
	@Action("foodintro")
	public String foodintro() throws IOException{
		String id=request.getParameter("id");
		QueryRunner qr = new QueryRunner(cp.getDataSource());
		List<DisheBean> tableList = null;
		try {

			tableList = qr.query("select food_id, food_name,food_price,food_pic,food_description from food_table where food_id =?", new BeanListHandler<DisheBean>(DisheBean.class),id);
		}catch (Exception e) {
			// TODO: handle exception
		}
		session.setAttribute("foodintro", tableList);
		response.sendRedirect("foodintro.jsp");
		return null;
	}


	private String index;
	private String name;
	private String price;

	public String getIndex() {
		return index;
	}


	public void setIndex(String index) {
		this.index = index;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}




	//下单
	@Action("xiadan")
	public String gouwuchegengxin(){
			
		try {
			String zhuahao=(String) session.getAttribute("zhuohao");
			if (zhuahao==null) {
				response.getWriter().print("true");
				return null;
			}

			String user=(String) session.getAttribute("user");
			String shijian=MyFormat.getDateformat().format(new Date());
			Integer money=(Integer) session.getAttribute("he");
			System.out.println(user+"***");
			Object[]params=new Object[]{user};
			//ArrayList<ArrayList> list=new DaoFactory().execQuery("select cus_id from cus_table where cus_name='"+user+"'",null);
			Integer list = (Integer) qr.query("select cus_id from cus_table where cus_name='"+user+"'", new ScalarHandler(1));
			System.out.println(list+"*********");
			Object[]params1=new Object[]{zhuahao};
			Integer list1 = (Integer) qr.query("select fk_emp_id from ser_tab where fk_table_id='"+zhuahao+"'", new ScalarHandler(1));
			//ArrayList<ArrayList> list1=new DaoFactory().execQuery("select fk_emp_id from ser_tab where fk_table_id=?", params1);
			System.out.println(list1+"************");
			ArrayList list5=(ArrayList) session.getAttribute("cart1");
			
			if (list5==null) {
				Object[]params2=new Object[]{shijian,zhuahao,money,list1,shijian,list};
				System.out.println("555");
				int flag=new DaoFactory().executeUpdate("insert into order_table(order_time,order_fk_tabid,order_money,order_fk_empid,order_lasttime,order_fk_cusid) values (?,?,?,?,?,?)", params2);
			}else {
				Object[]params5=new Object[]{money};
				int flag3=new DaoFactory().executeUpdate("update order_table set order_money=? ", params5);
			}
			QueryRunner qr = new QueryRunner(cp.getDataSource());
			Integer orderid = (Integer) qr.query("select order_id from order_table where order_fk_tabid=? and order_status=11", new ScalarHandler(1),zhuahao);
			session.setAttribute("orderid", orderid);
			ArrayList list2=(ArrayList) session.getAttribute("cart");
			for (int i = 0; i < list2.size(); i++) {
				GouwucheBean gBean=(GouwucheBean) list2.get(i);
				Object[]params3=new Object[]{orderid,gBean.getId(),gBean.getCount()};
				int flag1=new DaoFactory().executeUpdate("insert into order_food(fk_order_id,fk_food_id,order_food_num,order_food_status) values(?,?,?,1)", params3);
			}
			Object[]params4=new Object[]{zhuahao};
			int flag2=new DaoFactory().executeUpdate("update table_table set table_state=9 where table_id=?", params4);
			session.setAttribute("cart",null);
			QueryRunner qr2 = new QueryRunner(cp.getDataSource());
			List<OverOrderBean> tableList=qr2.query("select food_name, food_price,order_food_num from food_table,order_food where food_table.food_id=order_food.fk_food_id and order_food.fk_order_id=?", new BeanListHandler<OverOrderBean>(OverOrderBean.class),orderid);
			session.setAttribute("cart1", tableList);
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	private String kaitaimima;

	public String getKaitaimima() {
		return kaitaimima;
	}


	public void setKaitaimima(String kaitaimima) {
		this.kaitaimima = kaitaimima;
	}


	//开台验证
	@Action("kaitaiyanzheng")
	public String kaitaiyanzheng(){
		String kaitaimima=request.getParameter("kaitaimima");
		System.out.println(kaitaimima);
		int flag=0;
		if (kaitaimima.equals("123456")) {
			flag=1;
		}
		String str=null;
		try {
			if (flag==1) {
				QueryRunner qr = new QueryRunner(cp.getDataSource());
				List<TableBean> list1=null;
				try {
					list1 = qr.query("select table_id from table_table where table_state=8", new BeanListHandler<TableBean>(TableBean.class));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//ArrayList list1=new Userdaoimpl().executeQuery("select table_id from table_table where table_state=8");
				str=JSON.toJSONString(list1);
				System.out.println(list1);
			}else if (flag==0) {
				str=JSON.toJSONString(flag);
			}
			response.getWriter().print(str);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;


	}
	private String zhuohao;

	public String getZhuohao() {
		return zhuohao;
	}


	public void setZhuohao(String zhuohao) {
		this.zhuohao = zhuohao;
	}

	//开台
	@Action("kaitai")
	public String kaitai(){
		String zhuohao=request.getParameter("zhuohao");

		session.setAttribute("zhuohao", zhuohao);
		return null;
	}



	//结账
	@Action("jiezhang")
	public String jiezhang(){
		String pass=request.getParameter("jiezhangmima");
		Integer orderid=(Integer) session.getAttribute("orderid");
		String zhuohao=(String) session.getAttribute("zhuohao");
		if (pass.equals("123456")) {
			Object[]params=new Object[]{orderid};
			int flag=new DaoFactory().executeUpdate("update order_table set order_status=12 where order_id=?", params);
			System.out.println(flag);
			Object[]params1=new Object[]{zhuohao};
			int flag1=new DaoFactory().executeUpdate("update table_table set table_state=10 where table_id=? ", params1);
			System.out.println(flag1);
			try {
				session.invalidate();
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}



	//菜品导航
	@Action("caipindaohang")
	public String caipindaohang(){
		ArrayList list=new Userdaoimpl().executeQuery("select dishes_id, dishes_name from dishes_table");
		QueryRunner qr = new QueryRunner(cp.getDataSource());
		List<CaipinBean> list1=null;
		try {
			list1 = qr.query("select dishes_id, dishes_name from dishes_table", new BeanListHandler<CaipinBean>(CaipinBean.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("list", list1);
		try {
			response.sendRedirect("left.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	private String gerenxinxiname;
	private String gerenxinxipass;


	public String getGerenxinxiname() {
		return gerenxinxiname;
	}


	public void setGerenxinxiname(String gerenxinxiname) {
		this.gerenxinxiname = gerenxinxiname;
	}


	public String getGerenxinxipass() {
		return gerenxinxipass;
	}


	public void setGerenxinxipass(String gerenxinxipass) {
		this.gerenxinxipass = gerenxinxipass;
	}


	//@修改信息
	@Action("xiugaixinxi")
	public String xiugaixinxi(){
		String name=request.getParameter("gerenxinxiname");
		String pass=request.getParameter("gerenxinxipass");
		String oldname=(String) session.getAttribute("user");
		Object[]params=new Object[]{name,pass,oldname};
		int flag=new DaoFactory().executeUpdate("update cus_table set cus_name=?,cus_psw=? where cus_name=?", params);
		try {
			if (flag==1) {
				session.setAttribute("user", name);
				session.setAttribute("pass", pass);
			}
			response.getWriter().print(flag);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	private String pingfen;
	private String yijian;


	public String getPingfen() {
		return pingfen;
	}


	public void setPingfen(String pingfen) {
		this.pingfen = pingfen;
	}


	public String getYijian() {
		return yijian;
	}


	public void setYijian(String yijian) {
		this.yijian = yijian;
	}


	//评分 
	@Action("pingfen")
	public String pingfen(){
		String orderid=(String) session.getAttribute("orderid");
		String pingfen=request.getParameter("pingfen");
		String yijian=request.getParameter("yijian");
		System.out.println(orderid+pingfen+yijian);
		Object[]params=new Object[]{pingfen,yijian,orderid};
		int flag=new DaoFactory().executeUpdate("update order_table set order_dt_score=?,oeder_dt_mark=? where order_id=?", params);
		try {
			response.getWriter().print(flag);
			System.out.println(flag);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}



	//删除菜
	@Action("shanchucai")
	public String shanchucai(){
		System.out.println("111");
		ArrayList<GouwucheBean> list=(ArrayList<GouwucheBean>) session.getAttribute("cart");
		String caiid=request.getParameter("caiid");
		int he=(Integer) session.getAttribute("he");
		{
			for (GouwucheBean result : list) {
				if (result.getId() == Integer.parseInt(caiid)){
					int price=Integer.parseInt(result.getPrice());

					if (list.size()>1) {
						list.remove(result);

						he=he-price;
						System.out.println(he);
						session.setAttribute("cart", list);
					}else {
						ArrayList list2=(ArrayList) session.getAttribute("cart1");
						if (list2!=null) {
							he=he-price;
						}else {
							he=0;
						}
						session.setAttribute("cart", null);
					}
				}
			}
			session.setAttribute("he", he);
			try {
				response.sendRedirect("mainfood.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;

		}
	}
	//呼叫服务员
	@Action("hujiao")
	public String hujiao(){
		String zhuohao=(String) session.getAttribute("zhuohao");
		Object[]params=new Object[]{zhuohao};
		int flag=new DaoFactory().executeUpdate("update table_table set table_state=13 where table_id=?", params);
		try {
			response.getWriter().print(flag);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}



}




