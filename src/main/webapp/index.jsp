<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu sidebar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <link rel="stylesheet" href="./globals.css" />
</head>
<body onload="loadCheckboxState()">
<button class="btn btn-primary hide-filters" type="button" data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop" aria-controls="staticBackdrop">
    Filtres
</button>
<div class="offcanvas offcanvas-start" data-bs-backdrop="static" tabindex="-1" id="staticBackdrop" aria-labelledby="staticBackdropLabel">
    <nav class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="./img.png" width="70" height="70" alt="logo" class="d-inline-block align-text-top">
                MF
            </a>
        </div>
    </nav>
    <div class="offcanvas-header text-center">
    <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Filtres</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
</div>

<div class="offcanvas-body">
    <div class="d-flex justify-content-between">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="type2" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="type2">
                Type 2
            </label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="typeEF" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="typeEF">
                Type EF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </label>
        </div>
    </div>

    <span style="display: inline-block; width: 100px;"></span>

    <div class="d-flex justify-content-between">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="typeChademo" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="typeChademo">
                Type chademo
            </label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="comnoCss" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="comnoCss">
                comno_css&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </label>
        </div>
    </div>
    <span style="display: inline-block; width: 100px;"></span>

    <div class="d-flex justify-content-between">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="typeAutre" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="typeAutre">
                Type autre
            </label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="accessiblilitePmr" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="accessiblilitePmr">
                Accessiblilite PMR
            </label>
        </div>
    </div>

    <span style="display: inline-block; width: 100px;"></span>

    <div class="d-flex justify-content-between">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="gratuit" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="gratuit">
                Gratuit
            </label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="reservable" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="reservable">
                Reservable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </label>
        </div>
    </div>

    <span style="display: inline-block; width: 300px;"></span>

    <h5 class="offcanvas-title">Paiement</h5>
    <span style="display: inline-block; width: 500px;"></span>
    <span style="display: inline-block; width: 70px;"></span>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="CB" value="option1" onchange="saveCheckboxState(this)">
        <label class="form-check-label" for="CB">CB</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="acte" value="option2" onchange="saveCheckboxState(this)">
        <label class="form-check-label" for="acte">Acte</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="autre" value="option3" onchange="saveCheckboxState(this)">
        <label class="form-check-label" for="autre">Autre</label>
    </div>

    <div class="d-grid gap-2">
        <button class="btn btn-primary" type="button" onclick="submitFilters()">Rechercher</button>
    </div>
</div>
</div>
<script>
    function setCookie(name, value, days) {
        var expires = "";
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days*24*60*60*1000));
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + (value || "")  + expires + "; path=/";
    }

    function saveCheckboxState(checkbox) {
        setCookie(checkbox.id, checkbox.checked, 7);
    }

    function getCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0;i < ca.length;i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1,c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
        }
        return null;
    }

    function loadCheckboxState() {
        var checkboxes = document.querySelectorAll('.form-check-input');
        checkboxes.forEach(function(checkbox) {
            var cookieValue = getCookie(checkbox.id);
            checkbox.checked = cookieValue === "true";
        });
    }

    function saveFiltersInCookie() {
        var type2 = document.getElementById('type2').checked ? '1' : '0';
        var typeEF = document.getElementById('typeEF').checked ? '1' : '0';
        var typeChademo = document.getElementById('typeChademo').checked ? '1' : '0';
        var comnoCss = document.getElementById('comnoCss').checked ? '1' : '0';
        var typeAutre = document.getElementById('typeAutre').checked ? '1' : '0';
        var accessiblitePMR = document.getElementById('accessiblilitePmr').checked ? '1' : '0';
        var gratuit = document.getElementById('gratuit').checked ? '1' : '0';
        var reservable = document.getElementById('reservable').checked ? '1' : '0';
        var CB = document.getElementById('CB').checked ? '1' : '0';
        var acte = document.getElementById('acte').checked ? '1' : '0';
        var autre = document.getElementById('autre').checked ? '1' : '0';

        var cookieValue = type2 + ';' + typeEF + ';' + typeChademo + ';' +comnoCss+ ';' + typeAutre + ';' +accessiblitePMR + ';' +gratuit + ';' + reservable + ';' + CB + ';' + acte + ';' + autre;
            setCookie('filters', cookieValue, 7);
    }

    function loadFiltersFromCookie() {
        var filtersCookie = getCookie('filters');
        if (filtersCookie) {
            var values = filtersCookie.split(';');
            document.getElementById('type2').checked = values[0] === '1';
            document.getElementById('typeEF').checked = values[1] === '1';
            document.getElementById('typeChademo').checked = values[2] === '1';
            document.getElementById('comnoCss').checked = values[3] === '1';
            document.getElementById('typeAutre').checked = values[4] === '1';
            document.getElementById('accessiblitePMR').checked = values[5] === '1';
            document.getElementById('gratuit').checked = values[6] === '1';
            document.getElementById('reservable').checked = values[7] === '1';
            document.getElementById('CB').checked = values[8] === '1';
            document.getElementById('acte').checked = values[9] === '1';
            document.getElementById('autre').checked = values[10] === '1';
        }
    }

    function submitFilters() {
        // 从页面元素直接读取当前的筛选状态
        var type2 = document.getElementById('type2').checked;
        var typeEF = document.getElementById('typeEF').checked;
        var typeChademo = document.getElementById('typeChademo').checked;
        var comnoCss = document.getElementById('comnoCss').checked;
        var typeAutre = document.getElementById('typeAutre').checked;
        var accessiblitePMR = document.getElementById('accessiblilitePmr').checked;
        var gratuit = document.getElementById('gratuit').checked;
        var reservable = document.getElementById('reservable').checked;
        var CB = document.getElementById('CB').checked;
        var acte = document.getElementById('acte').checked;
        var autre = document.getElementById('autre').checked;

        // 构建提交URL，包含当前的筛选状态
        var url = "integrationMenu?";
        url += "type2=" + type2;
        url += "&typeEF=" + typeEF;
        url += "&typeChademo=" + typeChademo;
        url += "&comnoCss=" + comnoCss;
        url += "&typeAutre=" + typeAutre;
        url += "&accessiblitePMR=" + accessiblitePMR;
        url += "&gratuit=" + gratuit;
        url += "&reservable=" + reservable;
        url += "&CB=" + CB;
        url += "&acte=" + acte;
        url += "&autre=" + autre;

        // 重定向到构建的URL，以便后端可以处理这些筛选条件
        window.location.href = url;
    }




</script>
<jsp:include page="map.jsp"/>
</body>
</html>