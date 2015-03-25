package com.hb.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hb.dao.Dao;
import com.hb.mybatis.ChairVO;

@Controller
public class MyController {
	@Autowired
	private Dao dao;

	public Dao getDao() {
		return dao;
	}

	public void setDao(Dao dao) {
		this.dao = dao;
	}

	@RequestMapping("yes.do")
	public ModelAndView yes(String id, String chairnum) {
		String path = dao.getOne(id, chairnum);
		return new ModelAndView(path);
				}
	
	@RequestMapping("chk_chair.do")
	public ModelAndView chk_cha(String chairnum, String id){
		ChairVO vo = dao.findOne(chairnum);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("vo", vo);
		return new ModelAndView("seat/seat", "chair", map);
	}
	@RequestMapping("id_chked.do")
	public ModelAndView id_chked(String id){
		ChairVO vo = dao.findId(id);
		return new ModelAndView("seat/seat", "idInfo", vo);
	}

	// 사용자 수 세기
	@RequestMapping("count.do")
	public ModelAndView count(String id){
		int seatnum = dao.Count();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seatnum", seatnum);
		map.put("id", id);
		return new ModelAndView("seat/seat_current", "seat", map);
	}
	
	@RequestMapping("seat.do")
	public ModelAndView seat(String id){
		System.out.println(id);
		List<ChairVO> allvo = dao.All();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("allvo", allvo);
		map.put("id", id);
		return  new ModelAndView("seat/seat", "seat", map);
	}
	
	@RequestMapping("reserve.do")
	public ModelAndView reserve(@RequestParam("id")String id, @RequestParam("chairnum")String chairnum){
		String[] reserve = {id, chairnum};
		return new ModelAndView("seat/reserve", "reserve", reserve);
	}
	
	
	@RequestMapping("reserve_ok.do")
	public ModelAndView reserve_ok(ChairVO vo, String id){
	String path = dao.Reserve(vo, id);
		return new ModelAndView(path);
	}
	
	// 좌석 반납하기
	@RequestMapping("return.do")
	public ModelAndView Return(String id){
		String path = dao.findSeat(id);
		return new ModelAndView(path);
	}
	
	@RequestMapping("search.do")
	public ModelAndView person(String id){
		ChairVO vo = dao.search(id);
		return new ModelAndView("seat/seat_return", "ret", vo);
	}
	
	@RequestMapping("return_ok.do")
	public ModelAndView ret_ok(ChairVO vo, String id){
		String path = dao.Return(vo, id);
		return new ModelAndView(path);
	}
}
