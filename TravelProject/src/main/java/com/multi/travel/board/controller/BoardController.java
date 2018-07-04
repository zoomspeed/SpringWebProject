package com.multi.travel.board.controller;

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
import com.multi.travel.common.IP;

@Controller 
public class BoardController {
	@Resource(name="boardServiceImpl")
	BoardService boardService;
	
	//컨트롤러에서 직접 dao 사용하지 말고 서비스 
	//통해서 
	@RequestMapping("/board/list")
	public void list(Model model, BoardDto dto)
	{
		List<BoardDto> list = boardService.getList(dto);
		int total = boardService.getTotal(dto);
		
		if(dto == null) {
			System.out.println("dto is null");
		}
		else {
			System.out.println("dto is not null");
			System.out.println("boardSeq 리스트꺼");
			
			if(dto.getBoard_seq() == null || dto.getBoard_seq().equals("")) {
				System.out.println("boardSeq is null");
			}
			else {
				System.out.println("boardSeq is not null");
				System.out.println(dto.getBoard_seq());	
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		
		for(int i=0; i<list.size(); i++)
		{
			BoardDto temp = list.get(i);
			System.out.println(temp.getTitle());
		}
		System.out.println("전체 개수 : "+total);
	}

	
	
	
	@RequestMapping("/board/test")
	public void test(Model model, BoardDto dto)
	{
		List<BoardDto> list = 
				boardService.getList(dto);
		int total = boardService.getTotal(dto);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		
		for(int i=0; i<list.size(); i++)
		{
			BoardDto temp = list.get(i);
			System.out.println(temp.getTitle());
		}
		System.out.println("전체 개수 : "+total);
	}	

	//board/save.mt?title=test&contents=내용&userid=test
	@RequestMapping("/board/save")
	public @ResponseBody String save(HttpServletRequest req, BoardDto dto)
	{		
		ServletContext ctx= req.getServletContext();
		
		String path = ctx.getRealPath(CommonConst.BOARD_PATH);
		System.out.println(path);
		
		String ip = IP.getClientIP(req);
		dto.setIp_addr(ip);
		
		//파일 업로드 경로잡기 
		FileUploader.setFilePath(path);
		
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
		
		boardService.insert(dto);
		
		return "success";
	}
	// /board/view.mt?seq=200
	@RequestMapping("/board/view")
	public void getView(Model model, BoardDto dto)
	{
		BoardDto viewDto = boardService.getView(dto.getBoard_seq());
		BoardDto prevDto = boardService.getPrev(viewDto);
		BoardDto nextDto = boardService.getNext(viewDto);
		
		model.addAttribute("viewDto", viewDto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
	}
	
	
	
	@RequestMapping("/board/write")
	public void write(BoardDto dto, String mode,Model model)
	{
		//board/write.jsp 로 이동 
		/*
		 * 1.등록할때 - 작업할거 없음  
		 * 2.수정할때 - 수정할대상을 불러와야 함 
		 * 3.답글달때 - 부모글의 정보를 가져와야 한다
		 */
		BoardDto resultDto=null;
		System.out.println("mode : " + mode);
		Hashtable<String, String> map = new Hashtable<String, String>();

		if(mode!=null && !mode.equals("") && !mode.equals("insert"))
		{
			resultDto = boardService.getView(dto.getBoard_seq());
			System.out.println(resultDto.getTitle());

			if(mode.equals("reply"))
			{
				resultDto.setTitle("답글:");
				resultDto.setContents("");
			}
			
			//배열이 아니고 필드명이 filename1, filename2, filename3
			//for문 사용 안되니까 배열 구조로 바꾸기
			//해쉬테이블 사용하기 
			
			System.out.println(resultDto.getFilename1());
			System.out.println(resultDto.getFilename2());
			System.out.println(resultDto.getFilename3());
				
			map.put("filename1", resultDto.getFilename1());
			map.put("filename2", resultDto.getFilename2());
			map.put("filename3", resultDto.getFilename3());
		}
		
		if(mode.equals("insert")) {
/*			resultDto = new BoardDto();
			resultDto.setUserid(dto.getUserid());
			System.out.println(resultDto.getUserid());*/
			//resultDto = boardService.getView(dto.getBoard_seq());
			System.out.println("RESULT DTO USERID"+dto.getUserid());
		}
		
		//System.out.println("getUserid:~~~~~~~~~~~~~");
		//System.out.println(resultDto.getUserid());		
		//jsp로 전달 작업 
		model.addAttribute("resultDto", resultDto);
		model.addAttribute("filemap", map);
		//jsp단에서는 
		//BoardDto dto = 
		//  (BoardDto)request.getAttribute("resultDto")
		
	}

	
	@RequestMapping("/board/update")
	public @ResponseBody 
	String update(BoardDto dto,
			   HttpServletRequest req,
			   String []del,
			   String []old_name)
	{
		dto.setFilename1(old_name[0]);
		dto.setFilename2(old_name[1]);
		dto.setFilename3(old_name[2]);
		ServletContext ctx= req.getServletContext();
		String path = ctx.getRealPath(CommonConst.BOARD_PATH);
		System.out.println(path);
		//파일 업로드 경로잡기 
		FileUploader.setFilePath(path);
		
		boolean result=FileUploader.upload(dto.getFiles(),
			 dto.getFileNameList());
		if( result == false)
		{
			return "fail";//파일 업로드 실패시 
		}
		
		
		for(int i=0; i<del.length; i++)
		{
			String filename=
					dto.getFileNameList().get(i);
			if( del[i].equals("1"))
				dto.setFilename1(filename);
			else if(del[i].equals("2"))
				dto.setFilename2(filename);
			else if(del[i].equals("3"))
				dto.setFilename3(filename);
		}
		
		boardService.update(dto);
		
		return "success";
	}
	
	
	@RequestMapping("/board/reply")
	public @ResponseBody 
	String  reply(  HttpServletRequest req, BoardDto dto)
	{		
		ServletContext ctx= req.getServletContext();
		
		String path = ctx.getRealPath(CommonConst.BOARD_PATH);
		System.out.println(path);
		
		//파일 업로드 경로잡기 
		FileUploader.setFilePath(path);
		
		//Client Ip 설정.
		String ip = IP.getClientIP(req);
		dto.setIp_addr(ip);
/*		board_seq
		,title
		,contents
		,userid
		,hit
		,group_id
		,depth
		,g_level
		,regdate
		,delyn
		,ip_addr*/
		System.out.println("시작");
		
/*		System.out.println(dto.getBoard_seq());
		System.out.println(dto.getTitle());
		System.out.println(dto.getContents());
		System.out.println(dto.getUserid());
		System.out.println(dto.getHit());
		System.out.println(dto.getGroup_id());
		System.out.println(dto.getDepth());
		System.out.println(dto.getG_level());
		System.out.println(dto.getRegdate());
		System.out.println(dto.getIp_addr());*/
		boolean result=FileUploader.upload(dto.getFiles(),dto.getFileNameList()); 
		if( result == false)
		{
			System.out.println("파일 업로드 실패.");
			return "fail";//파일 업로드 실패시 
		}
		
		for(int i=0; i<dto.getFileNameList().size();i++)
		{
			dto.getFieldNameList().add("filename"+(i+1));
		}
			
		boardService.reply(dto);
		return "success";
	}
	
	@RequestMapping("/board/delete")
	public @ResponseBody 
	String  delete(BoardDto dto)
	{
		boardService.delete(dto);
		return "success";
	}
	
	
	
}




