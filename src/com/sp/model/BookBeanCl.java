package com.sp.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BookBeanCl {
		private Statement sm=null;
		private ResultSet rs=null;
		private Connection ct=null;
		private int pageSize=6;
		private int rowCount=0;
		private int pageCount=0; 
		
		//返回总页数
		public int getPageCount()
		{
			try{
				ct=new ConnDB().getConn();
				sm=ct.createStatement();
				rs=sm.executeQuery("select count(*) from book");
				if(rs.next())
				{
					rowCount=rs.getInt(1);
				}
				pageCount=rowCount%pageSize==0?rowCount/pageSize:rowCount/pageSize+1;

			}catch(Exception e){
				e.printStackTrace();
				
			}finally{
				this.close();
			}
			
			

			return pageCount;
		}
		
		
		//得到需要显示的用户信息
		public ArrayList<BookBean>  getBookByPage(int pageNow)
		{

			ArrayList<BookBean> bk=new ArrayList<BookBean>();
			try{
				ct=new ConnDB().getConn();
				sm=ct.createStatement();
				//查询出需要显示的记录
				rs=sm.executeQuery("select * from book limit "+(pageNow-1)*pageSize+","+pageSize+"");
				while(rs.next())
				{
					BookBean bb=new BookBean();
					bb.setId(rs.getInt(1));
					bb.setName(rs.getString(2));
					bb.setCover(rs.getString(3));
					bb.setAuthor(rs.getString(5));
					bb.setPrice(rs.getInt(8));
					bb.setSynopsis(rs.getString(9));
					bb.setSalesvolume(rs.getInt(10));
					bb.setStock(rs.getInt(11));
					bk.add(bb);		
				}
			}catch(Exception  e){
				e.printStackTrace();
			}finally{
				this.close();
			}
			
			return bk;
			
		}
		
		//查询购买图书信息
		public ArrayList<BookBean>  getByBook(String bookName)
		{

			ArrayList<BookBean> bk=new ArrayList<BookBean>();
			try{
				ct=new ConnDB().getConn();
				sm=ct.createStatement();
				//查询出需要显示的记录
				rs=sm.executeQuery("select * from book where name='"+bookName+"'");
				while(rs.next())
				{
					BookBean bb=new BookBean();
					bb.setId(rs.getInt(1));
					bb.setName(rs.getString(2));
					bb.setCover(rs.getString(3));
					bb.setAuthor(rs.getString(5));
					bb.setPrice(rs.getInt(8));
					bb.setSynopsis(rs.getString(9));
					bb.setSalesvolume(rs.getInt(10));
					bb.setStock(rs.getInt(11));
					bk.add(bb);		
				}
			}catch(Exception  e){
				e.printStackTrace();
			}finally{
				this.close();
			}
			
			return bk;
			
		}
				
		//书籍库存减少
		public boolean ubdateStock(int stock,String name)
		{
			boolean b=false;
			try{
				ct=new ConnDB().getConn();
				sm=ct.createStatement();
				
				int a=sm.executeUpdate("update book set stock='"+stock+"' where name='"+name+"'");
				if(a==1)
					b=true;
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.close();
			}
			return b;
		}
		
		//书籍销售量增加
		public boolean ubdateSalesvolume(int salesvolume,String name)
		{
			boolean b=false;
			try{
				ct=new ConnDB().getConn();
				sm=ct.createStatement();
				
				int a=sm.executeUpdate("update book set salesvolume='"+salesvolume+"' where name='"+name+"'");
				if(a==1)
					b=true;
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.close();
			}
			return b;
		}
				
		//关闭资源
		public void close()
		{
			//关闭资源
			try{
				if(rs!=null)
				{
					rs.close();
					rs=null;
				}
				if(sm!=null)
				{
					sm.close();
					sm=null;
				}
				if(ct!=null)
				{
					ct.close();
					ct=null;
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
}
