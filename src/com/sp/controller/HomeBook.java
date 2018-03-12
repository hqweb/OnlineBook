package com.sp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import com.sp.model.BookBean;
import com.sp.model.BookBeanCl;

public class HomeBook extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public HomeBook() {
		
		super();
		
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int PageCount;
		BookBeanCl bbc=new BookBeanCl();
		ArrayList<BookBean> ListBook= bbc.getBookByPage(1);
		PageCount = bbc.getPageCount();
		request.getSession().setAttribute("myName", "");
		
		//BookBean bb=(BookBean)ListBook.get(1);
		request.setAttribute("ListBook", ListBook);
		request.setAttribute("PageCount", PageCount);
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/json"); 
		response.setCharacterEncoding("UTF-8"); 
		String pageStr=request.getParameter("pageSer");
		int pageInt = Integer.parseInt(pageStr);
		int i = 0;
		BookBeanCl bbc=new BookBeanCl();
		ArrayList<BookBean> ListBook= bbc.getBookByPage(pageInt);
		
		
		
		
		JSONObject json = new JSONObject(); 
		JSONArray array = new JSONArray(); 
		JSONObject member = null;    
		
		for(;i<ListBook.size();i++)
		{
			BookBean bb=(BookBean)ListBook.get(i);
			
			member = new JSONObject();      
		    member.put("name", bb.getName());   
			member.put("author", bb.getAuthor());  
			member.put("cover", bb.getCover()); 
			member.put("synopsis", bb.getSynopsis());
			member.put("price", bb.getPrice());     
			member.put("salesvolume", bb.getSalesvolume());
			member.put("stock", bb.getStock());  
			array.add(member);    
			//System.out.printf("%d", ListBook.size());  
		}
		
		  for(; i < 6; i++){ //不足六本制空
				member = new JSONObject();      
				member.put("name", " ");   
				member.put("author", " ");  
				member.put("cover", " "); 
				member.put("synopsis", " ");
				member.put("price", " ");   
				member.put("salesvolume", " ");
				member.put("stock", " ");  
				array.add(member); 
		  }
		  json.put("jsonArray", array);   
		        
		  PrintWriter pw = response.getWriter();       
		  pw.print(json.toString());      
		        
		 // System.out.println("json array :"+array.toString());      
		 // System.out.println("json object :"+json.toString());      
		        
		  pw.close();   
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
