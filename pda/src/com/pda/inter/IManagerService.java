package com.pda.inter;

import java.util.List;
import java.util.Map;

import com.pda.model.DetailStudent;
import com.pda.model.Trainer;
import com.pda.model.User;

public interface IManagerService {

	public  Map<Object, Object> getStudent(int tid,int pageNow,int size,String type,String title,int status);
	public void takeinStudent(int tid,String idnumber,String name,String sex,String tel,String email,String remark,String idimag);
	public void takeinTrainer(String idnumber,String name,String sex,String tel,String email,String remark,String idimag);
	public List<DetailStudent> getStudentScore(int tid,int pageNow,int size,String type,String title);
	public int addScore(int id,int sid,int one,int tow,int three,int four);
	public int getStudentCount(int pageSize,int tid);
	public List<User> getUser(int pageNow);
	public int getUserCount();
	public int getStudentCount();
	public int getTrainerCount();
	public List<Map<Object, Object>> getStudent(int pageNow,int size,String type,String title,int status);
	public List<Map<Object, Object>> getTrainer(int pageNow,int size,String type,String title,int status);
	public int checkUser(int uid,String role);
	public int deleteUser(int uid,int role);
	public Map<Object, Object> getIndexContent();
	public List<String> getLoginImag();
	public void addArticle(String title,String author,String content);
	public void updateAd(int id,String newname);
	public String getAdContentById(int id);
	public List<Map<Object, Object>> getArticleList(int pageNow,int size,String type,String title);
	public List<Map<Object, Object>> getAllArticleList();
	public int getArtCount();
	public int deleteArt(int id);
	public  Map<Object, Object> showTakeinStudent();
	public  String getAdByFlag(int flag);
	public  Map<Object, Object> getTrainerDetail(int tid);
	public  Trainer getTrainerAd(int tid);
	public  String UpdateTrainerAd(int tid,String content);
	public  String UpdateTrainerAd1(int tid,String place,String price,String imag);
	public  String identifyTrainer(int tid,String year,String imag1,String imag2);
	public  Trainer getTrainerById(int tid);
	public  void updateStatus(int tid,int status);

}
