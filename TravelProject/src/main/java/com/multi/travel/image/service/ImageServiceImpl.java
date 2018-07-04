package com.multi.travel.image.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.travel.board.dao.BoardDao;
import com.multi.travel.board.dto.BoardDto;
import com.multi.travel.image.dao.ImageDao;
import com.multi.travel.image.dto.ImageDto;

import javax.annotation.Resource;

@Service ("imageServiceImpl")
public class ImageServiceImpl implements ImageService{

	//스프링이 만들어놓은 boardDao 객체 가져다
	//연결시켜준다 (Dependency Injection)
	// IoC(Inversion of Control) 
	@Resource(name="imageDaoImpl")
	ImageDao imageDao;

	@Override
	public List<ImageDao> getList(ImageDao dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(ImageDao dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ImageDao getView(String board_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ImageDao getPrev(ImageDao paramDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ImageDao getNext(ImageDao paramDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(ImageDto dto) {
		// TODO Auto-generated method stub
		imageDao.insert(dto);
	}

	@Override
	public void update(ImageDao dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(ImageDao dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reply(ImageDao dto) {
		// TODO Auto-generated method stub
		
	}


	
}
