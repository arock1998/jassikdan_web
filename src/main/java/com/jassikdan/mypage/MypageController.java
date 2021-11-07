package com.jassikdan.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jassikdan.ingrd.model.Ingrd;
import com.jassikdan.mypage.bo.ContentBO;
import com.jassikdan.mypage.model.ContentView;
import com.jassikdan.mypage.model.IngrdIconView;

@Controller
public class MypageController {

	@Autowired
	private ContentBO contentBO;
	
	/**
	 * 냉장고 화면
	 * @param model
	 * @param request
	 * @return
	 */
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
	
	/**
	 * 재료 등록 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/insert_ingrd_view")
	public String mypageInsertIngrdView(Model model) {
		
		//기본 재료 정보 가져오기 ingrd table
		List<Ingrd> ingrdList = contentBO.getIngrdAll();
		model.addAttribute("ingrdList", ingrdList);
		
		model.addAttribute("viewName", "mypage/insert_ingrd");
		return "template/layout";
	}
	
	//내가 등록한 레시피 보여주는 화면
	@RequestMapping("/mypage/recipe_view")
	public String mypageRecipeView(Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/user/sign_in_view";
		}
		List<ContentView> contentList = contentBO.generateContentViewListById(userId);
		model.addAttribute("contentList", contentList );
		model.addAttribute("viewName", "mypage/recipe");
		return "template/layout";
	}
	
}