package com.example.demo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.InvestDao;
import com.example.demo.dto.investDto;

@Controller
public class InvestController {
	@Autowired
	private InvestDao mapper1;
	
	@RequestMapping("/insertInvest")
	public String insertInvest(HttpServletRequest request) {
		investDto id=new investDto();
		
		id.setInvest1(request.getParameter("input1"));
		id.setInvest2(request.getParameter("input2"));
		id.setInvest3(request.getParameter("input3"));
		id.setInvest4(request.getParameter("input4"));
		id.setInvest5(request.getParameter("input5"));
		id.setInvest6(request.getParameter("input6"));
		id.setInvest7(request.getParameter("input7"));
		id.setInvest8(request.getParameter("input8"));
		id.setInvest9(request.getParameter("input9"));
		
		id.setId(1);
		id.setPart("빅데이터");
		mapper1.insertInvest(id);
		return "dashboardpage";
	}
}
