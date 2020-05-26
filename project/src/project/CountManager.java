package project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
public class CountManager implements HttpSessionListener {
    public static int count;

    public static int getCount() {
        return count;
    }

    public void sessionCreated(HttpSessionEvent event) {
        //�꽭�뀡�씠 留뚮뱾�뼱吏� �븣 �샇異�
        HttpSession session = event.getSession(); //request�뿉�꽌 �뼸�뒗 session怨� �룞�씪�븳 媛앹껜
        session.setMaxInactiveInterval(60*20);

        count++;

        session.getServletContext().log(session.getId() + " �꽭�뀡�깮�꽦 " + ", �젒�냽�옄�닔 : " + count);
    }

    public void sessionDestroyed(HttpSessionEvent event) {
        //�꽭�뀡�씠 �냼硫몃맆 �븣 �샇異�
        count--;
        if(count<0)
            count=0;

        HttpSession session = event.getSession();
        session.getServletContext().log(session.getId() + " �꽭�뀡�냼硫� " + ", �젒�냽�옄�닔 : " + count);
    }
}