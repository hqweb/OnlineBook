
package com.sp.controller;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.sp.model.*;
public class LoginClServlet extends HttpServlet {

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
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {
		//得到用户名和密码
		String u=request.getParameter("username");
		String p=request.getParameter("passname");
		
		
		//System.out.printf("%s  %s", u, p);
		UserBeanCl ubc=new UserBeanCl();
		//System.out.println("使用servlet");
		if(ubc.checkUser(u, p))
		{
			ArrayList<UserBean> al=ubc.getUsersByPage(1);
			int pageCount=ubc.getPageCount();
			//double balance = ubc.Balance(u);
			Double balance = ubc.Balance(u);
			request.setAttribute("result", al);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNow", 1);
			//将用户名放入session,以备后用
			request.getSession().setAttribute("myName", u);
			
			//System.out.printf("%f",balance);
			/*JSONObject json = new JSONObject(); 
			JSONArray array = new JSONArray(); 
			JSONObject member = null;    
			member = new JSONObject();      
		    member.put("balance", balance);       
			array.add(member);    
			*/
			PrintWriter out = response.getWriter();  
	        out.write(balance.toString());  
	        out.flush();  
	        out.close();  
			//System.out.printf("成功。");
			//request.getRequestDispatcher("main.jsp").forward(request, response);

		}
		else
		{
			PrintWriter out = response.getWriter();
			out.write("0");  
	        out.flush();  
	        out.close();  
			//System.out.printf("失败。");
			//request.getRequestDispatcher("login.jsp").forward(request, response);
		}
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
	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
		
	}

}