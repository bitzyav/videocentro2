<%-- 
    Document   : INVENTARIAR
    Created on : Dec 10, 2020, 12:17:17 PM
    Author     : Bitzy
--%>

<%@page import="objetosNegocio.Videojuego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
                Videojuego videojuego = (Videojuego) session.getAttribute("videojuego");
        %>
        <form action="InventarioControl">
            <label for="catalogo">Catalogo</label>
            <input id="catalogo" type="text" name="cat" value="<%=videojuego.getNumCatalogo()%>"/>
            <label for="inventario">Inventario</label>
            <input id="inventario" type="number" name="inventario" required/>
            <input type="submit" name="accion" value="Inven"/>
        </form>
    </body>
</html>
