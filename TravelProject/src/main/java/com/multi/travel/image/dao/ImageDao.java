package com.multi.travel.image.dao;

import java.util.List;

import com.multi.travel.board.dto.BoardDto;
import com.multi.travel.image.dto.ImageDto;

public interface ImageDao {
	List<ImageDto> getList(ImageDto dto);
	List<String> getMainImage();
	
	ImageDto getView(String board_seq);
	ImageDto getPrev(ImageDto dto);
	ImageDto getNext(ImageDto dto);
	
	int getTotal(ImageDto dto);	
	void insert(ImageDto dto);
	void update(ImageDto dto);
	void delete(ImageDto dto); 
	void reply(ImageDto dto);
	
}
