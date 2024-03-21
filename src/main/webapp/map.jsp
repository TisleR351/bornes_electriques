<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    double latitude = 0;
    double longitude = 0;
    if(request.getParameter("latitude") != null && request.getParameter("longitude") != null) {
        latitude = Double.parseDouble(request.getParameter("latitude"));
        longitude = Double.parseDouble(request.getParameter("longitude"));
    }
%>
<div id="map"></div>
<script>
    function getPositionsInQueryParams(position) {
        let latitude = position.coords.latitude;
        let longitude = position.coords.longitude;

        <% if(request.getParameter("latitude") == null && request.getParameter("longitude") == null) { %>
        window.location.href = "?latitude=" + encodeURIComponent(latitude) + "&longitude=" + encodeURIComponent(longitude);
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
    <% if(request.getParameter("latitude") == null && request.getParameter("longitude") == null) { %>
    getLocation();
    <%
    }
    %>
</script>
<script>
    var map = L.map('map').setView([<%= latitude %> , <%= longitude %>], 13);
    var markerGroup = L.layerGroup().addTo(map);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    function displayUpdatedMarkers() {
        markerGroup.clearLayers();
        let center = map.getCenter();
        let urlParams = new URLSearchParams(window.location.search);
        urlParams.set('latitude', center.lat.toFixed(6));
        urlParams.set('longitude', center.lng.toFixed(6));
        let newUrl = window.location.pathname + 'DAOServlet?' + urlParams.toString();
        fetch(newUrl)
            .then(response => response.json())
            .then(data => {
                data.forEach((terminal) => {
                    L.marker([ terminal.consolidated_latitude , terminal.consolidated_longitude]).addTo(markerGroup)
                        .on('click', function () {
                            console.log('Marqueur cliqué :', terminal);
                    });
                })
            })
            .catch(error => console.error('Erreur lors de la récupération des bornes', error))
    }

    map.on('moveend', displayUpdatedMarkers);

    displayUpdatedMarkers();
</script>