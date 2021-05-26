<%-- 
    Document   : actualizar_cliente
    Created on : Dec 9, 2020, 7:36:06 PM
    Author     : Bitzy
--%>

<%@page import="objetosNegocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Cliente</title>
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
                Cliente cliente = (Cliente) session.getAttribute("cliente");
        %>
        <form action="ClienteControl">
            <br><br><br><br>
            <label class="input" for="credencial">Número de Credencial</label>
            <input id="credencial" name="cred" type="text" required value="<%=cliente.getNumCredencial()%>"/><br><br>
            <label class="input" for="nombre">Nombre</label>
            <input id="nombre" name="nom" type="text" required value="<%=cliente.getNombre()%>"/><br><br>
            <label class="input" for="direccion">Dirección</label>
            <input id="direccion" name="dir" type="text" required value="<%=cliente.getDireccion()%>"/><br><br>
            <label class="input" for="telefono">Teléfono</label>
            <input id="telefono" name="tel" type="text" value="<%=cliente.getTelefono()%>"/><br><br>
            <input class="button" type="submit" name="accion" value="Actualizar"/>
        </form>
    </body>
</html>
