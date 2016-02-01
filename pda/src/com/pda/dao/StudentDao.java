package com.pda.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pda.inter.IStudentDao;
import com.pda.model.Coment;
import com.pda.model.Exam;
import com.pda.model.Examscore;
import com.pda.model.Order;
import com.pda.model.Problems;
import com.pda.model.Student;
import com.pda.model.Trainer;
import com.pda.model.User;

@Repository
@Transactional
public class StudentDao implements IStudentDao {

	@Qualifier(value = "sessionFactory")
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void SaveOrder(Order order) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(order);
	}

	@Override
	public List<Examscore> getExamScore(int sid,int from,int size) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Examscore where sid=?");
		query.setInteger(0, sid);
		query.setFirstResult(from);
		query.setMaxResults(size);
		return query.list();
	}

	@Override
	public Student getStudent(int sid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Student where sid=?");
		query.setInteger(0, sid);
		if(query.list().size()>0)
		      return (Student) query.list().get(0);
		return null;
	}

	@Override
	public Order getOrder(int sid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Order where sid=?");
		query.setInteger(0, sid);
		if (query.list().size()>0)
			return (Order) query.list().get(0);
		else
			return null;
	}

	@Override
	public boolean deleteOrder(int sid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete Order where sid=?");
		query.setInteger(0, sid);
		query.executeUpdate();
		return false;
	}

	

	@Override
	public List<Problems> getProblems(int size) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Problems order by rand()");
		query.setFirstResult(0);
		query.setMaxResults(size);
		return query.list();
	}

	@Override
	public String getResultById(int eid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Problems where id=?");
		query.setInteger(0, eid);
		Problems p=(Problems) query.list().get(0);
		return p.getResult();
	}

	
	@Override
	public void saveExamScore(Examscore score) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(score);
	}

	@Override
	public void saveComent(Coment coment) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(coment);
	}


	

}
