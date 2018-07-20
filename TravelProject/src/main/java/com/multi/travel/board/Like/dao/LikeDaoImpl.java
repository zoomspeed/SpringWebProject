package com.multi.travel.board.Like.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.travel.board.Like.dto.LikeDto;
import com.multi.travel.board.Qna.dto.QnaDto;



@Repository("likeDaoImpl")
public class LikeDaoImpl implements LikeDao{

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<LikeDto> getList(LikeDto dto) {
		
		List<LikeDto> list = sm.selectList("Qna.getList",dto);
				
		return list;
	}

	@Override
	public int getTotal(LikeDto dto) {
		
		int result = (Integer)sm.selectOne("Like.getTotalCount", dto);
		//selectOne 함수는 object를 반환
		//object -> Integer -> int 로 바꿔야 한다 
		//object -> int 로 바로 변경은 불가능 하다
		return result;
	}

	@Override
	public LikeDto getView(String like_seq) {
		//조회수 업데이트 

		return sm.selectOne("Like.getView", like_seq);

	}

	@Override
	public void insert(LikeDto dto) {
		
		// Qna.xml의 insert 태그 
		//id와 동일해야 한다 Qna.insert
		sm.insert("Like.insert", dto);
	}

	@Override
	public void update(LikeDto dto) {
		sm.update("Like.update", dto);

	}

	@Override
	public void delete(LikeDto dto) {
		sm.update("Like.delete", dto);
		
	}

	@Override
	public void reply(QnaDto dto) {
		sm.update("Qna.updateLevel", dto);
		sm.insert("Qna.reply", dto);
		
	}

	@Override
	public QnaDto getPrev(QnaDto paramDto) {
		QnaDto dto = 
			sm.selectOne("Qna.getPrev", paramDto);
		return dto;
	}

	@Override
	public QnaDto getNext(QnaDto paramDto) {
		QnaDto dto = 
			sm.selectOne("Qna.getNext", paramDto);
		return dto;
	}

}
