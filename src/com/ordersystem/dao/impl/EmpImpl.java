package com.ordersystem.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.daofactory.Connpool;
import com.daofactory.DaoFactory;
import com.ordersystem.dao.EmpDao;
import com.ordersystem.domain.EmpBeam;
import com.ordersystem.domain.RoleBean;

public class EmpImpl implements EmpDao{
	Connpool  cp = new Connpool();
	QueryRunner qr = new QueryRunner(cp.getDataSource());
	DaoFactory dt=new DaoFactory();
	
	/**添加员工的方法
	 * @author hcb
	 * 
	 */
	public void addEmp(EmpBeam emp) {
		// TODO Auto-generated method stub
		String sql = "insert into emp_table  values(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[]{emp.getEmp_name(),emp.getEmp_gender(),emp.getEmp_birday(),emp.getEmp_age(),emp.getEmp_idcar(),emp.getEmp_address(),emp.getEmp_hire_date(),emp.getEmp_fk_pos_id(),emp.getEmp_state(),emp.getEmp_phone(),emp.getEmp_pic()};
		DaoFactory.executeUpdate(sql, params);
		/*QueryRunner qr = new QueryRunner(cp.getBds());
		try {
			qr.update(sql, emp.getEmp_name(),emp.getEmp_gender(),emp.getEmp_birday(),emp.getEmp_age(),emp.getEmp_idcar(),emp.getEmp_address(),emp.getEmp_hire_date(),emp.getEmp_fk_pos_id(),emp.getEmp_state(),emp.getEmp_phone(),emp.getEmp_pic());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	
	/**查询所有员工的方法
	 * @author hcb
	 * 
	 */
	public List<EmpBeam> queryAllEmp() {
		String sql = "select et.emp_id,et.emp_name,et.emp_gender,et.emp_birday,et.emp_age,et.emp_idcar,et.emp_address,et.emp_hire_date,rt.role_name,et.emp_fk_pos_id,ct.code_name emp_state,et.emp_phone,et.emp_fk_pos_id,et.emp_pic from role_table rt,emp_table et,code_table ct where rt.role_id=et.emp_fk_pos_id and ct.code_id=et.emp_state";//到这里没写
		List<EmpBeam> allEmp = null;
		try {
			allEmp = qr.query(sql, new BeanListHandler<EmpBeam>(EmpBeam.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allEmp;
	}

	public List<EmpBeam> queryEmpByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**综合查询员工
	 * @author hcb
	 * 
	 */
	public List queryEmp(String sta,String pageSize,String startIndex) {
		// TODO Auto-generated method stub
		String sql = "select top "+pageSize+" et.emp_id,et.emp_name,et.emp_gender,et.emp_birday,et.emp_age,et.emp_idcar,et.emp_address,et.emp_hire_date,et.emp_fk_pos_id,ct.code_id,ct.code_name emp_state,et.emp_phone,rt.role_name,et.emp_fk_pos_id,et.emp_pic from role_table rt,emp_table et,code_table ct where rt.role_id=et.emp_fk_pos_id and ct.code_id=et.emp_state "+sta+" and et.emp_id not in(select top "+startIndex+" et.emp_id from role_table rt,emp_table et,code_table ct where rt.role_id=et.emp_fk_pos_id and ct.code_id=et.emp_state "+sta+" order by et.emp_id asc) order by et.emp_id asc";
		String sql2 = "select count(*) from role_table rt,emp_table et,code_table ct where rt.role_id=et.emp_fk_pos_id and ct.code_id=et.emp_state "+sta+"";
		List page = new ArrayList();
		try {
			List<EmpBeam> allEmp = qr.query(sql, new BeanListHandler<EmpBeam>(EmpBeam.class));
			Integer count = (Integer) qr.query(sql2, new ScalarHandler(1));
			count = count==null?0:count;
			page.add(allEmp);
			page.add(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return page;
	}

	/**查找职位信息
	 * @author hcb
	 * 
	 */
	public List<RoleBean> findPosition() {
		// TODO Auto-generated method stub
		String sql = "select * from role_table";
		List<RoleBean> roleList = null;
		try {
			roleList = qr.query(sql, new BeanListHandler<RoleBean>(RoleBean.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return roleList;
	}

	/**删除员工的方法
	 * @author hcb
	 * 
	 */
	public void delEmp(String del_id) {
		// TODO Auto-generated method stub
		String sql = "delete emp_table where emp_id=?";
		Object[] params = new Object[]{del_id};
		DaoFactory.executeUpdate(sql, params);
		/*try {
			qr.0update(sql, del_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	
	/**
	 * 
	 * 方法功能说明：  增加员工时查询身份证号是否存在
	 */
	public int sidcar(String idcar) {
		Object[] arr=new Object[]{idcar};
		String sql="select emp_idcar from emp_table where emp_idcar=?";
		int fl=dt.execQuery(sql, arr).get(0).size();
		return fl;
	}
	
	/**执行插入更新的方法
	 * @author hcb
	 * 
	 */
	public Integer update(String sql,Object[] params){
		
		return DaoFactory.executeUpdate(sql, params);
	}

}
