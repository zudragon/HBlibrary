package dao;

import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.springframework.web.context.ContextLoaderListener;

@WebListener
public class Listener extends ContextLoaderListener implements ServletContextListener {
       
}
