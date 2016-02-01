package com.pda.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pda.inter.IUserDao;
import com.pda.model.Article;
import com.pda.model.Coment;
import com.pda.model.Exam;
import com.pda.model.Login;
import com.pda.model.User;

@Repository
@Transactional
public class UserDao implements IUserDao {

	@Qualifier(value = "sessionFactory")
	@Autowired
	private SessionFactory sessionFactory;

	public Login getLogin(String user) {

		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Login where user=?");
		query.setString(0, user);
		Login login = null;
		try {
			login = (Login) query.list().get(0);
		} catch (Exception e) {
			return null;
		}
		return login;

	}

	@Override
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
	}
	
	@Override
	public User getUser(String user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where idnumber=?");
		query.setString(0, user);
		if (query.list().size()>0) {
			User u = (User) query.list().get(0);
			return u;
		} else
			return null;
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(user);
	}

	@Override
	public void UpdatePassword(Login login) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(login);
	}

	@Override
	public List<Coment> getComent(int tid,int from, int to,int flag) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query=null;
		if(flag==1){
		query = session.createQuery("from Coment where flag=? order by id desc");
		query.setInteger(0, flag);
		}
		else if(flag==2){
			query = session.createQuery("from Coment where flag=? and tid=? order by id desc");
			query.setInteger(0, flag);
			query.setInteger(1, tid);
		}
		else if(flag==3){
			query = session.createQuery("from Coment order by id desc");
		}
		else{
			query = session.createQuery("from Coment  where flag=2 order by id desc");
			
		}
			
		query.setFirstResult(from);
		query.setMaxResults(to);
		if (query.list() != null)
			return query.list();
		return null;
	}

	@Override
	public int getComentCount(int flag) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Coment where flag=?");
		query.setInteger(0, flag);
		int size = Integer.parseInt(query.list().get(0).toString());
		return size;
	}

	@Override
	public String getUseNameById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where id=?");
		query.setInteger(0, id);
		if (query.list().size() > 0) {
			User u = (User) query.list().get(0);
			return u.getName();
		}
		return null;

	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub

		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where id=?");
		query.setInteger(0, id);
		User u = (User) query.list().get(0);
		return u;
	}
	@Override
	public User getUserById(int id,String type,String title,int status) {
		// TODO Auto-generated method stub

		Session session = sessionFactory.getCurrentSession();
		Query query =null;
		System.out.println("type---------"+type);
		
		if(type.equals("all")){
			if(status==-1)
	           query = session.createQuery("from User where id=?");
			else{
				query = session.createQuery("from User where id=? and status=?");
				query.setInteger(1, status);
			}
	       query.setInteger(0, id);
		}else{
			if(status==-1)
			   query = session.createQuery("from User where id=? and "+type+" like ?");
			else{
			   query = session.createQuery("from User where id=? and "+type+" like ? and status=?");
			   query.setInteger(2, status);
			}
		     query.setInteger(0, id);
		     query.setParameter(1, "%"+title+"%");
		}
		User u=null;
		if(query.list().size()>0)
		 u = (User) query.list().get(0);
		return u;
	}
	@Override
	public Exam getExamById(int eid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Exam where id=?");
		query.setInteger(0, eid);	
		Exam exam=(Exam)query.list().get(0);
		return exam;
	}
	@Override
	public List<Exam> getExam(int from,int size,String type,String title) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=null;
		if(type.equals("all")){
		   query=session.createQuery("from Exam");
		}else{
		   query=session.createQuery("from Exam where "+type+" like ?");
		   query.setParameter(0, "%"+title+"%");
		}
		query.setFirstResult(from);
		query.setMaxResults(size);
		List<Exam> list=query.list();
		 return list;
	
	}

	@Override
	public int getExamCount() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Exam");
		int size = Integer.parseInt(query.list().get(0).toString());
		return size;
	}

	@Override
	public int getExamScoreCount(int sid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Examscore where sid=?");
		query.setInteger(0, sid);
		int size = Integer.parseInt(query.list().get(0).toString());
		return size;
	}
	@Override
	public void updatePassword(String idnumber, String password) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("update Login set password=? where user=?");
		query.setString(0, password);
		query.setString(1, idnumber);
		query.executeUpdate();
	}

	@Override
	public void saveLogin(Login login) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(login);
	}
	@Override
	public Article getArticleByid(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Article where id=?");
		query.setInteger(0, id);
		return (Article) query.list().get(0);
	}

	@Override
	public List<Coment> getComentByTid(int tid,int flag) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Coment where tid=? and flag=? order by id desc");
		query.setInteger(0, tid);
		query.setInteger(1, flag);
		return query.list();
	}


}
