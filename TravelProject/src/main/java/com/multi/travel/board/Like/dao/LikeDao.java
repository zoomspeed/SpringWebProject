package com.multi.travel.board.Like.dao;

import java.util.List;
import com.multi.travel.board.Qna.dto.QnaDto;

public interface LikeDao {
	List<QnaDto> getList(QnaDto dto);
	int getTotal(QnaDto dto);
	QnaDto getView(String qna_seq);
	QnaDto getPrev(QnaDto dto);
	QnaDto getNext(QnaDto dto);
	
	void insert(QnaDto dto);
	void update(QnaDto dto);
	void delete(QnaDto dto);
	void reply(QnaDto dto);
	
}
