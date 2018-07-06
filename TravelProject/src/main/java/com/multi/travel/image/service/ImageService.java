package com.multi.travel.image.service;

import java.util.List;

import com.multi.travel.board.dto.BoardDto;
import com.multi.travel.image.dao.ImageDao;
import com.multi.travel.image.dto.ImageDto;

public interface ImageService {
	List<ImageDao> getList(ImageDao dto);
	List<String> getMainImage(ImageDto dto);	
	
	int getTotal(ImageDao dto);
	ImageDao getView(String board_seq);
	ImageDao getPrev(ImageDao paramDto);
	ImageDao getNext(ImageDao paramDto);
	
	void insert(ImageDto dto);
	void update(ImageDao dto);
	void delete(ImageDao dto);
	void reply(ImageDao dto);
}
