package cal;

import java.sql.*;
import java.util.Vector;

public class Dbmgr {
    public void insert(String wdate,String name, String msg) {
        String sql = "insert into cal values(no_seq.nextval,?,?,?)";
        try {
            Connection con =ConnectionProvider.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
           
            pstm.setString(1, wdate);
            pstm.setString(2, name);
            pstm.setString(3, msg);
            pstm.executeUpdate();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.print("nonono");
            e.printStackTrace();
        }
    }
    
    public void del(String no2){
    	String sql = "delete from cal where no=?";
        try {
            Connection con =ConnectionProvider.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
            int no=Integer.parseInt(no2);
            pstm.setInt(1, no);
            pstm.executeUpdate();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.print("nonono");
            e.printStackTrace();
        }
    }
    
  
   public Vector<Member> output(String wdate){
        Vector<Member> result=new Vector<Member>();      
        try{
            String sql="select * from cal where wdate=? order by no desc";
            Connection con=ConnectionProvider.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setString(1, wdate);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
              Member m=new Member();
              m.setWdate(rs.getString("wdate").substring(0, 10));
              m.setName(rs.getString("name"));
              m.setMsg(rs.getString("msg"));
              m.setNo(rs.getInt("no"));
              
              result.add(m);
            }
            rs.close();
            pstm.close();
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}

