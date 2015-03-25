package dao;

import java.util.List;

import mybatis.SchExVo;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


public class ExDao {
	@Autowired
	SqlSessionFactory ex_sql;
	public SqlSessionFactory getEx_sql() {return ex_sql;}
	public void setEx_sql(SqlSessionFactory ex_sql) {this.ex_sql = ex_sql;}
	
	public SqlSession ss(){
		return ex_sql.openSession();
	}
	
	// 스케줄러 연습
	public List<SchExVo> exlist(){
		return ss().selectList("exlist");
	}
	public int exins(SchExVo vo){
		return ss().insert("exins", vo);
	}
	
}
