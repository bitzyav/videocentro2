package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import interfaces.IPersistencia;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objetosNegocio.Articulo;
import objetosNegocio.ArticuloED;
import objetosNegocio.Videojuego;
import persistencia.PersistenciaBD;

/**
 *
 * @author Bitzy
 */
@WebServlet(name = "InventarioControl", urlPatterns = {"/InventarioControl"})
public class InventarioControl extends HttpServlet {

    IPersistencia crud = new PersistenciaBD();
    List<ArticuloED> articulos = crud.consultarInventarioVideojuegos();
    Videojuego videojuego = new Videojuego();
    Articulo articulo = new Videojuego();
    ArticuloED articuloED = new ArticuloED();

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
        int num = 0;
        if (action.equalsIgnoreCase("inv")) {
            videojuego = crud.obten(new Videojuego(request.getParameter("catalogo")));
            HttpSession session = request.getSession();
            session.setAttribute("videojuego", videojuego);
            session.setAttribute("existencia", Integer.parseInt(request.getParameter("existencia")));
            session.setAttribute("disponibilidad", Integer.parseInt(request.getParameter("disponibilidad")));
            acceso = "inventariar_videojuego.jsp";
        } else if (action.equalsIgnoreCase("Inventariar")) {
            num = Integer.parseInt(request.getParameter("cant"));
            crud.inventariar(new Videojuego(request.getParameter("cat")), num);
            acceso = "Inventario_Videojuegos";
        } else if (action.equalsIgnoreCase("desinv")) {
            videojuego = crud.obten(new Videojuego(request.getParameter("catalogo")));
            HttpSession session = request.getSession();
            session.setAttribute("videojuego", videojuego);
            session.setAttribute("existencia", Integer.parseInt(request.getParameter("existencia")));
            session.setAttribute("disponibilidad", Integer.parseInt(request.getParameter("disponibilidad")));
            acceso = "desinventariar_videojuego.jsp";
        } else if (action.equalsIgnoreCase("Desinventariar")) {
            num = Integer.parseInt(request.getParameter("cant"));
            try {
                crud.desinventariar(new Videojuego(request.getParameter("cat")), num);
                acceso = "Inventario_Videojuegos";
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
