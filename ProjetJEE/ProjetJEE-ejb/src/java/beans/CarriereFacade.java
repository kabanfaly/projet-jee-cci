/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import metier.Carriere;

/**
 *
 * @author kaba
 */
@Stateless
public class CarriereFacade extends AbstractFacade<Carriere> implements CarriereFacadeLocal {
    @PersistenceContext(unitName = "ProjetJEE-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CarriereFacade() {
        super(Carriere.class);
    }

    @Override
    public Carriere findCarriereById(int id) {
        return (Carriere)em.createNamedQuery("Carriere.findByIdcarriere").setParameter("idcarriere", id);
    }
    
    
}
