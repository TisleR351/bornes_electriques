<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page import="dao.DBDAO" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="classes.Borne" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Borne borne = new Borne(
            "Opérateur", // nom_operateur
            "Contact Opérateur", // contact_operateur
            "Téléphone Opérateur", // telephone_operateur
            "Nom de la station", // nom_station
            "Adresse de la station", // adresse_station
            "Code INSEE commune", // code_insee_commune
            "[2.352222, 48.856614]", // coordonneesXY
            7.2, // puissance_nominale
            true, // prise_type_ef
            false, // prise_type_2
            true, // prise_type_combo_ccs
            false, // prise_type_chademo
            false, // prise_type_autre
            false, // gratuit
            true, // paiement_acte
            true, // paiement_cb
            false, // paiement_autre
            "Tarification", // tarification
            "Condition d'accès", // condition_acces
            true, // reservation
            "Horaires", // horaires
            "Accessibilité PMR", // accessibilite_pmr
            "Restriction gabarit", // restriction_gabarit
            false, // station_deux_roues
            "Raccordement", // raccordement
            java.sql.Date.valueOf("2023-01-01"), // date_mise_en_service
            "Observations", // observations
            java.sql.Date.valueOf("2023-01-01"), // date_maj
            2.352222, // consolidated_longitude
            48.856614, // consolidated_latitude
            "Nom de la commune" // consolidated_commune
    );
        DBDAO dbdao = new DBDAO();
        List<Borne> terminals = dbdao.getCloseElectricTerminals(borne);
        %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenStreetMap avec Leaflet</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        #map {
            height: 100%;
            width: 100%;
        }
    </style>
</head>
<body>
<div id="map"></div>
<script>
    var map = L.map('map').setView([48.724 , -0.56], 10);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    <%
    for(Borne terminal : terminals) {
        %>
    L.marker([<%= terminal.getConsolidated_latitude()%> , <%= terminal.getConsolidated_longitude()%>]).addTo(map)
        <%
    }
    %>
        .bindPopup('Point 1');
</script>
</body>
</html>