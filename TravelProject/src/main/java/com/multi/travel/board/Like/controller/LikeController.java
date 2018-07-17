package com.multi.travel.board.Like.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.multi.travel.board.Like.dto.LikeDto;
import com.multi.travel.board.Like.service.LikeService;
import com.multi.travel.board.Qna.dto.QnaDto;
import com.multi.travel.board.Qna.service.QnaService;
import com.multi.travel.board.dto.BoardDto;
import com.multi.travel.common.CommonConst;
import com.multi.travel.common.FileUploader;
import com.multi.travel.common.IP;
import com.multi.travel.image.dto.ImageDto;
import com.multi.travel.image.service.ImageService;

@Controller 
public class LikeController {
	@Resource(name="likeServiceImpl")
	LikeService likeService;
	

	@RequestMapping(value = "/board/like/ThumbUp", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object>  ThumbUp(@RequestBody Map<String, Object> values)
	{												//@RequestBody Map<String, Object> values, 
		Map<String,Object> result = new HashMap<String,Object>();
		LikeDto dto = new LikeDto();
		dto.setMode((String)values.get("mode"));
		dto.setBoard_type((String)values.get("mode"));
		
		//likeService.update(dto);
		return result;
	}
	
	
}


	





