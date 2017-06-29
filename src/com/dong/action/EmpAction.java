package com.dong.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.StringValueExp;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ModelDriven;
import com.ordersystem.domain.EmpBeam;
import com.ordersystem.domain.RoleBean;
import com.ordersystem.service.EmpService;

public class EmpAction extends BaseAction implements ModelDriven<EmpBeam>{
	HttpServletRequest request=ServletActionContext.getRequest();
	EmpService es = new EmpService();
	private EmpBeam emp;
	private File emppic;	//文件上传
	private String emppicFileName;		//文件名字
	private String oldemppic;		//修改信息是如果没有更新照片则在前端页面中获取原来的图片名字
	public String getOldemppic() {
		return oldemppic;
	}
	public void setOldemppic(String oldemppic) {
		this.oldemppic = oldemppic;
	}
	public String getEmppicFileName() {
		return emppicFileName;
	}
	public void setEmppicFileName(String emppicFileName) {
		this.emppicFileName = emppicFileName;
	}
	public File getEmppic() {
		return emppic;
	}
	public void setEmppic(File emppic) {
		this.emppic = emppic;
	}
	public EmpBeam getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	public EmpBeam getEmp() {
		return emp;
	}
	public void setEmp(EmpBeam emp) {
		this.emp = emp;
	}
	public String saveEmp(){
		return null;
	}
	
	/**列出所有员工信息
	 * @author hcb
	 * 
	 */
	public String listEmp(){
		List<EmpBeam> allEmp = es.queryAllEmp();
		super.setsession("allemp", allEmp);
		return "succ";
	}
	
