package com.jassikdan.timeline;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jassikdan.mypage.bo.ContentBO;

@Controller
public class TimelineController {
	
	@Autowired
	private ContentBO contentBO;
	
	// formData를 보내거나 완전히 방법을 바꾸거나 해야 될 것 같다.
	@RequestMapping("/timeline/timeline")
	public String timeline(Model model
			, HttpServletRequest request
			, @RequestParam(value="sharpList", required=false) List<String> sharp
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
//		if(StringUtils.isNullOrEmpty(sharp) == false) {
//			sharp = sharp.replace("\"", "").replace("[", "").replace("]", "");
//			List<String> dataList = Arrays.asList(sharp.split(","));
//			sharpList.addAll(dataList);
//		}
		
		sharpList.addAll(sharpList);
		
		//view에서 가지고 온 sharpList를 다시 view로 전달해준다.
		model.addAttribute("sharpList", sharpList);
		
		model.addAttribute("contentList", contentBO.generateAllContentView(userId, sharpList));
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
	
}
