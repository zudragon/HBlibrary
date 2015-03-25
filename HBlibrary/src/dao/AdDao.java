package dao;



import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


public class AdDao {
	@Autowired
	SqlSessionFactory ad_sql;
	public SqlSessionFactory getAd_sql() {return ad_sql;}
	public void setAd_sql(SqlSessionFactory ad_sql) {this.ad_sql = ad_sql;}
	
	public SqlSession ss(){
		return ad_sql.openSession();
	}
	
}
