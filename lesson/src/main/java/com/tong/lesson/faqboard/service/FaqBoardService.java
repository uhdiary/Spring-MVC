package com.tong.lesson.faqboard.service;

import java.util.List;
import java.util.Map;

import com.tong.lesson.faqboard.vo.FaqBoardVO;

public interface FaqBoardService {

	List<FaqBoardVO> selectBoardList(String userid, int currentPage, int limit);

	int countforfaqboardlist();

	int insertfaq(FaqBoardVO fabvo);

	int deletefaq(int[] check_no);

	List<FaqBoardVO> selectBoardList(int currentPage, int limit);

	List<Map<String, Object>> searchtitle(Map<String, Object> map);

	int countforsearchtitle(String keyword);

}
