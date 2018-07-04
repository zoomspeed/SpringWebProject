package com.multi.travel.common;

import com.multi.travel.image.dto.ImageDto;

public class Test {

	
	public static void ImageDtoTest(ImageDto dto) {
		
		System.out.println("@@@@@@ImageDto 정보출력@@@@@@@@@");
		System.out.println(dto.getImage_seq());
		System.out.println(dto.getUserid());
		System.out.println(dto.getTitle());
		System.out.println(dto.getLatitude());
		System.out.println(dto.getLongitude());
		System.out.println(dto.getAltitude());
		System.out.println(dto.getRegdate());
		System.out.println(dto.getModdate());
		System.out.println(dto.getFilesize());
		System.out.println(dto.getIp_addr());		
		System.out.println(dto.getDelyn());

	}
}
