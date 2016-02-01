package com.pda.inter;


import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.pda.model.Article;
import com.pda.model.Student;
import com.pda.model.User;

public interface IUserService {

	
	public int checkLogin(String name,String passowrd,HttpSession session);
	public User changeUser(User user,String tel,String email,String address,String filename);
	public String uploadFile(MultipartFile file,String path,String oldimag);
	public String changePassword(String oldpassword,String newpassword,String idnubmer);
	public Student getStudent(int sid);
	public User getUser(int id);
	public int varifyUser(String idnumber);
	public User getUserByIdnumber(String  idnumber);
	public String resetPassword(String idnumber);
	public int registerUser(String idnumber,String email,String tel,String password,String role);
    public Article getArticleByid(int id);
}
