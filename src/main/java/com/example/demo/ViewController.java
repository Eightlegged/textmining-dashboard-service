package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

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
	public String dashboard() {
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
}
