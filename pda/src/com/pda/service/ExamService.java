package com.pda.service;

import java.io.File;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pda.inter.IAdminDao;
import com.pda.inter.IExamService;
import com.pda.inter.IStudentDao;
import com.pda.inter.IUserDao;
import com.pda.model.Exam;
import com.pda.model.Examscore;
import com.pda.model.Problems;
import com.pda.model.StudentScore;
import com.pda.model.User;

@Service
@Transactional
public class ExamService implements IExamService {

	private int err = 0;
	private int score = 0;
	@Qualifier(value = "studentDao")
	@Autowired
	private IStudentDao studentDao;

	@Qualifier(value = "userDao")
	@Autowired
	private IUserDao userDao;
	
	@Qualifier(value = "adminDao")
	@Autowired
	private IAdminDao adminDao;

	
	@Override
	public List<Exam> getAllExam(int pageNow,String type,String title) {
		// TODO Auto-generated method stub
		int pageSize=5;
		List<Exam> list = userDao.getExam(pageNow*pageSize,pageSize,type,title);
		if (list != null)
			return list;
		return null;
	}

	@Override
	public List<Problems> getProblems(String subject) {
		// TODO Auto-generated method stub
		List<Problems> list=null;
		if(subject.equals("科目一"))
			list = studentDao.getProblems(10);
		else if(subject.equals("科目四"))
			list = studentDao.getProblems(5);
		score = 0;
		err = 0;
		return list;
	}

	@Override
	public String judege(int eid, String result) {
		// TODO Auto-generated method stub
		String r_result = studentDao.getResultById(eid);
		// System.out.println(result+"********"+r_result+"id="+eid);
		if (result.equals(r_result)) {
			score++;
			System.out.println("score****" + score);
			return "1";
		} else {
			err++;
			System.out.println("err" + err);
			if (err == 50)
				return "-1";
			return "0";
		}

	}

	@Override
	public int getScore(int eid, int sid) {
		// TODO Auto-generated method stub
		Examscore examscore = new Examscore();
		examscore.setEid(eid);
		examscore.setSid(sid);
		examscore.setScore(score);
		studentDao.saveExamScore(examscore);
		return score;
	}

	@Override
	public String getExamName(int eid) {
		// TODO Auto-generated method stub
		Exam exam = userDao.getExamById(eid);
		return exam.getExamname();
	}
	@Override
	public String getSubject(int eid) {
		// TODO Auto-generated method stub
		Exam exam = userDao.getExamById(eid);
		return exam.getSubject();
	}

	@Override
	public List<StudentScore> getExamScore(int sid,int pageNow) {
		// TODO Auto-generated method stub
		int pageSize=5;
		List<StudentScore> stlist=new ArrayList<StudentScore>();
		List<Examscore> list= studentDao.getExamScore(sid,pageNow*pageSize,pageSize);
		for (int i = 0; i < list.size(); i++) {
			StudentScore st=new StudentScore();
			Examscore examscore=list.get(i);
			Exam exam=userDao.getExamById(examscore.getEid());
			st.setExamname(exam.getExamname());
			st.setExamsubject(exam.getSubject());
			st.setScore(examscore.getScore());
			stlist.add(st);
		}
			
		return stlist;
	}

	@Override
	public String varifyDate(int id) {
		// TODO Auto-generated method stub
		Exam exam=userDao.getExamById(id);
		String begindate=exam.getBegindate();
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(begindate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date currentdate=new Date();
		if(currentdate.after(date))
			return "1";
		return "0";
	}

	@Override
	public int getExamCount() {
		// TODO Auto-generated method stub
		int size=userDao.getExamCount();
		return size;
	}

	@Override
	public int getExamScoreCount(int sid) {
		// TODO Auto-generated method stub
		int size=userDao.getExamScoreCount(sid);
		return size;
	}

	@Override
	public void deleteExam(int eid) {
		// TODO Auto-generated method stub
		adminDao.deleteExam(eid);
		adminDao.deleteExamScore(eid);
	}

	@Override
	public void addExam(String examname, String examsubject, String date) {
		// TODO Auto-generated method stub
		Exam exam=new Exam();
		exam.setExamname(examname);
		exam.setSubject(examsubject);
		exam.setBegindate(date);
		adminDao.saveExam(exam);
	}

	@Override
	public List<String> getExamRate(int eid) {
		// TODO Auto-generated method stub
		List<String> list=new ArrayList<String>();
		List<Integer> listScore=adminDao.getExamScoreByEid(eid);
		double number=listScore.size();
		double t=0;
		for (int i = 0; i < listScore.size(); i++) {
			int score=listScore.get(i);
			if(score>=90)
				t++;
		}
		double rate=t/number;
		NumberFormat nb=NumberFormat.getPercentInstance();
		nb.setMinimumFractionDigits(2);
		String r=nb.format(rate);
		list.add(number+"");
		list.add(r);
		return list;
	}

	@Override
	public void deleteExamData(int eid) {
		// TODO Auto-generated method stub
		adminDao.deleteExam(eid);
	}

	@Override
	public int addProblem(String psubject, String pcontent,
			String imag, String a, String b, String c, String d, String result,String ptype) {
		// TODO Auto-generated method stub
		Problems pro=new Problems();
		pro.setSubject(psubject);
		pro.setProblem(pcontent);
		pro.setA(a);
		pro.setB(b);
		pro.setC(c);
		pro.setD(d);
		pro.setResult(result);
		pro.setImag(imag);
		pro.setType(ptype);
		adminDao.SaveProblem(pro);
		int pcount=adminDao.getProblemCount();
		return pcount;
	}

	@Override
	public void changeProblem(int pid, String psubject, String pcontent,
			String imag, String a, String b, String c, String d, String result,String ptype) {
		// TODO Auto-generated method stub
		Problems pro=new Problems();
		pro.setId(pid);
		pro.setSubject(psubject);
		pro.setProblem(pcontent);
		pro.setA(a);
		pro.setB(b);
		pro.setC(c);
		pro.setD(d);
		pro.setResult(result);
		pro.setImag(imag);
		pro.setType(ptype);
		adminDao.updateProblem(pro);
	}

	@Override
	public int getProblemCount() {
		// TODO Auto-generated method stub
		int pcount=adminDao.getProblemCount();
		return pcount;
	}

	@Override
	public List<Problems> getProPage(int pageNow, int pageSize,String type,String title) {
		// TODO Auto-generated method stub
		int from=pageNow*pageSize;
		List<Problems> list=adminDao.getProblems(from, pageSize,type,title);
		return list;
	}

	@Override
	public int deletePro(int pid) {
		// TODO Auto-generated method stub
		Problems pro=adminDao.getProblemById(pid);
		String imag=pro.getImag();
		File file=new File("rescourse/imag/pro/"+imag);
		if(file.exists())
			file.delete();
		adminDao.deleteProblem(pid);
		int pcount=adminDao.getProblemCount();
		return pcount;
	}

	@Override
	public Problems getPro(int pid) {
		// TODO Auto-generated method stub
		Problems pro=adminDao.getProblemById(pid);
		return pro;
	}


}
