/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 * @returns {undefined}
 */
function verifierChamp() {
    if ($("#login").val() === "") {
        alert("Le champ login est vide");
        return false;
    } else if ($("#mdp").val() === "") {
        alert("Le champ login est vide");
        return false;
    }
    return true;
}