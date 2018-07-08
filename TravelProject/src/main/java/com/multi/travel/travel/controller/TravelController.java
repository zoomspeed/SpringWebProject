package com.multi.travel.travel.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.multi.travel.board.dto.BoardDto;
import com.multi.travel.board.service.BoardService;
import com.multi.travel.common.CommonConst;
import com.multi.travel.common.FileUploader;

@Controller 
public class TravelController {
	@Resource(name="boardServiceImpl")
	BoardService boardService;
	
	//컨트롤러에서 직접 dao 사용하지 말고 서비스 
	//통해서 
	@RequestMapping("/map/write")
	public void write()
	{

	}
	
	@RequestMapping("/index")
	public void index()
	{

	}	

	@RequestMapping("/map/home")
	public void home()
	{
	}		

	@RequestMapping("/map/home2")
	public void home2()
	{
	}		
	
	
	@RequestMapping("/, index")
	public String root()
	{

		return "/map/home";
	}		
	
	@RequestMapping("/contact")
	public String contact()
	{
		return "/map/contact";
	}	
	
	
	@RequestMapping("/board/Albumbbs")
	public String goAlbumbbs()
	{
		return "/board/Albumbbs";
	}			
}




