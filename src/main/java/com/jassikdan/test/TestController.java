package com.jassikdan.test;

import java.util.List;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jassikdan.test.bo.TestBO;

@Controller
public class TestController {
	
	@Autowired
	private TestBO testBO;
	
	@ResponseBody
	@RequestMapping("/test01")
	public String helloWrold() {
		return "Hello world!";
	}
	
	@RequestMapping("/test02")
	public String connectJspDB(Model model) {
		List<Test> testData = testBO.getData();
		model.addAttribute("testData", testData);
		return "test";
	}
}
