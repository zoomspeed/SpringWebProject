package com.multi.travel.board.Qna.service;

import java.util.List;

import com.multi.travel.board.Qna.dto.QnaDto;


public interface QnaService {
	List<QnaDto> getList(QnaDto dto);
	int getTotal(QnaDto dto);
	QnaDto getView(String board_seq);
	
	QnaDto getPrev(QnaDto paramDto);
	QnaDto getNext(QnaDto paramDto);
	
	void insert(QnaDto dto);
	void update(QnaDto dto);
	void delete(QnaDto dto);
	void reply(QnaDto dto);
}
