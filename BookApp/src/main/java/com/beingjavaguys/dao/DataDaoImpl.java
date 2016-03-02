package com.beingjavaguys.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import com.beingjavaguys.model.Book;

public class DataDaoImpl implements DataDao {

	@Autowired
	SessionFactory sessionFactory;

	Session session = null;
	Transaction tx = null;

	@Override
	public boolean addEntity(Book employee) throws Exception {

		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		session.save(employee);
		tx.commit();
		session.close();

		return false;
	}

	@Override
	public Book getEntityById(long id) throws Exception {
		session = sessionFactory.openSession();
		Book employee = (Book) session.load(Book.class,
				new Long(id));
		tx = session.getTransaction();
		session.beginTransaction();
		tx.commit();
		return employee;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> getEntityList() throws Exception {
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		List<Book> employeeList = session.createCriteria(Book.class)
				.list();
		tx.commit();
		session.close();
		return employeeList;
	}
	
	
	
	@Override
	public List<Book> get_multiple_EntityList(String book_name,String author_name,String genre,String pages,String year,String rating)throws Exception {
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
		
		Criteria criteria=session.createCriteria(Book.class);
			if(book_name!=null)
			{
				criteria.add(Restrictions.like("book_name", book_name+"%",MatchMode.ANYWHERE));
			}
			if(author_name!=null)
			{
			criteria.add(Restrictions.like("author_name",author_name+"%",MatchMode.ANYWHERE));
			}
			if(genre!=null)
			{
			criteria.add(Restrictions.like("genre", genre+"%",MatchMode.ANYWHERE));
			
			}	
			if(pages!= null)
			{
				criteria.add(Restrictions.like("pages",pages+"%",MatchMode.ANYWHERE));
			}
			
			if(year!=null)
			{
				criteria.add(Restrictions.like("year", year+"%",MatchMode.ANYWHERE));
			
			}
			
			if(rating!=null)
			{
				criteria.add(Restrictions.like("rating",rating+"%",MatchMode.ANYWHERE));
			}
	
		
				criteria.addOrder(Order.desc("rating"));
		@SuppressWarnings("unchecked")
		List<Book> employeeList=criteria.list();
		tx.commit();
		session.close();
		return employeeList;
	}
	
	
	
	@Override
	public boolean deleteEntity(long id)
			throws Exception {
		session = sessionFactory.openSession();
		Object o = session.load(Book.class, id);
		tx = session.getTransaction();
		session.beginTransaction();
		session.delete(o);
		tx.commit();
		return false;
	}

}
