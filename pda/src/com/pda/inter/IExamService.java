package com.pda.inter;

import java.util.List;
import java.util.Map;

import com.pda.model.Exam;
import com.pda.model.Problems;
import com.pda.model.StudentScore;
import com.pda.model.User;


public interface IExamService {

	public List<Exam> getAllExam(int pageNow,String type,String title);
	public List<Problems> getProblems(String subject);
	public String judege(int eid,String result);
	public int getScore(int eid,int sid);
	public String getExamName(int eid); 
	public String getSubject(int eid); 
	public List<StudentScore> getExamScore(int sid,int pageNow);
	public String varifyDate(int id);
	public int getExamCount();
	public int getExamScoreCount(int sid);
	public void deleteExam(int eid);
	public void addExam(String examname,String examsubject,String date);
	public List<String> getExamRate(int eid);
	public void deleteExamData(int eid);
	public int getProblemCount();
	public List<Problems> getProPage(int pageNow,int pageSize,String type,String title);
	public int addProblem(String psubject,String pcontent,String imag,String a,String b,String c,String d,String result,String ptype);
	public void changeProblem(int pid,String psubject,String pcontent,String imag,String a,String b,String c,String d,String result,String ptype);
	public int deletePro(int pid);
	public Problems getPro(int pid);
}
