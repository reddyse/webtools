package com.neu.myapp.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.neu.myapp.bean.TravelPlan;
import com.neu.myapp.bean.User;
import com.neu.myapp.dao.ManageUser;
import com.neu.myapp.dao.ProjectConstants;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/register"}, method = RequestMethod.GET)
	/*@RequestMapping(value = {"/","/login"}, method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("Login", locale);
		return "login";
	}*/	
	//@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public ModelAndView register(Locale locale, Model model){
		
		System.out.println(" to be implemented here");
		//ManageUser mu = new ManageUser();
		//mu.addEmployee(user.getFirstName(), user.getLastName(), user.getEmail(), user.getName(), user.getPassword(), user.getProfilePictureURI());
		logger.info("Register", locale);
		return new ModelAndView("register","User", new User());
	}
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String profile(Locale locale, Model model, User user) {
		ManageUser mu = new ManageUser();
		//List<User> results = null;
		Map<Integer,List<User>> results = null;
		mu.addEmployee(user.getFirstName(), user.getLastName(), user.getEmail(), user.getName(), user.getPassword(), user.getProfilePictureURI(), user.getUsername());			
		results = mu.selectUser(user.getUsername());
		logger.info("select query to fetch user", locale);
		System.out.println("username : "+results.size());
		
		//Map<Integer,List<User>> userList = results;
		model.addAttribute("User",results.get(0));
		
		//model.addAttribute("results",results);
		
		return "profile2";
	}
	@RequestMapping(value = {"/home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Home", locale);
		return "userhome";
	}
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public String login(Locale locale, Model model,HttpServletRequest req) {
		logger.info("Login", locale);
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String role = req.getParameter("role");
		if(username!=null && password!=null && role!=null){
			if(role.equalsIgnoreCase(ProjectConstants.ADMIN)){
				if(username.equalsIgnoreCase("a") && password.equalsIgnoreCase("a")){
					ManageUser mu = new ManageUser();
					List users = mu.getUsers();
					model.addAttribute("userslist", users);
					return "adminhome";
				}
			}else if(role.equalsIgnoreCase(ProjectConstants.TRVEL_AGENT)){
				if(username.equalsIgnoreCase("t") && password.equalsIgnoreCase("t"))
					return "travelhome";
			}else{
				if(username.equalsIgnoreCase("u") && password.equalsIgnoreCase("u"))
					return "userhome";
			}
		}
		return "login";
	}
	@RequestMapping(value = "/deleteuser**", method = RequestMethod.POST)
	public void onDeleteUser(HttpServletRequest request,HttpServletResponse response, Model model) {
		
		
		String userId = request.getParameter("userId");
		String status = request.getParameter("status");
		ManageUser mu = new ManageUser();
		
		int row = -1;
		if(userId != null){
			row = mu.updateUserStatus(userId,status);
		}
		try {
			response.getWriter().write(row > 0?"success":"failed");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
