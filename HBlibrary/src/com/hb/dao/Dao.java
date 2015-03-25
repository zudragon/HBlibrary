package com.hb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.web.servlet.ModelAndView;

import com.hb.mybatis.ChairVO;
import com.sun.org.apache.bcel.internal.generic.RETURN;

public class Dao {
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	// 사용 좌석 수 세기
	public int Count() {
		SqlSession ss = null;
		int seat = 0;
		try {
			ss = sqlSessionFactory.openSession();
			seat = ss.selectOne("count");
		} catch (Exception e) {
		} finally{
			ss.close();
		}
		return seat;
	}

	public String getOne(String id, String chairnum) {
		SqlSession ss = null;
		ChairVO vo = null;
		try {
			ss = sqlSessionFactory.openSession();
			vo = ss.selectOne("one", id);
			if (vo == null) {
				return "redirect:/chk_chair.do?chairnum="+chairnum+"&id="+id;
			} else {
				// 아이디가 이미 등록되어있는 경우(예약이 이미 되어있는 경우) 의자로 검색하기
				return "redirect:/id_chked.do?id="+id;
			}
		} catch (Exception e) {
		} finally{
			ss.close();
		}
		return "seat/seat";
	}

	public ChairVO findOne(String chairnum) {
		SqlSession ss = null;
		ChairVO vo = null;
		try {
			ss = sqlSessionFactory.openSession();
			vo = ss.selectOne("choose", chairnum);
		} catch (Exception e) {
		} finally{
			ss.close();
		}
		return vo;
	}

	public ChairVO findId(String id) {
		SqlSession ss = null;
		ChairVO vo = null;
		try {
			ss = sqlSessionFactory.openSession();
			vo = ss.selectOne("one", id);
		} catch (Exception e) {
		} finally{
			ss.close();
		}
		return vo;
	}

	// 예약하기
	public String Reserve(ChairVO vo, String id) {
		SqlSession ss = null;
		try {
			ss = sqlSessionFactory.openSession(true);
			int result = ss.update("update", vo);
			if (result > 0) {
				return "redirect:/seat.do?id="+id;
			}
		} catch (Exception e) {
		} finally{
			ss.close();
		}
		return "seat/seat";
	}

	// 모두 불러오는 것
	public List<ChairVO> All() {
		SqlSession ss = null;
		List<ChairVO> allvo = null;
		try {
			ss = sqlSessionFactory.openSession();
			allvo = ss.selectList("list");
		} catch (Exception e) {
		} finally{
			ss.close();
		}
		return allvo;
	}

	public String findSeat(String id) {
		SqlSession ss = null;
		ChairVO vo = null;
		try {
			ss = sqlSessionFactory.openSession();
			vo = ss.selectOne("findseat", id);
			if (vo == null) {
				return "redirect:/seat/seat_return.jsp?id="+ id;
			} else {
				return "redirect:/search.do?id="+ id;
			}
		} catch (Exception e) {
		} 
		return "seat/seat_return";
	}

	public ChairVO search(String id) {
		SqlSession ss = null;
		ChairVO vo = null;
		try {
			ss = sqlSessionFactory.openSession();
			vo = ss.selectOne("findseat", id);
		} catch (Exception e) {
		} finally{
			ss.close();
		}
		return vo;
	}

	public String Return(ChairVO vo, String id) {
		SqlSession ss = null;
		try {
			ss = sqlSessionFactory.openSession(true);
			int result = ss.update("updReturn", vo);
			if (result > 0) {
				return "redirect:/seat.do?id="+id;
			}
		} catch (Exception e) {
		} finally{
			ss.close();
		}
		return "seat/seat";
	}

}
