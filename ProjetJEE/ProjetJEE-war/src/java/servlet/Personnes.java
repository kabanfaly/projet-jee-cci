/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.PersonneFacadeLocal;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
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
        request.setAttribute("message", "");
        String action = request.getParameter("action");
        //liste des annees d'inscription
        Collection<Integer> anneeInscription = new ArrayList<Integer>();
        for (int i = 2013; i > 1995; i--) {
            anneeInscription.add(i);
        }
        request.setAttribute("anneeInscription", anneeInscription);
        //Liste des années de naissance
        Collection<Integer> anneeNaissance = new ArrayList<Integer>();
        anneeNaissance.add(0);
        for (int i = 1995; i > 1950; i--) {
            anneeNaissance.add(i);
        }
        request.setAttribute("anneeNaissance", anneeNaissance);
        // Liste des mois des 12 mois de l'année
        Collection<Integer> moisNaissance = new ArrayList<Integer>();
        for (int i = 0; i <= 12; i++) {
            moisNaissance.add(i);
        }
        request.setAttribute("moisNaissance", moisNaissance);
        // Liste des jours du mois
        Collection<Integer> jourNaissance = new ArrayList<Integer>();
        for (int i = 0; i <= 31; i++) {
            jourNaissance.add(i);
        }
        request.setAttribute("jourNaissance", jourNaissance);
        Collection<Personne> personnes;

        //gestion des reques

        if (action.equals("test")) { // creation des personnes predefinies
            this.createPersonneTests();
            Collection<Personne> p = personneFacade.findAll();
            request.setAttribute("personnes", p);
        } else if (action.equals("tout")) { // Affichage de toutes les personnes de la filiaire cci
            Collection<Personne> p = personneFacade.findAll();
            request.setAttribute("personnes", p);

        } else if (action.equals("inscription")) { // Aller  à la page d'inscription 
            request.setAttribute("titre", "Inscription");
            request.setAttribute("personne", null);
            page = "enregistrement_personne.jsp";
        } else if (action.equals("modifierPersonne")) { // Aller à la page de modification d'un personne
            Integer personneID = Integer.parseInt(request.getParameter("modifId"));
            Personne p = personneFacade.findPersonneById(personneID);
            if (p != null) {
                request.setAttribute("modifId", personneID);
                System.out.println(p);
                request.setAttribute("titre", "Modifier");
                request.setAttribute("personne", p);
                page = "enregistrement_personne.jsp";
            } else {
                page = "erreur.jsp";
                request.setAttribute("message", "Aucune personne correspondante trouvée");
            }
        } else if (action.equals("supprimerPersonne")) { // Supprimer une personne
            if (!request.getParameter("supprId").equals("")) {
                Integer personneID = Integer.parseInt(request.getParameter("supprId"));
                Personne p = personneFacade.findPersonneById(personneID);
                if (p != null) {
                    personneFacade.remove(p);
                    personnes = personneFacade.findAll();
                    request.setAttribute("personnes", personnes);
                    page = "personnes.jsp";
                } else {
                    page = "erreur.jsp";
                    request.setAttribute("message", "Aucune personne correspondante trouvée");
                }
            } else {
                personnes = personneFacade.findAll();
                request.setAttribute("personnes", personnes);
                page = "personnes.jsp";
            }
        } else if (action.equals("creerPersonne")) { // enregistrer une nouvelle personne et mofidier une personne
            Personne p;
            int mois = Integer.parseInt(request.getParameter("mois"));
            int jour = Integer.parseInt(request.getParameter("jour"));
            int annee = Integer.parseInt(request.getParameter("annee"));
            if (request.getParameter("modifId").equals("")) { // Enregistrement

                if (personneFacade.findPersonneByEmail(request.getParameter("email")) != null) {
                    request.setAttribute("message", "L'email saisi existe déjà pour une autre personne");
                    page = "erreur.jsp";
                } else {
                    p = new Personne(request.getParameter("nom"), request.getParameter("prenom"),
                            Integer.parseInt(request.getParameter("annee_inscription")), request.getParameter("membre"),
                            request.getParameter("login"), request.getParameter("motDePasse"), request.getParameter("email"),
                            new Date(annee - 1900, mois - 1, jour));
                    //Creation de la nouvelle personne
                    personneFacade.create(p);
                    request.setAttribute("message", "Enregistrement OK");
                    page = "enregistrement_ok.jsp";
                }
            } else { // Modification 
                Integer personneID = Integer.parseInt(request.getParameter("modifId"));
                try {
                    p = new Personne(request.getParameter("nom"), request.getParameter("prenom"),
                            Integer.parseInt(request.getParameter("annee_inscription")), request.getParameter("membre"),
                            request.getParameter("login"), request.getParameter("motDePasse"), request.getParameter("email"),
                            new Date(annee - 1900, mois - 1, jour));
                    p.setIdpersonne(personneID);
                    personneFacade.edit(p);
                    request.setAttribute("message", "Modification OK");
                    page = "enregistrement_ok.jsp";

                } catch (NoResultException ex) {
                    request.setAttribute("message", "Le modification de la personne n'a pas été effectuée");
                    page = "erreur.jsp";
                }
            }


        }
        RequestDispatcher dp = request.getRequestDispatcher(page);
        dp.forward(request, response);

    }

    /**
     * Creation des comptes de test
     */
    private void createPersonneTests() {
        if (personneFacade.findPersonneByEmail("mamkaba2000@yahoo.fr") == null) {
            personneFacade.create(new Personne("KABA", "Mamady", 2008, "OUI", "mkaba", "kaba", "mamkaba2000@yahoo.fr", new Date(1988 - 1900, 11, 8))); // 8-dec-1988
        }

        if (personneFacade.findPersonneByEmail("mamkaba2001@yahoo.fr") == null) {
            personneFacade.create(new Personne("KABA_2", "Mamady", 2008, "OUI", "mkaba2", "kaba2", "mamkaba2001@yahoo.fr", new Date(1987 - 1900, 11, 8)));
        }

        if (personneFacade.findPersonneByEmail("mamkaba2002@yahoo.fr") == null) {
            personneFacade.create(new Personne("KABA_3", "Mamady", 2008, "OUI", "mkaba3", "kaba3", "mamkaba2002@yahoo.fr", new Date(1986 - 1900, 11, 8)));
        }

        if (personneFacade.findPersonneByEmail("mamkaba2003@yahoo.fr") == null) {
            personneFacade.create(new Personne("KABA_4", "Mamady", 2008, "OUI", "mkaba4", "kaba4", "mamkaba2003@yahoo.fr", new Date(1985 - 1900, 11, 8)));
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
