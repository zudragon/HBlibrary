package cal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Ins extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	proc(request,response);	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proc(request,response);
    }

	private void proc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	response.setContentType("text/html; charset=utf-8");
        PrintWriter pw=response.getWriter();
        Member bean=new Member();
        bean.setName(request.getParameter("name"));
        bean.setMsg(request.getParameter("msg"));
        bean.setWdate(request.getParameter("wdate"));
        System.out.println("==>"+bean.getWdate());
        new Dbmgr().insert(bean.getWdate(),bean.getName(),bean.getMsg());
        pw.close();	
	}
}


