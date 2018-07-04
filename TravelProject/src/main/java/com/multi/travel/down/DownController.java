package com.multi.travel.down;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.travel.common.CommonConst;

@Controller
public class DownController {
	@RequestMapping("/down")
	public void download(
			HttpServletRequest req,
			HttpServletResponse res,
			String id, 
			String filename)
	{
		
		ServletContext ctx= req.getServletContext();
		String path = "";
		
		if( id.equals("board"))
			path = ctx.getRealPath(CommonConst.BOARD_PATH);
		System.out.println(path);
		
		
		InputStream in=null;//파일을 입력받기 위해 필요한 클래스 
		OutputStream out = null;//파일을 저장하기 위해 필요한 클래스 
		File file=null;  		//파일을 찾아서 Stream 객체와 연결시켜야한다
		boolean skip=false;
		//파일이 존재하면 skip = false 
		//파일이 존재하지 않으면 skip = true
		
		//1.파일 열고, 읽고, 닫고 
		//1.파일열기 
		try
		{
			file = new File(path,  filename);
			in = new FileInputStream(file);
		}catch(FileNotFoundException ex)
		{
			skip = true; //파일이 존재안함 
		}
		
		//2.클라이언트에게 전송할 파일에 대한 
		//정보를 전송해야 한다 
		
		//브라우저에게 전송할 파일에 대한 정보를 
		//먼저 보낸다 
		
		String client = req.getHeader("User-Agent");
		//상대방 브라우저의 종류에 대한 정보가 
		//User-Agent 속성안에 있다 
		
		try
		{
		//기본 정보 전송하기 
		res.reset(); //이전의 정보를 삭제
		res.setContentType("application/octet-stream");
		//파일 전송하겠다는 의미 
	    res.setHeader("Content-Description",  		"JSP Generated Data");
	 
		if(!skip) //전송할 파일이 존재하면 
		{
			if(client.indexOf("MSIE")!=-1)
			{
				res.setHeader("Content-Disposition","attachment; filename="
				+new String(filename.getBytes("KSC5601"),"ISO8859_1"));
			}
			else
			{
				 // 한글 파일명 처리
                filename = new String( filename.getBytes("utf-8"),  "iso-8859-1");
 
                res.setHeader("Content-Disposition", 
                 "attachment; filename=\"" +  filename + "\"");
                res.setHeader("Content-Type", 
                 "application/octet-stream;charset=utf-8");
 
			}
			
			res.setHeader ("Content-Length",""+file.length() );
			 
	        out = res.getOutputStream();
            byte b[] = new byte[(int)file.length()];
            int leng = 0;
             
            while( (leng = in.read(b)) > 0 ){
                out.write(b,0,leng);
            }
      	}
		
	     out.close();
         in.close();
		}
		catch(Exception e)
		{}
	
	}
}
