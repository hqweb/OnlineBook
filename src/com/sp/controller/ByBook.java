package com.sp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.sp.model.BookBean;
import com.sp.model.BookBeanCl;
import com.sp.model.UserBean;
import com.sp.model.UserBeanCl;

public class ByBook extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ByBook() {
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
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String bookName=URLDecoder.decode(request.getParameter("bookName"),"utf-8");
		String bookPrice=request.getParameter("bookPrice");
		String bookNum=request.getParameter("bookNum");
		int bookNumInt = Integer.parseInt(bookNum);
		double bookPriceInt = Double.valueOf(bookPrice).doubleValue();
		PrintWriter pw = response.getWriter();   
		
		String userName=(String) request.getSession().getAttribute("myName") ;//获取登陆用户
		if(userName.equals("")){
			pw.write("0");  
			pw.flush();  
			pw.close();  
			return;
		}
		UserBeanCl ubc=new UserBeanCl();
		BookBeanCl bbc=new BookBeanCl();
		ArrayList<BookBean> ListBook= bbc.getByBook(bookName);
		ArrayList<UserBean> ListUser= ubc.getUser(userName);
		BookBean bb=(BookBean)ListBook.get(0);
		UserBean ub=(UserBean)ListUser.get(0);
		int stock = bb.getStock() -  bookNumInt; //剩余书籍库存
		double balance =  ub.getBalance()-  bookPriceInt*bookNumInt; //购买后所剩金额
		int salesvolume = bb.getSalesvolume() + bookNumInt;
		System.out.printf("%d", salesvolume);
		JSONObject member = null;   
		
		if(stock >= 0 && balance >= 0 ){
			boolean stockFlage = bbc.ubdateStock(stock, bookName);//购买书籍
			boolean balanceFlage = ubc.ubdateBalance(balance, userName);//金额减少
			boolean salesvolumeFlage = bbc.ubdateSalesvolume(salesvolume, bookName);//书籍销售量增加
			member = new JSONObject();      
		    member.put("stock", stock);   
			member.put("balance", balance);      
			member.put("salesvolume", salesvolume);
			pw.print(member.toString());
		} else {
			pw.write("-1");  
			pw.flush();  
		}
		 pw.close();   
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
