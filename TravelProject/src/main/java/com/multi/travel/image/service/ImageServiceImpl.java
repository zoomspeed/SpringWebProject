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
	public List<ImageDto> getList(ImageDto dto) {
		// TODO Auto-generated method stub
		return imageDao.getList(dto);
	}

	@Override
	public int getTotal(ImageDto dto) {
		// TODO Auto-generated method stub
		return imageDao.getTotal(dto);
	}

	@Override
	public ImageDto getView(String image_seq) {
		// TODO Auto-generated method stub
		return imageDao.getView(image_seq);
	}

	@Override
	public ImageDto getPrev(ImageDto paramDto) {
		// TODO Auto-generated method stub
		return imageDao.getPrev(paramDto);
	}

	@Override
	public ImageDto getNext(ImageDto paramDto) {
		// TODO Auto-generated method stub
		return imageDao.getNext(paramDto);
	}

	@Override
	public void insert(ImageDto dto) {
		// TODO Auto-generated method stub
		imageDao.insert(dto);
	}

	@Override
	public void update(ImageDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(ImageDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reply(ImageDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> getMainImage(ImageDto dto) {
		// TODO Auto-generated method stub
		return imageDao.getMainImage(dto);
	}


	
}
