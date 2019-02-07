package net.hb.bbs;

import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.management.MalformedObjectNameException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class bbsController {
	private static final Logger logger = LoggerFactory.getLogger(bbsController.class);
	
	@Inject
	@Autowired
	bbsDAO dao;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String bbs_write(Locale locale, Model model) {
		logger.info("write.do");
		return "bbs";
	}
	
	@RequestMapping("/insert.do")
	public String bbs_insert(bbsDTO dto) {
		String path = application.getRealPath("/resources/upload");
		System.out.println(path);
		String img = dto.getUpload_f().getOriginalFilename();
		File file = new File(path,img);
		
		try {
			dto.getUpload_f().transferTo(file);
			// FileCopyUtils.copy(dto.getUpload_f().getBytes(), file);
			// File target=new File(path,img); File file = new File( path, img);바로위에 있음
			// FileCopyUtils.copy(dto.getUpload_f().getBytes(), target);
			// dto.getUpload_f().transferTo(target);
		} catch (Exception ex) {
		}

		dto.setB_file_name(img);
		System.out.println("컨트롤 물리적파일=" + dto.getB_file_name());
		dao.dbInsert(dto);
		return "redirect:/list.do";
	}
	
	@RequestMapping("/list.do")
	public ModelAndView bbs_select(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		int startpage = 1, endpage = 10;
		String pnum = "";
		int pageNUM = 1, start = 1, end = 10;
		int pagecount = 1, temp = 0;
		
		String skey="", sval="", returnpage="";
		String AA="", BB="", CC="";
		
		skey = request.getParameter("keyfield");
		sval = request.getParameter("keyword");		
		if(skey=="" || skey==null || sval=="" || sval==null) { skey="b_title"; sval=""; }
		returnpage="&keyfield="+skey+"&keyword="+sval;
		if(skey.equals("name")) { AA=skey; }
		else if(skey.equals("b_title")) { BB=skey; }
		else if(skey.equals("b_content")) { CC=skey; }
		
		pnum = request.getParameter("pageNum");
		if(pnum=="" || pnum==null) { pnum="1"; }
		pageNUM=Integer.parseInt(pnum);
		
		int Gtotal = dao.dbCount(); //레코드전체갯수
		int Stotal = dao.dbCountSearch(skey, sval);
		
		if(Stotal%10==0) { pagecount=Stotal/10; } 
		else { pagecount=(Stotal/10)+1; }
		end=Stotal-(pageNUM-1)*10;
		start=end-9;
		
		temp = (pageNUM-1)%10;
		startpage = pageNUM-temp;
		endpage = startpage+9;
		if(endpage>pagecount) { endpage = pagecount; }
		
		List<bbsDTO> list = dao.dbSelect(start,end,skey,sval);
		mav.addObject("list", list);
		mav.addObject("Gtotal", Gtotal);
		mav.addObject("Stotal", Stotal);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("pagecount", pagecount);
		mav.addObject("pageNUM", pageNUM);
		mav.addObject("returnpage", returnpage);
		mav.addObject("AA", AA);
		mav.addObject("BB", BB);
		mav.addObject("CC", CC);
		mav.addObject("sval", sval);
		mav.setViewName("bbsList");
		return mav;
	}
	
	@RequestMapping("/detail.do")
	public ModelAndView bbs_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int data = Integer.parseInt(request.getParameter("idx"));
		bbsDTO dto = dao.dbDetail(data);
		mav.addObject("dto", dto);
		mav.setViewName("bbsDetail");
		return mav;
	}
	
	@RequestMapping("/preEdit.do")
	public ModelAndView bbs_preEdit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int data = Integer.parseInt(request.getParameter("idx"));
		bbsDTO dto = dao.dbDetail(data);
		mav.addObject("dto", dto);
		mav.setViewName("bbsEdit");
		return mav;
	}
	
	@RequestMapping("/edit.do")
	public String bbs_edit(bbsDTO dto) {
		String path = application.getRealPath("/resources/upload");
		System.out.println(path);
		MultipartFile mf = dto.getUpload_f();
		String img = mf.getOriginalFilename();
		
		System.out.println("edit수정 넘어온이름=" + dto.getB_name());
		System.out.println("edit수정 넘어온제목=" + dto.getB_title());
		System.out.println("edit수정 넘어온내용=" + dto.getB_content());
		System.out.println("edit수정 문자열파일=" + dto.getUpload_f());
		System.out.println("edit수정 문자열파일=" + img);
		File file = new File(path,img);
		
		try {
			// dto.getUpload_f().transferTo(file);
			// FileCopyUtils클래스사용
			FileCopyUtils.copy(dto.getUpload_f().getBytes(), file);
			}catch(Exception ex) { }
		
		dto.setB_file_name(img);
		dao.dbEdit(dto);
		return "redirect:/list.do";
	}
	
	@RequestMapping("/delete.do")
	public ModelAndView bbs_delete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int data = Integer.parseInt(request.getParameter("idx"));
		dao.dbDelete(data);
		mav.setViewName("redirect:/list.do");
		return mav;
	}
}
