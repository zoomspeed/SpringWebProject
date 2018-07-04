package com.multi.travel.board.dao;

import java.util.List;

import com.multi.travel.board.dto.BoardDto;

public interface BoardDao {
	List<BoardDto> getList(BoardDto dto);
	int getTotal(BoardDto dto);
	BoardDto getView(String board_seq);
	BoardDto getPrev(BoardDto dto);
	BoardDto getNext(BoardDto dto);
	
	void insert(BoardDto dto);
	void update(BoardDto dto);
	void delete(BoardDto dto);
	void reply(BoardDto dto);
	
}
