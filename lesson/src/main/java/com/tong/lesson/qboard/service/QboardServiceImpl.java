package com.tong.lesson.qboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tong.lesson.qboard.dao.QboardDAO;
import com.tong.lesson.qboard.vo.QboardVO;

@Service
public class QboardServiceImpl implements QboardService {


   @Autowired
   private QboardDAO qboardDAO;

   @Override
   public List<QboardVO> selectBoardList(String userid,int currentPage, int limit) {
      return qboardDAO.selectBoardList(userid, currentPage, limit);
   }

   @Override
   public QboardVO selectBoardDetail(int qboardno) {
         QboardVO qboard = qboardDAO.selectBoardDetail(qboardno);
         return qboard;
   }

   @Override
   public int insertQboard(QboardVO vo) throws Exception {
      return qboardDAO.insertQboard(vo);
   }

   @Override
   public void deleteQboard(String qboardno) {
       qboardDAO.deleteQboard(qboardno);
      
   }

   @Override
   public void updateQboard(HashMap<String, String> hmap) {
      qboardDAO.updateQboard(hmap);
      
   }

   @Override
   public int countforqboardlist(String userid) {
      return  qboardDAO.countforqboardlist(userid);
      
   }

   @Override
   public int countforadminqboardlist() {
      return  qboardDAO.countforadminqboardlist();
   }

   @Override
   public List<Map<String, Object>> replyinsertqboard(QboardVO vo) {
       
      return qboardDAO.replyinsertqboard(vo);
   }

   @Override
   public List<Map<String, Object>> selectBoardDetailreply(int qboardno) {
       
      return qboardDAO.selectBoardDetailreply(qboardno);
   }

   @Override
   public List<Map<String, Object>> replydelete(HashMap<String, Object> hmap) {
       
      return qboardDAO.replydeleteqboard(hmap);
   }

@Override
public int changeansweryn(String qboardno) {
	// TODO Auto-generated method stub
	return qboardDAO.changeansweryn(qboardno);
}

}