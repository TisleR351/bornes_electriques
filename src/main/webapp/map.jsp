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
    function getPositionsInQueryParams(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;

        var url = "./map.jsp?latitude=" + encodeURIComponent(latitude) + "&longitude=" + encodeURIComponent(longitude);
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
    L.marker([<%= terminal.getConsolidated_latitude() %> , <%= terminal.getConsolidated_longitude() %>]).addTo(map).bindPopup('Point 1');
    <% } %>
</script>
</body>
</html>
