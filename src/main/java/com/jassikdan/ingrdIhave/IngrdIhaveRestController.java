package com.jassikdan.ingrdIhave;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jassikdan.ingrdIhave.bo.IngrdIhaveBO;

@RestController
public class IngrdIhaveRestController {
	
	@Autowired
	private IngrdIhaveBO ingrdIhaveBO;

	//구매한 재료 등록하기
	@RequestMapping("/ingrd_ihave/insert")
	public Map<String, Object> ingrdIhaveInsert(
			@RequestBody List<HashMap<String, Object>> ingrdList
			){
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		
		ingrdIhaveBO.insertIngrdIhaveList(ingrdList);
		result.put("result", "success");
		return result;
	}

}
