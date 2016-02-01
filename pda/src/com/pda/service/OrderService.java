package com.pda.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pda.inter.IExamService;
import com.pda.inter.IOrderService;
import com.pda.inter.IStudentDao;
import com.pda.inter.ITrainerDao;
import com.pda.inter.IUserDao;
import com.pda.model.DetailOrder;
import com.pda.model.Order;
import com.pda.model.Student;
import com.pda.model.User;

@Service
@Transactional
public class OrderService implements IOrderService {

	@Qualifier(value = "studentDao")
	@Autowired
	private IStudentDao studentDao;
	
	@Qualifier(value = "userDao")
	@Autowired
	private IUserDao userDao;
	
	@Qualifier(value = "trainerDao")
	@Autowired
	private ITrainerDao trainerDao;

	@Override
	public void comfirmOrder(Order order) {
		// TODO Auto-generated method stub
		studentDao.SaveOrder(order);
	}

	@Override
	public String orderSubject(int sid,String date) throws ParseException {
		// TODO Auto-generated method stub
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 if(date.length()!=0){
	     Date d=sdf.parse(date);
	     Calendar currenDate = Calendar.getInstance();
	     currenDate.add(Calendar.DATE, 10);
	     if(d.before(currenDate.getTime()))
			   return "0";
		 }
		Student st = studentDao.getStudent(sid);
		Order order=studentDao.getOrder(sid);
		if(order!=null){
			System.out.println("********");
			return "-1";
		}
		if (st.getSubjectone() < 90) {
			return "1";

		} else if (st.getSubjecttow() < 90) {
			return "2";

		} else if (st.getSubjectthree() < 90) {
			return "3";

		} else if (st.getSubjectfour() < 90) {
			return "4";

		}
		return null;

	}

	@Override
	public DetailOrder getOrderDetail(int sid) {
		// TODO Auto-generated method stub
		Order order=studentDao.getOrder(sid);
		User user=userDao.getUserById(sid);
		DetailOrder dor=new DetailOrder();
		if(order!=null){
		dor.setId(order.getId());
		dor.setDate(order.getDate().toString());
		dor.setIdnumber(user.getIdnumber());
		dor.setSname(user.getName());
		dor.setSubject(order.getSubject());
		dor.setPermision(order.getPermision());
		dor.setImag(user.getImag());
		}
		return dor;
	}

	@Override
	public boolean deleteOrder(int sid) {
		// TODO Auto-generated method stub
		studentDao.deleteOrder(sid);
		return false;
	}

	@Override
	public boolean orderPermision(int id, int per) {
		// TODO Auto-generated method stub
		String permision=null;
		if(per==1)
			permision="通过";
		else 
			permision="未通过";
		trainerDao.updateOrder(id, permision);
		return false;
	}

}
