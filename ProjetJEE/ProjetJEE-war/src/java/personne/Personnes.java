/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package personne;

import beans.PersonneFacadeLocal;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import javax.ejb.EJB;
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
public class Personnes extends HttpServlet {

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
        String page = "personnes.jsp";
        request.getSession(true).setAttribute("message", "");
        String action = request.getParameter("action");
        if (action.equals("test")) { // creation des personnes predefinie
            this.createPersonneTests();
            Collection<Personne> p = personneFacade.findAll();
            request.setAttribute("personnes", p);
        } else {
            Collection<Personne> p = personneFacade.findAll();
            request.setAttribute("personnes", p);
        }
        RequestDispatcher dp = request.getRequestDispatcher(page);
        dp.forward(request, response);

    }

    private void createPersonneTests() {
        personneFacade.create(new Personne("KABA", "Mamady", 2008, "OUI", "mkaba", "kaba", "mamkaba2000@yahoo.fr", new Date(1988, 12, 8)));
        personneFacade.create(new Personne("KABA_2", "Mamady", 2008, "OUI", "mkaba", "kaba", "mamkaba2001@yahoo.fr", new Date(1987, 12, 8)));
        personneFacade.create(new Personne("KABA_3", "Mamady", 2008, "OUI", "mkaba", "kaba", "mamkaba2002@yahoo.fr", new Date(1986, 12, 8)));
        personneFacade.create(new Personne("KABA_4", "Mamady", 2008, "OUI", "mkaba", "kaba", "mamkaba2003@yahoo.fr", new Date(1985, 12, 8)));
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
