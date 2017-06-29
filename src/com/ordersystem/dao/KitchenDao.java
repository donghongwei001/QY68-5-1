package com.ordersystem.dao;

import java.util.List;

import com.ordersystem.domain.SortKitchenFoodBean;
import com.ordersystem.domain.WaitFoodBean;

public interface KitchenDao {
	public List<SortKitchenFoodBean> showWaitFood(String sql,String sql2);
	public List<WaitFoodBean> showFood(String sql);
}
