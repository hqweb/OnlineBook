
package com.sp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sp.model.*;
public class UserAdmin extends HttpServlet {


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
		//获得标识位
		String flag=request.getParameter("flag");
		
		response.setContentType("text/json"); 
		response.setCharacterEncoding("UTF-8"); 
		if(flag.equals("cutpage"))
		{
			try{
				int pageNow=Integer.parseInt(request.getParameter("pageNow"));
				UserBeanCl ubc=new UserBeanCl();
				
				ArrayList<UserBean> al=ubc.getUsersByPage(pageNow);
				int pageCount=ubc.getPageCount();
				request.setAttribute("result", al);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNow", pageNow);
				
				request.getRequestDispatcher("admin/wel.jsp").forward(request, response);
				
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		else if(flag.equals("delUser"))
		{
			//删除用户
			String userId=request.getParameter("userId");
			UserBeanCl ubc=new UserBeanCl();
			if(ubc.delUserById(userId))
			{
				//删除成功
				request.getRequestDispatcher("admin/suc.jsp").forward(request, response);
				
			}
			else
			{
				//删除失败
				request.getRequestDispatcher("admin/err.jsp").forward(request, response);
			}
			
		}
		else if(flag.equals("addUser"))
		{
			//添加用户
			//得到用户输入的信息
			
			String name=request.getParameter("userName");
			String passwd=request.getParameter("passwd");
			String email=request.getParameter("email");
			String address="中国";
			String phone=request.getParameter("phone");
			String balance=request.getParameter("balance");
			double bookPriceInt = Double.valueOf(balance).doubleValue();
			
			//System.out.printf("%s--%s--%s--%s--%s--%f",name,passwd,email,address,phone,bookPriceInt);
			UserBeanCl ubc=new UserBeanCl();
			if( ubc.addUser(name, passwd, email, address, phone, bookPriceInt)  )
			{
				//添加成功
				request.getRequestDispatcher("admin/suc.jsp").forward(request, response);
				
			}
			else
			{
				//添加失败
				request.getRequestDispatcher("admin/err.jsp").forward(request, response);
			}
			
		}
		else if(flag.equals("updateUser"))
		{
			//修改用户
			//得到用户输入的信息
			String userId=request.getParameter("userId");
			String name=request.getParameter("userName");
			String passwd=request.getParameter("passwd");
			String email=request.getParameter("email");
			String address=URLDecoder.decode(request.getParameter("address"),"utf-8");
			String phone=request.getParameter("phone");
			String balance=request.getParameter("balance");
			String grade=request.getParameter("grade");
			
			System.out.printf("%s", address);
			double bookPriceInt = Double.valueOf(balance).doubleValue();
			
			UserBeanCl ubc=new UserBeanCl();
			if( ubc.ubdateUser(userId,name, passwd, email, address, phone, bookPriceInt)  )
			{
				//修改成功
				request.getRequestDispatcher("admin/suc.jsp").forward(request, response);
				
			}
			else
			{
				//修改失败
				request.getRequestDispatcher("admin/err.jsp").forward(request, response);
			}
			
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



