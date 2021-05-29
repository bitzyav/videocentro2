<%-- 
    Document   : clientes
    Created on : Dec 6, 2020, 12:26:28 PM
    Author     : Bitzy
--%>

<%@page import="services.VideojuegoService"%>
<%@page import="services.Videojuego"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="objetosNegocio.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Videojuegos</title>

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
                <li><a class="active">Juegos</a></li>
                <li><a href="agregar_videojuego.jsp">Agregar juego</a></li>
                <li><a href="Inventario_Videojuegos">Inventario</a></li>
                <li><a href="Servlet_Rentar">Rentas</a></li>
                <li><a href="Servlet_RegistrarRenta">Rentar juego</a></li>
            </ul>
        </nav>
        <form action="VideojuegoControl">
            <br><br><br>
            <label class="buscar" for="buscar"></label>

            <select name="busqueda">
                <option value="titulo">Título</option> 
                <option value="genero">Género</option> 
            </select>
            <input id="txtBuscar" name="buscar" type="text" required/>
            <input id="btnBuscar" class="button1" name="accion" type="submit" value="Buscar"/>


            <table border="1">
                <tr>
                    <th>Catálogo</th>
                    <th>Título</th>
                    <th>Género</th>
                    <th>Clasifiación</th>
                    <th>Consola</th>
                    <th>Fabricante</th>
                    <th>Version</th>
                    <th colspan="2">Acción</th>

                </tr>
                <%
                    VideojuegoService vs = new VideojuegoService();
                    List<Videojuego> listaVideojuegos = vs.obtenerVideojuegos();
                    for (int i = 0; i < listaVideojuegos.size(); i++) {
                %>
                <tr>      
                    <td><%= listaVideojuegos.get(i).getNumCatalogo()%></td>
                    <td><%= listaVideojuegos.get(i).getTitulo()%></td>
                    <td><%= listaVideojuegos.get(i).getGenero()%></td>
                    <td><%= listaVideojuegos.get(i).getClasificacion()%></td> 
                    <td><%= listaVideojuegos.get(i).getConsola()%></td> 
                    <td><%= listaVideojuegos.get(i).getFabricante()%></td> 
                    <td><%= listaVideojuegos.get(i).getVersion()%></td> 
                    <td>
                        <a class="button1" href="VideojuegoControl?accion=actualizarVideojuego&catalogo=<%=listaVideojuegos.get(i).getNumCatalogo()%>">Editar</a>
                    </td>
                    <td>        
                        <a class="button2" href="VideojuegoControl?accion=eliminarVideojuego&catalogo=<%=listaVideojuegos.get(i).getNumCatalogo()%>">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </table>
        </form>
    </body>
</html>
