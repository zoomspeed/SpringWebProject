package com.multi.travel.image.dto;
    
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
 
public class ImageDto_back {
	private String pg="0";
	private String sel="all";
	private String key="";
	private String num="";
	

	private String 	image_seq="";
	private String 	userid="";
	private List<String> title;
	private List<String> latitude;
	private List<String> longitude;
	private List<String> altitude;
	private String 	regdate="";
	private String 	moddate="";
	private List<String> filesize;
	private String 	delyn="";
	private String 	ip_addr="";

	MultipartFile file;

	List<MultipartFile> files;
	
	//파일 이름 저장하기 위해서
	List<String> fileNameList=
			  new ArrayList<String>();
	
	//필드명 저장할 배열 
	List<String> fieldNameList=
			new ArrayList<String>();	
	
	//파일을 받아오기 위해서 추가하는 필드 
	
	
	//파일 이름 저장하기 위해서
	
	//필드명 저장할 배열 

	//fileName1, fileName2, fileName
	


	//디폴트 생성자 
	public ImageDto_back() 
	{}
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
	
	
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public List<String> getFileNameList() {
		return fileNameList;
	}

	public void setFileNameList(List<String> fileNameList) {
		this.fileNameList = fileNameList;
	}

	public List<String> getFieldNameList() {
		return fieldNameList;
	}

	public void setFieldNameList(List<String> fieldNameList) {
		this.fieldNameList = fieldNameList;
	}

	//테스트용 생성자 

	
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

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public String getIp_addr() {
		return ip_addr;
	}

	public void setIp_addr(String ip_addr) {
		this.ip_addr = ip_addr;
	}

	public String getImage_seq() {
		return image_seq;
	}

	public void setImage_seq(String image_seq) {
		this.image_seq = image_seq;
	}

	public List<String> getTitle() {
		return title;
	}

	public void setTitle(List<String> title) {
		this.title = title;
	}

	public List<String> getLatitude() {
		return latitude;
	}

	public void setLatitude(List<String> latitude) {
		this.latitude = latitude;
	}

	public List<String> getLongitude() {
		return longitude;
	}

	public void setLongitude(List<String> longitude) {
		this.longitude = longitude;
	}

	public List<String> getAltitude() {
		return altitude;
	}

	public void setAltitude(List<String> altitude) {
		this.altitude = altitude;
	}

	public List<String> getFilesize() {
		return filesize;
	}

	public void setFilesize(List<String> filesize) {
		this.filesize = filesize;
	}



	
	
	
}
