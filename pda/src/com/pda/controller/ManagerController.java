package com.pda.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import antlr.collections.impl.IntRange;

import com.pda.inter.IManagerService;
import com.pda.inter.IUserService;
import com.pda.model.DetailStudent;
import com.pda.model.Trainer;
import com.pda.model.User;

@Controller
@RequestMapping(value="/Manager") 
public class ManagerController {

	@Resource(name="userService")
	public IUserService userService;
	
	@Resource(name="managerService")
	public IManagerService managerService;
	
	@RequestMapping(value="showUser.do")
	@ResponseBody
	public Object showUser(@RequestParam(value="sid")String sid){
		int sid_1=Integer.parseInt(sid);
		User u=userService.getUser(sid_1);
		return u;
	}
	
	@RequestMapping(value = "changeUser.do")
	@ResponseBody
	public String changeUser(
			@RequestParam(value = "sid") String sid,
			@RequestParam(value = "tel") String tel,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "filename") String filename,
			HttpSession session) {
		int sid_1=Integer.parseInt(sid);
		User user = userService.getUser(sid_1);
		User u = userService.changeUser(user, tel, email, address, filename);
		return "1";
	}
	@RequestMapping(value = "takeinStudent.do")
	@ResponseBody
	public void takeinStudent(
			@RequestParam(value = "tid") String tid,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "idnumber") String idnumber,
			@RequestParam(value = "sex") String sex,
			@RequestParam(value = "tel") String tel, 
			@RequestParam(value = "email") String email, 
			@RequestParam(value = "remark") String remark, 
			@RequestParam(value = "idimag") String idimag, 
			HttpSession session) {
		  int tid_1=Integer.parseInt(tid);
	      managerService.takeinStudent(tid_1,idnumber, name, sex,tel,email,remark,idimag);
	}
	
	@RequestMapping(value = "takeinTrainer.do")
	@ResponseBody
	public Object takeinTrainer(
			@RequestParam(value = "name") String name,
			@RequestParam(value = "idnumber") String idnumber,
			@RequestParam(value = "sex") String sex,
			@RequestParam(value = "tel") String tel, 
			@RequestParam(value = "email") String email, 
			@RequestParam(value = "remark") String remark, 
			@RequestParam(value = "idimag") String idimag, 
			HttpSession session) {
	      managerService.takeinTrainer(idnumber, name, sex,tel,email,remark,idimag);
	      int trainerCount=managerService.getTrainerCount();
	      return trainerCount;
	}
	
	
	@RequestMapping(value = "inputScore.do")
	@ResponseBody
	public Object inputScore(
			@RequestParam(value = "id") String id,
			@RequestParam(value = "sid") String sid,
			@RequestParam(value = "one") String one,
			@RequestParam(value = "tow") String two,
			@RequestParam(value = "three") String three,
			@RequestParam(value = "four") String four,
			HttpSession session) {
		int id_1=Integer.parseInt(id);
		int sid_1=Integer.parseInt(sid);
		int one_1=Integer.parseInt(one);
		int two_1=Integer.parseInt(two);
		int three_1=Integer.parseInt(three);
		int four_1=Integer.parseInt(four);
		managerService.addScore(id_1,sid_1, one_1, two_1, three_1, four_1);
	   return "111";
	}
	@RequestMapping(value = "getStudent.do")
	@ResponseBody
	public Object getStudent(
			@RequestParam(value = "pageNow") String pageNow,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "status") String status,
			HttpSession session) {
		int pageNow_1=Integer.parseInt(pageNow);
		int status_1=Integer.parseInt(status);
		User u=(User) session.getAttribute("user");
		Map<Object, Object> listuser=managerService.getStudent(u.getId(), pageNow_1, 5,type,title,status_1);
		return listuser;
	
	}
	
	@RequestMapping(value = "getStudentScore.do")
	@ResponseBody
	public Object getStudentScore(
			@RequestParam(value = "pageNow") String pageNow,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "title") String title,
			HttpSession session) {
		int pageNow_1=Integer.parseInt(pageNow);
		User u=(User) session.getAttribute("user");
		List<DetailStudent> listds=managerService.getStudentScore(u.getId(), pageNow_1, 5,type,title);
		System.out.println("*******************");
		return listds;
	
	}
	//测试  无效
