<%-- 
    Document   : rentar_videojuego
    Created on : Dec 10, 2020, 8:58:07 PM
    Author     : Bitzy
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="objetosNegocio.Cliente"%>
<%@page import="objetosNegocio.ArticuloED"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rentar videojuego</title>
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
                <li><a class="active">Rentar juego</a></li>
            </ul>
        </nav>
        <form action="RentaControl">
            <br><br><br><br>
            <%
                List<ArticuloED> articulos = (List) session.getAttribute("articulos");
                List<Cliente> clientes = (List) session.getAttribute("clientes");
            %>
            <label class="input" for="cliente">Cliente</label>
            <select name="cliente">
                <%
                    for (int i = 0; i < clientes.size(); i++) {
                        Cliente j = clientes.get(i);
                %>
                <option value="<% out.print(j.getNumCredencial()); %>"><% out.print(j.getNombre()); %></option> 
                <%
                    }
                %>
            </select><br><br>
            <label class="input" for="juego">Videojuego</label>
            <select name="videojuego">
                <%for (int i = 0; i < articulos.size(); i++) {
                        ArticuloED j = articulos.get(i);%>
                <option value="<% out.print(j.getArticulo().getNumCatalogo()); %>"><% out.print(j.getArticulo().getTitulo()); %></option> 
                <%
                    }
                %>
            </select><br><br>
            <%
                Calendar fecha = new GregorianCalendar();
                int dia = fecha.get(Calendar.DAY_OF_MONTH);
                int mes = fecha.get(Calendar.MONTH);
                int año = fecha.get(Calendar.YEAR);
                String fechaRenta = dia + "/" + (mes + 1) + "/" + año;
            %>
            <label class="input" for="fechaR">Fecha de renta</label>
            <input id="fechaR" type="text" name="fecha" readonly value="<%= fechaRenta%>"/><br><br>
            <label class="input" for="diasR">Días de renta</label>
            <input id="diasR" type="number" min="1" required name="dias"/><br><br>
            <input class="button" id="rentar" type="submit" name="accion" value="Rentar"/>
        </form>
    </body>
</html>
