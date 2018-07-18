package com.multi.travel.board.Like.dao;

import java.util.List;

import com.multi.travel.board.Like.dto.LikeDto;
import com.multi.travel.board.Qna.dto.QnaDto;

public interface LikeDao {
	List<QnaDto> getList(QnaDto dto);
	int getTotal(LikeDto dto);
	QnaDto getView(String qna_seq);
	QnaDto getPrev(QnaDto dto);
	QnaDto getNext(QnaDto dto);
	
	void insert(LikeDto dto);
	void update(LikeDto dto);
	void delete(LikeDto dto);
	void reply(QnaDto dto);
	
}
