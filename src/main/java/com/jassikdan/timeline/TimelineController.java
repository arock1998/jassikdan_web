package com.jassikdan.timeline;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jassikdan.mypage.bo.ContentBO;
import com.mysql.cj.util.StringUtils;

@Controller
public class TimelineController {
	
	@Autowired
	private ContentBO contentBO;
	
	@GetMapping("/timeline/timeline")
	public String timeline(Model model
			, HttpServletRequest request
			, @RequestParam(value="data", required=false,  defaultValue="[]") String data
			//냉장고 속 재료로만이 true인지 아닌지
			//List의 size가 0일 수 있다.
			//, @RequestParam("useHavingIngredient") boolean useHavingIngredient
			) {
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		List<String> sharpList = new ArrayList<>();
		//["한식","중국","중국"]
		if(StringUtils.isNullOrEmpty(data) == false) {
			data = data.replace("\"", "").replace("[", "").replace("]", "");
			List<String> dataList = Arrays.asList(data.split(","));
			sharpList.addAll(dataList);
		}
		//view에서 가지고 온 sharpList를 다시 view로 전달해준다.
		model.addAttribute("sharpList", sharpList);
		
		model.addAttribute("contentList", contentBO.generateAllContentView(userId, sharpList));
		model.addAttribute("result", "success");
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
	
}
