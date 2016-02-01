package com.pda.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pda.inter.ITrainerDao;
import com.pda.model.Student;
import com.pda.model.Trainer;
import com.pda.model.User;

@Repository
@Transactional
public class TrainerDao implements ITrainerDao{

	@Qualifier(value = "sessionFactory")
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Student> getStudent(int tid,int from,int size,int status) {
		// TODO Auto-generated method stub
		String sql=null;
		Session session=sessionFactory.getCurrentSession();
		if(status==1){
		   sql="from Student where tid=? order by id asc";
		}else{
			sql="from Student where tid=? order by id desc";
		}
		Query query=session.createQuery(sql);
		query.setInteger(0, tid);
		query.setFirstResult(from);
		query.setMaxResults(size);
		System.out.println("tid*******************="+tid);
     	return	query.list();
		
	}

	@Override
	public void updateOrder(int id,String permision) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("update Order set permision=? where id=?");
		query.setString(0, permision);
		query.setInteger(1, id);
		query.executeUpdate();
	}

	

	@Override
	public void saveStudent(Student student) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(student);
	}

	@Override
	public void updatetudent(Student student) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("update Student set subjectone=?,subjecttow=?,subjectthree=?,subjectfour=? where id=?");
	    query.setInteger(0, student.getSubjectone());
	    query.setInteger(1, student.getSubjecttow());
	    query.setInteger(2, student.getSubjectthree());
	    query.setInteger(3, student.getSubjectfour());
	    query.setInteger(4, student.getId());
	    query.executeUpdate();
	}

	@Override
	public void updateComent(int id,int tid,String content,String date) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("update Coment set tid=?,replycoment=?,replydate=? where id=?");
		query.setInteger(0, tid);
		query.setString(1, content);
		query.setString(2, date);
		query.setInteger(3, id);
		query.executeUpdate();
		
	}

	@Override
	public int getStudentCount(int tid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Student where tid=?");
		query.setInteger(0, tid);
		int size = Integer.parseInt(query.list().get(0).toString());
		return size;
	}


	@Override
	public Trainer getTrainer(int tid) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Trainer where tid=?");
		query.setInteger(0, tid);
		if(query.list().size()>0)
	      return (Trainer) query.list().get(0);
		return null;
	}

	@Override
	public void updateTrainerInstruction(int tid, String content) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update Trainer set instruction=? where tid=?");
		query.setString(0, content);
		query.setInteger(1, tid);
		query.executeUpdate();
	}

	@Override
	public void updateTrainer(Trainer tr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(tr);
	}


}
