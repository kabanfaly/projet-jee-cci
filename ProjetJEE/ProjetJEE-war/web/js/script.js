
/**
 * Vérifie les champs lors de la connexion
 * @returns {Boolean}
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