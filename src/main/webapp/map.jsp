<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="map.css" />
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
<div class="popup" id="card">
    <div class="d-flex justify-content-between">
        <p class="list-group-item h2" id="distance"></p>
        <button type="button" class="btn btn-primary" id="close-btn">Fermer</button>
    </div>
    <div class="row">
        <div class="col">
            <p class="list-group-item" id="adresse_station"></p>
            <p class="list-group-item" id="nom_operateur"></p>
            <p class="list-group-item" id="telephone_operateur"></p>
            <p class="list-group-item" id="paiements_acceptes"></p>
            <p class="list-group-item" id="types_prises"></p>
        </div>
        <div class="col">
            <p class="list-group-item" id="horaires"></p>
            <p class="list-group-item" id="tarification"></p>
            <p class="list-group-item" id="condition_acces"></p>
            <p class="list-group-item" id="puissance_nominale"></p>
        </div>
        <div class="col">
            <p class="list-group-item" id="restriction_gabarit"></p>
            <p class="list-group-item" id="date_maj"></p>
            <p class="list-group-item" id="station_deux_roues"></p>
            <p class="list-group-item" id="observations"></p>
            <p class="list-group-item" id="contact_operateur"></p>
            <p class="list-group-item" id="reservation"></p>
        </div>
    </div>
</div>

<script>
    var map = L.map('map').setView([<%= latitude %> , <%= longitude %>], 13);
    var markerGroup = L.layerGroup().addTo(map);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);


    function setDisplayCard(value) {
        if(value) {
            document.getElementById('card').style.display = 'block';
        } else {
            document.getElementById('card').style.display = 'none';
        }
    }

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
                            setDisplayCard(true);
                            displayCardData(terminal);
                    });
                })
            })
            .catch(error => console.error('Erreur lors de la récupération des bornes', error))
    }

    function displayPaiements(terminal) {
        value = ""
        if(terminal.paiement_cb) {
            value += "Carte bancaire, "
        }
        if (terminal.paiement_acte) {
            value += "paiement acte, "
        }
        if (terminal.paiement_autre) {
            value += "paiement autre"
        }
        return value;
    }

    function displayTypes(terminal) {
        value = ""
        if(terminal.prise_type_2) {
            value += "Type 2, "
        }
        if (terminal.prise_type_ef) {
            value += "Type EF, "
        }
        if (terminal.prise_type_autre) {
            value += "Type Autre, "
        }
        if (terminal.prise_type_chademo) {
            value += "Type Chademo, "
        }
        if (terminal.prise_type_combo_ccs) {
            value += "Type combo CCS"
        }
        return value;
    }

    function calculerDistance(terminal) {
        // Récupérer les paramètres de l'URL
        const urlParams = new URLSearchParams(window.location.search);
        const urlLatitude = parseFloat(urlParams.get('latitude'));
        const urlLongitude = parseFloat(urlParams.get('longitude'));

        // Vérifier si les paramètres de l'URL sont valides
        if (isNaN(urlLatitude) || isNaN(urlLongitude)) {
            console.error('Les coordonnées de l\'URL ne sont pas valides.');
            return null;
        }

        // Coordonnées du terminal
        const terminalLatitude = parseFloat(terminal.consolidated_latitude);
        const terminalLongitude = parseFloat(terminal.consolidated_longitude);

        // Vérifier si les coordonnées du terminal sont valides
        if (isNaN(terminalLatitude) || isNaN(terminalLongitude)) {
            console.error('Les coordonnées du terminal ne sont pas valides.');
            return null;
        }

        // Fonction de calcul de distance entre deux points en coordonnées géographiques
        function distance(lat1, lon1, lat2, lon2) {
            const R = 6371; // Rayon de la Terre en kilomètres
            const dLat = (lat2 - lat1) * Math.PI / 180;
            const dLon = (lon2 - lon1) * Math.PI / 180;
            const a =
                Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
                Math.sin(dLon / 2) * Math.sin(dLon / 2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            const d = R * c; // Distance en kilomètres
            return d;
        }

        // Calcul de la distance entre les deux points
        const distanceEnKilometres = distance(terminalLatitude, terminalLongitude, urlLatitude, urlLongitude);
        return distanceEnKilometres.toFixed(2);
    }

    function displayCardData(terminal){
        document.getElementById('distance').textContent = "Distance: " + calculerDistance(terminal);
        document.getElementById('nom_operateur').textContent = "Nom operateur: " + terminal.nom_operateur + " kilomètres ";
        document.getElementById('contact_operateur').textContent = "Contact operateur: " + terminal.contact_operateur;
        document.getElementById('telephone_operateur').textContent = "Telephone operateur: " + terminal.telephone_operateur;
        document.getElementById('adresse_station').textContent = "Adresse station: " + terminal.adresse_station;
        document.getElementById('puissance_nominale').textContent = "Puissance normal: " + terminal.puissance_nominale;
        document.getElementById('tarification').textContent = "Tarification: " + terminal.tarification;
        document.getElementById('condition_acces').textContent = "Conditions d'acces: " + terminal.condition_acces;
        document.getElementById('reservation').textContent = "Reservation: " + terminal.reservation;
        document.getElementById('horaires').textContent ="Horaires: " + terminal.horaires;
        document.getElementById('restriction_gabarit').textContent = "Restriction gabarit: " + terminal.restriction_gabarit;
        document.getElementById('station_deux_roues').textContent = "Station 2 roues: " + terminal.station_deux_roues;
        document.getElementById('date_maj').textContent = "Date de mise à jour: " + terminal.date_maj;
        document.getElementById('observations').textContent = "Observations : " + terminal.observations;
        document.getElementById('paiements_acceptes').textContent = "Types de prise : " + displayTypes(terminal);
        document.getElementById('types_prises').textContent = "Paiements acceptes : " + displayPaiements(terminal);
        document.getElementById('close-btn').addEventListener('click', function() {
            setDisplayCard(false);
        });
    }

    map.on('moveend', displayUpdatedMarkers);

    displayUpdatedMarkers();
</script>