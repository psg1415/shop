package com.models.file;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.models.*;
import com.core.*;

public class FileDto extends Dto<FileDto>{
	private int idx; // 파일 등록번호
	private long gid; // 파일 그룹ID 
	private String fileName; // 원본파일 이름 
	private String fileType; // 파일 형식
	private String filePath; // 파일 경로 
	private String fileUrl; // 파일 URL
	
	public FileDto() {}
	
	public FileDto(int idx, long gid, String fileName, String fileType) {
		this.idx = idx;
		this.gid = gid;
		this.fileName = fileName;
		this.fileType = fileType;
		
		/** 파일 Path */
		this.filePath = FileAjaxUpload.getUploadPath(Req.get(), idx);
		
		/** 파일 URL */
		this.fileUrl = FileAjaxUpload.getFileUrl(Req.get(), idx);
	}
	
	public FileDto(ResultSet rs) throws SQLException {
		this(
			rs.getInt("idx"),
			rs.getLong("gid"),
			rs.getString("fileName"),
			rs.getString("fileType")
		);
		
	}
	
	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public long getGid() {
		return gid;
	}
	
	public void setGid(long gid) {
		this.gid = gid;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFileType() {
		return fileType;
	}
	
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	@Override
	public FileDto setResultSet(ResultSet rs) throws SQLException {
		return new FileDto(rs);
	}
}
