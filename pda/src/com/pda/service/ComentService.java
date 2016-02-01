package com.pda.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pda.dao.AdminDao;
import com.pda.inter.IAdminDao;
import com.pda.inter.IComentService;
import com.pda.inter.IStudentDao;
import com.pda.inter.ITrainerDao;
import com.pda.inter.IUserDao;
import com.pda.model.Coment;
import com.pda.model.DetailComent;

@Service
@Transactional
public class ComentService implements IComentService{

	@Qualifier(value = "studentDao")
	@Autowired
	private IStudentDao studentDao;
	
	@Qualifier(value = "userDao")
	@Autowired
	private IUserDao userDao;

	@Qualifier(value = "trainerDao")
	@Autowired
	private ITrainerDao trainerDao;
	
	@Qualifier(value = "adminDao")
	@Autowired
	private IAdminDao adminDao;

	
	@Override
	public int leaveComent(int sid, String content,int tid,int flag) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:ss:mm");
		String date=sdf.format(new Date());
		Coment coment=new Coment();
		coment.setSid(sid);
		coment.setComent(content);
		coment.setFlag(flag);
		coment.setTid(tid);
		coment.setComentdate(date);
		studentDao.saveComent(coment);
		int comentCount=userDao.getComentCount(flag);
		return comentCount;
		
	}

	@Override
	public List<DetailComent> getComent(int tid,int pageNow,int pageSize,int flag) {
		// TODO Auto-generated method stub
		int from=0;
		int to=pageSize;
		List<DetailComent> comentlist=new ArrayList<DetailComent>();
		from=pageSize*pageNow;
		List<Coment> list=userDao.getComent(tid,from,to,flag);
		for (int i = 0; i < list.size(); i++) {
			Coment coment=list.get(i);
			DetailComent dc=new DetailComent();
			String sname=userDao.getUseNameById(coment.getSid());
			String tname=userDao.getUseNameById(coment.getTid());
			dc.setId(coment.getId());
			dc.setSname(sname);
			dc.setComent(coment.getComent());
			dc.setTname(tname);
			dc.setComentdate(coment.getComentdate());
			dc.setReplydate(coment.getReplydate());
			dc.setReplycoment(coment.getReplycoment());
		//	System.out.println(coment);
			comentlist.add(dc);
		}
		return comentlist;
	}

	@Override
	public List<DetailComent> getComentByTid(int tid,int flag) {
		// TODO Auto-generated method stub
		List<DetailComent> comentlist=new ArrayList<DetailComent>();
		List<Coment> list=userDao.getComentByTid(tid, flag);
		for (int i = 0; i < list.size(); i++) {
			Coment coment=list.get(i);
			DetailComent dc=new DetailComent();
			String tname=userDao.getUseNameById(coment.getTid());
			//System.out.println(sname+tname);
			dc.setId(coment.getId());
			dc.setComent(coment.getComent());
			dc.setTname(tname);
			dc.setReplycoment(coment.getReplycoment());
			dc.setComentdate(coment.getComentdate());
			dc.setReplycoment(coment.getReplycoment());
			dc.setReplydate(coment.getReplydate());
		//	System.out.println(coment);
			comentlist.add(dc);
		}
		return comentlist;
	}

	@Override
	public int getPageCount(int flag) {
		// TODO Auto-generated method stub
		int rowCount=userDao.getComentCount(flag);
		return rowCount;
	}

	@Override
	public void replyComent(int id, int tid, String content) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:ss:mm");
		String date=sdf.format(new Date());
		trainerDao.updateComent(id, tid, content,date);
	}

	@Override
	public int deleteComent(int id,int flag) {
		// TODO Auto-generated method stub
		adminDao.deleteComentById(id);
		int count=userDao.getComentCount(flag);
		return count;
	}

	@Override
	public void deleteAllrComent() {
		// TODO Auto-generated method stub
		adminDao.deleteAllComent();
	}


}
