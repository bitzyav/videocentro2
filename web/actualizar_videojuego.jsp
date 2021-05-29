<%-- 
    Document   : actualizar_cliente
    Created on : Dec 9, 2020, 7:36:06 PM
    Author     : Bitzy
--%>

<%@page import="objetosNegocio.Videojuego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar videojuego</title>
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
        <%
                Videojuego videojuego = (Videojuego) session.getAttribute("videojuego");
        %>
        <form action="VideojuegoControl">
            <br><br><br><br>
            <label class="input" for="catalogo">Número de Catálogo</label>
            <input id="catalogo" name="cat" type="text" required value="<%=videojuego.getNumCatalogo()%>"/><br><br>
            <label class="input" for="titulo">Título</label>
            <input id="titulo" name="tit" type="text" required value="<%=videojuego.getTitulo()%>"/><br><br>
            <label class="input" for="genero">Género</label>
            <input id="genero" name="gen" type="text" required value="<%=videojuego.getGenero()%>"/><br><br>
            <label class="input" for="clasif">Clasificación</label>
            <input id="clasif" name="clas" type="text" required value="<%=videojuego.getClasificacion()%>"/><br><br>
            <label class="input" for="consola">Consola</label>
            <input id="consola" name="con" type="text" required value="<%=videojuego.getConsola()%>"/><br><br>
            <label class="input" for="fabricante">Fabricante</label>
            <input id="fabricante" name="fab" type="text" required value="<%=videojuego.getFabricante()%>"/><br><br>
            <label class="input" for="version">Versión</label>
            <input id="version" name="ver" type="number" required value="<%=videojuego.getVersion()%>"/><br><br>
            <input class="button" type="submit" name="accion" value="Actualizar"/>
        </form>
    </body>
</html>
