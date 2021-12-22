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
			, @RequestParam(value="refrigeratorNum", defaultValue = "3" ) int refrigeratorNum
			, HttpServletRequest request
			){
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		ingrdIhaveBO.insertIngrdIhave(userId, ingrdId, refrigeratorNum);
		result.put("result", "success");
		return result;
	}
	
	@RequestMapping("/ingrd_ihave/update")
	public Map<String, Object> ingrdIhaveUpdate(
			@RequestParam("ingrdIhaveId") int ingrdIhaveId
			, @RequestParam("ingrdAmount") String ingrdAmount
			, @RequestParam("ingrdExpdate") String ingrdExpdate
			){
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		ingrdIhaveBO.updateIngrdIhave(ingrdIhaveId, ingrdAmount, ingrdExpdate);
		
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
			@RequestParam("ingrdIhaveId") int id
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
