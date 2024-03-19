import java.io.*;

import dao.DBDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "integrationMenu", value = "/integrationMenu")
public class integrationMenu extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        Cookie[] cookies = request.getCookies();
        String filtreValue = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("filtres".equals(cookie.getName())) {
                    filtreValue = java.net.URLDecoder.decode(cookie.getValue(), "UTF-8");
                    break;
                }
            }
        }

        if (filtreValue != null) {
            String[] filtres = filtreValue.split(",");
            boolean type2 = Boolean.parseBoolean(filtres[0]);
            boolean typeEF = Boolean.parseBoolean(filtres[1]);
            boolean typeChademo = Boolean.parseBoolean(filtres[2]);
            boolean comnoCss = Boolean.parseBoolean(filtres[3]);
            boolean typeAutre = Boolean.parseBoolean(filtres[4]);
            boolean accessiblitePMR = Boolean.parseBoolean(filtres[5]);
            boolean gratuit = Boolean.parseBoolean(filtres[6]);
            boolean reservable = Boolean.parseBoolean(filtres[7]);
            boolean CB = Boolean.parseBoolean(filtres[8]);
            boolean acte = Boolean.parseBoolean(filtres[9]);
            boolean autre = Boolean.parseBoolean(filtres[10]);
        }
    }

    public void destroy() {
    }
}