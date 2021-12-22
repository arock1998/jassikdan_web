package com.jassikdan.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jassikdan.ingrd.bo.IngrdBO;
import com.jassikdan.ingrd.model.Ingrd;
import com.jassikdan.mypage.bo.ContentBO;
import com.jassikdan.mypage.model.ContentView;
import com.jassikdan.mypage.model.IngrdIconView;

@Controller
public class MypageController {

	@Autowired
	private ContentBO contentBO;
	@Autowired
	private IngrdBO ingrdBO;

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
		
		//전체 재료 리스트 가져오기
		List<Ingrd> ingrdList = ingrdBO.getIngrdAll();
		model.addAttribute("ingrdList", ingrdList);
		
		//user의 재료 리스트 가져오기
		List<List<IngrdIconView>> ingrdIhaveList = contentBO.generateIngrdIhaveIconViewListById(userId);
		model.addAttribute("ingrdIhaveList1", ingrdIhaveList.get(0));
		model.addAttribute("ingrdIhaveList2", ingrdIhaveList.get(1));
		model.addAttribute("ingrdIhaveList3", ingrdIhaveList.get(2));

		model.addAttribute("viewName", "mypage/refrigerator");
		return "template/layout";
	}
		
	/**
	 * 내가 등록한 레시피 보여주는 화면
	 * @param model
	 * @param request
	 * @return
	 */
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