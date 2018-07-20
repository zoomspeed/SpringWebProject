package com.multi.travel.board.Like.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.multi.travel.board.Like.dto.LikeDto;
import com.multi.travel.board.Qna.dto.QnaDto;

public interface LikeDao {
	List<LikeDto> getList(LikeDto dto);
	int getTotal(LikeDto dto);
	LikeDto getView(String like_seq);
	QnaDto getPrev(QnaDto dto);
	QnaDto getNext(QnaDto dto);
	
	void insert(LikeDto dto);
	void update(LikeDto dto);
	void delete(LikeDto dto);
	void reply(QnaDto dto);
	
}
