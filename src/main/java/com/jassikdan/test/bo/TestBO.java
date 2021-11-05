package com.jassikdan.test.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jassikdan.test.dao.TestDAO;
import com.jassikdan.test.model.Test;

@Service
public class TestBO {
	
	@Autowired
	private TestDAO testDAO;
	
	public List<Test> getData(){
		return testDAO.selectData();
	}
}
