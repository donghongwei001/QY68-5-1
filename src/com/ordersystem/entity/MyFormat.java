package com.ordersystem.entity;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class MyFormat {
	
	/**获取时间格式为yyyy-MM-dd HH:mm:ss
	 * @author hcb
	 * 
	 */
	public static SimpleDateFormat getDateformat(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf;
	}
	
	/**获取时间格式为yyyy-MM-dd
	 * @author hcb
	 * 
	 */
	public static SimpleDateFormat getDateFormata(){
		SimpleDateFormat sddf = new SimpleDateFormat("yyyy-MM-dd");
		return sddf;
	}
	
	/**获取时间格式为yyyy-MM-dd HH:mm:ss HH为24小时制
	 * @author hcb
	 * 
	 */
	public static SimpleDateFormat getLastServingFormat(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf;
	}
	
	/**获得当天0点的时间戳
	 * @author hcb
	 * 
	 */
	public static Timestamp getDayBegin() {
		  Calendar cal = Calendar.getInstance();
		  cal.set(Calendar.HOUR_OF_DAY, 0);
		  cal.set(Calendar.SECOND, 0);
		  cal.set(Calendar.MINUTE, 0);
		  cal.set(Calendar.MILLISECOND, 001);
		  return new Timestamp(cal.getTimeInMillis());
		 }
	
	/**获得当天0点的时间戳
	 * @author hcb
	 * 
	 */
	 public static Timestamp getDayBeginTimestamp() {
		  Date date = new Date();
		  GregorianCalendar gc = new GregorianCalendar();
		  gc.setTime(date);
		  Date date2 = new Date(date.getTime() - gc.get(gc.HOUR_OF_DAY) * 60 * 60
		    * 1000 - gc.get(gc.MINUTE) * 60 * 1000 - gc.get(gc.SECOND)
		    * 1000);
		  return new Timestamp(date2.getTime());
		 }
	
	public static void main(String[] args) {
		System.out.println(getDateformat().format(new Date()));
		System.out.println(new Date());
		System.out.println(getDayBegin()+"****");
		System.out.println(getDayBeginTimestamp()+"-----");
		 try {
			 Timestamp dayBegin = getDayBegin();
			getDateformat().parse("2017.12.12");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
