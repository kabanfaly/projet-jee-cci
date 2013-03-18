
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
/**
 * Vérifie l'existance des champs vides lors de l'enregistrement d'un formulaire
 * @returns {Boolean}
 */
function validerFormulaireInscription() {
    var valide = true;
    $('.enregistrer input, .enregistrer select').each(function(e) {
        $('#erreur' + e).remove();
        if ($(this).attr('value') === '' || $(this).attr('value') == 0) {

            $(this).after('<span style="color:red;" id="erreur' + e + '">Ce champ est vide</span>');
            valide = false;
        }

    });
    if ($('#motDePasse').val() !== '' && $('#reMotDePasse').val() !== '' && $('#motDePasse').val() !== $('#reMotDePasse').val()) {
        valide = false;
        alert('Les mots de passe saisis ne sont pas identiques');
    }

    return valide;
}