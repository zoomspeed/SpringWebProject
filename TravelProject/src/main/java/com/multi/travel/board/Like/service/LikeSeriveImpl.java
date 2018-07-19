package com.multi.travel.board.Like.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.travel.board.Qna.dto.QnaDto;
import com.multi.travel.board.Like.dao.LikeDao;
import com.multi.travel.board.Like.dto.LikeDto;
import com.multi.travel.board.Qna.dao.QnaDao;

import javax.annotation.Resource;

@Service ("likeServiceImpl")
public class LikeSeriveImpl implements LikeService{

	//스프링이 만들어놓은 qnaDao 객체 가져다
	//연결시켜준다 (Dependency Injection)
	// IoC(Inversion of Control) 
	@Resource(name="likeDaoImpl")
	LikeDao likeDao;
	
	@Override
	public List<LikeDto> getList(LikeDto dto) {
		// TODO Auto-generated method stub
		return likeDao.getList(dto);
	}

	@Override
	public int getTotal(LikeDto dto) {
		
		return likeDao.getTotal(dto);
	}

	@Override
	public Map<String, Object>  getView(String like_seq) {
		
		return likeDao.getView(like_seq);
	}

/*	@Override
	public void insert(LikeDto dto) {
		likeDao.insert(dto);
	}*/

	@Override
	public void update(LikeDto dto) {
		
		likeDao.update(dto);
	}

	@Override
	public void delete(LikeDto dto) {
		likeDao.delete(dto);
	}

	@Override
	public void reply(QnaDto dto) {
		likeDao.reply(dto);
	}

	@Override
	public QnaDto getPrev(QnaDto paramDto) {
		
		return likeDao.getPrev(paramDto);
	}

	@Override
	public QnaDto getNext(QnaDto paramDto) {
		
		return likeDao.getNext(paramDto);
	}

	@Override
	public void insert(LikeDto dto) {
		likeDao.insert(dto);
		// TODO Auto-generated method stub
		
	}
}
