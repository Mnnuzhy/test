package com.pda.inter;

import java.util.List;

import com.pda.model.DetailStudent;
import com.pda.model.Student;
import com.pda.model.Trainer;
import com.pda.model.User;


public interface ITrainerDao {
	

   public List<Student> getStudent(int tid,int from,int size,int status);
   public void updateOrder(int id,String permision);
   public void saveStudent(Student student);
   public void updatetudent(Student student);
   public void updateComent(int id,int tid,String content,String date);
   public int getStudentCount(int tid);
   public Trainer getTrainer(int tid);
   public void updateTrainerInstruction(int tid,String content);
   public void updateTrainer(Trainer tr);
}
