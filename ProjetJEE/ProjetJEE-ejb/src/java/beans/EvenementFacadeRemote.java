/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.List;
import javax.ejb.Remote;
import metier.Evenement;

/**
 *
 * @author kaba
 */
@Remote
public interface EvenementFacadeRemote {

    void create(Evenement evenement);

    void edit(Evenement evenement);

    void remove(Evenement evenement);

    Evenement find(Object id);

    List<Evenement> findAll();

    List<Evenement> findRange(int[] range);

    int count();

    Evenement findEvenementById(int id);
    
}
