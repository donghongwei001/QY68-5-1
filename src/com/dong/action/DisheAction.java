package com.dong.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ModelDriven;
import com.ordersystem.domain.DisheBean;
import com.ordersystem.domain.EmpBeam;
import com.ordersystem.domain.FoodCategoryBean;
import com.ordersystem.service.DisheService;

public class DisheAction extends BaseAction implements ModelDriven<DisheBean> {
	HttpServletRequest request=ServletActionContext.getRequest();
	DisheService ds = new DisheService();
	private DisheBean db;
	private File food_pic;
	private String food_picFileName;
	private String oldpic;				//旧图片的名字    如果没有更新 就用旧的
	public String getOldpic() {
		return oldpic;
	}

	public void setOldpic(String oldpic) {
		this.oldpic = oldpic;
	}

	public File getFood_pic() {
		return food_pic;
	}

	public void setFood_pic(File food_pic) {
		this.food_pic = food_pic;
	}

	public String getFood_picFileName() {
		return food_picFileName;
	}

	public void setFood_picFileName(String food_picFileName) {
		this.food_picFileName = food_picFileName;
	}

	public DisheBean getDb() {
		return db;
	}

	public void setDb(DisheBean db) {
		this.db = db;
	}
	
	public DisheBean getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	/**录入菜品的方法
	 * @author hcb
	 * 
	 */
	public String addDishe(){
		System.out.println(request.getRequestURI());
		String description = super.getparameter("description");
		String fileName = "";
		if (food_pic.length()!=0) {
			String suffix = food_picFileName.substring(food_picFileName.lastIndexOf('.')).toLowerCase();		//获取上传文件格式
			if (suffix.equals(".jpg")||suffix.equals(".jpeg")||suffix.equals(".gif")||suffix.equals(".png")) {
				try {
					FileInputStream is = new FileInputStream(food_pic);
					String path = ServletActionContext.getRequest().getRealPath("/");
					fileName = new Date().getTime()+suffix;
					FileOutputStream os = new FileOutputStream(new File(path+"uploadFile\\"+fileName));
					byte[] b = new byte[1024];
					int n = -1;
					while ((n = is.read(b))>0) {
						os.write(b, 0, n);
					}
					os.flush();
					os.close();
					is.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}else {
			return "error";
		}
		db.setFood_description(description);
		db.setFood_pic(fileName);
		ds.addDishes(db);		//调用添加的方法
		queryAllDishes();
		return "succ";
	}

	
	/**查询菜品的方法
	 * @author hcb
	 * 
	 */
	public String queryAllDishes(){
		System.out.println(request.getRequestURI());
		String food_name = super.getparameter("food_name");
		String food_id = super.getparameter("food_id");
		String category = super.getparameter("category");
		String minprice = super.getparameter("minprice");
		String maxprice = super.getparameter("maxprice");
		Map<String, String> ma = new HashMap<String, String>();
		Map<String, String> price = new HashMap<String, String>();
		if(food_name!=null&&!food_name.equals(""))ma.put("ft.food_name", food_name);
		if(food_id!=null&&!food_id.equals("")) ma.put("ft.food_id", food_id);
		if(category!=null&&!category.equals("")) ma.put("dt.dishes_id", category);
		if(minprice!=null&&!minprice.equals("")) price.put("minprice", minprice);
		if(maxprice!=null&&!maxprice.equals("")) price.put("maxprice", maxprice);
		Integer pageSize = 12;
		Integer pageStart = 0;
		
		List dishList = ds.queryDishe(ma,price,pageSize+"",pageStart+"");
		List<DisheBean> disheInfo = (List<DisheBean>) dishList.get(0);
		Integer count = (Integer) dishList.get(1);
		Integer total = count/pageSize;
		if(count%pageSize>0)total++;
		super.setsession("disheInfo", disheInfo);
		super.setsession("total", total);
		super.setsession("food_name", food_name);
		super.setsession("food_id", food_id);
		super.setsession("food_fk_dishes_id", category);
		super.setsession("minprice", minprice);
		super.setsession("maxprice", maxprice);
		return "succ";
	}
	
	/**ajax查询菜品的方法
	 * @author hcb
	 * 
	 */
	public String ajaxQueryDishes(){
		String food_name = super.getparameter("food_name");
		String food_id = super.getparameter("food_id");
		String category = super.getparameter("category");
		String minprice = super.getparameter("minprice");
		String maxprice = super.getparameter("maxprice");
		String pageNo = super.getparameter("pageNo");
		Map<String, String> ma = new HashMap<String, String>();
		Map<String, String> price = new HashMap<String, String>();
		if(food_name!=null&&!food_name.equals(""))ma.put("food_name", food_name);
		if(food_id!=null&&!food_id.equals("")) ma.put("food_id", food_id);
		if(category!=null&&!category.equals("")) ma.put("food_fk_dishes_id", category);
		if(minprice!=null&&!minprice.equals("")) price.put("minprice", minprice);
		if(maxprice!=null&&!maxprice.equals("")) price.put("maxprice", maxprice);
		Integer pageSize = 12;
		Integer pageStart = 0;
		Integer pageNum = null;
		try {
			pageNum = Integer.parseInt(pageNo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		pageStart = (pageNum-1)*pageSize;
		List dishList = ds.queryDishe(ma,price,pageSize+"",pageStart+"");
		List<DisheBean> disheInfo = (List<DisheBean>) dishList.get(0);
		Integer count = (Integer) dishList.get(1);
		Integer total = count/pageSize;
		if(count%pageSize>0)total++;
		String dish = JSON.toJSONString(disheInfo);		//转换为json字符串
		super.write(dish);								//写出json字符串
		super.setsession("disheInfo", disheInfo);
		super.setsession("total", total);
		super.setsession("food_name", food_name);
		super.setsession("food_id", food_id);
		super.setsession("category", category);
		super.setsession("minprice", minprice);
		super.setsession("maxprice", maxprice);
		return null;
	}
		
	/**显示菜系类别
	 * @author hcb
	 * 
	 */
	public String findCategory(){
		List<FoodCategoryBean> fcb = ds.findCategory();
		String str = JSON.toJSONString(fcb);
		super.write(str);
		return null;
	}
	
	/**删除
	 * @author hcb
	 * 
	 */
	public String delDishe(){
		System.out.println(request.getRequestURI());
		String del_id = super.getparameter("del_id");
		ds.del_dishe(del_id);
		ajaxQueryDishes();
		return null;
	}
	
	/**编辑菜品的方法
	 * @author hcb
	 * 
	 */
	public String editDishe(){
		System.out.println(request.getRequestURI());
		String food_id = super.getparameter("food_id");
		Map<String, String> ma = new HashMap<String, String>();
		ma.put("food_id", food_id);
		List foodli = ds.queryDishe(ma, null, "10", "0");
		if(foodli.size()!=0){
			DisheBean disheInfo = (DisheBean)((List) foodli.get(0)).get(0);
			super.setsession("disheInfo", disheInfo);
			return "edit";
		}
		return "error";
	}
	/**修改菜品信息的方法
	 * @author hcb
	 * 
	 */
	public String updateDishe(){
		String description = super.getparameter("description");
		String fileName = "";
		Integer food_picnum = (int) (food_pic==null?0:food_pic.length());
		if (food_picnum!=0) {
			String suffix = food_picFileName.substring(food_picFileName.lastIndexOf('.')).toLowerCase();		//获取上传文件格式
			if (suffix.equals(".jpg")||suffix.equals(".jpeg")||suffix.equals(".gif")||suffix.equals(".png")) {
				try {
					FileInputStream is = new FileInputStream(food_pic);
					String path = ServletActionContext.getRequest().getRealPath("/");
					fileName = new Date().getTime()+suffix;
					FileOutputStream os = new FileOutputStream(new File(path+"uploadFile\\"+fileName));
					byte[] b = new byte[1024];
					int n = -1;
					while ((n = is.read(b))>0) {
						os.write(b, 0, n);
					}
					os.flush();
					os.close();
					is.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					fileName=oldpic;
					e.printStackTrace();
				}
			}
		}else {
			fileName=oldpic;
		}
		db.setFood_description(description);
		db.setFood_pic(fileName);
		System.out.println(db);
		int i = ds.updateDishes(db);		//调用更新的方法
		queryAllDishes();
		return "succ";
	}

	public String se() {
		String tbname=super.getparameter("tbname");
		int flag=ds.seidcar(tbname);
		if (flag>0) {
			super.write("false");
		}else super.write("true");
		return null;
	} 
	
}
