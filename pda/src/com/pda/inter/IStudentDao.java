package com.pda.inter;

import java.util.List;

import com.pda.model.Coment;
import com.pda.model.Exam;
import com.pda.model.Examscore;
import com.pda.model.Order;
import com.pda.model.Problems;
import com.pda.model.Student;
import com.pda.model.User;


public interface IStudentDao {

	public Student getStudent(int sid);
	public void SaveOrder(Order order);
	public List<Examscore> getExamScore(int sid,int from,int size);
    public Order getOrder(int sid);
    public boolean deleteOrder(int sid);
    public List<Problems> getProblems(int size);
    public String getResultById(int eid);
    public void saveExamScore(Examscore score);
    public void saveComent(Coment coment);
 
}
