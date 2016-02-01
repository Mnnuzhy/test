package com.pda.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pda.inter.IOrderService;
import com.pda.model.DetailOrder;
import com.pda.model.User;
import com.pda.model.Order;;


@Controller
@RequestMapping(value = "/Order")
public class OrderController {

	@Resource(name = "orderService")
	private IOrderService orderService;

	@RequestMapping(value = "/order.do")
	@ResponseBody
	public Object Order(@RequestParam(value = "subject") String subject,
			@RequestParam(value = "date") String date,HttpSession session) throws ParseException {
		
       User u=(User) session.getAttribute("user");
       String flag=orderService.orderSubject(u.getId(),date);
       System.out.println(flag+"******");
       if(subject.equals(flag)){
    	   return "5";
       }
	   return flag;
	}
	@RequestMapping(value = "/confirmOrder.do")
	@ResponseBody
	public void confirmOrder(@RequestParam(value = "subject") String subject,
			@RequestParam(value = "date") String date,HttpSession session) throws ParseException{
		
		System.out.println(subject+date);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	    Date d=sdf.parse(date);
	    User u=(User) session.getAttribute("user");
	    Order order=new Order();
	    order.setSid(u.getId());
	    order.setSubject(subject);
	    order.setDate(date);
	    order.setPermision("审核中");
	    orderService.comfirmOrder(order);
		
	}
	@RequestMapping(value = "/deleteOrder.do")
	@ResponseBody
	public void deleteOrder(HttpSession session){
		User u=(User) session.getAttribute("user");
		orderService.deleteOrder(u.getId());
		//return "sechedule";
	}
	
	@RequestMapping(value = "showOrder.do")
	@ResponseBody
	public Object showOrder(
			@RequestParam(value = "sid") String sid,
			HttpSession session) {
		int sid_1=Integer.parseInt(sid);
		DetailOrder order=orderService.getOrderDetail(sid_1);
		return order;
	}
	
	@RequestMapping(value = "perOrder.do")
	@ResponseBody
	public Object perOrder(
			@RequestParam(value = "id") String id,
			@RequestParam(value = "per") String per,
			HttpSession session) {
		int id_1=Integer.parseInt(id);
		int per_1=Integer.parseInt(per);
		orderService.orderPermision(id_1, per_1);
		return null;
	}

}
