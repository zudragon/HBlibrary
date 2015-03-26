package cal;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class cont {
	@Autowired
	Dao dao;
	public Dao getDao() {return dao;}
	public void setDao(Dao dao) {this.dao = dao;}
	
	@RequestMapping("/list.do")
	public void list(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<Member> list = dao.list(request.getParameter("wdate"));
		for(Member k : list){
			k.setWdate(k.getWdate().substring(0,10));
		}
		
		PrintWriter pw;
		try {
			pw = response.getWriter();
        
			JSONArray jsonArray=new JSONArray();
	        for(int i=0;i<list.size();++i){
	        	JSONObject object=new JSONObject();
		        Member m=list.get(i);
		        object.put("wdate",m.getWdate());
		        object.put("name",m.getName());
		        object.put("msg",m.getMsg());
		        object.put("no",m.getNo());
		        jsonArray.add(object);
	        }
        	pw.println(jsonArray);
        	pw.flush();
        	pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/ins.do")
	public void ins(HttpServletRequest request, HttpServletResponse response) throws Exception{
        PrintWriter pw=response.getWriter();
        Member bean=new Member();
        bean.setName(request.getParameter("name"));
        bean.setMsg(request.getParameter("msg"));
        bean.setWdate(request.getParameter("wdate"));
        System.out.println("==>"+bean.getWdate());
        dao.ins(bean);
        pw.close();	
	}
	
	
	@RequestMapping("/del.do")
	public void del(HttpServletRequest request, HttpServletResponse response) throws Exception{
        PrintWriter pw=response.getWriter();
        
        int no=Integer.parseInt(request.getParameter("no"));
        dao.del(no);
        pw.close();	
	}
	
	
	
	
	
}
