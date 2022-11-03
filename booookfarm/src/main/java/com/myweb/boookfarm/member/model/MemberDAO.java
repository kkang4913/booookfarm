package com.myweb.boookfarm.member.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;
	
	private String mapper = "memberMapper.%s";
	
	public MemberDTO getMemData(String memId) {
		String mapperId = String.format(mapper, "selectMemData");
		MemberDTO memData = session.selectOne(mapperId, memId);

		return memData;
	}

}
