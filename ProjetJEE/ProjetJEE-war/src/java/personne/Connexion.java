/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package personne;

import beans.PersonneFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import metier.Personne;

/**
 *
 * @author kaba
 */
public class Connexion extends HttpServlet {

    @EJB
    private PersonneFacadeLocal personneFacade;

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
        String page = "index.jsp";
        request.getSession(true).setAttribute("message", "");
        String action = request.getParameter("action");
        if (action.equals("login")) {
            //Trouver la personne correspondant au login et au mot de passe
            Personne p = personneFacade.findPersonneByLoginMdp(request.getParameter("login"), request.getParameter("mdp"));
            if (p != null) {
                request.getSession(true).setAttribute("personne", p);
                request.getSession(true).setAttribute("connexion", true);
                page = "profil.jsp";
            } else {
                request.getSession(true).setAttribute("connexion", false);
                request.getSession(true).setAttribute("message", "Aucune personne correspondante trouvée");

            }
        } else if (action.equals("logout")) {
            request.getSession(true).setAttribute("personne", null);
            request.getSession(true).setAttribute("connexion", false);
            page = "index.jsp";
        }
        RequestDispatcher dp = request.getRequestDispatcher(page);
        dp.forward(request, response);
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
