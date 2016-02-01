package com.pda.inter;


import java.text.ParseException;

import com.pda.model.DetailOrder;
import com.pda.model.Order;

public interface IOrderService {

	public String orderSubject(int sid,String date) throws ParseException;
	public void comfirmOrder(Order order);
	public DetailOrder getOrderDetail(int sid);
	public boolean deleteOrder(int sid);
	public boolean orderPermision(int id,int per);
}
