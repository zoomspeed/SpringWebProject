package com.multi.travel.common;
  
import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/*
 * filePath : 업로드 할 경로를 전달해주면 된다 
 * FileUploader.setFilePath("경로");
 * FileUploader.upload(MultipartFile 파일목록,  
 *                    등록된파일명 전달받을 리스트)
 *                    
 *  FileUploader.getNewFileName(파일명)
 *  파일명이 중복될경우 파일명을 바꿔주는 함수
 *  sample.txt 
 *  sample(1).txt
 *  sample(2).txt
 *  sample(3).txt
 *                    
 */
public class FileUploader {
	static String filePath ="c:/upload";

	public static String getFilePath() {
		return filePath;
	}
 
	public static void setFilePath(String filePath) {
		FileUploader.filePath = filePath;
		
		File dir = new File(filePath);
		//파일 업로드 폴더가 존재하는지 찾아보기 위해서
		if( !dir.exists())//폴더가 존재안하면 
		{
			System.out.println("결과 : " + dir.mkdirs()); //만든다 
		}
		System.out.println(dir);
		
	}
	
	public static boolean upload(List<MultipartFile> files, List<String> fileNameList)
	{
		
		//files : 업로드할 파일들 
		//fileNameList : 파일 업로드 후 
		//   실제 파일명을 전달하기 위한 리스트 
		
		

		//첨부된 파일이 존재한다면 
		if(files!=null && files.size()>0)
		{
			for(MultipartFile f:files) {
			
				System.out.println(f.getOriginalFilename());
				if(f.getOriginalFilename().length()==0)
				{
					fileNameList.add("");
				}
				else
				{
					String filename = 
							getNewFileName(f.getOriginalFilename());
					//파일 이름 중복 해결해야 한다
					File newFile = new File(filePath + "/"+ filename);
					try {
						f.transferTo(newFile);
					} catch (Exception e) {
						
						e.printStackTrace();
						return false; //예외상황발생했을때
					}
					fileNameList.add(filename);
				}
			}
		}
	
		return true;  //예외 아닐때 
	}
	
	public static String getNewFileName(String oldName)
	{
		//원본파일명 : sample1.txt 
		//중복될때 : sample1(1).txt
		
		//1.파일명을 파일명과 확장자로 분리 
		//뒤쪽에서. 위치를 찾아서 그 점이후로는 확장자
		//앞쪽은 파일명으로 
		int pos = oldName.lastIndexOf(".");
		String ext = oldName.substring(pos+1);
		//확장자 (txt)
		String ori = oldName.substring(0, pos);
		//원래파일명 sample1 
		File newFile = 
		  new File(filePath+"/"+ oldName);
		//이 파일이 이미 존재한다면 파일이름 변경
		int i=1;
		while(newFile.exists())
		{
			oldName = ori +"("+i+")."+ext;
			//새로운 파일명을 만든다 
			newFile = 
			  new File(filePath+"/"+ oldName);
			 i++;
		}
		System.out.println(filePath+"/"+oldName);
		return oldName;
	}
	
	public static String upload(MultipartFile f)
	{
		
		
		String filename="";
		if(f==null)
			return filename;
		
		if(f.getOriginalFilename().length()!=0)
		{
			filename = getNewFileName(f.getOriginalFilename());
			//파일 이름 중복 해결해야 한다
			File newFile = new File(filePath + "/"+ filename);
			try {
				f.transferTo(newFile);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}
		return filename;
	}
			
}



