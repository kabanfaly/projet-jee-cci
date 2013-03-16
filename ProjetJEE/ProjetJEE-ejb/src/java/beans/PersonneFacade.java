/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import metier.Personne;

/**
 *
 * @author kaba
 */
@Stateless
public class PersonneFacade extends AbstractFacade<Personne> implements PersonneFacadeLocal {
    @PersistenceContext(unitName = "ProjetJEE-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PersonneFacade() {
        super(Personne.class);
    }

    @Override
    public Personne findPersonneById(int id) {
        return (Personne)em.createNamedQuery("Personne.findByIdpersonne").setParameter("idpersonne", id).getSingleResult();
    }

  

    @Override
    public Personne findPersonneByEmail(String email) {
        return (Personne)em.createNamedQuery("Personne.findByEmail").setParameter("email", email).getSingleResult();
    }
    
    @Override
    public void create(Personne p){
       try {
             findPersonneByEmail(p.getEmail());
        } catch (NoResultException e) {
            em.persist(p);
        }
    }
    
}
