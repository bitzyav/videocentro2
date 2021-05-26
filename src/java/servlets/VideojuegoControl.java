package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import interfaces.IPersistencia;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "VideojuegoControl", urlPatterns = {"/VideojuegoControl"})
public class VideojuegoControl extends HttpServlet {

    IPersistencia crud = new PersistenciaBD();
    Videojuego videojuego = new Videojuego();
    List<Videojuego> videojuegos = crud.consultarVideojuegos();

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
                videojuego.setNumCatalogo(request.getParameter("cat"));
                videojuego.setTitulo(request.getParameter("tit"));
                videojuego.setGenero(request.getParameter("gen"));
                videojuego.setClasificacion(request.getParameter("clas"));
                videojuego.setConsola(request.getParameter("con"));
                videojuego.setFabricante(request.getParameter("fab"));
                videojuego.setVersion(Integer.parseInt(request.getParameter("ver")));
                crud.agregar(videojuego);
                crud.inventariar(videojuego, 1);
                acceso = "Servlet_Videojuegos";
            } catch (Exception e) {
                HttpSession session = request.getSession();
                String msj = e.getMessage();
                session.setAttribute("msj", msj);
                acceso = "error.jsp";
            }

        } else if (action.equalsIgnoreCase("actualizarVideojuego")) {
            try {
                videojuego = crud.obten(new Videojuego(request.getParameter("catalogo")));
                HttpSession session = request.getSession();
                session.setAttribute("videojuego", videojuego);
                acceso = "actualizar_videojuego.jsp";
            } catch (Exception e) {
                HttpSession session = request.getSession();
                String msj = e.getMessage();
                session.setAttribute("msj", msj);
                acceso = "error.jsp";
            }

        } else if (action.equalsIgnoreCase("Actualizar")) {
            videojuego.setNumCatalogo(request.getParameter("cat"));
            videojuego.setTitulo(request.getParameter("tit"));
            videojuego.setGenero(request.getParameter("gen"));
            videojuego.setClasificacion(request.getParameter("clas"));
            videojuego.setConsola(request.getParameter("con"));
            videojuego.setFabricante(request.getParameter("fab"));
            videojuego.setVersion(Integer.parseInt(request.getParameter("ver")));
            crud.actualizar(videojuego);
            acceso = "Servlet_Videojuegos";
        } else if (action.equalsIgnoreCase("eliminarVideojuego")) {
            try {
                videojuego.setNumCatalogo(request.getParameter("catalogo"));
                crud.eliminar(videojuego);
                acceso = "Servlet_Videojuegos";
            } catch (Exception e) {
                HttpSession session = request.getSession();
                String msj = e.getMessage();
                session.setAttribute("msj", msj);
                acceso = "error.jsp";
            }

        } else if (action.equalsIgnoreCase("Buscar")) {
            String cbox = request.getParameter("busqueda");
            if (cbox.equals("titulo")) {
                List<Videojuego> busqueda = new ArrayList<>();
                for (Videojuego vid : videojuegos) {
                    if (vid.getTitulo().contains(request.getParameter("buscar"))) {
                        busqueda.add(vid);
                    }
                }
                HttpSession session = request.getSession();
                session.setAttribute("listaVideojuegos", busqueda);
                acceso = "consultar_videojuegos.jsp";
            } else {
                List<Videojuego> busqueda = new ArrayList<>();
                for (Videojuego vid : videojuegos) {

                    if (vid.getGenero().contains(request.getParameter("buscar"))) {

                        busqueda.add(vid);

                    }
                }
                HttpSession session = request.getSession();
                session.setAttribute("listaVideojuegos", busqueda);
                acceso = "consultar_videojuegos.jsp";
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
