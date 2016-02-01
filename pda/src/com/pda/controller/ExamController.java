package com.pda.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

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
import com.pda.inter.IExamService;
import com.pda.inter.IUserService;
import com.pda.model.Exam;
import com.pda.model.Problems;
import com.pda.model.StudentScore;
import com.pda.model.User;
import com.pda.service.UserService;

@Controller
@RequestMapping(value = "/Exam")
public class ExamController {

	@Resource(name = "examService")
	private IExamService examService;
	
	@Resource(name = "userService")
	private IUserService userService;
	@RequestMapping(value="/examing.do")
	
    public String Examing(@RequestParam(value="eid")String eid,HttpSession session,Model m) throws UnsupportedEncodingException{
    	 
		User u=(User)session.getAttribute("user");
		if(u==null){
			return "public/login";
		}
		
		/*byte ch[];
        ch = examname.getBytes("ISO-8859-1"); //以"ISO-8859-1"方式解析name字符串
        examname= new String(ch, "UTF-8"); //再用"utf-8"格式表示name*
		System.out.println(URLDecoder.decode(examname, "utf-8"));*/
		String examname=examService.getExamName(Integer.parseInt(eid));
		String examsubject=examService.getSubject(Integer.parseInt(eid));
		List<Problems> problemlist=examService.getProblems(examsubject);
		m.addAttribute("examname", examname);
		m.addAttribute("examsubject", examsubject);
		m.addAttribute("eid", eid);
		m.addAttribute("problemlist", problemlist);
		//System.out.println(problemlist.get(0).getProblem());
    	return "student/examing";
    }
	@RequestMapping(value="examjudge.do")
	@ResponseBody
	public String examJudge(@RequestParam(value="pid")String pid,@RequestParam(value="result")String result){
		int pid_1=Integer.parseInt(pid);
		String b=examService.judege(pid_1, result);
		return b;
	}
	@RequestMapping(value="result.do")
	@ResponseBody
	public String result(@RequestParam(value="eid")String eid,HttpSession session){
		System.out.println(eid);
		int eid_1=Integer.parseInt(eid);
		User u=(User) session.getAttribute("user");
		int score=examService.getScore(eid_1,u.getId());
		System.out.println("******");
		return score+"";
	}
	
	@RequestMapping(value="varifyDate.do")
	@ResponseBody
	public String varifyExam(@RequestParam(value="id")String id,HttpSession session){
		int id_1=Integer.parseInt(id);
		String flag=examService.varifyDate(id_1);
		return flag;
	}
	
	@RequestMapping(value="getAllExam.do")
	@ResponseBody
	public Object getAllExam(@RequestParam(value="pageNow")String pageNow,
			@RequestParam(value="type")String type,
			@RequestParam(value="title")String title,
			HttpSession session){
		int pageNow_1=Integer.parseInt(pageNow);
        List<Exam> listexam=examService.getAllExam(pageNow_1,type,title);
       // System.out.println(listexam.get(0).getBegindate()+"******************");
		return listexam;
	}
	
	@RequestMapping(value="getExamScore.do")
	@ResponseBody
	public Object getExamScore(@RequestParam(value="pageNow")String pageNow,
			HttpSession session){
		int pageNow_1=Integer.parseInt(pageNow);
		User user=(User) session.getAttribute("user");
        List<StudentScore> list=examService.getExamScore(user.getId(), pageNow_1);
        
		return list;
	}
	@RequestMapping(value="deleteExam.do")
	@ResponseBody
	public Object deleteExam(@RequestParam(value="eid")String eid,
			HttpSession session){
		int eid_1=Integer.parseInt(eid);
        examService.deleteExam(eid_1);
        int examCount=examService.getExamCount();
		return examCount;
	}
	
	@RequestMapping(value="addExam.do")
	@ResponseBody
	public Object addExam(
			@RequestParam(value="examname")String examname,
			@RequestParam(value="examsubject")String examsubject,
			@RequestParam(value="date")String date,
			HttpSession session){
        examService.addExam(examname, examsubject, date);
        int examCount=examService.getExamCount();
		return examCount;
	}
	
