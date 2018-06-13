package com.tong.lesson.faqboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tong.lesson.faqboard.dao.FaqBoardDAO;
import com.tong.lesson.faqboard.vo.FaqBoardVO;


@Service
public class FaqBoardServiceImpl implements FaqBoardService{
	
	@Autowired
	private FaqBoardDAO faqboardDAO;

	@Override
	public List<FaqBoardVO> selectBoardList(String userid, int currentPage, int limit) {
		return faqboardDAO.selectfaqBoardList(userid, currentPage, limit);
	}
	
	@Override
	public int countforfaqboardlist() {
		return  faqboardDAO.countforfaqboardlist();
		
	}

	@Override
	public int insertfaq(FaqBoardVO fabvo) {
		return faqboardDAO.insertfaq(fabvo);
	}

	@Override
	public int deletefaq(int[] check_no) {
		return faqboardDAO.deletefaq(check_no);
	}

	@Override
	public List<FaqBoardVO> selectBoardList(int currentPage, int limit) {
		return faqboardDAO.selectfaqBoardList(currentPage, limit);
	}

	@Override
	public List<Map<String, Object>> searchtitle(Map<String, Object> map) {
		return faqboardDAO.searchtitle(map);
	}

	@Override
	public int countforsearchtitle(String keyword) {
		 
		return faqboardDAO.countforsearchtitle( keyword);
	}


	

	

}
