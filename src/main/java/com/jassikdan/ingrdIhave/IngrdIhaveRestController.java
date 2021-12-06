package com.jassikdan.ingrdIhave;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jassikdan.ingrdIhave.bo.IngrdIhaveBO;

@RestController
public class IngrdIhaveRestController {
	
	@Autowired
	private IngrdIhaveBO ingrdIhaveBO;


	/**
	 * 구매한 재료 등록하기
	 * @param ingrdId
	 * @param request
	 * @return
	 */
	@RequestMapping("/ingrd_ihave/insert")
	public Map<String, Object> ingrdIhaveInsert(
			@RequestParam("ingrdId") int ingrdId
			, HttpServletRequest request
			){
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		ingrdIhaveBO.insertIngrdIhave(userId, ingrdId);
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 구매한 재료 삭제하기
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/ingrd_ihave/delete")
	public Map<String, Object> ingrdIhaveDelete(
			@RequestParam("ingrdId")int id
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		ingrdIhaveBO.deleteIngrdIhaveById(userId, id);
		result.put("result", "success");
		return result;
	}
}
