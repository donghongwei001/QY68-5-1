package com.ordersystem.dao;

import java.util.List;

import com.ordersystem.domain.FoodCategoryBean;

public interface FoodDao {
	/*@添加菜品
	 * @author hcb
	 */
	public int addFood(FoodCategoryBean fo);
	
	/*查询所有菜品的方法
	 * @author hcb
	 */
	public List QueryAllFood();
	
	/*@按id查询指定菜品
	 * @author hcb
	 */
	public List QueryFoodById(int id);
	
	/*@按名字查询指定菜品
	 * @author hcb
	 */
	public List QueryFoodByName(String name);
	
}
