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
import javax.servlet.http.HttpSession;

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
			HttpSession session = req.getSession(true);
			String userid = (String)session.getAttribute("userid");
			
			ServletContext ctx= req.getServletContext();
			String ip = IP.getClientIP(req);
			String filename = null;
			List<ImageDto> dataList = new ArrayList<ImageDto>();
			String path = ctx.getRealPath(CommonConst.IMAGE_PATH);
			System.out.println(path);
			

			

			
			System.out.println("values size @@@@@@ : "+values.size());
			
			dataList = ExifData.getExifData(values, dataList);
			
			System.out.println("1번 :"+dataList.get(0).getFile().getOriginalFilename());
			//System.out.println("2번 :"+dataList.get(1).getFile().getOriginalFilename());
			//System.out.println("3번 :"+dataList.get(2).getFile().getOriginalFilename());
			
			
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
				//dataList.get(i).setUserid(dto.getUserid());
				dataList.get(i).setUserid(userid);
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

		@RequestMapping("/file/fileUpload")
		public String filUpload() {
			
			

			return "/file/fileUpload";
		}		
		


				
		  
		@RequestMapping(value = "/ImageList", method = RequestMethod.POST)
		public @ResponseBody
		List<ImageDto> Submit2(@RequestBody ImageDto dto) {//@RequestBody Map<String,Object> params
			//@RequestParam("sel") String sel
			Map<String, Object> resultMap = new HashMap<String,Object>();
			//System.out.println(sel);
			
			
			System.out.println(dto.getSel());
			System.out.println(dto.getMod());
			if(dto.getMod().equals("home")) {
				dto.setNum("6");
			}
			else if(dto.getMod().equals("album")) {
				dto.setNum("12");
			}
			
			System.out.println(dto.getNum());

			//List<ImageDto> dataList = imageService.getMainImage(dto);
			List<ImageDto> dataList = imageService.getMainImage(dto);
			
			for(int i=0; i<dataList.size(); i++) {
				resultMap.put("ImageList"+(i+1), dataList.get(i));
			}

			//resultMap.put("sel", dto.getSel());
			
			for(int i=0; i<dataList.size(); i++) {
				System.out.println(dataList.get(i).getTitle());
				//System.out.println("resultMap@@@@@"+resultMap.get("ImageList"+(i+1)));
			}
			//ImageDto temp = (ImageDto)resultMap.get("ImageList1");
			//System.out.println("TEMP@@@@@"+temp.getTitle());

			//model.addAttribute("resultMap", resultMap);
			//System.out.println("ImgeList 호출완료");
			
			
			return dataList;
		}			
		
		@RequestMapping("/board/imageview")
		public void getView(Model model, ImageDto dto)
		{
			System.out.println("image seq~ :"+dto.getImage_seq());
			
			ImageDto viewDto = imageService.getView(dto.getImage_seq());
			//ImageDto prevDto = imageService.getPrev(viewDto);
			//ImageDto nextDto = imageService.getNext(viewDto);
			
			model.addAttribute("viewDto", viewDto);
			//model.addAttribute("prevDto", prevDto);
			//model.addAttribute("nextDto", nextDto);
		}	
		
		
		
		@RequestMapping("/board/albumbbs")
		public String  albumlisting(ImageDto dto, Model model)
		{
			//List<String> ImageList = new ArrayList<String>();	
			List<ImageDto> ImageList = new ArrayList<ImageDto>();
			dto.setNum("12");
			
			
			int total = imageService.getTotal(dto);
			//ImageList = imageService.getMainImage(dto);	
			ImageList = imageService.getList(dto);
			
			System.out.println("dto.getImage_seq() : ~~~ "+ImageList.get(0).getImage_seq());
			System.out.println("total  :   "+total);
			model.addAttribute("ImageList",ImageList);
			model.addAttribute("total",total);
			//ImageList = imageService.getList(dto);
			//model.addAttribute("ImageList", ImageLisst);
			
			return "board/albumbbs";
		}		
}






