package com.multi.travel.image.service;

import java.util.List;

import com.multi.travel.board.dto.BoardDto;
import com.multi.travel.image.dao.ImageDao;
import com.multi.travel.image.dto.ImageDto;

public interface ImageService {
	List<ImageDto> getList(ImageDto dto);
	List<ImageDto> getMainImage(ImageDto dto);	
	
	int getTotal(ImageDto dto);
	ImageDto getView(String board_seq);
	ImageDto getPrev(ImageDto paramDto);
	ImageDto getNext(ImageDto paramDto);
	
	void insert(ImageDto dto);
	void update(ImageDto dto);
	void delete(ImageDto dto);
	void reply(ImageDto dto);
}
