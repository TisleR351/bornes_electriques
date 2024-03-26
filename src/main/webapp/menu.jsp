<jsp:include page="hidden-menu-header.jsp"/>
<%
    String perimetre = null;
    String puissance = null;
    String prise_type_2 = null;
    String prise_type_ef = null;
    String prise_type_chademo = null;
    String prise_type_autre = null;
    String prise_type_combo_ccs = null;
    String accessibilite_pmr = null;
    String reservation = null;
    String gratuit = null;
    String max_tarif = null;
    String paiement_cb = null;
    String paiement_autre = null;
    String paiement_acte = null;
    Cookie[] cookies = request.getCookies();
    for(Cookie cookie : cookies) {
        switch(cookie.getName()) {
            case "perimetre":
                perimetre = cookie.getValue();
                break;
            case "puissance":
                puissance = cookie.getValue();
                break;
            case "prise_type_2":
                prise_type_2 = cookie.getValue();
                break;
            case "prise_type_ef":
                prise_type_ef = cookie.getValue();
                break;
            case "prise_type_chademo":
                prise_type_chademo = cookie.getValue();
                break;
            case "prise_type_autre":
                prise_type_autre = cookie.getValue();
                break;
            case "prise_type_combo_ccs":
                prise_type_combo_ccs = cookie.getValue();
                break;
            case "accessibilite_pmr":
                accessibilite_pmr = cookie.getValue();
                break;
            case "reservation":
                reservation = cookie.getValue();
                break;
            case "gratuit":
                gratuit = cookie.getValue();
                break;
            case "max_tarif":
                max_tarif = cookie.getValue();
                break;
            case "paiement_cb":
                paiement_cb = cookie.getValue();
                break;
            case "paiement_autre":
                paiement_autre = cookie.getValue();
                    break;
            case "paiement_acte":
                paiement_acte = cookie.getValue();
                break;
            default:
                break;
            }
    }
%>
<form action="./CookieServlet" method="post">
    <h5>Filtres</h5>
    <div class="mb-3">
        <label for="perimetre" class="form-label d-none">Perimetre</label>
        <input type="text" class="form-control" name="perimetre" placeholder="Perimetre" id="perimetre" value="">
    </div>
    <div class="mb-3">
        <label for="puissance" class="form-label d-none">Puissance</label>
        <input type="text" class="form-control" name="puissance" placeholder="Puissance" id="puissance" value="">
    </div>
    <div class="container mb-4 mt-4">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="prise_type_2" id="prise_type_2" <% if(prise_type_2 != null && prise_type_2.equals("on")) { %>checked<% }%>>
                        <label class="form-check-label" for="prise_type_2">Type 2</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="prise_type_chademo" id="prise_type_chademo" <% if(prise_type_chademo != null && prise_type_chademo.equals("on")) { %>checked<% }%>>
                        <label class="form-check-label" for="prise_type_chademo">Type Chademo</label>
                    </div>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="prise_type_autre" id="prise_type_autre" <% if(prise_type_autre != null && prise_type_autre.equals("on")) { %>checked<% }%>>
                    <label class="form-check-label" for="prise_type_autre">Type Autre</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="gratuit" id="gratuit" <% if(gratuit != null && gratuit.equals("on")) { %>checked<% }%>>
                    <label class="form-check-label" for="gratuit">Gratuit</label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="prise_type_ef" id="prise_type_ef" <% if(prise_type_ef != null && prise_type_ef.equals("on")) { %>checked<% }%>>
                        <label class="form-check-label" for="prise_type_ef">Type EF</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="prise_type_combo_ccs" id="prise_type_combo_ccs" <% if(prise_type_combo_ccs != null && prise_type_combo_ccs.equals("on")) { %>checked<% }%>>
                        <label class="form-check-label" for="prise_type_combo_ccs">combo_ccs</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="accessibilite_pmr" id="accessibilite_pmr" <% if(accessibilite_pmr != null && accessibilite_pmr.equals("on")) { %>checked<% }%>>
                        <label class="form-check-label" for="accessibilite_pmr">Accessibilite PMR</label>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="reservation" id="reservation" <% if(reservation != null && reservation.equals("on")) { %>checked<% }%>>
                        <label class="form-check-label" for="reservation">Reservable</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <h5>Paiement</h5>
    <div class="form-group m-4">
        <input type="checkbox" class="form-check-input" name="paiement_cb" id="paiement_cb" autocomplete="off" <% if(paiement_cb != null && paiement_cb.equals("on")) { %>checked<% }%>>
        <label class="form-check-label" for="paiement_cb">CB</label>
        <input type="checkbox" class="form-check-input" name="paiement_acte" id="paiement_acte" autocomplete="off" <% if(paiement_acte != null && paiement_acte.equals("on")) { %>checked<% }%>>
        <label class="form-check-label" for="paiement_acte">Acte</label>
        <input type="checkbox" class="form-check-input" name="paiement_autre" id="paiement_autre" autocomplete="off" <% if(paiement_autre != null && paiement_autre.equals("on")) { %>checked<% }%>>
        <label class="form-check-label" for="paiement_autre">Autre</label>
    </div>
    <button type="submit" class="btn btn-primary">Envoyer</button>
</form>
 <jsp:include page="hidden-menu-footer.jsp" />
