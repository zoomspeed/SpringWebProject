package com.multi.travel.map.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.multi.travel.common.FileUploader;
import com.multi.travel.common.IP;
import com.multi.travel.member.dto.MemberDto;
import com.multi.travel.member.service.MemberService;


@Controller  
public class MapController {


	
	@RequestMapping("/map/mapInfo")
	public void mapInfo()
	{}
	
	

}