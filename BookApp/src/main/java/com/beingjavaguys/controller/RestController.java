package com.beingjavaguys.controller;

import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;
import com.beingjavaguys.model.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beingjavaguys.model.Book;
import com.beingjavaguys.services.DataServices;

@Controller
@RequestMapping("/book")
public class RestController {

	@Autowired
	DataServices dataServices;
	
	static final Logger logger = Logger.getLogger(RestController.class);
	
	
	
	
	
	
	@RequestMapping(value = "/create", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	Status addEmployee(@RequestBody Book employee) {
		try {
			dataServices.addEntity(employee);
			return new Status(1, "Book added Successfully !");
		} catch (Exception e) {
			// e.printStackTrace();
			return new Status(0, e.toString());
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public @ResponseBody
	Book getEmployee(@PathVariable("id") long id) {
		Book employee = null;
		try {
			employee = dataServices.getEntityById(id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return employee;
	}
	
	
	@RequestMapping(value = "/multiple", method = RequestMethod.POST , consumes = "application/json")
	public @ResponseBody
	List<Book> getBooks_multiple1(@RequestBody Book bo)
	
		{ 
		
		System.out.println("-------------------------MULTIPLE QUERY-------------");
		System.out.println("-------------------------MULTIPLE QUERY-------------");
		
		String book_name =bo.getBook_name();
		String author_name =bo.getAuthor_name();
		String genre =bo.getGenre();
		String pages=bo.getPages();
		String year= bo.getYear();
		String rating=bo.getRating();
		
		List<Book> employee = null;
		
		try {
			employee = dataServices.get_multiple_EntityList(book_name, author_name, genre, pages, year, rating);
			
			
			System.out.println(Arrays.toString(employee.toArray()));
			System.out.println("-------------------------FUNC1 PASSED-------------");
			System.out.println("-------------------------FUNC PASSED-------------");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employee;
	}
	
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody
	List<Book> getEmployee() {

		List<Book> employeeList = null;
		try {
			employeeList = dataServices.getEntityList();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return employeeList;
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public @ResponseBody
	Status deleteEmployee(@PathVariable("id") long id) {

		try {
			dataServices.deleteEntity(id);
			return new Status(1, "Book deleted Successfully !");
		} catch (Exception e) {
			return new Status(0, e.toString());
		}

	}
}
