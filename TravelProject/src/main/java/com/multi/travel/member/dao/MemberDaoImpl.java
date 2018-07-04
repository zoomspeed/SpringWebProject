package com.multi.travel.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.travel.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public int getIdCheck(MemberDto dto) {
		int result = sm.selectOne("Member.idcheck",dto);
		return result;
	}

	@Override
	public int getEmailCheck(MemberDto dto) {
		int result = sm.selectOne("Member.emailcheck",dto);
		return result;
	}	
	
	@Override
	public void insert(MemberDto dto) {
		sm.insert("Member.insert", dto);
	}

	@Override
	public MemberDto getMemberInfo(MemberDto dto) {
		
		return sm.selectOne("Member.getMemberInfo", dto);
	}

	@Override
	public MemberDto findId(MemberDto dto) {
		
		return sm.selectOne("Member.findId", dto);
	}

	@Override
	public MemberDto findPwd(MemberDto dto) {
		
		return sm.selectOne("Member.findPwd", dto);
	}

}
