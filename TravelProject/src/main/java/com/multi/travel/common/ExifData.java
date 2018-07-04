package com.multi.travel.common;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.ExifSubIFDDirectory;
import com.multi.travel.image.dto.ImageDto;
import com.multi.travel.common.Util;
public class ExifData {

	private static Metadata metadata = null;
	private static List<File> file = null;
	//private static ImageDto dto = null;
	
	

	 
	
	public static ImageDto getExifData(MultipartFile mFile, ImageDto dto) {
		ImageDto temp = null;
		File file = null;
		
		//temp.setTitle(mFile.getName());
		//temp.setUserid(dto.getUserid());
		
		try {
			file = multipartToFile(mFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  

		try {
			metadata = ImageMetadataReader.readMetadata(file);
		} catch (ImageProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		dto = setGPS(dto);
		//dto.setTitle(temp.getTitle());
		//dto.setUserid(temp.getUserid());
		
		return dto;
		
	}
	
	
	public static File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException 
	{
		File convFile = new File( multipart.getOriginalFilename());
		multipart.transferTo(convFile); 
		return convFile;
	}

	 
	public static ImageDto setGPS(ImageDto dto) {
		//38° 31' 52.8 N ,  0° 9' 49.8 W
		//https://www.google.com/maps/place/38%C2%B031'52.8%22N+0%C2%B009'49.8%22W/@38.5306485,-0.1654881,17.25z/data=!4m5!3m4!1s0x0:0x0!8m2!3d38.5313333!4d-0.1638333
		

		
		for (Directory directory : metadata.getDirectories()) {
		    for (Tag tag : directory.getTags()) {
		        System.out.format(" [%s] - %s = %s \n",
		            directory.getName(), tag.getTagName(), tag.getDescription());
		        //System.out.println("getDataType@@@@@@@@@@@@@@@@@@@@@ : "+tag.getTagName().equals("GPS"));
		        
		        
		        
		        
		        if(tag.getTagName().equals("GPS Latitude")) {
		        	System.out.println("GPS Latitude "+tag.getDescription());
		        	dto.setLatitude(tag.getDescription());
		        	//dto.setLatitude(Util.getString(tag.getDescription()));
		        }
		        else if(tag.getTagName().equals("GPS Longitude")) {
		        	System.out.println("GPS Longitude "+tag.getDescription());
		        	dto.setLongitude(tag.getDescription());
		        	//dto.setLongitude(Util.getString(tag.getDescription()));
		        }
		        else if(tag.getTagName().equals("GPS Altitude")) {
		        	System.out.println("GPS Altitude "+tag.getDescription());
		        	dto.setAltitude(tag.getDescription());
		        	//dto.setAltitude(Util.getString(tag.getDescription()));
		        }
		        else if(tag.getTagName().equals("File Size")) {
		        	System.out.println("File Size "+tag.getDescription());
		        	dto.setFilesize(tag.getDescription());
		        }
		        else if(tag.getTagName().equals("File Modified Date")) {
		        	System.out.println("ModTime : "+tag.getDescription());
		        	dto.setModdate(tag.getDescription());
		        }
		        else if(tag.getTagName().equals("Date/Time Original")) {
		        	System.out.println("Date/Time Original : "+tag.getDescription());
		        	dto.setRegdate(tag.getDescription());
		        }
		        
		    }
		    
		    if (directory.hasErrors()) {
		        for (String error : directory.getErrors()) {
		            System.err.format("ERROR: %s", error);
		        }
		    }
		    
		}
		return dto;
	}
	
	public static List<ImageDto> getExifData(List<MultipartFile> mFile, List<ImageDto> dataList)
	{
		List<File> file = new ArrayList<File>();
		int i;
		
		if(mFile == null) {
			System.out.println("파일 리스트가 널임");
			
		}
		
		
		//files : 업로드할 파일들 
		//fileNameList : 파일 업로드 후 
		//   실제 파일명을 전달하기 위한 리스트 

		
		//temp.setTitle(mFile.getName());
		//temp.setUserid(dto.getUserid());
		
		try {
			for(MultipartFile f : mFile) {
				file.add(multipartToFile(f));
			}
			//System.out.println("파일크기 : "+file.size());
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  

		try {
			i=0;
			for(File f : file) {
				metadata = ImageMetadataReader.readMetadata(f);
				//dto.set(i) = setGPS(dto.get(i));
				
				
				dataList.add(setGPS(new ImageDto()));
				dataList.get(i).setFile(mFile.get(i));
				i++;
			}
			
		} catch (ImageProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dataList;
		
		
		
		
		
		
		
		
		
		
		/*
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
		*/
	}	
	
	
}
