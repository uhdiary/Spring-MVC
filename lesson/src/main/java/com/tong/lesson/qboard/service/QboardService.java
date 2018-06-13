package com.tong.lesson.qboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tong.lesson.qboard.vo.QboardVO;

public interface QboardService {

   List<QboardVO> selectBoardList(String userid, int currentPage, int limit);

   QboardVO selectBoardDetail(int qboardno);

   int insertQboard(QboardVO vo) throws Exception;

   void deleteQboard(String qboardno);

   void updateQboard(HashMap<String, String> hmap);

   int countforqboardlist(String userid);

   int countforadminqboardlist();

   List<Map<String, Object>> replyinsertqboard(QboardVO vo );

   List<Map<String, Object>> selectBoardDetailreply(int qboardno);

   List<Map<String, Object>> replydelete(HashMap<String, Object> hmap);

int changeansweryn(String qboardno);

}