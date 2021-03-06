package com.multi.travel.board.Qna.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.travel.board.Qna.dto.QnaDto;



@Repository("qnaDaoImpl")
public class QnaDaoImpl implements QnaDao{

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<QnaDto> getList(QnaDto dto) {
		
		List<QnaDto> list = sm.selectList("Qna.getList",dto);
				
		return list;
	}

	@Override
	public int getTotal(QnaDto dto) {
		
		int result = (Integer)sm.selectOne("Qna.getTotalCount", dto);
		//selectOne 함수는 object를 반환
		//object -> Integer -> int 로 바꿔야 한다 
		//object -> int 로 바로 변경은 불가능 하다
		return result;
	}

	@Override
	public QnaDto getView(String Qna_seq) {
		//조회수 업데이트 
		sm.update("Qna.updateHit", Qna_seq);
		
		QnaDto dto = 
			sm.selectOne("Qna.getView", Qna_seq);
		return dto;
	}

	@Override
	public void insert(QnaDto dto) {
		
		// Qna.xml의 insert 태그 
		//id와 동일해야 한다 Qna.insert
		sm.insert("Qna.insert", dto);
	}

	@Override
	public void update(QnaDto dto) {
		sm.update("Qna.update", dto);
		
	}

	@Override
	public void delete(QnaDto dto) {
		sm.update("Qna.delete", dto);
		
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
