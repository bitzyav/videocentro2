<%-- 
    Document   : inventariar_videojuego
    Created on : Dec 10, 2020, 6:58:53 PM
    Author     : Bitzy
--%>

<%@page import="objetosNegocio.Videojuego"%>
<%@page import="java.util.List"%>
<%@page import="objetosNegocio.ArticuloED"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventariar videojuego</title>
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
                <li><a href="agregar_videojuego.jsp">Agregar juego</a></li>
                <li><a href="Inventario_Videojuegos">Inventario</a></li>
                <li><a href="Servlet_Rentar">Rentas</a></li>
                <li><a href="Servlet_RegistrarRenta">Rentar juego</a></li>
            </ul>
        </nav>
        <%
            Videojuego videojuego = (Videojuego) session.getAttribute("videojuego");
            Integer existencia = (Integer) session.getAttribute("existencia");
            Integer disponibilidad = (Integer) session.getAttribute("disponibilidad");
        %>
        <form action="InventarioControl">
            <br><br><br><br>
            <label class="input" for="catalogo">Núm. de Catálogo</label>
            <input id="catalogo" type="text" name="cat" readonly value="<%=videojuego.getNumCatalogo()%>"/><br><br>
            <label class="input" for="titulo">Título</label>
            <input id="titulo" type="text" name="tit" readonly value="<%=videojuego.getTitulo()%>"/><br><br>

            <label class="input" for="dispon">Disponibilidad</label>
            <input id="dispon" type="text" name="disp" readonly value="<%=disponibilidad%>"/><br><br>
            <label class="input" for="exist">Existencia</label>
            <input id="exist" type="text" name="exis" readonly value="<%=existencia%>"/><br><br>
                        
            <label class="input" for="cantidad">Cantidad</label>
            <input id="cantidad" type="number" name="cant" min="0" max="150" required/><br><br>
            <input class="button" type="submit" name="accion" value="Inventariar"/>
        </form>
    </body>
</html>
