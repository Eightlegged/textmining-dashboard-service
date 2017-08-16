package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.InvestDao;
import com.example.demo.dto.investDto;
import com.example.demo.dto.scoreDto;

@RestController
public class InvestController {
	@Autowired
	private InvestDao mapper1;
	
	@RequestMapping("/insertInvest")
	public String insertInvest(HttpServletRequest request) {

		String id=request.getParameter("meeting_id");
		mapper1.insertInvest(request.getParameter("meeting_id"),request.getParameter("input1"),request.getParameter("input2"),request.getParameter("input3"),request.getParameter("input4"),request.getParameter("input5"));
		List<String> result =mapper1.useridlist(id);
	
		for(int i=0;i<result.size();i++)
		mapper1.insertsurvey_info(result.get(i), id);
		return "1";
	}
	@RequestMapping("/teammeeting1")
	public List teammeeting1(HttpServletRequest request) {
		return mapper1.meetingresult("ABC");
	}
	@RequestMapping("/showallsurvey")
	public List showallsurvey(HttpServletRequest request) {
		List<String> result=new ArrayList<String>();
		result.add(mapper1.allsurvey(request.getParameter("meeting_id")));
		result.add(mapper1.allsurvey2(request.getParameter("meeting_id")));
		result.add(mapper1.allsurvey3(request.getParameter("meeting_id")));
		result.add(mapper1.allsurvey4(request.getParameter("meeting_id")));
		result.add(mapper1.allsurvey5(request.getParameter("meeting_id")));
		return result;
	}
	@RequestMapping("/insertsurvey")
	public String insertsurvey(HttpServletRequest request) {
		mapper1.insertsurvey_result(request.getParameter("meeting_id"),"ABC", request.getParameter("score1"), request.getParameter("score2"), request.getParameter("score3"), request.getParameter("score4"), request.getParameter("score5"));
		mapper1.updatesurvey("ABC", request.getParameter("meeting_id"));
		return "1";
	}
	@RequestMapping("/surveypoint")
	public List surveypoint(HttpServletRequest request) {
		
		List<Integer> result= new ArrayList<Integer>();
		
			result.add(mapper1.surveycount(request.getParameter("part")));
			result.add(mapper1.surveycount2(request.getParameter("part")));
			result.add(mapper1.surveycount3(request.getParameter("part")));
			result.add(mapper1.surveycount4(request.getParameter("part")));
			result.add(mapper1.surveycount5(request.getParameter("part")));
		return result;
		
	}
	
}
