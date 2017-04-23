package com.neu.myapp.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.myapp.bean.User;
import com.neu.myapp.dao.ConnectionDao;
import com.neu.myapp.fbsocial.FBConnection;
import com.neu.myapp.fbsocial.FBGraph;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FbAuthenticationController {

	private static final Logger logger = LoggerFactory.getLogger(FbAuthenticationController.class);
	private String code = "";

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/connectfbuser", method = RequestMethod.GET)
	public void connectFbUser() {
		System.out.println("In connectFbUser of FbAuthenticationController..");

	}

	@RequestMapping(value = "/fbhome", method = RequestMethod.GET)
	public String authenticate(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("In authenticate of FbAuthenticationController..");
		code = req.getParameter("code");
		if (code == null || code.equals("")) {
			throw new RuntimeException("ERROR: Didn't get code parameter in callback.");
		}
		FBConnection fbConnection = new com.neu.myapp.fbsocial.FBConnection();
		String accessToken = fbConnection.getAccessToken(code);

		FBGraph fbGraph = new FBGraph(accessToken);
		String graph = fbGraph.getFBGraph();
		Map<String, String> fbProfileData = fbGraph.getGraphData(graph);
		ServletOutputStream out;
		HttpSession userSession = req.getSession();
		userSession.setAttribute("accesscode", accessToken);
		ConnectionDao connectionDao = ConnectionDao.getConnectionDao();
		Connection conn = connectionDao.getConnection();
		//try {
			System.out.print("test");
			
			System.out.print("test1");
			// Search User in the Db
			// if present in the DB go to Home
			long userId = Long.parseLong(fbProfileData.get("id"));
			User user = connectionDao.getUser(conn, userId);
			if (user == null) {
				user = connectionDao.create(conn,userId, fbProfileData.get("name"), fbProfileData.get("email"),
						fbProfileData.get("first_name"), fbProfileData.get("last_name"), fbProfileData.get("profile"),fbProfileData.get("name"));

			}
			model.addAttribute("name", fbProfileData.get("name"));
			model.addAttribute("email", fbProfileData.get("email"));
			model.addAttribute("profile", fbProfileData.get("profile"));
			//userSession.setAttribute("user", user);
			// Populate Runs
		//	try {
				/*ArrayList<RunLog> userRuns = (ArrayList<RunLog>) runLogDAO.getUserRuns();
				ArrayList<RunLog> leadersRuns = (ArrayList<RunLog>) runLogDAO.getLeaderBoard();
				model.addAttribute("leadersRuns",leadersRuns);
				model.addAttribute("userRuns", userRuns);*/
			//} catch (MyAppException e) {
				//model.addAttribute("nouserrun", "No User Run to Populate");
			//}
			// DAO.close();
		//} catch (MyAppException e) {
		//	System.out.println("Exception: " + e.getMessage());
		//}

		return "home";
	}
	
	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	public String logout(Locale locale, Model model,HttpServletRequest req,HttpServletResponse res) {
		logger.info("Welcome home! The client locale is {}.", locale);
		//FBConnection fbConnection = new FBConnection();
		HttpSession session=req.getSession();
		//String accessToken = (String)session.getAttribute("accesscode");
		//String url = fbConnection.getLogOutURL(accessToken);
		//try {
			  
            session.invalidate();  
			//res.sendRedirect(url);
			//return;
		//} catch (IOException e) {
			// TODO Auto-generated catch block
		//	e.printStackTrace();
		//}
		return "login";
	}
	
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "login";
		//return "home";
	}

}
