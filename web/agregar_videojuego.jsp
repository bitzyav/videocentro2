<%-- 
    Document   : agregar_cliente
    Created on : Dec 9, 2020, 6:01:28 PM
    Author     : Bitzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar videojuego</title>
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <% if (session.getAttribute("elUsuario") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <nav>
            <label class="logo">VideoCentro</label>
            <ul>
                <li><a href="index.html">Index</a></li>
                <li><a href="Servlet_Clientes">Clientes</a></li>
                <li><a href="agregar_cliente.jsp">Agregar cliente</a></li>
                <li><a href="Servlet_Videojuegos">Juegos</a></li>
                <li><a class="active">Agregar juego</a></li>
                <li><a href="Inventario_Videojuegos">Inventario</a></li>
                <li><a href="Servlet_Rentar">Rentas</a></li>
                <li><a href="Servlet_RegistrarRenta">Rentar juego</a></li>
            </ul>
        </nav>
        <form action="VideojuegoControl">
            <br><br><br><br>
            <label class="input" for="catalogo">Número de Catálogo</label>
            <input id="catalogo" name="cat" required type="text"/><br><br>
            <label class="input" for="titulo">Título</label>
            <input id="titulo" name="tit" required type="text"/><br><br>
            <label class="input" for="genero">Género</label>
            <input id="genero" name="gen" required type="text"/><br><br>
            <label class="input" for="clasif">Clasificación</label>
            <input id="clasif" name="clas" required type="text"/><br><br>
            <label class="input" for="consola">Consola</label>
            <input id="consola" name="con" required type="text"/><br><br>
            <label class="input" for="fabricante">Fabricante</label>
            <input id="fabricante" name="fab" required type="text"/><br><br>
            <label class="input" for="version">Versión</label>
            <input id="version" name="ver" required type="number"/><br><br><br>
            <input class="button"type="submit" name="accion" value="Agregar"/>
        </form>
    </body>
</html>
