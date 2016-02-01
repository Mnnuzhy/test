package com.pda.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pda.inter.IComentService;
import com.pda.model.DetailComent;
import com.pda.model.User;

@Controller
@RequestMapping(value="/Coment")
public class ComentController {

	@Resource(name="comentService")
	private IComentService comentService;
	
	@RequestMapping(value="leaveComent.do")
	@ResponseBody
	public Object leaveComent(@RequestParam(value="content") String content,HttpSession session){
		User u=(User) session.getAttribute("user");
		if(u==null){
			return "public/login";
		}
		int comentCount=comentService.leaveComent(u.getId(), content,0,1);
		return comentCount;
		
	}
	@RequestMapping(value="comentPage.do")
	@ResponseBody
	public List<DetailComent> comentPage(
			@RequestParam(value="pageNow")String pageNow,
			@RequestParam(value="flag")String flag,
			HttpSession session){
		
		int pageSize=4;
		System.out.println(pageNow);
		int pageNow_1=Integer.parseInt(pageNow);
		int flag_1=Integer.parseInt(flag);
		User user=(User) session.getAttribute("user");
		List<DetailComent> comentlist=comentService.getComent(user.getId(),pageNow_1, pageSize,flag_1);
		return comentlist;
		
	}
	@RequestMapping(value="replyComent.do")
	@ResponseBody
	public Object replyComent(
			@RequestParam(value="id") String id,
			@RequestParam(value="tid") String tid,
			@RequestParam(value="content") String content,
			HttpSession session){
		
		int id_1=Integer.parseInt(id);
		int tid_1=Integer.parseInt(tid);
		
		comentService.replyComent(id_1, tid_1, content);
		return "11111";
		
	}
	
	@RequestMapping(value="deleteComent.do")
	@ResponseBody
	public Object deleteComent(
			@RequestParam(value="id") String id,
			HttpSession session){
		
		int id_1=Integer.parseInt(id);	
		int count=comentService.deleteComent(id_1,1);
		return count;
		
	}
	@RequestMapping(value="leaveQuestion.do")
	@ResponseBody
	public Object leaveQuestion(@RequestParam(value="tid") String tid,@RequestParam(value="content") String content,Model m){
		int tid_1=Integer.parseInt(tid);
	    int count=comentService.leaveComent(0, content,tid_1,2);
	  
		return count;
		
	}
	@RequestMapping(value="showQuestion.do")
	@ResponseBody
	public Object showQuestion(@RequestParam(value="tid") String tid,Model m){
		int tid_1=Integer.parseInt(tid);
		List<DetailComent> list=comentService.getComentByTid(tid_1, 2);
		//System.out.println(list.get(0).getTname()+"");
		return list;
		
	}
	@RequestMapping(value="clearComent.do")
	@ResponseBody
	public void clearComent(){
	
          comentService.deleteAllrComent();
		
	}
}
