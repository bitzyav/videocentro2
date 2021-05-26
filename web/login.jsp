<%-- 
    Document   : login
    Created on : Dec 11, 2020, 7:12:02 PM
    Author     : Bitzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="185300425333-108qhrtoa487mrm3go42gpomts46ehm9.apps.googleusercontent.com">
        <title>Login</title>
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="login">
            <div class="g-signin2" data-onsuccess="onSignIn" id="div"></div>
            <img id="img"/>
            <p id="name"></p>
            <div id="status"></div>
            <button onclick="signOut()">Log out</button>
            <script>
                function signOut() {
                    gapi.auth2.getAuthInstance().disconnect();
                    location.reload();
                }
                function onSignIn(googleUser) {
                    var profile = googleUser.getBasicProfile();
                    var image = profile.getImageUrl();
                    var name = profile.getName();
                    var email = profile.getEmail();
                    document.getElementById("img").src = image;
                    document.getElementById("name").innerHTML = name;
                    document.getElementById("status").innerHTML = "Welcome " + name + "<a href=index.jsp?email=" + email + "&name=" + name + "/>Continue with Google Login</a>";
                    document.getElementById("div").style.visibility = "hidden";
                }
            </script>
        </form>
        <!--            <input type="submit" value="Ingresar">-->
    </body>
</html>
