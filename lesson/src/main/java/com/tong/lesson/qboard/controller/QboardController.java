package com.tong.lesson.qboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.SynchronousQueue;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.tong.lesson.member.vo.MemberVO;
import com.tong.lesson.qboard.service.QboardService;
import com.tong.lesson.qboard.vo.QboardVO;

@Controller
public class QboardController {

   @Resource
   private QboardService qboardService;

   @RequestMapping(value = "qboardListView.do")
   public ModelAndView userCheck(QboardVO vo, ModelAndView mv, HttpSession session,
         @RequestParam(value = "page", required = false) String page) throws Exception {
      
      
      int currentPage = 1;
      int limit = 10;

      if (page != null)
         currentPage = Integer.parseInt(page);
       
      int totalListCount = 0;

      if (session.getAttribute("loginUser") != null) {
         if (((MemberVO)session.getAttribute("loginUser")).getUserid().equals("admin")) {
            totalListCount = qboardService.countforadminqboardlist();
             
         } else {
            totalListCount = qboardService.countforqboardlist(((MemberVO) session.getAttribute("loginUser")).getUserid());
         }
         
         
         List<QboardVO> list = qboardService.selectBoardList(((MemberVO) session.getAttribute("loginUser")).getUserid(), currentPage, limit);
         System.out.println(list.get(0));
         mv.addObject("list", list);
      }
      int maxPage = (int) ((double) totalListCount / limit + 0.9);
      int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
      int endPage = startPage + limit - 1;

      if (maxPage < endPage)
         endPage = maxPage;
      mv.addObject("totalCount", totalListCount);
      mv.addObject("currentPage", currentPage);
      mv.addObject("maxPage", maxPage);
      mv.addObject("startPage", startPage);
      mv.addObject("endPage", endPage);
      
      mv.setViewName("qboard/qboardListView");
      return mv;
   }

   @RequestMapping(value = "qboardWriteForm.do")
   public ModelAndView write(ModelAndView mv, HttpSession session) throws Exception {
      mv.setViewName("qboard/qboardWriteForm");
      return mv;
   }

   @RequestMapping("qboardDetailViewagain.do")
   public ModelAndView openqBoardDetail(@RequestParam("qboardno") int qboardno) throws Exception {
      ModelAndView mv = new ModelAndView("qboard/qboardDetailViewagain");
      QboardVO qboard = qboardService.selectBoardDetail(qboardno);
      List<Map<String, Object>>  qboardreply = qboardService.selectBoardDetailreply(qboardno);
      mv.addObject("qboard", qboard);
      mv.addObject("qboardreply", qboardreply);
      return mv;
   }

   @RequestMapping(value = "qboardinsert.do")
   public String insert(@RequestParam("qboardTitle") String qboardtitle,
         @RequestParam("qboardWrite") String qboardwriter, @RequestParam("qboardContent") String qboardcontent)
         throws Exception {
      QboardVO vo = new QboardVO();

      vo.setQboardtitle(qboardtitle);
      vo.setQboardwriter(qboardwriter);
      vo.setQboardcontent(qboardcontent);

      int result = qboardService.insertQboard(vo);
   

      return "redirect:qboardListView.do";
   }

   
   @RequestMapping(value = "changeansweryn.do")
   @ResponseBody
   public int changeansweryn(@RequestParam("qboardno") String qboardno)
  {
      QboardVO vo = new QboardVO();


     return qboardService.changeansweryn(qboardno);
   

   }
   
   
   
   
   @RequestMapping(value = "updateqboard.do")
   public String updateqboard(@RequestParam("qboardno") String qboardno,
         @RequestParam("qboardcontext") String qboardcontent) throws Exception {

      HashMap<String, String> hmap = new HashMap<String, String>();
      hmap.put("qboardno", qboardno);
      hmap.put("qboardcontent", qboardcontent);

      qboardService.updateQboard(hmap);

      return "redirect:qboardListView.do";

   }

   @RequestMapping(value = "deleteqboard.do")
   public String deleteqboard(@RequestParam("qboardno") String qboardno) throws Exception {

      qboardService.deleteQboard(qboardno);

      return "redirect:qboardListView.do";
   }
   
   @RequestMapping(value = "replyinsert.do")
   @ResponseBody
   public HashMap<String, Object> replyinsert(@RequestParam("onelevelrepltxt") String onelevelrepltxt,
         @RequestParam("tdqboardno") String tdqboardno,
         @RequestParam("qboardwriter") String qboardwriter,QboardVO qvo) throws Exception {
      qvo.setQboardwriter(qboardwriter);
      qvo.setQboardcontent(onelevelrepltxt);
      qvo.setQboardno(Integer.parseInt(tdqboardno));
      HashMap<String, Object> resultMap = new HashMap<String, Object>();
      resultMap.put("list", qboardService.replyinsertqboard(qvo));   
      return resultMap ;      
   }
   
   @RequestMapping(value = "replydelete.do")
   @ResponseBody
   public HashMap<String, Object> replydelete( @RequestParam("tdqboardno") String tdqboardno,
         @RequestParam("detailboardno") String detailboardno, QboardVO qvo) throws Exception {

      HashMap<String, Object> hmap = new HashMap<String, Object>();
      hmap.put("qboardno", tdqboardno);
      hmap.put("detailboardno", detailboardno);
      HashMap<String, Object> resultMap = new HashMap<String, Object>();
      resultMap.put("list", qboardService.replydelete(hmap));
      return resultMap ;      
   }
   

}