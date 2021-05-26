package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import interfaces.IPersistencia;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objetosNegocio.Cliente;
import persistencia.PersistenciaBD;

/**
 *
 * @author Bitzy
 */
@WebServlet(name = "ClienteControl", urlPatterns = {"/ClienteControl"})
public class ClienteControl extends HttpServlet {

    IPersistencia crud = new PersistenciaBD();
    Cliente cliente = new Cliente();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("Agregar")) {
            try {
                cliente.setNumCredencial(request.getParameter("cred"));
                cliente.setNombre(request.getParameter("nom"));
                cliente.setDireccion(request.getParameter("dir"));
                cliente.setTelefono(request.getParameter("tel"));
                crud.agregar(cliente);
                acceso = "Servlet_Clientes";
            } catch (Exception e) {
                HttpSession session = request.getSession();
                String msj = e.getMessage();
                session.setAttribute("msj", msj);
                acceso = "error.jsp";
            }

        } else if (action.equalsIgnoreCase("actualizarCliente")) {
            cliente = crud.obten(new Cliente(request.getParameter("credencial")));
            HttpSession session = request.getSession();
            session.setAttribute("cliente", cliente);
            acceso = "actualizar_cliente.jsp";
        } else if (action.equalsIgnoreCase("Actualizar")) {
            try {
                cliente.setNumCredencial(request.getParameter("cred"));
                cliente.setNombre(request.getParameter("nom"));
                cliente.setDireccion(request.getParameter("dir"));
                cliente.setTelefono(request.getParameter("tel"));
                crud.actualizar(cliente);
                acceso = "Servlet_Clientes";
            } catch (Exception e) {
                HttpSession session = request.getSession();
                String msj = e.getMessage();
                session.setAttribute("msj", msj);
                acceso = "error.jsp";
            }

        } else if (action.equalsIgnoreCase("eliminarCliente")) {
            try {
                cliente.setNumCredencial(request.getParameter("credencial"));
                crud.eliminar(cliente);
                acceso = "Servlet_Clientes";
                acceso = "Servlet_Clientes";
            } catch (Exception e) {
                HttpSession session = request.getSession();
                String msj = e.getMessage();
                session.setAttribute("msj", msj);
                acceso = "error.jsp";
            }

        }
        RequestDispatcher rp = request.getRequestDispatcher(acceso);
        rp.forward(request, response);
//        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
