package com.pda.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pda.inter.IAdminDao;
import com.pda.model.Ad;
import com.pda.model.Article;
import com.pda.model.Exam;
import com.pda.model.Problems;
import com.pda.model.Student;
import com.pda.model.Trainer;
import com.pda.model.User;

@Repository
@Transactional
public class AdminDao implements IAdminDao{

	@Qualifier(value = "sessionFactory")
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<User> getAllUser(int from,int size) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User");
		query.setFirstResult(from);
		query.setMaxResults(size);
		if(query.list().size()>0)
			return query.list();
		return null;
	}

	@Override
	public void deleteUserById(int uid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from User where id=?");
		query.setInteger(0, uid);
		query.executeUpdate();
	}

	@Override
	public void updateUserByUser(int idnumber,String password) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("update Login set password=? where idnumber=?");
		query.setString(0, password);
		query.setInteger(1, idnumber);
		query.executeUpdate();
	}

	@Override
	public int getUserCount() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from User");
		if(query.list().size()>0)
			return Integer.parseInt(query.list().get(0).toString());
		return 0;
	}

	@Override
	public List<Student> getStudent(int from,int size) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Student");
		query.setFirstResult(from);
		query.setMaxResults(size);
	    System.out.println("**********************"+query.list().size());
	//	if(query.list().size()>0)
			return query.list();
	//	return null;
	}

	@Override
	public List<Integer> getTrainerId(int from,int size) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select tid from Trainer");
		query.setFirstResult(from);
		query.setMaxResults(size);
	//	if(query.list().size()>0)
			return query.list();
	//	return null;
	}

	@Override
	public int getStudentCount() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Student");
		if(query.list().size()>0)
			return Integer.parseInt(query.list().get(0).toString());
		return 0;
	}

	@Override
	public int getTrainerrCount() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Trainer");
		if(query.list().size()>0)
			return Integer.parseInt(query.list().get(0).toString());
		return 0;
	}

	@Override
	public void UpdateStatus(int uid,int status) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("update User set status=? where id=?");
		query.setInteger(0, status);
		query.setInteger(1, uid);
		query.executeUpdate();
	}

	

	@Override
	public void deleteLoginByIdnumber(String idnumber) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Login where user=?");
		query.setString(0, idnumber);
		query.executeUpdate();
	}

	@Override
	public void deleteStudentBySid(int sid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Student where sid=?");
		query.setInteger(0, sid);
		query.executeUpdate();
	}

	@Override
	public void deleteTrainerByTid(int tid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Trainer where tid=?");
		query.setInteger(0, tid);
		query.executeUpdate();
	}

	@Override
	public void deleteStudentByTid(int tid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Student where tid=?");
		query.setInteger(0, tid);
		query.executeUpdate();
	}

	@Override
	public void saveTrainer(Trainer trainer) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(trainer);
	}

	@Override
	public void deleteExam(int eid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Exam where id=?");
		query.setInteger(0, eid);
		query.executeUpdate();
	}

	@Override
	public void deleteExamScore(int eid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Examscore where eid=?");
		query.setInteger(0, eid);
		query.executeUpdate();
	}


	@Override
	public void saveExam(Exam exam) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(exam);
	}

	@Override
	public List<Integer> getExamScoreByEid(int eid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select score from Examscore where eid=?");
		query.setInteger(0, eid);
		List<Integer> list=query.list();
		return list;
	}

	@Override
	public void deleteComentById(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Coment where id=?");
		query.setInteger(0, id);
		query.executeUpdate();

	}

	@Override
	public List<Ad> getAd() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Ad");
		return query.list();
	}


	

	@Override
	public void saveArticle(Article art) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(art);
	}

	@Override
	public void updateAd(int id,String newname) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("update Ad set content=? where id=?");
		query.setString(0, newname);
		query.setInteger(1, id);
		query.executeUpdate();
	}

	@Override
	public String getAdContentById(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select content from Ad where id=?");
		query.setInteger(0, id);
		System.out.println((String) query.list().get(0)+"--------------------");
		return (String) query.list().get(0);
	}

	@Override
	public void updateNotice(String title, String Content) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("update Notice set content=? where title=?");
		query.setString(0, Content);
		query.setString(1, title);
		query.executeUpdate();
		
	}

	@Override
	public List<Object[]> getArticle(int from, int size,String type,String title) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=null;
		if(type.equals("all")){
	      query=session.createQuery("select id,title,author,date from Article");
		}else{
		  query=session.createQuery("select id,title,author,date from Article where "+type+" like ?");
		//  query.setString(0, type);
		  query.setString(0, "%"+title+"%");
		 // System.out.println("*****9*9***********"+type);
		}
		query.setFirstResult(from);
		query.setMaxResults(size);
		List<Object[]>  list=query.list();
		System.out.println(list.size());
	/*	List<Map<Object, Object>> alist=new ArrayList<Map<Object, Object>>();
		for(Object[] link : list){  
			int id =  (int) link[0];  
			String title = (String) link[1];  
			Map<Object, Object> map=new HashMap<Object, Object>();
			map.put(id, title);
			System.out.println(id + " : " + title+"**********"); 
			alist.add(map);
			}  */
		
		return list;
	}

	
	@Override
	public List<Object[]> getAllArticle() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select id,title from Article");
		List<Object[]>  list=query.list();
		return list;
	}

	@Override
	public int getArtCount() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Article");
		if(query.list().size()>0)
			return Integer.parseInt(query.list().get(0).toString());
		return 0;
	}

	@Override
	public void deleteArt(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Article where id=?");
		query.setInteger(0, id);
		query.executeUpdate();

	}

	@Override
	public int SaveProblem(Problems problem) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(problem);
		return 0;
	}
	@Override
	public int updateProblem(Problems problem) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.update(problem);
		return 0;
	}

	@Override
	public int getProblemCount() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select count(*) from Problems");
		return (int) query.list().get(0);
	}

	@Override
	public List<Problems> getProblems(int from, int size,String type,String title) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=null;
		if(type.equals("all"))
	       query=session.createQuery("from Problems order by id desc");
		else{
		   query=session.createQuery("from Problems where "+type+" like ? order by id desc");
		   query.setParameter(0, "%"+title+"%");
		}
		query.setFirstResult(from);
		query.setMaxResults(size);
		return query.list();
	}

	@Override
	public int deleteProblem(int pid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Problems where id=?");
		query.setInteger(0, pid);
		query.executeUpdate();
		return 0;
	}

	@Override
	public Problems getProblemById(int pid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Problems where id=?");
		query.setInteger(0, pid);
		return (Problems) query.list().get(0);
	}

	@Override
	public List<Trainer> getTrainer(int flag) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Trainer order  by rand()");
		if(flag==1){
		query.setFirstResult(0);
		query.setMaxResults(6);
		}
		return query.list();
	}

	@Override
	public String getTakeinInfor(int flag) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("select content from Ad where flag=?");
		query.setInteger(0, flag);
		return (String) query.list().get(0);
	}

	@Override
	public void deleteAllComent() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("delete from Coment where 1=1");
		query.executeUpdate();
	}

}
