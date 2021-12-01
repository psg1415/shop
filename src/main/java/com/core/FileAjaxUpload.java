package com.core;

import javax.servlet.http.*;

import java.io.*;
import java.util.*;
import java.util.Base64.Decoder;


import com.core.*;
import com.models.file.FileDto;

public class FileAjaxUpload {
	/**
	 * 
	 * @param request
	 * @return
	 */
	public static boolean upload(HttpServletRequest request) throws Exception {
		
		/** 파일 업로드 데이터 체크 S */
		StringBuilder sb = new StringBuilder();
		boolean isFirstMissing = true;
		if (request.getParameter("gid") == null) {
			sb.append("gid");
			isFirstMissing = false;
		}
		
		if (request.getParameter("fileName") == null) {
			if (!isFirstMissing) 
				sb.append(",");
			
			sb.append("fileName");
			isFirstMissing = false;
		}
		
		if (request.getParameter("fileType") == null) {
			if (!isFirstMissing) 
				sb.append(",");
			
			sb.append("fileType");
			isFirstMissing = false;
		}
		
		if (request.getParameter("data") == null) {
			if (!isFirstMissing) 
				sb.append(",");
				
			sb.append("data");
			isFirstMissing = false;
		}
		
		if (sb.length() > 0) {
			throw new Exception("필수 항목 누락 - " + sb.toString());
		}
		/** 파일 업로드 데이터 체크 E */
		
		/** 파일 업로드 정보 DB 처리 */
		ArrayList<DBField> bindings = new ArrayList<>();
		bindings.add(DB.setBinding("Long", request.getParameter("gid")));
		bindings.add(DB.setBinding("String", request.getParameter("fileName")));
		bindings.add(DB.setBinding("String", request.getParameter("fileType")));
		
		String sql = "INSERT INTO fileInfo (gid, fileName, fileType) VALUES (?, ?, ?)";
		int idx = DB.executeUpdate(sql, bindings, true);
		if (idx > 0) { // DB 등록 성공 
			String path = getUploadPath(request, idx);
			String data = request.getParameter("data");
			String[] tmp = data.split("base64,");
			byte[] bytes = Base64.getDecoder().decode(tmp[1]);
			
			try(FileOutputStream fos = new FileOutputStream(path)) {
				fos.write(bytes);
			} catch(IOException e) {
				Logger.log(e);
				return false;
			}
		}
		
		return true;
	}
	
	/**
	 * 파일 등록번호로 업로드될 경로를 자동 생성 
	 * 
	 * @param idx
	 * @return
	 */
	public static String getUploadPath(HttpServletRequest request, int idx) {
		StringBuilder sb = new StringBuilder();
		sb.append(request.getServletContext().getRealPath("."));
		sb.append(File.separator);
		sb.append("resources");
		sb.append(File.separator);
		sb.append("upload");
		sb.append(File.separator);
		sb.append(idx);
		
		return sb.toString();
	}
	
	public static String getFileUrl(HttpServletRequest request, int idx) {
		String url = request.getServletContext().getContextPath() + "/resouces/upload/" + idx;
		return url;
	}
	
	/**
	 * gid에 해당하는 파일의 업로드 완료 처리 
	 *    isFinish - 1로 변경 
	 *    
	 * @param gid
	 */
	public static void fileUploadDone(long gid) {
		ArrayList<DBField> bindings = new ArrayList<>();
		bindings.add(DB.setBinding("Long", String.valueOf(gid)));
		String sql = "UPDATE fileInto SET isFinish=1 WHERE gid = ?";
		DB.executeUpdate(sql, bindings);
	}
	
	public static ArrayList<FileDto> gets(long gid) {
		String sql = "SELECT * FROM fileInfo WHERE gid = ? AND isFinish=1 ORDER BY regDt";
		ArrayList<DBField> bindings = new ArrayList<>();
		bindings.add(DB.setBinding("Long", String.valueOf(gid)));
		
		ArrayList<FileDto> list = DB.executeQuery(sql, bindings, new FileDto());
		
		return list;
	}
}
