package control;

import java.util.List;

import mybatis.SchExVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.AdDao;
import dao.ExDao;

@Controller
public class ExControll {
	@Autowired
	private ExDao exdao;
	public ExDao getExdao() {return exdao;}
	public void setExdao(ExDao exdao) {this.exdao = exdao;}
	
	
	
	
	
	@RequestMapping("/list.ex")
	public ModelAndView exlist(){
		List<SchExVo> list =  exdao.exlist();
		for(SchExVo k : list){
			k.setSelyear(k.getSelday().substring(0,4));
			k.setSelmd(k.getSelday().substring(4,8));
		}
		return new ModelAndView("dir","list",list);
	}
	@RequestMapping("/ins.ex")
	public ModelAndView exins(String name, String time, String selday){
		SchExVo vo = new SchExVo();
		vo.setName(name);
		vo.setTime(time);
		vo.setSelday(selday);
		exdao.exins(vo);
		
		return new ModelAndView("redirect:/list.ex");
	}
	
}
