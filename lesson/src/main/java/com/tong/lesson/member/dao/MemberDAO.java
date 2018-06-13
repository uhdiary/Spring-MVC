package com.tong.lesson.member.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.safepay.vo.PagingVO;

@Repository("memberDAO")
public class MemberDAO<MemberBean> {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberVO selectMember(MemberVO vo) {
		vo = (MemberVO)mybatis.selectOne("selectMember", vo);
		return vo;
	}
	
	/*public MemberVO selectMemberazax(HashMap<String, String> param) {
		MemberVO mvo = (MemberVO)mybatis.selectOne("selectMemberazax", param);
		
		return mvo;
	}*/
		
	public int insertMember(MemberVO vo) {
		int result = 0;
		result = mybatis.insert("insertMember", vo);
		return result;
	}

	public int membermupdate(MemberVO vo) {
		return mybatis.update("membermupdate", vo);
	}


	public int mdel(MemberVO vo) {
		return mybatis.delete("mdel", vo);
	}

	public String idfindin(MemberVO vo) {
		if(vo.getPhone() != null && vo.getPhone() != ""){
			return (String) mybatis.selectOne("idfindin1", vo);
		}else{
			return (String) mybatis.selectOne("idfindin2", vo);
		}
	}


	public String pwdfindin(MemberVO vo) {
		if(vo.getPhone() != null && vo.getPhone() != ""){
			return (String) mybatis.selectOne("pwdfindin1", vo);
		}else{
			return (String) mybatis.selectOne("pwdfindin2", vo);
		}
	}


	public int pwding(MemberVO vo) {
		return mybatis.update("pwding", vo);
	}


	public String idcheck(MemberVO vo) {
		return (String) mybatis.selectOne("idcheck", vo);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> managergo(PagingVO page) {
		
		 
			if(page.getHiddensearchstandardKind().equals("userid")) {
		return (List<Map<String, Object>>) mybatis.selectList("manager", page);
			}else if(page.getHiddensearchstandardKind().equals("username")) {
				return	(List<Map<String, Object>>) mybatis.selectList("managername", page); 
			}else{
				return	(List<Map<String, Object>>) mybatis.selectList("managerphone", page); 
			}
		
	}


	public String getmemberTotal(HashMap<String, String> hmap) {
		if(hmap.get("hiddensearchstandardKind").equals("userid")) {
		return (String)mybatis.selectOne("getmemberTotal",hmap);
		}else if(hmap.get("hiddensearchstandardKind").equals("username")) {
			return (String)mybatis.selectOne("getmemberTotalname",hmap);
		}else{
			return (String)mybatis.selectOne("getmemberTotalphone",hmap);
		}
	}

	public MemberVO managerMember(String userid) {
		return (MemberVO)mybatis.selectOne("managerMember",userid);
	}

	public MemberVO selectMember(String userid) {
		return (MemberVO)mybatis.selectOne("managerMember", userid);
	}

	public MemberVO selectMemberazax(HashMap<String, String> param) {
		return (MemberVO)mybatis.selectOne("selectMemberazax", param);
	}

}