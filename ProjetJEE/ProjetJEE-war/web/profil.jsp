<%-- 
    Document   : profil
    Created on : 17 mars 2013, 10:45:32
    Author     : kaba
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>
<%@include file="entete.jsp" %>
<h1>Mes informations personnelles</h1>
<div class="info">
    <div><span id="titre">Nom: </span> <span>${utilisateur.nom}</span></div>
    <div><span id="titre">Prénom: </span> <span>${utilisateur.prenom}</span></div>
    <div><span id="titre">Membre: </span> <span>${utilisateur.membre}</span></div>
    <div><span id="titre">Email: </span> <span>${utilisateur.email}</span></div>
    <div><span id="titre">Date de naissance </span> <span><fmt:formatDate  value="${utilisateur.dateDeNaissance}" pattern="dd/MM/yyyy"/></span></div>
    <div><span id="titre">Année d'inscription: </span> <span>${utilisateur.anneeInscription}</span></div>
</div>
<a href="personnes?action=modifierPersonne&modifId=${utilisateur.idpersonne}">Modifier mon profil</a>
<%@include file="pied.jsp" %>

