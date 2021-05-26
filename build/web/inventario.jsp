<%-- 
    Document   : inventariar_videojuegos
    Created on : Dec 9, 2020, 9:11:27 PM
    Author     : Bitzy
--%>

<%@page import="objetosNegocio.ArticuloED"%>
<%@page import="java.util.List"%>
<%@page import="objetosNegocio.Videojuego"%>
<%@page import="objetosNegocio.Videojuego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventariar Videojuegos</title>
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
                <li><a class="active">Inventario</a></li>
                <li><a href="Servlet_Rentar">Rentas</a></li>
                <li><a href="Servlet_RegistrarRenta">Rentar juego</a></li>
            </ul>
        </nav>
        <table border="1">

            <tr>
                <th>Catálogo</th>
                <th>Título</th>
                <th>Género</th>
                <th>Clasifiación</th>
                <th>Disponibilidad</th>
                <th>Existencia</th>
                <th colspan="2">Acción</th>

            </tr>
            <%
                List<ArticuloED> listaArticulos = (List) session.getAttribute("listaArticulos");
                for (int i = 0; i < listaArticulos.size(); i++) {

            %>
            <tr>      
                <td><%= listaArticulos.get(i).getArticulo().getNumCatalogo()%></td>
                <td><%= listaArticulos.get(i).getArticulo().getTitulo()%></td>
                <td><%= listaArticulos.get(i).getArticulo().getGenero()%></td>
                <td><%= listaArticulos.get(i).getArticulo().getClasificacion()%></td> 
                <td><%= listaArticulos.get(i).getDisponibilidad()%></td> 
                <td><%= listaArticulos.get(i).getExistencia()%></td> 
                <td>
                    <a class="button1" href="InventarioControl?accion=inv&catalogo=<%= listaArticulos.get(i).getArticulo().getNumCatalogo()%>&existencia=<%= listaArticulos.get(i).getExistencia()%>&disponibilidad=<%= listaArticulos.get(i).getDisponibilidad()%>">Inventariar</a>
                </td>
                <td>
                    <a class="button2" href="InventarioControl?accion=desinv&catalogo=<%= listaArticulos.get(i).getArticulo().getNumCatalogo()%>&existencia=<%= listaArticulos.get(i).getExistencia()%>&disponibilidad=<%= listaArticulos.get(i).getDisponibilidad()%>">Desinventariar</a>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
