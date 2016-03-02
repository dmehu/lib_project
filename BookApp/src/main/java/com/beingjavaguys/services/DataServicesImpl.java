package com.beingjavaguys.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.beingjavaguys.dao.DataDao;
import com.beingjavaguys.model.Book;

public class DataServicesImpl implements DataServices {

	@Autowired
	DataDao dataDao;
	
	@Override
	public boolean addEntity(Book employee) throws Exception {
		return dataDao.addEntity(employee);
	}

	@Override
	public Book getEntityById(long id) throws Exception {
		return dataDao.getEntityById(id);
	}

	@Override
	public List<Book> getEntityList() throws Exception {
		return dataDao.getEntityList();
	}
	
	public List<Book>get_multiple_EntityList(String book_name,String author_name,String genre,String pages,String year,String rating ) throws Exception {
		return dataDao.get_multiple_EntityList(book_name,author_name,genre,pages,year,rating);
	}

	@Override
	public boolean deleteEntity(long id) throws Exception {
		return dataDao.deleteEntity(id);
	}

}
