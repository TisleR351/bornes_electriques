<%@ page import="java.util.List" %>
<%@ page import="dao.DBDAO" %>
<%@ page import="classes.Borne" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    double latitude = 0;
    double longitude = 0;
    if(request.getParameter("latitude") != null && request.getParameter("longitude") != null) {
        latitude = Double.parseDouble(request.getParameter("latitude"));
        longitude = Double.parseDouble(request.getParameter("longitude"));
    }
    DBDAO dbdao = new DBDAO();
    List<Borne> terminals = null;
    try {
        terminals = dbdao.getCloseElectricTerminals(latitude, longitude);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<div id="map"></div>
<script>
    function getPositionsInQueryParams(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;

        var url = "?latitude=" + encodeURIComponent(latitude) + "&longitude=" + encodeURIComponent(longitude);
        <% if(request.getParameter("latitude") == null && request.getParameter("longitude") == null) { %>
            window.location.href = url;
        <%
        }
        %>
    }

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(getPositionsInQueryParams);
        } else {
            alert("La géolocalisation n'est pas prise en charge par ce navigateur.");
        }
    }

    getLocation();
</script>

<script>
    var map = L.map('map').setView([<%= latitude %> , <%= longitude %>], 10);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    <% for(Borne terminal : terminals) { %>
    L.marker([<%= terminal.getConsolidated_latitude() %> , <%= terminal.getConsolidated_longitude() %>]).addTo(map)
        .bindPopup('<div class="container-fluid">' +
            '<div class="row">' +
            '<div class="col-md-6">' +
            '<p><strong>Nom station:</strong> <%= terminal.getNom_station() %> </p>' +
            '<p><strong>Nom opérateur:</strong> <%= terminal.getNom_operateur() %> </p>' +
            '<p><strong>Contact opérateur:</strong> <%= terminal.getContact_operateur() %> </p>' +
            '<p><strong>Téléphone opérateur:</strong> <%= terminal.getTelephone_operateur() %> </p>' +
            '<p><strong>Adresse station:</strong> <%= (terminal.getAdresse_station().length() > 49) ? "Adresse trop longue" : terminal.getAdresse_station() %>> </p>' +
            '<p><strong>Code INSEE Commune:</strong> <%= terminal.getCode_insee_commune() %> </p>' +
            '<p><strong>Puissance nominale:</strong> <%= terminal.getpuissance_nominale() %> </p>' +
            '<p><strong>Conditions d\'accès:</strong> <%= terminal.getCondition_acces() %> </p>' +
            '</div>' +
            '<div class="col-md-6">' +
            '<p><strong>Tarification:</strong> <%= terminal.getTarification() %> </p>' +
            '<p><strong>Horaires:</strong> <%= terminal.getHoraires() %> </p>' +
            '<p><strong>Accessibilité PMR:</strong> <%= terminal.getAccessibilité_pmr() %> </p>' +
            '<p><strong>Raccordement:</strong> <%= terminal.getraccordement() %> </p>' +
            '<p><strong>Restriction gabarit:</strong> <%= terminal.getRestriction_gabarit() %> </p>' +
            '<p><strong>Station deux roues:</strong> <%= terminal.isStation_deux_roues() %> </p>' +
            '<p><strong>Date de mise en service:</strong> <%= terminal.getDate_mise_en_service() %> </p>' +
            '<p><strong>Observations:</strong> <%= (terminal.getObservations().length() > 27) ? "Observations trop longues" : terminal.getObservations() %> </p>' +
            '</div>' +
            '</div>' +
            '</div>'
        );
    <% } %>
</script>
