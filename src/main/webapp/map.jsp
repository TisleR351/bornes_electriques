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

<div class="card"  id="card" style="width: 45rem; margin: auto; display: none">
    <ul class="list-group list-group-flush">
        <li class="list-group-item" id="nom_operateur"></li>
        <li class="list-group-item" id="contact_operateur"></li>
        <li class="list-group-item" id="telephone_operateur"></li>
        <li class="list-group-item" id="nom_station"></li>
        <li class="list-group-item" id="adresse_station"></li>
        <li class="list-group-item" id="puissance_nominale"></li>
        <li class="list-group-item" id="tarification"></li>
        <li class="list-group-item" id="condition_acces"></li>
        <li class="list-group-item" id="reservation"></li>
        <li class="list-group-item" id="horaires"></li>
        <li class="list-group-item" id="restriction_gabarit"></li>
        <li class="list-group-item" id="station_deux_roues"></li>
        <li class="list-group-item" id="date_maj"></li>
        <li class="list-group-item" id="consolidated_commune"></li>
        <li class="list-group-item" id="raccordement"></li>
    </ul>
    </div>
<%--</div>--%>

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
                            displayCardData(terminal);
                    });
                })
            })
            .catch(error => console.error('Erreur lors de la récupération des bornes', error))
    }

    function displayCardData(terminal){
        document.getElementById('nom_operateur').textContent = "Nom operation: "+terminal.nom_operateur;
        document.getElementById('contact_operateur').textContent = "Contact operateur: "+terminal.contact_operateur;
        document.getElementById('telephone_operateur').textContent = "Telephone operateur: "+terminal.telephone_operateur;
        document.getElementById('nom_station').textContent = "Nom station: "+terminal.nom_station;
        document.getElementById('adresse_station').textContent = "Adress station: "+terminal.adresse_station;
        document.getElementById('puissance_nominale').textContent = "Puissance normal: "+terminal.puissance_nominale;
        document.getElementById('tarification').textContent = "Tarification: "+terminal.tarification;
        document.getElementById('condition_acces').textContent = "Conditions d'acces: "+terminal.condition_acces;
        document.getElementById('reservation').textContent = "Resrvation: "+terminal.reservation;
        document.getElementById('horaires').textContent ="Horaires: "+ terminal.horaires;
        document.getElementById('restriction_gabarit').textContent = "Restriction gabarit: "+terminal.restriction_gabarit;
        document.getElementById('station_deux_roues').textContent = "Station 2 roues: "+terminal.station_deux_roues;
        document.getElementById('date_maj').textContent = "Date de mise ajour: "+terminal.date_maj;
        document.getElementById('consolidated_commune').textContent = "Consolidated: "+terminal.consolidated_commune;
        document.getElementById('raccordement').textContent = "Raccordement: "+terminal.raccordement;

        document.getElementById('card').style.display = 'block';
    }

    map.on('moveend', displayUpdatedMarkers);

    displayUpdatedMarkers();
</script>