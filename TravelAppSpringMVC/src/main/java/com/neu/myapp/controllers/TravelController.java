package com.neu.myapp.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.myapp.bean.TravelPlan;
import com.neu.myapp.dao.ConnectionDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TravelController {

	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = { "/traveloptions" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model, @RequestParam(value = "city") String cityName) {
		System.out.println("In traveloptions of ..");
		logger.info("traveloptions for cityName", cityName);
		model.addAttribute("cityName", cityName);
		return "traveloptions";
	}

	@RequestMapping(value = { "/reviewexpierience" }, method = RequestMethod.GET)
	public String travelexpierience(Locale locale, Model model) {
		logger.info("reviewexpierience", locale);
		return "reviewexpierience";
	}

	// @RequestParam(value="cityName") String cityName
	// @ModelAttribute("travelmodel")TravelPlan travel,
	@RequestMapping(value = { "/customplan" }, method = RequestMethod.GET)
	public String customplan(Locale locale, Model model, HttpServletRequest req) {
		logger.info("customplan", locale);
		String params[] = new String[10];
		params[0] = req.getParameter("cityName");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Date d1 = null;
		Date d2 = null;
		try {
			d1 = format.parse(req.getParameter("start"));
			d2 = format.parse(req.getParameter("end"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// Get msec from each, and subtract.
		long diff = d2.getTime() - d1.getTime();
		params[1] = new Long(diff / (1000 * 60 * 60 * 24)).toString();
		params[2] = req.getParameter("selTripType");

		// Retrieve Data
		ConnectionDao connectionDao = ConnectionDao.getConnectionDao();
		Map<Integer, List<TravelPlan>> travelPlanmap = connectionDao.getTravelPlan(connectionDao.getConnection(),
				params);
		// Generate Plan
		model.addAttribute("cityName", params[0]);
		model.addAttribute("attractionList", travelPlanmap.get(0));
		model.addAttribute("attractionList1", travelPlanmap.get(1));
		model.addAttribute("attractionList2", travelPlanmap.get(2));
		return "customplan";
	}

}
