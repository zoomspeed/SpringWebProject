package com.multi.travel.board.Like.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.multi.travel.board.Like.dto.LikeDto;
import com.multi.travel.board.Qna.dto.QnaDto;


public interface LikeService {
	List<LikeDto> getList(LikeDto dto);
	int getTotal(LikeDto dto);
	LikeDto  getView(String like_seq);
	
	QnaDto getPrev(QnaDto paramDto);
	QnaDto getNext(QnaDto paramDto);
	
	void insert(LikeDto dto);
	void update(LikeDto dto);
	void delete(LikeDto dto);
	void reply(QnaDto dto);
}
