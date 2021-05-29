<%-- 
    Document   : clientes
    Created on : Dec 6, 2020, 12:26:28 PM
    Author     : Bitzy
--%>

<%@page import="services.ClienteService"%>
<%@page import="services.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="objetosNegocio.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>

        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        
        <nav>
            <label class="logo">VideoCentro</label>
            <ul>
                <li><a href="index.jsp">Index</a></li>
                <li><a class="active">Clientes</a></li>
                <li><a href="agregar_cliente.jsp">Agregar cliente</a></li>
                <li><a href="Servlet_Videojuegos">Juegos</a></li>
                <li><a href="agregar_videojuego.jsp">Agregar juego</a></li>
                <li><a href="Inventario_Videojuegos">Inventario</a></li>
                <li><a href="Servlet_Rentar">Rentas</a></li>
                <li><a href="Servlet_RegistrarRenta">Rentar juego</a></li>
            </ul>
        </nav>

<!--        <div class="filter">

        </div>-->
        <table border="1">

            <tr>
                <th>Credencial</th>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Teléfono</th>
                <th>Acción</th>
            </tr>
            <%
                ClienteService cs = new ClienteService();
                List<Cliente> listaClientes = cs.obtenerClientes();
                for (int i = 0; i < listaClientes.size(); i++) {

            %>
            <tr>      
                <td><%= listaClientes.get(i).getNumCredencial()%></td>
                <td><%= listaClientes.get(i).getNombre()%></td>
                <td><%= listaClientes.get(i).getDireccion()%></td>
                <td><%= listaClientes.get(i).getTelefono()%></td> 
                <td>
                    <a class="button1" href="ClienteControl?accion=actualizarCliente&credencial=<%= listaClientes.get(i).getNumCredencial()%>">Editar</a>
                    <a class="button2" href="ClienteControl?accion=eliminarCliente&credencial=<%= listaClientes.get(i).getNumCredencial()%>">Eliminar</a>
                
            </tr>
            <%}%>
        </table>
        <section></section>
    </body>
</html>
