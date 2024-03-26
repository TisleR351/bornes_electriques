package controllers;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "CookieServletServlet", value = "/CookieServlet")
public class CookieServlet extends HttpServlet {

    public void init() {
    }
    public void cookiesSettings(HttpServletRequest request, HttpServletResponse response) {
        setCookieIfNotNullAndNotEmpty("perimetre", request.getParameter("perimetre"), response);
        setCookieIfNotNullAndNotEmpty("puissance_nominale", request.getParameter("puissance"), response);
        setCookieIfNotNullAndNotEmpty("prise_type_2", request.getParameter("prise_type_2"), response);
        setCookieIfNotNullAndNotEmpty("prise_type_ef", request.getParameter("prise_type_ef"), response);
        setCookieIfNotNullAndNotEmpty("prise_type_chademo", request.getParameter("prise_type_chademo"), response);
        setCookieIfNotNullAndNotEmpty("prise_type_autre", request.getParameter("prise_type_autre"), response);
        setCookieIfNotNullAndNotEmpty("prise_type_combo_ccs", request.getParameter("prise_type_combo_ccs"), response);
        setCookieIfNotNullAndNotEmpty("accessibilite_pmr", request.getParameter("accessibilite_pmr"), response);
        setCookieIfNotNullAndNotEmpty("reservation", request.getParameter("reservation"), response);
        setCookieIfNotNullAndNotEmpty("gratuit", request.getParameter("gratuit"), response);
        setCookieIfNotNullAndNotEmpty("paiement_cb", request.getParameter("paiement_cb"), response);
        setCookieIfNotNullAndNotEmpty("paiement_autre", request.getParameter("paiement_autre"), response);
        setCookieIfNotNullAndNotEmpty("paiement_acte", request.getParameter("paiement_acte"), response);
    }

    private void setCookieIfNotNullAndNotEmpty(String cookieName, String cookieValue, HttpServletResponse response) {
        if (cookieValue != null && !cookieValue.isEmpty()) {
            Cookie cookie = new Cookie(cookieName, cookieValue);
            cookie.setMaxAge(-1);
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie(cookieName, "");
            cookie.setMaxAge(-1);
            response.addCookie(cookie);

        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        cookiesSettings(request, response);
        response.sendRedirect("./");
    }


    public void destroy() {
    }
}