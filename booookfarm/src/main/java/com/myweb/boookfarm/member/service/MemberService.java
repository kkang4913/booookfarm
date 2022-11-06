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

	/**
	 *  DAO에 id와 일치하는 member_id를 요청하는메서드
	 * @param id DB에서 찾을 id
	 * @return DAO에서 받은 member_id 반환
	 */
	public String getMemId(String id) {
		String data = dao.getMemId(id);
		return data;
	}

	/**
	 *  DAO에 phone과 일치하는 phone을 요청하는 메서드
	 * @param phone DB에서 찾을 phone
	 * @return DAO에서 받은 phone 반환
	 */
	public String getMemPhone(String phone) {
		String data = dao.getMemPhone(phone);
		return data;
	}

	/**
	 *  ID 중복 체크 메서드
	 * @param id 중복 체크할 id
	 * @return 중복이면 true 아니면 false 반환
	 */
	public boolean chkIdDup(String id) {
		boolean result = false;
		if(getMemId(id) != null) {
			result = getMemId(id).equals(id) ? true : false;
		}
		return result;
	}

	/**
	 *  phone 중복 체크 메서드
	 * @param phone 중복 체크할 phone
	 * @return 중복이면 true 아니면 false 반환
	 */
    public boolean chkPhoneDup(String phone) {
		boolean result = false;
		if(getMemPhone(phone) != null) {
			result = getMemPhone(phone).equals(phone) ? true : false;
		}
		return result;
    }

	public boolean addMemData(MemberDTO newMem) {
		int result = dao.addMemData(newMem);
		return result == 1 ? true : false;
	}
}
