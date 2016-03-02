package com.beingjavaguys.services;

import java.util.List;

import com.beingjavaguys.model.Book;

public interface DataServices {
	public boolean addEntity(Book employee) throws Exception;
	public Book getEntityById(long id) throws Exception;
	public List<Book> getEntityList() throws Exception;
	public List<Book> get_multiple_EntityList(String book_name,String author_name,String genre,String pages,String year,String rating) throws Exception;
	public boolean deleteEntity(long id) throws Exception;
}
