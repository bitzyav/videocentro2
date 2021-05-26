<%-- 
    Document   : devolver_videojuego
    Created on : Dec 11, 2020, 10:54:05 AM
    Author     : Bitzy
--%>

<%@page import="objetosNegocio.Renta"%>
<%@page import="objetosNegocio.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Devolver videojuego</title>
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
        <form action="RentaControl">
            <h1>Hello World!</h1>
            <%
                List<Cliente> clientes = (List) session.getAttribute("cliente");
                List<Renta> rentas = (List) session.getAttribute("rentas");
            %>

            <select name="cliente">
                <%
                    for (int i = 0; i < clientes.size(); i++) {
                        Cliente j = clientes.get(i);
                %>
                <option value="<% out.print(j.getNumCredencial()); %>"><% out.print(j.getNombre()); %></option> 
                <%
                    }
                %>
            </select>

            <select name="videojuego">
                <%for (int i = 0; i < articulos.size(); i++) {
                        ArticuloED j = articulos.get(i);%>
                <option value="<% out.print(j.getArticulo().getNumCatalogo()); %>"><% out.print(j.getArticulo().getTitulo()); %></option> 
                <%
                    }
                %>
            </select>

            <label for="fechaR">Fecha de renta</label>
            <input id="fechaR" type="text" name="fecha" readonly value="<%= fechaRenta %>"/>
            <label for="diasR">Días de renta</label>
            <input id="diasR" type="text" name="dias"/>
            <input id="rentar" type="submit" name="accion" value="Aceptar"/>
        </form>
    </body>
</html>
