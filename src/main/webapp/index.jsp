<!DOCTYPE html>
<html>
<head>
    <title>Menu sidebar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body onload="loadCheckboxState()">
<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop" aria-controls="staticBackdrop">
    Filtres
</button>
<div class="offcanvas offcanvas-start" data-bs-backdrop="static" tabindex="-1" id="staticBackdrop" aria-labelledby="staticBackdropLabel">
    <nav class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="D:\IdeaProjects\bornes_electriques\src\main\webapp\img.png" width="50" height="45" class="d-inline-block align-text-top">
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
            <input class="form-check-input" type="checkbox" value="" id="flexCheckLeft" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="flexCheckLeft">
                Type 2
            </label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckRight" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="flexCheckRight">
                Type EF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </label>
        </div>
    </div>

    <span style="display: inline-block; width: 100px;"></span>

    <div class="d-flex justify-content-between">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckLeft_2_ligne" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="flexCheckLeft">
                Type chademo
            </label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckRight_2_ligne" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="flexCheckRight">
                comno_css&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </label>
        </div>
    </div>
    <span style="display: inline-block; width: 100px;"></span>

    <div class="d-flex justify-content-between">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckLeft_3_ligne" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="flexCheckLeft">
                Type autre
            </label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckRight_3_ligne" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="flexCheckRight">
                Accessiblilite PMR
            </label>
        </div>
    </div>

    <span style="display: inline-block; width: 100px;"></span>

    <div class="d-flex justify-content-between">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckLeft_4_ligne" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="flexCheckLeft">
                Gratuit
            </label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckRight_4_ligne" onchange="saveCheckboxState(this)">
            <label class="form-check-label" for="flexCheckRight">
                Reservable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </label>
        </div>
    </div>

    <span style="display: inline-block; width: 300px;"></span>

    <h5 class="offcanvas-title">Paiement</h5>
    <span style="display: inline-block; width: 500px;"></span>
    <span style="display: inline-block; width: 70px;"></span>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1" onchange="saveCheckboxState(this)">
        <label class="form-check-label" for="inlineCheckbox1">CB</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2" onchange="saveCheckboxState(this)">
        <label class="form-check-label" for="inlineCheckbox2">Acte</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" onchange="saveCheckboxState(this)">
        <label class="form-check-label" for="inlineCheckbox3">Autre</label>
    </div>

    <div class="d-grid gap-2">
        <button class="btn btn-primary" type="button">Rechercher</button>
    </div>
</div>
</div>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">integration-du-menu</a>
<a href="./map.jsp">Voir la carte</a>
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
</script>
</body>
</html>