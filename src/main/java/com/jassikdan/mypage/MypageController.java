package com.jassikdan.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jassikdan.mypage.bo.ContentBO;
import com.jassikdan.mypage.model.IngrdIconView;

@Controller
public class MypageController {

	@Autowired
	private ContentBO contentBO;
	
	//냉장고 화면 
	@RequestMapping("/mypage/refrigerator_view")
	public String mypageRefrigerator(Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId == null ) {
			return "redirect:/user/sign_in_view";
		}
		//재료 아이콘 리스트 가져오기
		List<IngrdIconView> ingrdList = contentBO.generateIngrdIconViewListById(userId);
		model.addAttribute("ingrdList", ingrdList);
		
		model.addAttribute("viewName", "mypage/refrigerator");
		return "template/layout";
	}
}
