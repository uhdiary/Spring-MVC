package com.tong.lesson.qboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tong.lesson.qboard.vo.QboardVO;

@Repository("qboardDAO")
public class QboardDAO {
   
   @Autowired
   private SqlSessionTemplate mybatis;
   
   @SuppressWarnings("unchecked")
   public List<QboardVO> selectBoardList(String userid, int currentPage, int limit) {
      int startRow = (currentPage - 1) * limit   +1;
       int endRow = startRow + limit-1 ;
      List<QboardVO> resultlist = null;
      
      HashMap<String, String> hmap = new HashMap<String,String>();
       hmap.put("userid", userid);
       hmap.put("startRow",String.valueOf(startRow));
       hmap.put("endRow", String.valueOf(endRow+1));
    
      if(userid.equals("admin")){
         resultlist = (List<QboardVO>) mybatis.selectList("qboard.qboardlistAll", hmap); 
         }else {
         resultlist = (List<QboardVO>) mybatis.selectList("qboard.qboardlist", hmap);
      }
      
      
      return resultlist;
   }

   public QboardVO selectBoardDetail(int qboardno) {
      return (QboardVO) mybatis.selectOne("qboard.selectBoardDetail", qboardno);
   }

   public int insertQboard(QboardVO vo) {
      return mybatis.insert("qboard.inserQboard", vo);
   }

   public int deleteQboard(String qboardno) {
       return mybatis.delete("qboard.deleteQboard",qboardno);
      
   }

   public void updateQboard(HashMap<String, String> hmap) {
      mybatis.update("qboard.updateQboard", hmap);
      
   }

   public int countforqboardlist(String userid) {
      return (int)mybatis.selectOne("qboard.countforqboardlist", userid);
   }

   public int countforadminqboardlist() {
      return (int)mybatis.selectOne("qboard.countforadminqboardlist");
   }

   @SuppressWarnings("unchecked")
   public List<Map<String, Object>>  replyinsertqboard(QboardVO vo) {
       mybatis.insert("qboard.replyinsertqboard",vo);   
      return (List<Map<String, Object>>)mybatis.selectList("qboard.qboardReplylist",vo);
   }

   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectBoardDetailreply(int qboardno) {
       
      return (List<Map<String, Object>>)mybatis.selectList("qboard.qboardReplylist",qboardno);
   }

   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> replydeleteqboard(HashMap<String, Object> hmap) {
      mybatis.delete("qboard.replydeleteqboard",hmap.get("qboardno"));
      String detailboardno = hmap.get("detailboardno").toString();

      return (List<Map<String, Object>>)mybatis.selectList("qboard.qboardReplylist2",detailboardno);
   }
   
public int changeansweryn(String qboardno) {
	// TODO Auto-generated method stub
	return (int)mybatis.update("qboard.changeansweryn",qboardno);
}

}