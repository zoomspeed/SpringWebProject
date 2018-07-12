package com.multi.travel.board.Qna.dto;
    
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
 
public class QnaDto {
	private String pg="0";
	private String sel="all";
	private String key="";
	private String num="";
	

	private String username="";
	
	private String qna_seq="";
	private String userid="";
	private String title="";
	private String contents="";
	private String filename1="";
	private String filename2="";
	private String filename3="";
	private String regdate="";
	private String moddate="";
	private String delyn="";
	private String group_id="";
	private String depth="";
	private String g_level="";
	private String hit="";
	private String ip_addr="";
	//파일을 받아오기 위해서 추가하는 필드 
	List<MultipartFile> files;
	
	//파일 이름 저장하기 위해서
	List<String> fileNameList=
			  new ArrayList<String>();
	
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

	//디폴트 생성자 
	public QnaDto() 
	{}
	
	//테스트용 생성자 
	public QnaDto(String title)
	{
		this.title = title;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getModdate() {
		return moddate;
	}

	public void setModdate(String moddate) {
		this.moddate = moddate;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getDepth() {
		return depth;
	}

	public void setDepth(String depth) {
		this.depth = depth;
	}

	public String getG_level() {
		return g_level;
	}

	public void setG_level(String g_level) {
		this.g_level = g_level;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public String getFilename1() {
		return filename1;
	}

	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}

	public String getFilename2() {
		return filename2;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	public String getFilename3() {
		return filename3;
	}

	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}

	public String getIp_addr() {
		return ip_addr;
	}

	public void setIp_addr(String ip_addr) {
		this.ip_addr = ip_addr;
	}

	public String getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(String qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	

	
	
	
}
