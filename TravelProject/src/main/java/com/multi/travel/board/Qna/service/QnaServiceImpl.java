package com.multi.travel.board.Qna.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.travel.board.Qna.dto.QnaDto;
import com.multi.travel.board.Qna.dao.QnaDao;

import javax.annotation.Resource;

@Service ("qnaServiceImpl")
public class QnaServiceImpl implements 
    QnaService{

	//스프링이 만들어놓은 qnaDao 객체 가져다
	//연결시켜준다 (Dependency Injection)
	// IoC(Inversion of Control) 
	@Resource(name="qnaDaoImpl")
	QnaDao qnaDao;
	
	@Override
	public List<QnaDto> getList(QnaDto dto) {
		// TODO Auto-generated method stub
		return qnaDao.getList(dto);
	}

	@Override
	public int getTotal(QnaDto dto) {
		
		return qnaDao.getTotal(dto);
	}

	@Override
	public QnaDto getView(String qna_seq) {
		
		return qnaDao.getView(qna_seq);
	}

	@Override
	public void insert(QnaDto dto) {
		qnaDao.insert(dto);
	}

	@Override
	public void update(QnaDto dto) {
		qnaDao.update(dto);
	}

	@Override
	public void delete(QnaDto dto) {
		qnaDao.delete(dto);
	}

	@Override
	public void reply(QnaDto dto) {
		qnaDao.reply(dto);
	}

	@Override
	public QnaDto getPrev(QnaDto paramDto) {
		
		return qnaDao.getPrev(paramDto);
	}

	@Override
	public QnaDto getNext(QnaDto paramDto) {
		
		return qnaDao.getNext(paramDto);
	}
}
