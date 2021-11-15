package com.jassikdan.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\arock\\Desktop\\jassikdan_spring\\jassikdan_workspace\\images/";
	
	//이미지 저장
	public String saveFile(String loginId, MultipartFile file) throws IOException {
		String directoryName = loginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			logger.error("[이미지 업로드] 디렉토리 생성 실패" + directoryName + ", filePath: " + filePath);
			return null;
		}
		
		//파일 업로드 : byte 단위로 업로드 된다.
		byte[] bytes = file.getBytes();
		Path path = Paths.get(filePath + file.getOriginalFilename()); //input에 올린 파일 명이다.
		Files.write(path, bytes);
		
		//이미지 Path리턴
		return "/images/" + directoryName + file.getOriginalFilename();
	}
	
	//이미지 삭제
	public void deleteFile(String imagePath) throws IOException{
		Path path = Paths.get(FILE_UPLOAD_PATH + imagePath.replace("/images/", ""));
		if(Files.exists(path)) {
			//파일이 존재하면 삭제한다.
			Files.delete(path);
		}
		//디렉토리 삭제
		path = path.getParent();
		if(Files.exists(path)) {
			//디렉토리가 존재하면 삭제한다.
			Files.delete(path);
		}
	}
	
	//이미지 저장 
	public String saveRecipe(Integer userId, long currentTimeMillis, MultipartFile file) throws IOException {
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";		//음식이름_시간/ 파일이름이 한국어z일때....
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			logger.error("[이미지 업로드] 디렉토리 생성 실패" + directoryName + ", filePath: " + filePath);
			return null;
		}
		
		if(directory.exists()) {
			//디렉토리가 존재한다면 
		} else if (directory.mkdir() == false) {
			logger.error("[이미지 업로드] 디렉토리 생성 실패" + directoryName + ", filePath: " + filePath);
			return null;
		}
		
		//파일 업로드 : byte 단위로 업로드 된다.
		byte[] bytes = file.getBytes();
		Path path = Paths.get(filePath + file.getOriginalFilename()); //input에 올린 파일 명이다.
		Files.write(path, bytes);
		
		//이미지 Path리턴
		return "/images/" + directoryName + file.getOriginalFilename();
	}
}
