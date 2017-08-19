package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {
	
	String id;
	
	@RequestMapping("/chart")
	public String chartview() {
		System.out.println("뷰시작");
		return "chart";
	}
	@RequestMapping("/wordCloud")
	public String workCloudView() {
		
		return "wordcloud";
	}
	@RequestMapping("/pieChart")
	public String pieChartView() {
		return "pie";
	}
	@RequestMapping("/Dashboard")
	public String dashboardView() {
		
		return "Dashboard";
	}
	@RequestMapping("/createInvest")
	public String createInvestView() {
		return "Sulmun";
	}
	@RequestMapping("/Dashboard1")
	public String dashboard(HttpServletRequest request, HttpSession session) {
		id=request.getParameter("id");
		session.setAttribute("user_id", id);
		return "dashboardpage";
	}
	@RequestMapping("/chart1")
	public String chart() {
		return "chartpage";
	}
	@RequestMapping("/investform")
	public String investform() {
		return "investform";
	}
	@RequestMapping("/enrollform")
	public String enrollform() {
		return "enroll";
	}
	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest request, HttpSession session) {
	
		session.setAttribute("user_id", "test6@sk.com");
		return "mypage";
	}
}
