<%-- 
    Document   : index
    Created on : May 26, 2021, 1:47:49 PM
    Author     : Bitzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="cerrar_sesion">
            <nav>
                <label class="logo">VideoCentro</label>
                <ul>
                    <li><a class="active">Index</a></li>
                    <li><a href="Servlet_Clientes">Clientes</a></li>
                    <li><a href="agregar_cliente.jsp">Agregar cliente</a></li>
                    <li><a href="Servlet_Videojuegos">Juegos</a></li>
                    <li><a href="agregar_videojuego.jsp">Agregar juego</a></li>
                    <li><a href="Inventario_Videojuegos">Inventario</a></li>
                    <li><a href="Servlet_Rentar">Rentas</a></li>
                    <li><a href="Servlet_RegistrarRenta">Rentar juego</a></li>
                </ul>
            </nav>
            <%  String email = request.getParameter("email");
                String name = request.getParameter("name");
            %>
            <h2><%=name%></h2>
            <h2><%=email%></h2>
            <button onclick="signOut()">Log out</button>
            <script>
                var name = profile.getName();
                var email = profile.getEmail();
                function signOut() {
                    gapi.auth2.getAuthInstance().disconnect();
                    location.reload();
                }
            </script>
        </form>
    </body>
</html>

