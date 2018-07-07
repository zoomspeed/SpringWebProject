package com.multi.travel.image.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.multi.travel.board.dto.BoardDto;
import com.multi.travel.board.service.BoardService;
import com.multi.travel.common.CommonConst;
import com.multi.travel.common.Test;
import com.multi.travel.common.ExifData;
import com.multi.travel.common.FileUploader;
import com.multi.travel.common.IP;
import com.multi.travel.common.Test;
import com.multi.travel.image.dto.ImageDto;
import com.multi.travel.image.service.ImageService;

@Controller 
public class ImageController {
	@Resource(name="imageServiceImpl")
	ImageService imageService;
	
	//컨트롤러에서 직접 dao 사용하지 말고 서비스 
	//통해서 
	//board/save.mt?title=test&contents=내용&userid=test
	//board/save.mt?title=test&contents=내용&userid=test
		@RequestMapping("/image/save")
		public @ResponseBody String save(@RequestParam(value="file", required=true) List<MultipartFile> values,HttpServletRequest req, ImageDto dto)
		{		
			ServletContext ctx= req.getServletContext();
			String ip = IP.getClientIP(req);
			String filename = null;
			List<ImageDto> dataList = new ArrayList<ImageDto>();
			String path = ctx.getRealPath(CommonConst.IMAGE_PATH);
			System.out.println(path);
			

			

			
			System.out.println("values size @@@@@@ : "+values.size());
			
			dataList = ExifData.getExifData(values, dataList);
/*			
			System.out.println("1번 :"+dataList.get(0).getFile().getOriginalFilename());
			System.out.println("2번 :"+dataList.get(1).getFile().getOriginalFilename());
			System.out.println("3번 :"+dataList.get(2).getFile().getOriginalFilename());
*/			
			
		/*	     
			//exif data 가져오기 (gps정보, 파일크기, 생성시간, 수정시간)
			dto = ExifData.getExifData(dto.getFile(), dto); 
			dto.setIp_addr(ip);
			filename = FileUploader.getNewFileName(dto.getFile().getOriginalFilename());
			//System.out.println("file name : " + filename);
			dto.setTitle(filename);
			//dto에 값들어갔나 확인 출력테스트
			Test.ImageDtoTest(dto);
		*/
			//파일 업로드 경로잡기 
			FileUploader.setFilePath(path);
			
			for(int i=0; i<dataList.size(); i++) {
				filename = FileUploader.getNewFileName(dataList.get(i).getFile().getOriginalFilename());
				System.out.println("file name : " + filename);
				dataList.get(i).setTitle(filename);
				dataList.get(i).setUserid(dto.getUserid());
				dataList.get(i).setIp_addr(ip);
				
				String result = FileUploader.upload(dataList.get(i).getFile());
				
				 
				Test.ImageDtoTest(dataList.get(i));
				imageService.insert(dataList.get(i));
			}


			
		/*
			boolean result=FileUploader.upload(dto.getFiles(),
				dto.getFileNameList()); 
			if( result == false)
			{
				return "fail";//파일 업로드 실패시 
			}
				
			for(int i=0; i<dto.getFileNameList().size(); i++)
			{
				dto.getFieldNameList().add("filename"+(i+1));
			}
		*/		
			
			//boardService.insert(dto);
			
			return "success";
		}
		
		
		@RequestMapping("/file/upload")
		public void upload()
		{
			
		}
				
		@RequestMapping("fileUpload1")
		public void fileUpload(HttpServletRequest request, HttpServletResponse response) throws Exception{
			  MultipartRequest multipartReq = (MultipartRequest)request;
			  System.out.println("전송성공");

		}

		@RequestMapping("fileUpload")
		public String filUpload() {
			
			

			return "file/fileUpload";
		}		
		

		//@RequestMapping(value = "/ImageList", method = RequestMethod.GET)
		@RequestMapping("ImageList")
		public @ResponseBody Map<String,Object> ImageList(
				@RequestBody Map<String,Object> params, ImageDto dto) {
			Map<String,Object>resultMap = new HashMap<String,Object>();
			
			System.out.println("@@@@@@@@@@getSel@@@@@@@@@@@@@@@@ : "+dto.getSel());
			System.out.println("key@@@@@@@@@@@@@2:"+dto.getKey());
			List<String> ImageList = new ArrayList<String>();
			ImageList = imageService.getMainImage(dto);
			
			resultMap.put("message", "회원정보 입력완료");
			System.out.println(params.get("sel"));
			String json ="{\"id\" :" + 1 + ",\"id2\" :" + 2 + "}";	
			System.out.println(json);
			return resultMap;
		}	
		
		
		@RequestMapping(value = "/ImageList1", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
		public @ResponseBody
		String Submit() {
			//@RequestParam("name") String name,@RequestParam("location") String location
		    // your logic here
			System.out.println("호출완료");

			

			
			String resp = "{\"name\" : \"aa\", \"location\" :  \"location44\"}";
			System.out.println(resp);
		    return resp;
		}		
	
}




