<%-- 
    Document   : consultar_rentas
    Created on : Dec 10, 2020, 10:52:26 PM
    Author     : Bitzy
--%>

<%@page import="objetosNegocio.Renta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rentas</title>
        
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
                <li><a class="active">Rentas</a></li>
                <li><a href="Servlet_RegistrarRenta">Rentar juego</a></li>
            </ul>
        </nav>
        <table border="1">

            <tr>
                <th>Credencial</th>
                <th>Cliente</th>
                <th>Catalogo</th>
                <th>Videojuego</th>
                <th>Fecha renta</th>
                <th>Tiempo renta</th>
                <th>Acción</th>
            </tr>
            <%
                List<Renta> rentas = (List) session.getAttribute("rentas");
                for (int i = 0; i < rentas.size(); i++) {    
            %>
            <tr>      
                <td><%= rentas.get(i).getCliente().getNumCredencial() %></td>
                <td><%= rentas.get(i).getCliente().getNombre()%></td>
                <td><%= rentas.get(i).getArticulo().getNumCatalogo() %></td>
                <td><%= rentas.get(i).getArticulo().getTitulo()%></td> 
                <td><%= rentas.get(i).getFechaRenta() %></td> 
                <td><%= rentas.get(i).getTiempoRenta() %> días</td> 
                <td>
                    <a class="button1" href="RentaControl?accion=devolver&credencial=<%= rentas.get(i).getCliente().getNumCredencial() %>&catalogo=<%= rentas.get(i).getArticulo().getNumCatalogo() %>">Devolver</a>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
