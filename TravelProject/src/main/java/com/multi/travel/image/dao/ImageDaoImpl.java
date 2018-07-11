package com.multi.travel.image.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.travel.board.dto.BoardDto;
import com.multi.travel.image.dto.ImageDto;

@Repository("imageDaoImpl")
public class ImageDaoImpl implements ImageDao{

	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<ImageDto> getList(ImageDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("Image.getList", dto);
	}

	@Override
	public int getTotal(ImageDto dto) {
		// TODO Auto-generated method stub
		int total = (Integer) sm.selectOne("Image.getTotalCount", dto);
		return total;
	}

	@Override
	public ImageDto getView(String image_seq) {
		// TODO Auto-generated method stub
		sm.update("Image.updateHit", image_seq);
		return sm.selectOne("Image.getView",image_seq);
	}

	@Override
	public ImageDto getPrev(ImageDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ImageDto getNext(ImageDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(ImageDto dto) {
		// TODO Auto-generated method stub
		sm.insert("Image.insert", dto);
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
		List<String> list = sm.selectList("Image.getMainImage",dto);
		return list;
	}
	


}
