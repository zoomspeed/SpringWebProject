package com.multi.travel.member.controller;

import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.multi.travel.member.dto.MemberDto;
import com.multi.travel.member.service.MemberService;
import com.multi.travel.common.FileUploader;
import com.multi.travel.common.IP;

@Controller  
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping("/member/member_write")
	public void member_write()
	{}
	
	@RequestMapping("/member/getIdCheck")
	public @ResponseBody String 
	   getIdCheck(MemberDto dto)
	{
		if(memberService.getIdCheck(dto)==0)
			return "OK";
		else
			return "CANCEL";
	}
	
	
	@RequestMapping("/member/getEmailCheck")
	public @ResponseBody String getEmailCheck(MemberDto dto)
	{
		if(memberService.getEmailCheck(dto)==0)
			return "OK";
		else
			return "CANCEL";
	}	
	
	@RequestMapping("/member/member_save")
	public String member_save(MemberDto dto)
	{
		//dto.setMember_auth("user");
		System.out.println(dto.getMember_auth());
		System.out.println(dto.getUserid());
		System.out.println(dto.getUsername());
		System.out.println(dto.getEmail());
		//System.out.println(dto.getInterest());
		//System.out.println(dto.getGender());
		
		memberService.insert(dto);
		

		return "redirect:/home.do";	
	
	}
	
	
	@RequestMapping("/member/upload")
	public @ResponseBody 
	String upload( HttpServletRequest req, 
			    MultipartFile imagefile)
	{
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@");
		ServletContext ctx= req.getServletContext();
		
		String path = ctx.getRealPath("/resources/upload/member");
		System.out.println(path);
	
		FileUploader.setFilePath(path);
		String filename=FileUploader.upload(imagefile);
		return filename;
		
	}

	
	@RequestMapping("/member/logon")
	public void logon(MemberDto dto)
	{
		System.out.println("logon");
	} 
	
	
	@RequestMapping("/member/login")
	public void login(MemberDto dto)
	{
		System.out.println("login");
	} 	
	
/*	@CacheEvict(cacheNames="login",allEntries=true)*/
	@RequestMapping("/member/logon_proc")
	public @ResponseBody 
	String logon_proc(HttpServletRequest req, MemberDto dto)
	{

		System.out.println("logon_proc 호출됨");
		HttpSession session = req.getSession();
		
		//클라이언트 ip주소 알아내기
		String ip  = IP.getClientIP(req);
		System.out.println("ip : "+ip);
		
		//세션 삭제 
		//session.invalidate();
		MemberDto memberDto = memberService.getMemberInfo(dto);
		//System.out.println(memberDto);
		if(memberDto==null)
		{
			return "1"; //아이디가 존재안함 
		}
			
		if(!dto.getPassword().equals(memberDto.getPassword()))
		{
			return "2";//패스워드가 안 맞음 
		}
			
		session.setAttribute("username", memberDto.getUsername());
		session.setAttribute("email", memberDto.getEmail());
		session.setAttribute("mobile",memberDto.getMobile());
		session.setAttribute("userid", memberDto.getUserid());
		
		System.out.println("session userid : "+session.getAttribute("userid"));
		//회원정보중에서 
		//아이디, 이름, 전화번호 
		
		// 함수명 MemberDto getMemberInfo(MemberDto dto)
		// 반환값이 null 이면 로그온 실패, null 이 아니면
		// 로그온 성공 
		
		return "OK";
	}
	
	@RequestMapping("/member/idfind")
	public void idfind()
	{ //페이지 이동용
	}
	
	@RequestMapping("/member/idfind_proc")
	public String idfind_proc(MemberDto dto, Model model)
	{
		//이름하고 전화번호 받아서 해당 아이디 알려주기
		MemberDto resultDto = memberService.findId(dto);
		if( resultDto !=null)
			model.addAttribute("email", resultDto.getEmail());
		else
			model.addAttribute("email", "");

		return "/member/idview";
	}
	
	@RequestMapping("/member/pwdfind")
	public void pwdfind()
	{}
	
	@RequestMapping("/member/pwdfind_proc")
	public String pwdfind_proc(MemberDto dto, Model model)
	{
		//이름하고 전화번호 받아서 해당 아이디 알려주기
		MemberDto resultDto = memberService.findPwd(dto);
		if( resultDto !=null)
			model.addAttribute("pwd", resultDto.getPassword());
		else
			model.addAttribute("pwd", "");
		return "/member/pwdview";
	}

	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest req)
	{	
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/home.do";
	}
	
	
	@RequestMapping("/member/signup")
	public void signup()
	{	
		
	}	
	
	

}
