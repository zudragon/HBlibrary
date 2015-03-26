package cal;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;



public class Dao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	public SqlSessionFactory getSqlSessionFactory() {return sqlSessionFactory;}
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {this.sqlSessionFactory = sqlSessionFactory;}
	
	public SqlSession ss(){
		SqlSession ss = sqlSessionFactory.openSession(true);
		return ss;
	}
	
	public List<Member> list(String wdate){
		return ss().selectList("list",wdate);
	}
	
	public int ins(Member vo){
		return ss().insert("ins", vo);
	}
	
	public int del(int no){
		return ss().delete("del", no);
	}
	
	
}











