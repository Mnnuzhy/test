package com.pda.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pda.inter.IComentService;
import com.pda.inter.IExamService;
import com.pda.inter.IManagerService;
import com.pda.inter.IOrderService;
import com.pda.inter.IUserService;
import com.pda.model.DetailOrder;
import com.pda.model.Student;
import com.pda.model.User;
import com.pda.model.Trainer;
@Controller
@RequestMapping(value = "/ChangeOver")
public class ChangeOverController {

	@Resource(name = "userService")
	private IUserService userService;

	@Resource(name = "orderService")
	private IOrderService orderService;

	@Resource(name = "examService")
	private IExamService examService;

	@Resource(name = "comentService")
	private IComentService comentService;

	@Resource(name = "managerService")
	private IManagerService managerService;

	@RequestMapping(value = "/admin.do")
	public String Admin(@RequestParam(value = "flag") String flag,
			HttpSession session, Model m) {
		User u = (User) session.getAttribute("user");
		if (u == null) {
			return "public/login";
		}
		int role = (int) session.getAttribute("role");

		if (role != 1) {
			return "public/error";
		}
		if (flag.equals("1")) {
			return "admin/home";

		} else if (flag.equals("2")) {
			int count = managerService.getArtCount();
			m.addAttribute("rowCount", count);
			return "admin/managerIndex";

		} else if (flag.equals("3")) {
			return "admin/notices";

		} else if (flag.equals("4")) {
			int studentCount = managerService.getStudentCount();
			int trainerCount = managerService.getTrainerCount();
			m.addAttribute("studentCount", studentCount);
			m.addAttribute("trainerCount", trainerCount);
			return "admin/manager";

		} else if (flag.equals("5")) {
			int examCount = examService.getExamCount();
			int proCount = examService.getProblemCount();
			m.addAttribute("examCount", examCount);
			m.addAttribute("proCount", proCount);
			return "admin/addExam";

		} else if (flag.equals("6")) {
			return "admin/changePass";

		} else if(flag.equals("7")){
			int rowCount = comentService.getPageCount(1);
			m.addAttribute("rowCount", rowCount);
			return "admin/managerComent";
		}else if(flag.equals("8")){
			return "admin/managerAd";
		}else {
			return "admin/managerGuide";
		}

	}

	@RequestMapping(value = "/trainer.do")
	public String Trainer(@RequestParam(value = "flag") String flag,
			HttpSession session, Model m) {
		User u = (User) session.getAttribute("user");
		if (u == null) {
			return "public/login";
		}
		int role = (int) session.getAttribute("role");
		if (role != 2) {
			return "public/error";
		}
		if (flag.equals("1")) {
			return "trainer/home";

		} else if (flag.equals("2")) {
			int pageSize = 5;
			int rowCount = managerService.getStudentCount(pageSize, u.getId());
			m.addAttribute("rowCount", rowCount);
			return "trainer/manager";

		} else if (flag.equals("3")) {
			int studentCount = managerService.getStudentCount(5, u.getId());
			m.addAttribute("studentCount", studentCount);
			return "trainer/addStudent";

		} else if (flag.equals("4")) {
			int pageSize = 5;
			int rowCount = managerService.getStudentCount(pageSize, u.getId());
			m.addAttribute("rowCount", rowCount);
			return "trainer/addScore";

		} else if (flag.equals("5")) {
			return "trainer/changeUser";

		} else if (flag.equals("6")) {
			return "trainer/changePass";

		} else if (flag.equals("7")) {

			int rowCount = comentService.getPageCount(1);
			m.addAttribute("rowCount", rowCount);
			int rowCount_1 = comentService.getPageCount(2);
			m.addAttribute("rowCount_1", rowCount_1);
			return "trainer/replyComent";

		}else{
			Trainer tr=managerService.getTrainerById(u.getId());
			m.addAttribute("tr", tr);
			return "trainer/identity";
		}

	}

	@RequestMapping(value = "/student.do")
	public String Student(@RequestParam(value = "flag") String flag,
			HttpSession session, Model m) {
		User u = (User) session.getAttribute("user");
		if (u == null) {
			return "public/login";
		}
		int role = (int) session.getAttribute("role");

		if (role != 3) {
			return "public/error";
		}
		if (flag.equals("1")) {
			Student sd = userService.getStudent(u.getId());
			m.addAttribute("sd", sd);
			return "student/home";

		} else if (flag.equals("2")) {
			return "student/appoint";

		} else if (flag.equals("3")) {

			DetailOrder order = orderService.getOrderDetail(u.getId());
			m.addAttribute("order", order);
			return "student/schedule";

		} else if (flag.equals("4")) {
			/*
			 * List<Exam> examlist=examService.getAllExam(); List<StudentScore>
			 * scorelist=examService.getExamScore(u.getId());
			 */
			int examCount = examService.getExamCount();
			int examScoreCount = examService.getExamScoreCount(u.getId());
			m.addAttribute("examCount", examCount);
			m.addAttribute("examScoreCount", examScoreCount);
			return "student/exam";

		} else if (flag.equals("5")) {
			return "student/changeUser";

		} else if (flag.equals("6")) {
			return "student/changePass";

		} else {

			int rowCount = comentService.getPageCount(1);
			m.addAttribute("rowCount", rowCount);
			return "student/coment";

		}

	}

	@RequestMapping(value = "/takeinStudent.do")
	public String takeinStudent(HttpSession session, Model m) {
		Map<Object, Object> map = managerService.showTakeinStudent();
		m.addAttribute("map", map);
		return "public/takeinStudent";

	}

	@RequestMapping(value = "/takeinTrainer.do")
	public String takeinTrainer(HttpSession session, Model m) {
		String m7 = managerService.getAdByFlag(7);
		m.addAttribute("m7", m7);
		return "public/takeinTrainer";

	}

	@RequestMapping(value = "/trainerDetail.do")
	public String trainerDetail(@RequestParam(value = "id") String id,
			HttpSession session, Model m) {
		int id_1 = Integer.parseInt(id);
		Map<Object, Object> map = managerService.getTrainerDetail(id_1);
		m.addAttribute("map", map);
		return "public/trainerDetail";

	}

	@RequestMapping(value = "/guide.do")
	public String guide(@RequestParam(value = "flag") String flag,
			HttpSession session, Model m) {
		String content = null;
		if (flag.equals("1")) {
			content = managerService.getAdContentById(10);
			m.addAttribute("title", "科目一");
		} else if (flag.equals("2")) {
			content = managerService.getAdContentById(11);
			m.addAttribute("title", "科目二");
		} else if (flag.equals("3")) {
			content = managerService.getAdContentById(12);
			m.addAttribute("title", "科目三");
		} else if (flag.equals("4")) {
			content = managerService.getAdContentById(13);
			m.addAttribute("title", "科目四");
		} else if (flag.equals("5")) {
			content = managerService.getAdContentById(14);
			m.addAttribute("title", "领证");
		}
		m.addAttribute("content", content);
		return "public/guide";

	}
}
