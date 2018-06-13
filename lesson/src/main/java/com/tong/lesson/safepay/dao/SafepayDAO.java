package com.tong.lesson.safepay.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.SynchronousQueue;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tong.lesson.safepay.vo.PagingVO;
import com.tong.lesson.safepay.vo.SafepayRefundVO;
import com.tong.lesson.safepay.vo.SafepayVO;

@Repository("safepayDAO")
public class SafepayDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 안전결재 조건별 리스트 총 갯수.
	public String getSafepayTotal(String SPASKUSERID, String KIND) throws Exception{
		String total ="0";
		if(!SPASKUSERID.equals("admin")){ total= (String) mybatis.selectOne("safepay.getSafepayTotal",SPASKUSERID);}		
		else{ 
			if( KIND.equals("necessaryrefund")){			
				total= (String) mybatis.selectOne("safepay.necessaryrefundTotal");
			}else if ( KIND.equals("completerefund")){
				total= (String) mybatis.selectOne("safepay.completerefundTotal");
			}else{ 
				total= (String) mybatis.selectOne("safepay.allofrefundTotal");
			}		
		}	
		return total;
	}
	
	public String getSafepayTotal(PagingVO pagevobysww) throws Exception{
		String total = "0";
		String SPASKUSERID = pagevobysww.getPvid();
		String kind = pagevobysww.getPvsearchkind();
		String hiddensearchstandardKind = pagevobysww.getHiddensearchstandardKind();
		String hiddensearchtextbox1 = pagevobysww.getHiddensearchtextbox1();
		if(!pagevobysww.getPvid().equals("admin")){ total= (String) mybatis.selectOne("safepay.getSafepayTotal",SPASKUSERID);}		
		else{ 	
				// 검색을 하지 않았다면
				if(hiddensearchstandardKind.equals(""))
					if( kind.equals("necessaryrefund")){			
						total= (String) mybatis.selectOne("safepay.necessaryrefundTotal");
					}else if ( pagevobysww.getPvsearchkind().equals("completerefund")){
						total= (String) mybatis.selectOne("safepay.completerefundTotal");
					}else{ 
						total= (String) mybatis.selectOne("safepay.allofrefundTotal");
					}
				else{ // 검색버튼 클릭 이후 라면
					if(hiddensearchstandardKind.equals("searchrefundno") && kind.equals("necessaryrefund")){			
						total= (String) mybatis.selectOne("safepay.necessaryrefundTotalwithreno",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("necessaryrefund")){			
						total= (String) mybatis.selectOne("safepay.necessaryrefundTotalwithsano",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchapplyid") && kind.equals("necessaryrefund")){			
						total= (String) mybatis.selectOne("safepay.necessaryrefundTotalwithid",hiddensearchtextbox1);
					}else if (hiddensearchstandardKind.equals("searchrefundno") && kind.equals("completerefund")){
						total= (String) mybatis.selectOne("safepay.completerefundTotalwithreno",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("completerefund")){			
						total= (String) mybatis.selectOne("safepay.completerefundTotalwithsano",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchapplyid") && kind.equals("completerefund")){			
						total= (String) mybatis.selectOne("safepay.completerefundTotalwithid",hiddensearchtextbox1);
					}else if (hiddensearchstandardKind.equals("searchrefundno") && kind.equals("allofrefund")){
						total= (String) mybatis.selectOne("safepay.allofrefundTotalwithreno",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("allofrefund")){			
						total= (String) mybatis.selectOne("safepay.allofrefundTotalwithsano",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchapplyid") && kind.equals("allofrefund")){			
						total= (String) mybatis.selectOne("safepay.allofrefundTotalwithid",hiddensearchtextbox1);
					}		
				}
		}	
		return total;
	}
	 

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectsafepayList(PagingVO pagevobysww) throws Exception{
		return ( List<Map<String, Object>>)mybatis.selectList("safepay.selectmysafepayList", pagevobysww);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectsafepayListforadmin(PagingVO pagevobysww) {
		
		String kind = pagevobysww.getPvsearchkind();
		String hiddensearchstandardKind = "";

		if(pagevobysww.getHiddensearchstandardKind()!= null && pagevobysww.getHiddensearchstandardKind()!= "")
		{ hiddensearchstandardKind= pagevobysww.getHiddensearchstandardKind(); }
	
		if(hiddensearchstandardKind.equals("")){
			if( kind.equals("necessaryrefund")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.necessaryrefund", pagevobysww);
			}else if ( kind.equals("completerefund")){
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.completerefund", pagevobysww);
			}else{ 
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.allofrefund", pagevobysww);
			}
		}else {	
			if(hiddensearchstandardKind.equals("searchrefundno") && kind.equals("necessaryrefund")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.necessaryrefundwithreno", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("necessaryrefund")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.necessaryrefundwithsano", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchapplyid") && kind.equals("necessaryrefund")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.necessaryrefundwithid", pagevobysww);
			}else if (hiddensearchstandardKind.equals("searchrefundno") && kind.equals("completerefund")){
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.completerefundwithreno", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("completerefund")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.completerefundwithsano", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchapplyid") && kind.equals("completerefund")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.completerefundwithid", pagevobysww);
			}else if (hiddensearchstandardKind.equals("searchrefundno") && kind.equals("allofrefund")){
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.allofrefundwithreno", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("allofrefund")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.allofrefundwithsano", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchapplyid") && kind.equals("allofrefund")){	
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.allofrefundwithid", pagevobysww);
			}else{
				return null;
			}	
		}
	}

	public int insertSafepay(SafepayVO vo) {
		return mybatis.insert("safepay.insertsafepay", vo);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getselectedSafepay(String SPASKNO) {
		return (Map<String, Object>)mybatis.selectOne("safepay.getSelectedSafepay", SPASKNO);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getselectedRefund(String SPASKNO) {
		return (Map<String, Object>)mybatis.selectOne("safepay.getSelectedRefund", SPASKNO);
	}

	public int changeStatusSafepay(Map<String, Object> map) {
		 return mybatis.update("safepay.updateStatus", map);		
	}

	public int insertRefund(SafepayRefundVO vo) {		 
		return mybatis.insert("safepay.insertrefund", vo);
	}

	public int updateHavingynrefund(Map<String, Object> map) {	 
		return mybatis.insert("safepay.updateHavingynrefund", map);
	}

	public int refunddelete(String refundno) {
		return mybatis.delete("safepay.refunddelete", refundno);
	}

	public int approvestatuschange(Map<String, Object> map) {
		return  mybatis.update("safepay.approvestatuschange", map);
	}


	public String getteachercheck(Map<String, Object> map) {	
		return (String)mybatis.selectOne("safepay.getteachercheck", map);
	
	}

	public String getManagerSafepayTabTotal( PagingVO pagevobysww) {
			String total ="0";
		
				// 검색을 하지 않았다면
			String kind = pagevobysww.getPvsearchkind();
			String hiddensearchstandardKind = pagevobysww.getHiddensearchstandardKind();
			String hiddensearchtextbox1 = pagevobysww.getHiddensearchtextbox1();
			
				if( hiddensearchtextbox1==null)
					if( kind.equals("necessarydeposite")){			
						total= (String) mybatis.selectOne("safepay.necessarydeposittotal");
					}else if ( kind.equals("allofsafepay")){
						total= (String) mybatis.selectOne("safepay.managerallofsafepaytotal");
					}else if ( kind.equals("cancledsafepay")){
						total= (String) mybatis.selectOne("safepay.canclesafepaytotalformanager");
					}else{   // completesafepay
						total= (String) mybatis.selectOne("safepay.donesafepaytotalformanager");
					}
				else{ // 검색버튼 클릭 이후 라면																 
					if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("necessarydeposite")){			
						total= (String) mybatis.selectOne("safepay.necessarydeposittotalwithsafepayno",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("allofsafepay")){					
						total= (String) mybatis.selectOne("safepay.managerallofsafepaytotalwithsafepayno",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("cancledsafepay")){			
						total= (String) mybatis.selectOne("safepay.canclesafepaytotalformanagerwithsafeno",hiddensearchtextbox1);
					}else if (hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("completesafepay")){
						total= (String) mybatis.selectOne("safepay.donesafepaytotalformanagerwithsafeno",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchsafepayaskid") && kind.equals("necessarydeposite")){			
						total= (String) mybatis.selectOne("safepay.necessarydeposittotalwithaskid",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchsafepayaskid") && kind.equals("allofsafepay")){			
						total= (String) mybatis.selectOne("safepay.managerallofsafepaytotalwithaskid",hiddensearchtextbox1);
					}else if (hiddensearchstandardKind.equals("searchsafepayaskid") && kind.equals("cancledsafepay")){
						total= (String) mybatis.selectOne("safepay.canclesafepaytotalformanagerwithsafeno",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchsafepayaskid") && kind.equals("completesafepay")){			
						total= (String) mybatis.selectOne("safepay.donesafepaytotalformanagerwithaskid",hiddensearchtextbox1);
					}else if(hiddensearchstandardKind.equals("searchenddate") && kind.equals("necessarydeposite")){			
						total= (String) mybatis.selectOne("safepay.necessarydeposittotalwithenddate",pagevobysww );
					}else if(hiddensearchstandardKind.equals("searchenddate") && kind.equals("allofsafepay")){			
						total= (String) mybatis.selectOne("safepay.managerallofsafepaytotalwithenddate",pagevobysww  );
					}else if(hiddensearchstandardKind.equals("searchenddate") && kind.equals("cancledsafepay")){			
						total= (String) mybatis.selectOne("safepay.canclesafepaytotalformanagerwithdate",pagevobysww );
					}else if(hiddensearchstandardKind.equals("searchenddate") && kind.equals("completesafepay")){			
						total= (String) mybatis.selectOne("safepay.donesafepaytotalformanagerwithaskid",pagevobysww );
					}	
				}		
		return total;
	}	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getManagerSafepayTab(PagingVO pagevobysww) {
		 		
		String kind = pagevobysww.getPvsearchkind();
		String hiddensearchtextbox = "";
		String hiddensearchstandardKind = "";

		if(!pagevobysww.getHiddensearchtextbox1().equals("%%"))
		{ hiddensearchtextbox= pagevobysww.getHiddensearchtextbox1(); }
		if(pagevobysww.getHiddensearchstandardKind()!= null)
		{ hiddensearchstandardKind= pagevobysww.getHiddensearchstandardKind(); }
		 
		
		if(hiddensearchtextbox.equals("")&& pagevobysww.getHiddensearchdateendinput().equals("")){
			if( kind.equals("necessarydeposite")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.necessarydeposit", pagevobysww);
			}else if ( kind.equals("allofsafepay")){
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.managerallofsafepay", pagevobysww);
			}else if ( kind.equals("cancledsafepay")){
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.canclesafepayformanager", pagevobysww);
			}else{ 
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.donesafepayformanager", pagevobysww);
			}
		}else {	
			
			if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("necessarydeposite")){		
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.necessarydepositwithsafepayno", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("allofsafepay")){
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.managerallofsafepaywithsafepayno", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("cancledsafepay")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.canclesafepayformanagerwithsafeno", pagevobysww);
			}else if (hiddensearchstandardKind.equals("searchsafepayno") && kind.equals("completesafepay")){
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.donesafepayformanagerwithsafeno", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchsafepayaskid") && kind.equals("necessarydeposite")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.necessarydepositwithaskid", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchsafepayaskid") && kind.equals("allofsafepay")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.managerallofsafepaywithaskid", pagevobysww);
			}else if (hiddensearchstandardKind.equals("searchsafepayaskid") && kind.equals("cancledsafepay")){
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.canclesafepayformanagerwithaskid", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchsafepayaskid") && kind.equals("completesafepay")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.donesafepayformanagerwithaskid", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchenddate") && kind.equals("necessarydeposite")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.necessarydepositwithenddate", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchenddate") && kind.equals("allofsafepay")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.managerallofsafepaywithenddate", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchenddate") && kind.equals("cancledsafepay")){			
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.canclesafepayformanagerwithdate", pagevobysww);
			}else if(hiddensearchstandardKind.equals("searchenddate") && kind.equals("completesafepay")){	
				return ( List<Map<String, Object>>)mybatis.selectList("safepay.donesafepayformanagerwithdate", pagevobysww);
			}else{
				return null;
			}			 	
		}
	}

	public void setafterdeposit(String refundnoarray, String afterresultynarray, String afterprocesskindarray) {
		 
		 HashMap<String,String> hmap = new HashMap<String,String>();
		 hmap.put("refundnoarray", refundnoarray);
		 hmap.put("afterresultynarray", afterresultynarray);
		 hmap.put("afterprocesskindarray", afterprocesskindarray);
		 mybatis.update("setafterdeposit",hmap);  
		 
		
	}

	public void setafterdeposit2(String safepaynoarray, String afterresultynarray, String afterprocesskindarray) {
		 HashMap<String,String> hmap = new HashMap<String,String>();
		 hmap.put("safepaynoarray", safepaynoarray);
		 hmap.put("afterresultynarray", afterresultynarray);
		 hmap.put("afterprocesskindarray", afterprocesskindarray);
		 mybatis.update("setafterdepositsafepay",hmap);  	
	}
}