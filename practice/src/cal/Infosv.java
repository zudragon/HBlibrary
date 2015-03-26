package cal;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray; 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

public class Infosv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        
        Vector<Member> result= new Dbmgr().output(request.getParameter("wdate"));
        PrintWriter pw=response.getWriter();
        
        JSONArray jsonArray=new JSONArray();
        for(int i=0;i<result.size();++i){
        JSONObject object1=new JSONObject();
        Member m=result.get(i);
        object1.put("wdate",m.getWdate());
        object1.put("name",m.getName());
        object1.put("msg",m.getMsg());
        object1.put("no",m.getNo());
        jsonArray.add(object1);
        }
        pw.println(jsonArray);
        pw.flush();
        pw.close();

    }

}

 