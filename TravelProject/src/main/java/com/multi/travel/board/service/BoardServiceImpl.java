package com.multi.travel.board.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.travel.board.dao.BoardDao;
import com.multi.travel.board.dto.BoardDto;
import javax.annotation.Resource;

@Service ("boardServiceImpl")
public class BoardServiceImpl implements 
    BoardService{

	//스프링이 만들어놓은 boardDao 객체 가져다
	//연결시켜준다 (Dependency Injection)
	// IoC(Inversion of Control) 
	@Resource(name="boardDaoImpl")
	BoardDao boardDao;
	
	@Override
	public List<BoardDto> getList(BoardDto dto) {
		// TODO Auto-generated method stub
		return boardDao.getList(dto);
	}

	@Override
	public int getTotal(BoardDto dto) {
		
		return boardDao.getTotal(dto);
	}

	@Override
	public BoardDto getView(String board_seq) {
		
		return boardDao.getView(board_seq);
	}

	@Override
	public void insert(BoardDto dto) {
		boardDao.insert(dto);
	}

	@Override
	public void update(BoardDto dto) {
		boardDao.update(dto);
	}

	@Override
	public void delete(BoardDto dto) {
		boardDao.delete(dto);
	}

	@Override
	public void reply(BoardDto dto) {
		boardDao.reply(dto);
	}

	@Override
	public BoardDto getPrev(BoardDto paramDto) {
		
		return boardDao.getPrev(paramDto);
	}

	@Override
	public BoardDto getNext(BoardDto paramDto) {
		
		return boardDao.getNext(paramDto);
	}
}
