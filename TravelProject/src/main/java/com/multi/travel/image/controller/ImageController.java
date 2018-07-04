package com.multi.travel.image.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.multi.travel.board.dto.BoardDto;
import com.multi.travel.board.service.BoardService;
import com.multi.travel.common.CommonConst;
import com.multi.travel.common.FileUploader;
import com.multi.travel.common.IP;
import com.multi.travel.image.dto.ImageDto;
import com.multi.travel.image.service.ImageService;

@Controller 
public class ImageController {
	@Resource(name="imageServiceImpl")
	ImageService imageService;
	
	//컨트롤러에서 직접 dao 사용하지 말고 서비스 
	//통해서 
	//board/save.mt?title=test&contents=내용&userid=test
		@RequestMapping(value="/image/save" ,method = RequestMethod.POST)
		public @ResponseBody String save(HttpServletRequest req, List<ImageDto> dto)
		{		
			ServletContext ctx= req.getServletContext();
			
			
			String path = ctx.getRealPath(CommonConst.IMAGE_PATH);
			System.out.println(path);
			String ip = IP.getClientIP(req);
			//dto.setIp_addr(ip);
			
			System.out.println(dto.get(0).getTitle());
			//System.out.println(dto.get(1).getTitle());
	/*		dto.get(0).setIp_addr(ip);
			
			
			
			//파일 업로드 경로잡기 
			FileUploader.setFilePath(path);
			
			boolean result=FileUploader.upload(dto.get(0).getFiles(),
					 dto.get(0).getFileNameList()); 
			if( result == false)
			{
				return "fail";//파일 업로드 실패시 
			}
				
			for(int i=0; i<dto.get(0).getFileNameList().size(); i++)
			{
				dto.get(0).getFieldNameList().add("filename"+(i+1));
				imageService.insert(dto.get(0));
			}
			
			
			//String result=FileUploader.upload(dto.getFile()); 
			
			
			
			return "success";
			*/
			return "success";
		}
		
		
		@RequestMapping("/file/upload")
		public void upload()
		{
			
		}
				

		@RequestMapping("fileUpload")
		public String filUpload() {
			
			

			return "file/fileUpload";
		}		
		

				
		
	
}




