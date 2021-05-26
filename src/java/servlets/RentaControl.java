package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import interfaces.IPersistencia;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objetosNegocio.ArticuloED;
import objetosNegocio.Cliente;
import objetosNegocio.Renta;
import objetosNegocio.Videojuego;
import objetosServicio.Fecha;
import persistencia.PersistenciaBD;

/**
 *
 * @author Bitzy
 */
@WebServlet(name = "RentaControl", urlPatterns = {"/RentaControl"})
public class RentaControl extends HttpServlet {

    IPersistencia crud = new PersistenciaBD();
    Renta renta = new Renta();
    Cliente cliente = new Cliente();
    List<ArticuloED> articulos = crud.consultarInventarioVideojuegos();
    ArticuloED articulo = new ArticuloED();

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

        if (action.equalsIgnoreCase("Rentar")) {
            try {
                cliente = crud.obten(new Cliente(request.getParameter("cliente")));
                Videojuego vid = new Videojuego(request.getParameter("videojuego"));

                Calendar fecha = new GregorianCalendar();
                int dia = fecha.get(Calendar.DAY_OF_MONTH);
                int mes = fecha.get(Calendar.MONTH);
                int año = fecha.get(Calendar.YEAR);
                int dias = Integer.parseInt(request.getParameter("dias"));
                renta = new Renta(cliente, crud.obten(vid), new Fecha(dia, mes + 1, año), dias);
                crud.rentarVideojuego(renta);
                acceso = "Servlet_Rentar";
            } catch (Exception e) {
                HttpSession session = request.getSession();
                String msj = e.getMessage();
                session.setAttribute("msj", msj);
                acceso = "error.jsp";
            }
        } else if (action.equalsIgnoreCase("devolver")) {
            try {
                cliente = crud.obten(new Cliente(request.getParameter("credencial")));
                Videojuego vid = crud.obten(new Videojuego(request.getParameter("catalogo")));
                crud.devolverVideojuego(new Renta(cliente, vid));
                acceso = "Servlet_Rentar";
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