	@RequestMapping(value="getRate.do")
	@ResponseBody
	public Object getRate(
			@RequestParam(value="eid")String eid,
			HttpSession session){
		int eid_1=Integer.parseInt(eid);
        List<String> list=examService.getExamRate(eid_1);
		return list;
	}
	
	@RequestMapping(value="deleteData.do")
	@ResponseBody
	public Object deleteData(
			@RequestParam(value="eid")String eid,
			HttpSession session){
		int eid_1=Integer.parseInt(eid);
        examService.deleteExamData(eid_1);
		return null;
	}
	
	@RequestMapping(value="addPro.do")
	@ResponseBody
	public Object addPro(
			@RequestParam(value="psubject")String psubject,
			@RequestParam(value="pcontent")String pcontent,
			@RequestParam(value="pimag")String pimag,
			@RequestParam(value="pa")String pa,
			@RequestParam(value="pb")String pb,
			@RequestParam(value="pc")String pc,
			@RequestParam(value="pd")String pd,
			@RequestParam(value="result")String result,
			@RequestParam(value="ptype")String ptype,
			HttpSession session){
		
        int pcount=examService.addProblem(psubject, pcontent, pimag, pa, pb, pc, pd, result,ptype);
		return pcount;
	}
	@RequestMapping(value="updatePro.do")
	@ResponseBody
	public Object updatePro(
			@RequestParam(value="pid")String pid,
			@RequestParam(value="psubject")String psubject,
			@RequestParam(value="pcontent")String pcontent,
			@RequestParam(value="pimag")String pimag,
			@RequestParam(value="pa")String pa,
			@RequestParam(value="pb")String pb,
			@RequestParam(value="pc")String pc,
			@RequestParam(value="pd")String pd,
			@RequestParam(value="result")String result,
			@RequestParam(value="ptype")String ptype,
			HttpSession session){
		int pid_1=Integer.parseInt(pid);
		examService.changeProblem(pid_1, psubject, pcontent, pimag, pa, pb, pc, pd, result,ptype);
		return null;
	}
	@RequestMapping(value="proList.do")
	@ResponseBody
	public Object proList(
			@RequestParam(value="pageNow")String pageNow,
			@RequestParam(value="type")String type,
			@RequestParam(value="title")String title,
			HttpSession session){
		int pageNow_1=Integer.parseInt(pageNow);
		int pageSize=5;
		List<Problems> list=examService.getProPage(pageNow_1, pageSize,type,title);
		return list;
	}
	@RequestMapping(value="deletePro.do")
	@ResponseBody
	public Object deletePro(
			@RequestParam(value="pid")String pid,
			HttpSession session){
		int pid_1=Integer.parseInt(pid);
		int pcount=examService.deletePro(pid_1);
		return pcount;
	}
	@RequestMapping(value = "/upload.do")
	@ResponseBody
	public Object uploadFile(@RequestParam(value = "file") MultipartFile file,
			HttpServletRequest request) throws IllegalStateException,
			IOException {

		if (file.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/pro");
		String oldname=null;	
		String filename = userService.uploadFile(file, path, oldname);
		return filename;
	}
	
	@RequestMapping(value = "/upload1.do")
	@ResponseBody
	public Object uploadFile1(@RequestParam(value = "cfile") MultipartFile cfile,
			HttpServletRequest request) throws IllegalStateException,
			IOException {

		if (cfile.isEmpty())
			return null;
		String path = request.getSession().getServletContext()
				.getRealPath("rescourse/imag/pro");
		String oldname=null;	
		String filename = userService.uploadFile(cfile, path, oldname);
		return filename;
	}
	@RequestMapping(value="getPro.do")
	@ResponseBody
	public Object getPro(
			@RequestParam(value="pid")String pid,
			HttpSession session){
		int pid_1=Integer.parseInt(pid);

		Problems pro=examService.getPro(pid_1);
		return pro;
	}
}
