package com.myweb.boookfarm.member.service;

import com.myweb.boookfarm.member.model.MemberDAO;
import com.myweb.boookfarm.member.model.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public MemberDTO getMemData(String memId) {
		MemberDTO data = dao.getMemData(memId);
		return data;
	}

	public boolean chkIdDup(String memId) {
		boolean result = getMemData(memId) == null ? false : true;

		return result;
	}
}
