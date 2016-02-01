package com.pda.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pda.inter.IAdminDao;
import com.pda.inter.IManagerService;
import com.pda.inter.IStudentDao;
import com.pda.inter.ITrainerDao;
import com.pda.inter.IUserDao;
import com.pda.model.Ad;
import com.pda.model.Article;
import com.pda.model.Coment;
import com.pda.model.DetailStudent;
import com.pda.model.Login;
import com.pda.model.Order;
import com.pda.model.Problems;
import com.pda.model.Student;
import com.pda.model.Trainer;
import com.pda.model.User;
import com.pda.until.Mail;

@Service
@Transactional
public class ManagerService implements IManagerService{

	@Qualifier(value = "adminDao")
	@Autowired
	private IAdminDao adminDao;
	
	@Qualifier(value = "trainerDao")
	@Autowired
	private ITrainerDao trainerDao;
	

	@Qualifier(value = "userDao")
	@Autowired
	private IUserDao userDao;
	

	@Qualifier(value = "studentDao")
	@Autowired
	private IStudentDao studentDao;
	
	
	@Override
	public  Map<Object, Object> getStudent(int tid,int pageNow,int size,String type,String title,int status) {
		// TODO Auto-generated method stub
		int from=pageNow*size;
		Map<Object, Object> map=new HashMap<Object, Object>();
		List<Student> list=trainerDao.getStudent(tid,from,size,status);
		List<User> listuser=new ArrayList<User>();
		for (int i = 0; i < list.size(); i++) {
		   
			Student st=list.get(i);
			User user= userDao.getUserById(st.getSid(),type,title,status);
			if(user!=null){
			listuser.add(user);
			}
		}
		map.put("listuser", listuser);
		return map;
	}
	@Override
	public void takeinStudent(int tid,String idnumber, String name,String sex,String tel,String email,String remark,String idimag) {
		// TODO Auto-generated method stub	Student st=new Student();
		User user=new User();
		user.setIdnumber(idnumber);
		user.setName(name);
		user.setSex(sex);
		user.setTel(tel);
		user.setEmail(email);
		user.setIdimag(idimag);
		user.setRemark(remark);
		user.setStatus(0);
		userDao.saveUser(user);
		User u=userDao.getUser(idnumber);
		Student student=new Student();
		student.setSid(u.getId());
		student.setTid(tid);
	    student.setSubjectone(0);
	    student.setSubjecttow(0);
	    student.setSubjectthree(0);
	    student.setSubjectfour(0);
		trainerDao.saveStudent(student);
		
		
		
	}
	@Override
	public List<DetailStudent> getStudentScore(int tid,int pageNow,int size,String type,String title) {
		// TODO Auto-generated method stub
		int from=pageNow*size;
		List<Student> list=trainerDao.getStudent(tid,from,size,1);
		List<DetailStudent> lists=new ArrayList<DetailStudent>();
		for (int i = 0; i < list.size(); i++) {
		
			DetailStudent ds=new DetailStudent();
			Student st=list.get(i);
			User user= userDao.getUserById(st.getSid(),type,title,1);
			//System.out.println("name=="+user.getName());
			if(user!=null){
			ds.setId(st.getId());
			ds.setSname(user.getName());
			ds.setSid(st.getSid());
			ds.setSubjectone(st.getSubjectone());
			ds.setSubjecttow(st.getSubjecttow());
			ds.setSubjectthree(st.getSubjectthree());
			ds.setSubjectfour(st.getSubjectfour());
			ds.setImag(user.getImag());
			lists.add(ds);
			}
		}
		return lists;
	}
	@Override
	public int addScore(int id,int sid, int one, int tow, int three, int four) {

		//if(st.getSubjectone())
		// TODO Auto-generated method stub
		Student student=new Student();
		student.setId(id);
		student.setSubjectone(one);
		student.setSubjecttow(tow);
		student.setSubjectthree(three);
		student.setSubjectfour(four);
		trainerDao.updatetudent(student);
		System.out.println(id+"sid************************");
		studentDao.deleteOrder(sid);
		if(student.getSubjectfour()>=90){
			User u=userDao.getUserById(sid);
			u.setStatus(3);
			userDao.updateUser(u);
		}
		return 0;
	}
	@Override
	public int getStudentCount(int pageSize,int tid) {
		// TODO Auto-generated method stub
		int rowCount=trainerDao.getStudentCount(tid);
		return rowCount;
	}
	@Override
	public List<User> getUser(int pageNow) {
		// TODO Auto-generated method stub
		int pageSize=5;
		List<User> listuser=adminDao.getAllUser(pageNow,pageSize);
		return listuser;
	}
	@Override
	public int getUserCount() {
		// TODO Auto-generated method stub
		int userCount=adminDao.getUserCount();
		return userCount;
	}
	@Override
	public int getStudentCount() {
		// TODO Auto-generated method stub
		int studentCount=adminDao.getStudentCount();
		return studentCount;
	}
	@Override
	public int getTrainerCount() {
		// TODO Auto-generated method stub
		int trainer=adminDao.getTrainerrCount();
		return trainer;
	}
	@Override
	public List<Map<Object, Object>> getStudent(int pageNow,int size,String type,String title,int status) {
		// TODO Auto-generated method stub
	    
		List<Student> list=adminDao.getStudent(pageNow*size, size);
		List<Map<Object, Object>> liststudent=new ArrayList<Map<Object, Object>>();
		//System.out.println("*******"+list.get(0));
		for (int i = 0; i < list.size(); i++) {
			Student student=list.get(i);	
			User user=userDao.getUserById(student.getSid(), type, title,status);
			if(user!=null){
	      	String tname=userDao.getUseNameById(student.getTid());
			Map<Object, Object> map=new HashMap<Object, Object>();
			map.put("id", user.getId());
			map.put("idnumber",user.getIdnumber());
			map.put("name",user.getName());
			map.put("tname",tname);
			map.put("status",user.getStatus());
			liststudent.add(map);
			}
		}
		return liststudent;
	}
	@Override
	public List<Map<Object, Object>> getTrainer(int pageNow,int size,String type,String title,int status) {
		// TODO Auto-generated method stub
		List<Integer> list=adminDao.getTrainerId(pageNow*size, size);
		List<Map<Object, Object>> listtrainer=new ArrayList<Map<Object, Object>>();
		//System.out.println("*******"+list.get(0));
		for (int i = 0; i < list.size(); i++) {
			int tid=list.get(i);
			User user=userDao.getUserById(tid,type,title,status);
			if(user!=null){
			Map<Object, Object> map=new HashMap<Object, Object>();
			map.put("id", user.getId());
			map.put("idnumber",user.getIdnumber());
			map.put("name",user.getName());
			map.put("status",user.getStatus());
			listtrainer.add(map);
			}
		}
		return listtrainer;
	}
	@Override
	public int checkUser(int uid,String role) {
		// TODO Auto-generated method stub
		User user=userDao.getUserById(uid);
		if(user.getStatus()==0)
		    adminDao.UpdateStatus(uid,1);
		else
			return 0;
		String idnumber=user.getIdnumber();
		String password="z"+(int)(Math.random()*1000000);
		Login login=new Login();
		login.setPassword(password);
		login.setUser(idnumber);
		login.setRole(role);
		userDao.saveLogin(login);
		
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		user.setRegistertime(date);
		user.setStatus(1);
		userDao.updateUser(user);
		String smtp = "smtp.qq.com";  
        String from = "1039273497@qq.com";  
        String to = user.getEmail();  
        String copyto = "抄送人:系统管理员";  
        String subject = "找回密码";  
        String content = "<h1>------驾校综合管理平台------</h1><h2>***您已通过审核初始密码为:"+password+"***</h2>";  
        String username="1039273497@qq.com";  
        String epassword="2351284866zhy";   
        Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, epassword);  
		return 1;
	}
	
	@Override
	public int deleteUser(int uid, int role) {
		// TODO Auto-generated method stub
		int count=0;
		User user=userDao.getUserById(uid);
		String idnumber=user.getIdnumber();
		adminDao.deleteUserById(uid);
		adminDao.deleteLoginByIdnumber(idnumber);
		if(role==1){
			adminDao.deleteTrainerByTid(uid);
			adminDao.deleteStudentByTid(uid);
			count=getTrainerCount();
		}
		else{
			adminDao.deleteStudentBySid(uid);
			count=getStudentCount();
		}
		return count;
	}
	@Override
	public void takeinTrainer(String idnumber,String name,String sex,String tel,String email,String remark,String idimag){
		// TODO Auto-generated method stub
		User user=new User();
		user.setIdnumber(idnumber);
		user.setName(name);
		user.setSex(sex);
		user.setIdimag(idimag);
		user.setTel(tel);
		user.setEmail(email);
		user.setRemark(remark);
		user.setStatus(0);
		userDao.saveUser(user);
		User u=userDao.getUser(idnumber);
		Trainer trainer=new Trainer();
		trainer.setTid(u.getId());
		adminDao.saveTrainer(trainer);
	}
	@Override
	public Map<Object, Object> getIndexContent() {
		// TODO Auto-generated method stub
		Map<Object, Object> map=new HashMap<Object, Object>();
		List<Ad> adlist=adminDao.getAd();
		List<String> m1=new ArrayList<String>();
		String m2=null;
		String m3=null;
		String m4=null;
		String m5=null;
	//	adminDao.getArticle(0, 5);
		//List<Notice> m5=new ArrayList<Notice>();
		for (int i = 0; i < adlist.size(); i++) {
			Ad ad=adlist.get(i);
			if(ad.getFlag()==1){
				m1.add(ad.getContent());
			}
			else if(ad.getFlag()==2){
				m2=ad.getContent();
			}
			else if(ad.getFlag()==3){
				m4=ad.getContent();
			}
			else if(ad.getFlag()==4){
				m3=ad.getContent();
			}
			else if(ad.getFlag()==5){
				m5=ad.getContent();
			}
		}
		List<Map<Object, Object>> lu=new ArrayList<Map<Object, Object>>();
		List<Trainer> lt=adminDao.getTrainer(1);
		for(int i=0;i<lt.size();i++){
			Trainer tr=lt.get(i);
			User user=userDao.getUserById(tr.getTid());
			if(user.getStatus()!=0){
			Map<Object, Object> umap=new HashMap<Object, Object>();
			SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
			String cd=sdf.format(new Date());
			int cd1=Integer.parseInt(cd);
			int y=0;
			if(tr.getYear()!=null)
				y=cd1-tr.getYear();
			umap.put("name", user.getName());
			umap.put("id", user.getId());
			umap.put("imag", user.getImag());
			umap.put("year", y);
			lu.add(umap);
			}
		}
		map.put("m0", lu);
        map.put("m1", m1);
        map.put("m2", m2);
        map.put("m3", m3);
        map.put("m4", m4);
        map.put("m5", m5);
       // map.put("m5", m5);
		return map;
	}
	@Override
	public List<String> getLoginImag() {
		// TODO Auto-generated method stub
		List<String> list=new ArrayList<String>();
		List<Ad> adlist=adminDao.getAd();
		for (int i = 0; i < adlist.size(); i++) {
			Ad ad=adlist.get(i);
			if(ad.getFlag()==1){
				list.add(ad.getContent());
			}
		}
		return list;
	}
	@Override
	public void addArticle(String title, String author, String content) {
		// TODO Auto-generated method stub
		Article art=new Article();
		art.setTitle(title);
		art.setAuthor(author);
		System.out.println(content);
		art.setContent(content);
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		art.setDate(date);
		adminDao.saveArticle(art);
	}
	@Override
	public void updateAd(int id, String newname) {
		// TODO Auto-generated method stub
		adminDao.updateAd(id, newname);
	}
	@Override
	public String getAdContentById(int id) {
		// TODO Auto-generated method stub
		String content=adminDao.getAdContentById(id);
		System.out.println(content+"*******************************************");
		return content;
	}
	
	@Override
	public List<Map<Object, Object>> getArticleList(int pageNow, int size,String type,String title) {
		// TODO Auto-generated method stub
		int from=pageNow*size;
		List<Object[]> list=adminDao.getArticle(from, size,type,title);
		List<Map<Object, Object>> alist=new ArrayList<Map<Object, Object>>();
		for(Object[] link : list){  
			int id =  (int) link[0];  
			String title1 = (String) link[1];  
			String author = (String) link[2];  
			String date = (String) link[3];  
			Map<Object, Object> map=new HashMap<Object, Object>();
			map.put("id", id);
			map.put("author", author);
			map.put("date", date);
			map.put("title", title1);
			System.out.println(id + " : " + title1+"**********"); 
			alist.add(map);
			}
		return alist;
	}
	@Override
	public List<Map<Object, Object>> getAllArticleList() {
		// TODO Auto-generated method stub
		List<Object[]> list=adminDao.getAllArticle();
		List<Map<Object, Object>> alist=new ArrayList<Map<Object, Object>>();
		for(Object[] link : list){  
			int id =  (int) link[0];  
			String title = (String) link[1];  
			Map<Object, Object> map=new HashMap<Object, Object>();
			map.put("id", id);
			map.put("title", title);
			System.out.println(id + " : " + title+"**********"); 
			alist.add(map);
			}
		return alist;
	}
	@Override
	public int getArtCount() {
		// TODO Auto-generated method stub
		int count=adminDao.getArtCount();
		return count;
	}
	@Override
	public int deleteArt(int id) {
		// TODO Auto-generated method stub
		adminDao.deleteArt(id);
		int count=adminDao.getArtCount();
		return count;
	}
	@Override
	public  Map<Object, Object> showTakeinStudent() {
		// TODO Auto-generated method stub
		List<Trainer> list=adminDao.getTrainer(2);
	     Map<Object, Object> umap=new HashMap<Object,Object>();
		List<Map<Object, Object>> listtrainer=new ArrayList<Map<Object, Object>>();
		//System.out.println("*******"+list.get(0));
		for (int i = 0; i < list.size(); i++) {
			Trainer tr=list.get(i);
			User user=userDao.getUserById(tr.getTid());
			if(user.getStatus()!=0){
			Map<Object, Object> map=new HashMap<Object, Object>();
			SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
			String cd=sdf.format(new Date());
			int cd1=Integer.parseInt(cd);
			int y=0;
			if(tr.getYear()!=null)
				y=cd1-tr.getYear();
			map.put("id", user.getId());
			map.put("imag",user.getImag());
			map.put("name",user.getName());
			map.put("year",y);
			listtrainer.add(map);
			}
		}
		String m6=getAdByFlag(6);
		umap.put("trainerM1", listtrainer);
		umap.put("m6", m6);
		return umap;
	}
	@Override
	public String getAdByFlag(int flag) {
		// TODO Auto-generated method stub
		String str=adminDao.getTakeinInfor(flag);
		return str;
	}
	@Override
	public Map<Object, Object> getTrainerDetail(int tid) {
		// TODO Auto-generated method stub
		Trainer tr=trainerDao.getTrainer(tid);
		User user=userDao.getUserById(tid);
		Map<Object, Object> map=new HashMap<Object, Object>();
		if(user.getStatus()!=0){
			SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
			String cd=sdf.format(new Date());
			int cd1=Integer.parseInt(cd);
			int y=0;
			System.out.println(tr.getYear());
			if(tr.getYear()!=null)
				y=cd1-tr.getYear();
		map.put("year", y);
		map.put("tr", tr);
		map.put("user", user);
		}
		int count=0;
		List<Student> lt=trainerDao.getStudent(tid, 0, trainerDao.getStudentCount(tid),1);
		for (int i = 0; i < lt.size(); i++) {
			Student st=lt.get(i);
			int uid=st.getSid();
			User u=userDao.getUserById(uid);
			if(u.getStatus()==3){
				count++;
			}
		}
		map.put("count", count);
		return map;
		
	}
	@Override
	public Trainer getTrainerAd(int tid) {
		// TODO Auto-generated method stub
		Trainer tr=trainerDao.getTrainer(tid);
		return tr;
	}
	@Override
	public String UpdateTrainerAd(int tid, String content) {
		// TODO Auto-generated method stub
		trainerDao.updateTrainerInstruction(tid, content);
		return null;
	}
	@Override
	public String UpdateTrainerAd1(int tid, String place, String price,String imag) {
		// TODO Auto-generated method stub
		int price_1=Integer.parseInt(price);
		Trainer tr=trainerDao.getTrainer(tid);
		if(imag.length()!=0)
			tr.setImag(imag);
		tr.setPlace(place);
		tr.setPrice(price_1);
		trainerDao.updateTrainer(tr);
		return null;
	}
	@Override
	public String identifyTrainer(int tid, String year, String imag1,
			String imag2) {
		// TODO Auto-generated method stub
		int year_1=Integer.parseInt(year);
		Trainer tr=trainerDao.getTrainer(tid);
		if(imag1.length()!=0)
			tr.setImag1(imag1);
		if(imag2.length()!=0)
			 tr.setImag2(imag2);
		tr.setYear(year_1);
		trainerDao.updateTrainer(tr);
		return null;
	}
	@Override
	public Trainer getTrainerById(int tid) {
		// TODO Auto-generated method stub
		Trainer tr=trainerDao.getTrainer(tid);
		return tr;
	}
	@Override
	public void updateStatus(int tid, int status) {
		// TODO Auto-generated method stub
		User user=userDao.getUserById(tid);
		user.setStatus(status);
		userDao.updateUser(user);
	}
	


	
}