/*	@RequestMapping(value = "getAllUser.do")
	@ResponseBody
	public Object getAllUser(@RequestParam(value = "pageNow") String pageNow,
			HttpSession session){
		int pageNow_1=Integer.parseInt(pageNow);
		List<Map<Object, Object>> list=managerService.getStudent(pageNow_1);
		return list;
		
	}*/
	
	@RequestMapping(value = "getStudentUser.do")
	@ResponseBody
	public Object getStudentUser(@RequestParam(value = "pageNow") String pageNow,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "status") String status,
			HttpSession session){
		int pageNow_1=Integer.parseInt(pageNow);
		int status_1=Integer.parseInt(status);
		List<Map<Object, Object>> list=managerService.getStudent(pageNow_1,5,type,title,status_1);
		return list;
		
	}
	
	@RequestMapping(value = "getTrainerUser.do")
	@ResponseBody
	public Object getTrainerUser(@RequestParam(value = "pageNow") String pageNow,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "status") String status,
			HttpSession session){
		int pageNow_1=Integer.parseInt(pageNow);
		int status_1=Integer.parseInt(status);
		List<Map<Object, Object>> list=managerService.getTrainer(pageNow_1,5,type,title,status_1);
		return list;
		
	}
	
	@RequestMapping(value = "checkUser.do")
	@ResponseBody
	public Object checkUser(
			@RequestParam(value = "uid") String uid,
			@RequestParam(value = "role") String role,
			HttpSession session){
		int u_uid=Integer.parseInt(uid);
		int flag=managerService.checkUser(u_uid,role);
		return flag;
		
	}
	@RequestMapping(value="resetPassword.do")
	@ResponseBody
	public Object resetPassword(@RequestParam(value="idnumber")String idnumber){
		
		String password=userService.resetPassword(idnumber);
		return password;
	}
	@RequestMapping(value="deleteUser.do")
	@ResponseBody
	public Object deleteUser(@RequestParam(value="uid")String uid,@RequestParam(value="role")String role){
		
		int u_uid=Integer.parseInt(uid);
		int r_role=Integer.parseInt(role);
		int count=managerService.deleteUser(u_uid, r_role);
	    return count;
	}
	@RequestMapping(value="Index.do")
	@ResponseBody
	public Object Index(){
		
		Map<Object, Object> map=managerService.getIndexContent();
	    return map;
	}
	@RequestMapping(value="Login.do")
	@ResponseBody
	public Object Login(){
	   List<String> list=managerService.getLoginImag();
	   return list;
	}
	
	@RequestMapping(value="addArticle.do")
	@ResponseBody
	public Object addArticle(@RequestParam(value="title")String title,
			@RequestParam(value="author")String author,
			@RequestParam(value="content")String content
			){
	   managerService.addArticle(title, author, content);
	   return "1";
	}
	@RequestMapping(value="updateAd.do")
	@ResponseBody
	public Object updateAd(@RequestParam(value="id")String id,
			@RequestParam(value="name")String name
			){
	   int id_1=Integer.parseInt(id);
	   managerService.updateAd(id_1, name);
	   return "1";
	}
	
	@RequestMapping(value = "/upload1.do")
	@ResponseBody
	public Object uploadFile(@RequestParam(value = "file1") MultipartFile file1,
			HttpServletRequest request) throws IllegalStateException,
			IOException {

		if (file1.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/ad");
		String oldname=managerService.getAdContentById(1);
		System.out.println(oldname+"****************");
		String filename = userService.uploadFile(file1, path, oldname);

		return filename;
	}
	@RequestMapping(value = "/upload2.do")
	@ResponseBody
	public Object uploadFile2(@RequestParam(value = "file2") MultipartFile file2,
			HttpServletRequest request) throws IllegalStateException,
			IOException {

		if (file2.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/ad");
		String oldname=managerService.getAdContentById(2);
		String filename = userService.uploadFile(file2, path, oldname);

		return filename;
	}
	@RequestMapping(value = "/upload3.do")
	@ResponseBody
	public Object uploadFile3(@RequestParam(value = "file3") MultipartFile file3,
			HttpServletRequest request) throws IllegalStateException,
			IOException {

		if (file3.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/ad");
		String oldname=managerService.getAdContentById(3);
		String filename = userService.uploadFile(file3, path, oldname);

		return filename;
	}
	
	@RequestMapping(value = "/upload4.do")
	@ResponseBody
	public Object uploadFile4(@RequestParam(value = "file4") MultipartFile file4,
			HttpServletRequest request) throws IllegalStateException,
			IOException {

		if (file4.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/ad");
		String oldname=managerService.getAdContentById(4);
		
		String filename = userService.uploadFile(file4, path, oldname);

		return filename;
	}
	
	
	@RequestMapping(value = "/getArtList.do")
	@ResponseBody
	public Object getArtList(@RequestParam(value = "pageNow") String pageNow,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "title")String title
			) {
        int pageNow_1=Integer.parseInt(pageNow);
        int pageSize=5;
        List<Map<Object, Object>> list= managerService.getArticleList(pageNow_1, pageSize,type,title);
		return list;
	}
	
	@RequestMapping(value = "/getAllArt.do")
	@ResponseBody
	public Object getAllArt() 
	 {
        List<Map<Object, Object>> list= managerService.getAllArticleList();
		return list;
	}
	@RequestMapping(value = "/deleteArt.do")
	@ResponseBody
	public Object deleteArt(@RequestParam(value="id")String id) 
	 {
		int id_1=Integer.parseInt(id);
        int count=managerService.deleteArt(id_1);
		return count;
	}
	@RequestMapping(value = "/getAd.do", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAd(@RequestParam(value="id")String id) 
	 {
		int id_1=Integer.parseInt(id);
        String content=managerService.getAdContentById(id_1);
        System.out.println(content+"++++++++++++++++++++++++");
		return content;
	}
	@RequestMapping(value = "/trainerAd.do")
	@ResponseBody
	public Object trainerAd(@RequestParam(value="tid")String tid) 
	 {
		int tid_1=Integer.parseInt(tid);
        Trainer tr=managerService.getTrainerAd(tid_1);
       // System.out.println(content+"++++++++++++++++++++++++");
		return tr;
	}
	@RequestMapping(value = "/updateTrainerAd.do", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String updateTrainerAd(@RequestParam(value="tid")String tid,
			@RequestParam(value="content")String content) {
	
		int tid_1=Integer.parseInt(tid);
		managerService.UpdateTrainerAd(tid_1, content);
		return null;
	}
	//更新招生宣传
	@RequestMapping(value = "/updateTrainerAd1.do")
	@ResponseBody
	public Object updateTrainerAd1(@RequestParam(value="place")String place,
			@RequestParam(value="price")String price,
			@RequestParam(value="imag")String imag,
			HttpSession session
			) {
        User user=(User) session.getAttribute("user");
        int tid=user.getId();
         managerService.UpdateTrainerAd1(tid, place, price, imag);
       // System.out.println(content+"++++++++++++++++++++++++");
		return null;
	}
	//资格认证
		@RequestMapping(value = "/identity.do")
		@ResponseBody
		public Object identity(@RequestParam(value="imag1")String imag1,
				@RequestParam(value="imag2")String imag2,
				@RequestParam(value="year")String year,
				HttpSession session
				) {
	        User user=(User) session.getAttribute("user");
	        int tid=user.getId();
	         managerService.identifyTrainer(tid, year, imag1, imag2);
	       // System.out.println(content+"++++++++++++++++++++++++");
			return null;
		}
		//资格认证
				@RequestMapping(value = "/showgidentity.do")
				@ResponseBody
				public Object showgidentity(@RequestParam(value="tid")String tid,
						HttpSession session
						) {
			        int tid_1=Integer.parseInt(tid);
			        Trainer tr= managerService.getTrainerById(tid_1);
			       // System.out.println(content+"++++++++++++++++++++++++");
					return tr;
				}
				
				//资格认证
				@RequestMapping(value = "/comfirmIdentity.do")
				@ResponseBody
				public void comfirmIdentity(@RequestParam(value="tid")String tid,
						HttpSession session
						) {
			        int tid_1=Integer.parseInt(tid);
			        managerService.updateStatus(tid_1, 2);
				
				}
}
