import java.io.*;
import java.sql.SQLException;
import java.util.List;

import classes.Borne;
import dao.DBDAO;
import jakarta.servlet.ServletException;
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

        boolean type2 = false;
        boolean typeEF = false;
        boolean typeChademo = false;
        boolean comnoCss = false;
        boolean typeAutre = false;
        boolean accessiblitePMR = false;
        boolean gratuit = false;
        boolean reservable = false;
        boolean CB = false;
        boolean acte = false;
        boolean autre = false;

        Cookie[] cookies = request.getCookies();
        String filtreValue = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("filtres".equals(cookie.getName())) {
                    filtreValue = java.net.URLDecoder.decode(cookie.getValue(), "UTF-8");
                    String[] filtres = filtreValue.split(",");
                    type2 = "1".equals(filtres[0]);
                    typeEF = "1".equals(filtres[1]);
                    typeChademo = "1".equals(filtres[2]);
                    comnoCss = "1".equals(filtres[3]);
                    typeAutre = "1".equals(filtres[4]);
                    accessiblitePMR = "1".equals(filtres[5]);
                    gratuit = "1".equals(filtres[6]);
                    reservable = "1".equals(filtres[7]);
                    CB = "1".equals(filtres[8]);
                    acte = "1".equals(filtres[9]);
                    autre = "1".equals(filtres[10]);
                    break;
                }
            }
        }

        DBDAO dbdao = new DBDAO();
        try {

            double latitude = 0.0;
            double longitude = 0.0;

            List<Borne> terminals = dbdao.getCloseElectricTerminals(latitude, longitude, type2, typeEF, typeChademo, comnoCss, typeAutre, accessiblitePMR, gratuit, reservable, CB, acte, autre);
            request.setAttribute("terminals", terminals);
            request.getRequestDispatcher("./map.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
    }
}