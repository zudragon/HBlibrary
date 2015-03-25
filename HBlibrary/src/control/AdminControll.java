package control;

import java.util.List;

import mybatis.SchExVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.AdDao;

@Controller
public class AdminControll {
	@Autowired
	private AdDao addao;
	public AdDao getAddao() {return addao;}
	public void setAddao(AdDao addao) {this.addao = addao;}
	
	
	
	
	@RequestMapping("/main.ad")
	public ModelAndView main(){
		return new ModelAndView("ad_index","adpage","ad_main.jsp");
	}
	@RequestMapping("/member.ad")
	public ModelAndView member(){
		return new ModelAndView("ad_index","adpage","ad_member.jsp");
	}
	@RequestMapping("/readroom.ad")
	public ModelAndView readroom(){
		return new ModelAndView("ad_index","adpage","ad_readroom.jsp");
	}
	@RequestMapping("/class.ad")
	public ModelAndView classroom(){
		return new ModelAndView("ad_index","adpage","ad_classroom.jsp");
	}
	@RequestMapping("/class_sch.ad")
	public ModelAndView class_sch(){
		return new ModelAndView("ad_index","adpage","ad_classroom_sch.jsp");
	}
	@RequestMapping("/class_ins.ad")
	public ModelAndView class_ins(){
		return new ModelAndView("ad_index","adpage","ad_classroom_ins.jsp");
	}
	@RequestMapping("/class_del.ad")
	public ModelAndView class_del(){
		return new ModelAndView("ad_index","adpage","ad_classroom_del.jsp");
	}
	@RequestMapping("/library.ad")
	public ModelAndView library(){
		return new ModelAndView("ad_index","adpage","ad_library.jsp");
	}
	@RequestMapping("/library_sch.ad")
	public ModelAndView library_sch(){
		return new ModelAndView("ad_index","adpage","ad_library_sch.jsp");
	}
	@RequestMapping("/library_req.ad")
	public ModelAndView library_req(){
		return new ModelAndView("ad_index","adpage","ad_library_req.jsp");
	}
	@RequestMapping("/library_ins.ad")
	public ModelAndView library_ins(){
		return new ModelAndView("ad_index","adpage","ad_library_ins.jsp");
	}
	@RequestMapping("/board.ad")
	public ModelAndView board(){
		return new ModelAndView("ad_index","adpage","ad_board.jsp");
	}
	@RequestMapping("/board_qna.ad")
	public ModelAndView board_qna(){
		return new ModelAndView("ad_index","adpage","ad_board_qna.jsp");
	}
	
	
	
	
}
