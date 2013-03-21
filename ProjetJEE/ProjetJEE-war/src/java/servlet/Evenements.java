/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.EvenementFacadeLocal;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import metier.Evenement;

/**
 *
 * @author kaba
 */
public class Evenements extends HttpServlet {

    @EJB
    private EvenementFacadeLocal evenementFacade;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String page = "evenements.jsp";
        Collection<Evenement> evenements;
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("test")) { // Créer des évènements tests
                creerEvenementTests();
                page = "gestion_evenements.jsp";
            } else if (action.equals("gerer")) {
                page = "gestion_evenements.jsp";
            } else if (action.equals("supprimer")) {
                if (!request.getParameter("supprId").equals("")) {
                    Integer evenementID = Integer.parseInt(request.getParameter("supprId"));
                    Evenement e = evenementFacade.findEvenementById(evenementID);
                    if (e != null) {
                        evenementFacade.remove(e);                        
                        page = "gestion_evenements.jsp";
                    } else {
                        page = "erreur.jsp";
                        request.setAttribute("message", "Aucun évènement correspondant trouvé");
                    }
                }
            }
        }
        evenements = evenementFacade.findAll();
        request.setAttribute("evenements", evenements);
        RequestDispatcher dp = request.getRequestDispatcher(page);
        dp.forward(request, response);
    }

    private void creerEvenementTests() {
        if (evenementFacade.findEvenementByLieuDate("Paris", new Date(2013 - 1900, 04, 20, 15, 30)) == null) {
            evenementFacade.create(new Evenement(new Date(2013 - 1900, 04, 20, 15, 30), "Evènement", "Rencontre des ancien", "Paris"));
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
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
