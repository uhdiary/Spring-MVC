package com.tong.lesson.faqboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tong.lesson.faqboard.vo.FaqBoardVO;

@Repository("faqboardDAO")
public class FaqBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@SuppressWarnings("unchecked")
	public List<FaqBoardVO> selectfaqBoardList(String userid, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		List<FaqBoardVO> resultlist = null;

		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("userid", userid);
		hmap.put("startRow", String.valueOf(startRow));
		hmap.put("endRow", String.valueOf(endRow + 1));
		
		resultlist = (List<FaqBoardVO>) mybatis.selectList("faqboard.faqboardlisttAll", hmap);
		return resultlist;
	}
	
	public int countforfaqboardlist() {
		return (int)mybatis.selectOne("faqboard.countforfaqboardlist");
	}

	public int insertfaq(FaqBoardVO fabvo) {
		return mybatis.insert("faqboard.inserFaqboard",fabvo);
	}

	public int deletefaq(int[] check_no) {
		  int result = 0;
	      for (int i = 0; i < check_no.length; i++) {
	         result += (int) mybatis.update("faqboard.deleteFaqboard", check_no[i]);
	      }
	      return result;
	}

	public List<FaqBoardVO> selectfaqBoardList(int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		List<FaqBoardVO> resultlist = null;

		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("startRow", String.valueOf(startRow));
		hmap.put("endRow", String.valueOf(endRow + 1));
		
		resultlist = (List<FaqBoardVO>) mybatis.selectList("faqboard.faqboardlisttAll", hmap);
		return resultlist;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchtitle(Map<String, Object> map) {
		return (List<Map<String, Object>>)mybatis.selectList("faqboard.searchtitle", map);
	}

	public int countforsearchtitle(String receivedkeyword) {
		String keyword ="%";
		keyword +=receivedkeyword;
		keyword +="%";
				
		return (int)mybatis.selectOne("faqboard.countforsearchtitle",keyword);
	}

}