	/**添加员工
	 * @author hcb
	 * 
	 */
	public String addEmp(){
		System.out.println(request.getRequestURI());
		HttpServletRequest request=ServletActionContext.getRequest();
		String filename = "";
		try {
			if (emppic.length()>0) {	//判断有文件
				String suffix = emppicFileName.substring(emppicFileName.lastIndexOf('.')).toLowerCase();	//取图片格式名并转换成
				if(suffix.equals(".jpg")||suffix.equals(".jpeg")||suffix.equals(".gif")||suffix.equals(".png")){
					String path = request.getRealPath("/");		//得到文件的真实路径
					filename = new Date().getTime()+suffix;
					FileInputStream is = new FileInputStream(emppic);
					FileOutputStream os = new FileOutputStream(new File(path+"uploadFile\\"+filename));
					byte[] b = new byte[1024];
					int n = -1;
					while((n=is.read(b))>0){
						os.write(b, 0, n);
					}
					os.flush();
					os.close();
					is.close();
					emp.setEmp_pic(filename);
				}else{
					return "error";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		es.addEmp(emp);
		//listEmp();
		queryEmp();		//添加完成后需要调用查询的方法更新显示列表
		return "succ";		//转发到list页面
	}
	
	/**查询员工的方法
	 * @author hcb
	 * 
	 */
	public String queryEmp(){
		System.out.println(request.getRequestURI());
		String emp_id = super.getparameter("emp_id");
		String emp_name = super.getparameter("emp_name");
		String emp_gender = super.getparameter("emp_gender");
		String emp_idcar = super.getparameter("emp_idcar");
		String pageNo = super.getparameter("pageNo");
		
		Integer pageNb=null;
		try {
			pageNb = Integer.parseInt(pageNo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		pageNb = pageNb==null?1:pageNb;
		int pageSize = 10;
		String startIndex = (pageNb-1)*pageSize+"";
		Map<String , String> map = new HashMap<String , String>();
		if(emp_id!=null&&!emp_id.equals("")) map.put("et.emp_id", emp_id);
		if(emp_name!=null&&!emp_name.equals(""))map.put("et.emp_name", emp_name);
		if(emp_gender!=null&&!emp_gender.equals(""))map.put("et.emp_gender", emp_gender);
		if(emp_idcar!=null&&!emp_idcar.equals(""))map.put("et.emp_idcar", emp_idcar);
		List list = es.queryEmp(map,pageSize+"",startIndex);
		List<EmpBeam> empList = (List<EmpBeam>) list.get(0);
		String str = JSON.toJSONString(empList);
		//super.write(str);
		Integer count = (Integer) list.get(1);
		int ceil = count/pageSize;
		if (count%pageSize>0) {
			ceil++;
		}
		
		super.setsession("allemp", empList);
		super.setsession("emp_id", emp_id);
		super.setsession("emp_name", emp_name);
		super.setsession("emp_gender", emp_gender);
		super.setsession("emp_idcar", emp_idcar);
		super.setsession("total", ceil);
		return "succ";
			
	}
	
	/**ajax分页
	 * @author hcb
	 * 
	 */
	public String ajxQueryEmp(){
		String emp_id = super.getparameter("emp_id");
		String emp_name = super.getparameter("emp_name");
		String emp_gender = super.getparameter("emp_gender");
		System.out.println(emp_gender);
		String emp_idcar = super.getparameter("emp_idcar");
		String pageNo = super.getparameter("pageNo");	
		Integer pageNb=null; 	//当前页数
		try {
			pageNb = Integer.parseInt(pageNo);   
		} catch (Exception e) {
			// TODO: handle exception
		}
		pageNb = pageNb==null?1:pageNb;
		Map<String , String> map = new HashMap<String , String>();
		if(emp_id!=null&&!emp_id.equals("")) map.put("et.emp_id", emp_id);
		if(emp_name!=null&&!emp_name.equals(""))map.put("et.emp_name", emp_name);
		if(emp_gender!=null&&!emp_gender.equals(""))map.put("et.emp_gender", emp_gender);
		if(emp_idcar!=null&&!emp_idcar.equals(""))map.put("et.emp_idcar", emp_idcar);
		int pageSize = 10;
		String startIndex = (pageNb-1)*pageSize+"";
		List list = es.queryEmp(map,pageSize+"",startIndex);
		List<EmpBeam> empList = (List<EmpBeam>) list.get(0);
		String str = JSON.toJSONString(empList);
		Integer count = (Integer) list.get(1);
		int ceil = count/pageSize;
		if (count%pageSize>0) {
			ceil++;
		}
		
		super.setsession("allemp", empList);
		super.setsession("emp_id", emp_id);
		super.setsession("emp_name", emp_name);
		super.setsession("emp_gender", emp_gender);
		super.setsession("emp_idcar", emp_idcar);
		super.setsession("total", ceil);
		super.write(str);
			return null;
			
	}
	
	/**displayposition(显示职位)(ajax方法)
	 * @author hcb
	 * 
	 */
	public String showPosition(){
		List<RoleBean> roleList = es.findPosition();
		String str = JSON.toJSONString(roleList);
		System.out.println(str);
		super.write(str);
		return null;
	}
	
	/**编辑员工信息的方法
	 * @author hcb
	 * 
	 */
	public String editEmp(){
		
		String empId = super.getparameter("emp_id");
		Map<String, String> ma = new HashMap<String, String>();
		ma.put("emp_id", empId);
		List empli = es.queryEmp(ma, "5", "0");
		if(empli.size()!=0){
			EmpBeam empinfo = (EmpBeam)((List) empli.get(0)).get(0);
			super.setsession("empinfo", empinfo);
			return "edit";
		}
		return "error";
	}
	
	/**更新员工信息方法 
	 * @author hcb
	 * 
	 */
	public String updateInfo(){
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String filename = "";
		Integer filenum=(int) (emppic==null?0:emppic.length());
		try {
			if (filenum>0) {	//判断有文件
				String suffix = emppicFileName.substring(emppicFileName.lastIndexOf('.')).toLowerCase();	//取图片格式名并转换成
				if(suffix.equals(".jpg")||suffix.equals(".jpeg")||suffix.equals(".gif")||suffix.equals(".png")){
					String path = request.getRealPath("/");		//得到文件的真实路径
					filename = new Date().getTime()+suffix;
					FileInputStream is = new FileInputStream(emppic);
					FileOutputStream os = new FileOutputStream(new File(path+"uploadFile\\"+filename));
					byte[] b = new byte[1024];
					int n = -1;
					while((n=is.read(b))>0){
						os.write(b, 0, n);
					}
					os.flush();
					os.close();
					is.close();
					emp.setEmp_pic(filename);
				}else{
					return "error";
				}
			}else {
					emp.setEmp_pic(oldemppic);
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//listEmp();
		queryEmp();		//添加完成后需要调用查询的方法更新显示列表
		return "succ";		//转发到list页面
	}
	
	/**删除员工信息
	 * @author hcb
	 * 
	 */
	public String delEmp(){
		String del_id = super.getparameter("del_id");
		es.del_emp(del_id);
		ajxQueryEmp();
		return null;
	}
	
	/**身份证号重复性验证
	 * @author yhl
	 * 
	 */
	public String selidcar() {
		String idcar=super.getparameter("emp_idcar");
		int flag=es.seidcar(idcar);
		if (flag>0) {
			super.write("false");
		}else super.write("true");
		return null;
	}
	
	
}








