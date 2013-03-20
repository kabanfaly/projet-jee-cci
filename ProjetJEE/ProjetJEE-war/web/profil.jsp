<%-- 
    Document   : profil
    Created on : 17 mars 2013, 10:45:32
    Author     : kaba
--%>

<%@page import="java.util.Date"%>
<%@include file="entete.jsp" %>
<h1>Mes informations personnelles</h1>
<div class="info">
    <div><span id="titre">Nom: </span> <span>${personne.nom}</span></div>
    <div><span id="titre">Prénom: </span> <span>${personne.prenom}</span></div>
    <div><span id="titre">Membre: </span> <span>${personne.membre}</span></div>
    <div><span id="titre">Email: </span> <span>${personne.email}</span></div>
    <c:set var="naissance" value="${personne.dateDeNaissance}" scope="request" />
    <%
        Date d = (Date) request.getAttribute("naissance");
        request.setAttribute("mois", d.getMonth() + 1);
        request.setAttribute("jour", d.getDate());
        request.setAttribute("annee", d.getYear() + 1900);
    %>
    <div><span id="titre">Date de naissance </span> <span>${jour}/${mois}/${annee}</span></div>
    <div><span id="titre">Année d'inscription: </span> <span>${personne.anneeInscription}</span></div>
</div>
<a href="personnes?action=modifierPersonne&modifId=${personne.idpersonne}">Modifier mon profil</a>
<%@include file="pied.jsp" %>

