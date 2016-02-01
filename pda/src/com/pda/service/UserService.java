package com.pda.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.pda.dao.UserDao;
import com.pda.inter.IStudentDao;
import com.pda.inter.ITrainerDao;
import com.pda.inter.IUserDao;
import com.pda.inter.IUserService;
import com.pda.model.Article;
import com.pda.model.Examscore;
import com.pda.model.Login;
import com.pda.model.Student;
import com.pda.model.Trainer;
import com.pda.model.User;
import com.pda.until.Mail;

@Service
@Transactional
public class UserService implements IUserService {

	@Qualifier(value = "userDao")
	@Autowired
	private IUserDao userDao;
	@Qualifier(value = "studentDao")
	@Autowired
	private IStudentDao studentDao;
   
	@Qualifier(value = "trainerDao")
	@Autowired
	private ITrainerDao trainerDao;

	@Override
	public int checkLogin(String user, String passowrd, HttpSession session) {
		// TODO Auto-generated method stub
		System.out.println(user + passowrd);
		Login login = userDao.getLogin(user);
		if (login == null) {
			return 0;
		}
		String password_r = login.getPassword();
		if (password_r.equals(passowrd)) {
			String role = login.getRole();
			User u = userDao.getUser(user);
			System.out.println(u.getId());
			session.setAttribute("user", u);
			if (role.equals("1")) {
				return 1;
			} else if (role.equals("2")) {
				return 2;
			} else if (role.equals("3")) {
				return 3;
			}
		}
		return 0;

	}
	

	@Override
	public User changeUser(User user, String tel, String email, String address,String filename) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String updatetime = sdf.format(new Date());
		user.setTel(tel);
		user.setEmail(email);
		user.setAddress(address);
		user.setUpdatetime(updatetime);
//		System.out.println(filename+"--------");
		if(filename.length()>0)
			user.setImag(filename);
		userDao.updateUser(user);
		User u = userDao.getUser(user.getIdnumber());
		System.out.println(u.getImag());
		return u;
	}

	@Override
	public String uploadFile(MultipartFile file, String path,String oldimag) {
		// TODO Auto-generated method stub
		File oldfile=new File(path+"/"+oldimag);
		if(oldfile.exists())
			oldfile.delete();
		String filename = UUID.randomUUID().toString();
		//System.out.println(path);
		String fname = file.getOriginalFilename();
		String suffx = fname.substring(fname.lastIndexOf("."));
		filename += suffx;
		System.out.println(filename);
		File targetfile = new File(path, filename);
		if (!targetfile.exists())
			targetfile.mkdirs();
		try {
			file.transferTo(targetfile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return filename;
	}

	@Override
	public String changePassword(String oldpassword, String newpassword,String idnumber) {
		// TODO Auto-generated method stub
		Login login=userDao.getLogin(idnumber);
		if(!login.getPassword().equals(oldpassword))
			return "0";
		login.setPassword(newpassword);
		userDao.UpdatePassword(login);
		return "1";
	}


	@Override
	public Student getStudent(int sid) {
		// TODO Auto-generated method stub
		Student sd = studentDao.getStudent(sid);
		return sd;
	}


	@Override
	public User getUser(int id) {
		// TODO Auto-generated method stub
		User u=userDao.getUserById(id);
		return u;
	}


	@Override
	public int varifyUser(String idnumber) {
		// TODO Auto-generated method stub
		User user=userDao.getUser(idnumber);
		if(user!=null)
			return user.getStatus();
		return -1;
	}


	@Override
	public User getUserByIdnumber(String idnumber) {
		// TODO Auto-generated method stub
		User u=userDao.getUser(idnumber);
		return u;
	}
	@Override
	public String resetPassword(String idnumber) {
		// TODO Auto-generated method stub
		User user=userDao.getUser(idnumber);
		if(user.getStatus()!=2)
			return "0";
		String newpassword="z"+(int)(Math.random()*1000000);
		userDao.updatePassword(idnumber, newpassword);
		String smtp = "smtp.qq.com";  
        String from = "1039273497@qq.com";  
        String to = user.getEmail();  
        String copyto = "抄送人:系统管理员";  
        String subject = "找回密码";  
        String content = "<h1>------驾校综合管理平台------</h1><h2>***您的密码已被管理员重置为:"+newpassword+"***</h2>";  
        String username="1039273497@qq.com";  
        String password="2351284866zhy";   
        Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, password);  
		return newpassword;
	}


	@Override
	public int registerUser(String idnumber, String email, String tel,
			String password, String role) {
		// TODO Auto-generated method stub
		User user=userDao.getUser(idnumber);
		int u_id=user.getId();
		if(role.equals("3")){
			Student st=studentDao.getStudent(u_id);
			if(st==null)
				return -1;
		}else if(role.equals("2")){
			 Trainer t=trainerDao.getTrainer(u_id);
			 if(t==null)
				 return -1;
		}
		Login login=new Login();
		login.setPassword(password);
		login.setUser(idnumber);
		login.setRole(role);
		userDao.saveLogin(login);
		
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		user.setRegistertime(date);
		user.setEmail(email);
		user.setTel(tel);
		user.setStatus(2);
		userDao.updateUser(user);
		return 0;
	}


	@Override
	public Article getArticleByid(int id) {
		// TODO Auto-generated method stub
		Article at=userDao.getArticleByid(id);
		return at;
	}

}
