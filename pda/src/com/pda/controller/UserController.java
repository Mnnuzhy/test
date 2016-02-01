package com.pda.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.code.kaptcha.Constants;
import com.pda.inter.IUserService;
import com.pda.model.Article;
import com.pda.model.Student;
import com.pda.model.User;
import com.pda.service.UserService;

@Controller
@RequestMapping(value = "/User")
public class UserController {

	@Resource(name = "userService")
	private IUserService userService;

	@RequestMapping(value = "/login.do")
	public String login(@RequestParam(value = "user") String user,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "verifyCode") String verifyCode,
			HttpSession session, Model m) {
		System.out.println(user + password + verifyCode + "*****");
		String verifyCode_r = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		System.out.println(verifyCode_r + "||" + verifyCode);
		if (!verifyCode.equalsIgnoreCase(verifyCode_r)) {

			m.addAttribute("error", "-1");
			return "public/login";
		}
		int role = userService.checkLogin(user, password, session);
		User u=(User) session.getAttribute("user");
		session.setAttribute("role", role);
		if (role == 1) {
			return "admin/managerIndex";
		} else if (role == 2) {

			return "trainer/home";

		} else if (role == 3) {
           
			Student sd=userService.getStudent(u.getId());
			m.addAttribute("sd", sd);
			return "student/home";
		} else {
			m.addAttribute("error", "1");
			return "public/login";
		}

	}

	@RequestMapping(value = "/Home.do")
	public String PersonalHome(HttpSession session) {

		
		User u = (User) session.getAttribute("user");
		if (u == null)
			return "public/login";
		int role = (int) session.getAttribute("role");
		if (role == 1) {
			System.out.println("1111111");
			return "admin/managerIndex";
		} else if (role == 2) {
			System.out.println("2222");
			return "trainer/home";

		} else {
			System.out.println("3333");
			return "student/home";
		}
	}

	@RequestMapping(value = "changeUser.do")
	@ResponseBody
	public String changeUser(@RequestParam(value = "tel") String tel,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "filename") String filename,
			HttpSession session) {
		System.out.println(email);
		User user = (User) session.getAttribute("user");
		User u = userService.changeUser(user, tel, email, address, filename);
		session.setAttribute("user", u);
		return "1";
	}

	@RequestMapping(value = "/upload0.do")
	@ResponseBody
	public Object uploadFile0(@RequestParam(value = "file") MultipartFile file,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
	//	System.out.println("------**********************-----"+file);
		if (file.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/trainer");
		User u = (User) request.getSession().getAttribute("user");
		String filename = userService.uploadFile(file, path, u.getImag());
		return filename;
	}
	@RequestMapping(value = "/upload00.do")
	@ResponseBody
	public Object uploadFile00(@RequestParam(value = "file1") MultipartFile file1,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		//System.out.println("------**********************-----"+file1);
		if (file1.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/trainer");
		User u = (User) request.getSession().getAttribute("user");
		String filename = userService.uploadFile(file1, path, u.getImag());
		return filename;
	}
	@RequestMapping(value = "/upload.do")
	@ResponseBody
	public Object uploadFile(@RequestParam(value = "file") MultipartFile file,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		System.out.println("------**********************-----"+file);
		if (file.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/user");
		User u = (User) request.getSession().getAttribute("user");
		String filename = userService.uploadFile(file, path, u.getImag());
		return filename;
	}
	@RequestMapping(value = "/upload1.do")
	@ResponseBody
	public Object uploadFile1(@RequestParam(value = "file") MultipartFile file,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		System.out.println("------**********************-----"+file);
		if (file.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/user");
		String filename = userService.uploadFile(file, path, null);
		return filename;
	}

	@RequestMapping(value = "changePassword.do")
	@ResponseBody
	public String changePassword(
			@RequestParam(value = "oldpassword") String oldpassword,
			@RequestParam(value = "newpassword") String newpassword,HttpSession session) {
		User u=(User) session.getAttribute("user");
		String idnumber=u.getIdnumber();
	    String flag=userService.changePassword(oldpassword, newpassword, idnumber);
		return flag;
	}
	@RequestMapping(value = "logoff.do")
	public String logOff(HttpSession session){
		session.removeAttribute("user");
		return "public/login";
	}
	@RequestMapping(value = "varify.do")
	@ResponseBody
	public int varify(
			@RequestParam(value = "idnumber") String idnumber,
			HttpSession session) {
	     int flag= userService.varifyUser(idnumber);	
	     System.out.println("flag:"+flag);
	   	 return flag;
	}
	
	@RequestMapping(value = "findPassword.do")
	public String findPassword(
			@RequestParam(value = "idnumber") String idnumber,
			@RequestParam(value = "verifyCode") String verifyCode,
			HttpSession session,Model m) {
	     
		String verifyCode_r = (String) session
				.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		System.out.println(verifyCode_r + "||" + verifyCode);
		
		if (!verifyCode.equalsIgnoreCase(verifyCode_r)) {

			m.addAttribute("error", "-1");
			return "public/resetPassword";
		}
		User u=userService.getUserByIdnumber(idnumber);
		if(u==null){
			m.addAttribute("error", "1");
			return "public/resetPassword";
		}
		 userService.resetPassword(idnumber);
		 m.addAttribute("title", " 恭喜您，密码修改成功！");
		 m.addAttribute("content", "请到您的邮箱找回你的密码。");
		 return "public/success";
	}

	@RequestMapping(value = "register.do")
	@ResponseBody
	public Object register(
			@RequestParam(value = "idnumber") String idnumber,
			@RequestParam(value = "tel") String tel,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "role") String role,
			HttpSession session,Model m) {
	     
		 int flag=userService.registerUser(idnumber, email, tel, password, role);
		 return flag;
	}
	@RequestMapping(value = "article.do")
	public String article(
			@RequestParam(value = "aid") String aid,
			HttpSession session,Model m) {
	     
		  int id=Integer.parseInt(aid);
		  Article at=userService.getArticleByid(id);
		  m.addAttribute("title", at.getTitle());
		  m.addAttribute("date", at.getDate());
		  m.addAttribute("author", at.getAuthor());
		  m.addAttribute("content", at.getContent());
		 return "public/article";
	}
}
