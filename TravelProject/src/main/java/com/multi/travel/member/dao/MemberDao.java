package com.multi.travel.member.dao;

import com.multi.travel.member.dto.MemberDto;

public interface MemberDao {
	int getIdCheck(MemberDto dto);
	void insert(MemberDto dto);
	MemberDto getMemberInfo(MemberDto dto);
	MemberDto findId(MemberDto dto);
	MemberDto findPwd(MemberDto dto);
	int getEmailCheck(MemberDto dto);
}
