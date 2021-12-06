package com.jassikdan.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	//메인 페이지
	@RequestMapping("/main")
	public String main() {
		return "main/main";
	}

}
