package cal;

import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.springframework.web.context.ContextLoaderListener;

@WebListener
public class listener extends ContextLoaderListener implements ServletContextListener {
       
}
