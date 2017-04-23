package com.neu.myapp.dao;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator; 

import java.sql.*;

import org.hibernate.HibernateException; 
import org.hibernate.Session; 
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.neu.myapp.bean.TravelPlan;
import com.neu.myapp.bean.User;

public class ManageUser 
{
	private static SessionFactory factory; 
	
	public Session getConnection()
	{
		Session session = null;
	      try{
	         factory = new Configuration().configure().buildSessionFactory();
	         session=factory.openSession();
	         
	         //factory = new AnnotationConfiguration().
	                   //configure().
	                   //addPackage("com.xyz") //add package if used.
	                   //addAnnotatedClass(User.class).
	                   //buildSessionFactory();
	         
	      }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
	      
	      return session;
	}    
	      /* Method to CREATE an employee in the database */
	      public Integer addEmployee(String fname, String lname, String email, String name, String password,String profile_pic, String username){
	         Session session = getConnection();
	         Transaction tx = null;
	         Integer userID = null;
	         try{
	            tx = session.beginTransaction();
	            User user = new User(fname, lname, email, name, password,profile_pic, username);
	            userID = (Integer) session.save(user); 
	            tx.commit();
	         }catch (HibernateException e) {
	            if (tx!=null) tx.rollback();
	            e.printStackTrace(); 
	         }finally {
	            session.close(); 
	         }
	         return userID;
	      }
	      
	      public Map<Integer, List<User>> selectUser(String username )
	      {
	    	  Map map = new HashMap<Integer, List<User>>();
	    	  List<User> travelPlans = new ArrayList<User>();
	    	  User user = new User();
	
		         Session session = getConnection();
		         Transaction tx = null;
		         Integer userID = null;
		         List<User> results = new ArrayList<User>();
		         int ind=0;
		         ResultSet res=null;
		         try{
		            tx = session.beginTransaction();
		            //User user = new User(username);
		            String hql = "from User where username = :username";
		            Query query = session.createQuery(hql);
		            query.setParameter("username",username);
		            results = query.list();
		            map.put(ind++, results);
		            tx.commit();
		         }
		         catch (HibernateException e) 
		         {
		            if (tx!=null) tx.rollback();
		            e.printStackTrace(); 
		         }
		         catch(Exception e)
		         {
		        	 if (tx!=null) tx.rollback();
			            e.printStackTrace();
		         }
		         finally {
		         }
		            session.close(); 
		         
		         return map;
		      }
}
