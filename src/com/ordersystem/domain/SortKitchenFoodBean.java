package com.ordersystem.domain;

/**@ WaitFoodBean的包装类  为排序提供权重和并菜的数量
 * @author hcb
 * 
 */
public class SortKitchenFoodBean {
	private WaitFoodBean wfb;
	private String order_food_id;	//id编号
	private String foodnum;	//记录合并菜品后该菜的数量
	private String tabid;	//餐桌编号
	private String orderId;	//订单编号  在更新餐桌最后上菜时间的时候需要用到
	
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Override
	public String toString() {
		return "wfb=" + wfb + ", order_food_id="
				+ order_food_id + ", foodnum=" + foodnum + ", tabid=" + tabid;
	}
	
	public String getOrder_food_id() {
		return order_food_id;
	}
	public void setOrder_food_id(String order_food_id) {
		this.order_food_id = order_food_id;
	}
	public String getTabid() {
		return tabid;
	}
	public void setTabid(String tabid) {
		this.tabid = tabid;
	}
	public WaitFoodBean getWfb() {
		return wfb;
	}
	public void setWfb(WaitFoodBean wfb) {
		this.wfb = wfb;
	}

	public String getFoodnum() {
		return foodnum;
	}

	public void setFoodnum(String foodnum) {
		this.foodnum = foodnum;
	}
	
	
}
