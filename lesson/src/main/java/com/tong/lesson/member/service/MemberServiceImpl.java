package com.tong.lesson.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.tong.lesson.member.dao.MemberDAO;
import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.safepay.vo.PagingVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberVO selectMember(MemberVO vo) {		
		return memberDAO.selectMember(vo);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return memberDAO.insertMember(vo);
	}

	@Override
	public int membermupdate(MemberVO vo) {
		return memberDAO.membermupdate(vo);
	}

	@Override
	public int mdel(MemberVO vo) {
		return memberDAO.mdel(vo);
	}

	@Override
	public String idfindin(MemberVO vo) {
		return memberDAO.idfindin(vo);
	}
	@Override
	public String pwdfindin(MemberVO vo) {
		return memberDAO.pwdfindin(vo);
	}

	@Override
	public int pwding(MemberVO vo) {
		return memberDAO.pwding(vo);
	}

	@Override
	public String idcheck(MemberVO vo) {
		return memberDAO.idcheck(vo);
	}
	
	@Override
	public List<Map<String, Object>> managergo(PagingVO page) {
	    return memberDAO.managergo(page);
	}

	@Override
	public String getmemberTotal(HashMap<String, String> hmap) {
		return memberDAO.getmemberTotal(hmap);
	}

	@Override
	public MemberVO managerMember(String userid) {
		return memberDAO.managerMember(userid);
	}

	@Override
	public MemberVO selectMember(String userid) {
		return memberDAO.selectMember(userid);
	}

	@Override
	public MemberVO selectMemberazax(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberazax(param);
	}

}
