package com.multi.travel;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.travel.board.service.BoardService;
import com.multi.travel.image.dto.ImageDto;
import com.multi.travel.image.service.ImageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Resource(name="imageServiceImpl")
	ImageService imageService;	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody String home(Locale locale, Model model, ImageDto dto) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
/*		List<String> ImageList = new ArrayList<String>();	
		

		ImageList = imageService.getMainImage(dto);	
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("ImageList",ImageList);	*/	
		
		return "redirect:/home.do";
	}

	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public  String home1(Locale locale, Model model ,ImageDto dto) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		System.out.println("@@@@@@@@@@getSel@@@@@@@@@@@@@@@@ : "+dto.getSel());
		System.out.println("key@@@@@@@@@@@@@2:"+dto.getKey());
		List<ImageDto> ImageList = new ArrayList<ImageDto>();
		ImageList = imageService.getList(dto);
		

		model.addAttribute("serverTime", formattedDate );		
		model.addAttribute("ImageList",ImageList);
		
		return "/map/home";
	}
	
	
		
	
	

}
