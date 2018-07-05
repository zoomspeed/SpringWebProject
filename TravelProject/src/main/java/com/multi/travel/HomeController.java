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

import com.multi.travel.board.service.BoardService;
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
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List<String> ImageList = new ArrayList<String>();		
		ImageList = imageService.getMainImage();	
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("ImageList",ImageList);		
		
		return "redirect:/home.do";
	}

	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		List<String> ImageList = new ArrayList<String>();
		ImageList = imageService.getMainImage();

		

		model.addAttribute("serverTime", formattedDate );		
		model.addAttribute("ImageList",ImageList);
		
		return "/map/home";
	}  
		
	
	

}
