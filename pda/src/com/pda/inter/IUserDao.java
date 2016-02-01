package com.pda.inter;


import java.util.List;

import com.pda.model.Article;
import com.pda.model.Coment;
import com.pda.model.Exam;
import com.pda.model.Login;
import com.pda.model.User;

public interface IUserDao {
	public Login getLogin(String user);
    public User getUser(String user);
    public void updateUser(User user);
    public void UpdatePassword(Login login);
    public List<Coment> getComent(int tid,int from,int to,int flag);
    public int getComentCount(int flag);
    public String getUseNameById(int id);
    public User getUserById(int id);
    public User getUserById(int id,String type,String title,int staus);
    public void saveUser(User user);
    public List<Exam> getExam(int from,int size,String type,String title);
    public Exam getExamById(int eid);
    public int getExamCount();
    public int getExamScoreCount(int sid);
	public void updatePassword(String idnumber,String password);
	public void saveLogin(Login login);
	public Article getArticleByid(int id);
	public List<Coment> getComentByTid(int tid,int flag);

   
}
