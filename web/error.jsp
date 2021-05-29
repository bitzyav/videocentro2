<%-- 
    Document   : error
    Created on : Dec 11, 2020, 1:19:58 PM
    Author     : Bitzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav>
            <label class="logo">VideoCentro</label>
            <ul>
                <li><a href="index.jsp">Index</a></li>
                <li><a href="Servlet_Clientes">Clientes</a></li>
                <li><a href="agregar_cliente.jsp">Agregar cliente</a></li>
                <li><a href="Servlet_Videojuegos">Juegos</a></li>
                <li><a href="agregar_videojuego.jsp">Agregar juego</a></li>
                <li><a href="Inventario_Videojuegos">Inventario</a></li>
                <li><a href="Servlet_Rentar">Rentas</a></li>
                <li><a href="Servlet_RegistrarRenta">Rentar juego</a></li>
            </ul>
        </nav>
        <br><br>
        <h1>Oopsie!!! :(</h1>
        <h3>Se ha encontrado un error</h3>
        <%
                    String msj = (String) session.getAttribute("msj");
        %>
        <label for="label"><%= msj %></label>
    </body>
</html>
