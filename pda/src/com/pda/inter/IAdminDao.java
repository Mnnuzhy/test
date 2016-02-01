package com.pda.inter;

import java.util.List;

import com.pda.model.Ad;
import com.pda.model.Article;
import com.pda.model.Exam;
import com.pda.model.Problems;
import com.pda.model.Student;
import com.pda.model.Trainer;
import com.pda.model.User;



public interface IAdminDao {
	
   
	public List<User> getAllUser(int from,int size); 
	public void deleteUserById(int uid);
	public void updateUserByUser(int idnumber,String password);
	public int getUserCount();
	public int getStudentCount();
	public int getTrainerrCount();
	public List<Student> getStudent(int from,int size);
	public List<Integer> getTrainerId(int from,int size);
	public void UpdateStatus(int uid,int status);
	public void deleteLoginByIdnumber(String idnumber);
	public void deleteStudentBySid(int sid);
	public void deleteStudentByTid(int tid);
	public void deleteTrainerByTid(int tid);
	public void saveTrainer(Trainer trainer);
	public void deleteExam(int eid);
	public void deleteExamScore(int eid);
	public void saveExam(Exam exam);
    public List<Integer> getExamScoreByEid(int eid);
    public void deleteComentById(int id);
    public List<Ad> getAd();
    public void saveArticle(Article art);
    public void updateAd(int id,String newname);
    public String getAdContentById(int id);
    public void updateNotice(String title,String Content);
    public List<Object[]> getArticle(int from,int size,String type,String title);
    public List<Object[]> getAllArticle();
	public int getArtCount();
	public void deleteArt(int id);
	public int SaveProblem(Problems problem);
	public int updateProblem(Problems problem);
	public int getProblemCount();
	public List<Problems> getProblems(int from,int size,String type,String title);
	public int deleteProblem(int pid);
	public Problems getProblemById(int pid);
	public List<Trainer> getTrainer(int flag);
	public String getTakeinInfor(int flag);
	public void deleteAllComent();
 }
