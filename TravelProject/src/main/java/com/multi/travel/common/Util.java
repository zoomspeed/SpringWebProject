package com.multi.travel.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Util {
	public static String getCode()
	{
		Date date=new Date();
		//현재 날짜와 시간을 가져온다 
		//SimpleDateFormat 날짜를 우리가원하는 예쁜 형태로
		//전환시켜주는 클래스 
		SimpleDateFormat format1 =
			new SimpleDateFormat("yyyyMMddHHmmss");
		
		//객체 생성시 생성자 안에 내가 원하는 유형을 입력
		//yyyy - 연도 
		//MM - 월
		//dd -일
		//HH - 24시간  hh :12시간 
		//mm -소문자의 경우 시간 
		//ss - 초 
		//Math.random() : 0.0~1.0사이의 값
		//0.0, ~10.0  -> 0~9
 		int n = (int) (Math.random() * 10) + 1;
 		//1~10까지
		 
		String code = format1.format(date)+n;
		//format 함수호출 (시간)을 주면 
		//시간을 우리가 지정한 형태로 전환하기 
		
		return code;
	}
}
