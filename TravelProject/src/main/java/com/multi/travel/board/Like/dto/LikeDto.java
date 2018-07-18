package com.multi.travel.board.Like.dto;
    
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
 
public class LikeDto {
	private String pg="0";
	private String sel="";
	private String key="";
	private String num="";
	
	private String mode="";
	private String like_seq="";
	private String userid="";
	private String like_type="";
	private String datatime="";
	private String ip_addr="";
	private String board_type="";
	private String target_id="";
	
	private String isDel="";
	private String delyn="";
	private String pre_like_type="";
	
	private String isUpdate = "0";
	//디폴트 생성자 
	public LikeDto() 
	{}
	
	public LikeDto(String mode) {
		this.mode = mode;
	}
	
	//파일을 받아오기 위해서 추가하는 필드 
	List<MultipartFile> files;
	
	//파일 이름 저장하기 위해서
	List<String> fileNameList = new ArrayList<String>();
	
	//필드명 저장할 배열 
	List<String> fieldNameList=
			new ArrayList<String>();
	//fileName1, fileName2, fileName
	
	
	public List<String> getFileNameList() {
		return fileNameList;
	}

	public List<String> getFieldNameList() {
		return fieldNameList;
	}

	public void setFieldNameList(List<String> fieldNameList) {
		this.fieldNameList = fieldNameList;
	}

	public void setFileNameList(List<String> fileNameList) {
		this.fileNameList = fileNameList;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	
	public String getSel() {
		return sel;
	}

	public void setSel(String sel) {
		this.sel = sel;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getPg() {
		return pg;
	}

	public void setPg(String pg) {
		this.pg = pg;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getLike_seq() {
		return like_seq;
	}

	public void setLike_seq(String like_seq) {
		this.like_seq = like_seq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getLike_type() {
		return like_type;
	}

	public void setLike_type(String like_type) {
		this.like_type = like_type;
	}

	public String getDatatime() {
		return datatime;
	}

	public void setDatatime(String datatime) {
		this.datatime = datatime;
	}

	public String getIp_addr() {
		return ip_addr;
	}

	public void setIp_addr(String ip_addr) {
		this.ip_addr = ip_addr;
	}



	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public String getIsUpdate() {
		return isUpdate;
	}

	public void setIsUpdate(String isUpdate) {
		this.isUpdate = isUpdate;
	}

	public String getIsDel() {
		return isDel;
	}

	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}

	public String getPre_like_type() {
		return pre_like_type;
	}

	public void setPre_like_type(String pre_like_type) {
		this.pre_like_type = pre_like_type;
	}

	

	

	
	
	
}
