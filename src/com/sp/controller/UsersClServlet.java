
package com.sp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.sp.model.*;
public class UsersClServlet extends HttpServlet {


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
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String userName=URLDecoder.decode(request.getParameter("userName"),"utf-8");
		
		UserBeanCl ubc=new UserBeanCl();
		ArrayList<UserBean> ListUser= ubc.getUser(userName);
		UserBean ub=(UserBean)ListUser.get(0);
		JSONObject member = null;
		PrintWriter pw = response.getWriter();  
		
		member = new JSONObject();      
	    member.put("name", ub.getUsername());   
		member.put("phone", ub.getPhone());      
		member.put("address", ub.getAddress());
		member.put("email", ub.getEmail());
		pw.print(member.toString());
		pw.close();  
	}

}



