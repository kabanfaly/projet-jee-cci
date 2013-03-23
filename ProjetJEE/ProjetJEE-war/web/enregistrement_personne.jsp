<%-- 
    Document   : inscription
    Created on : 17 mars 2013, 10:56:01
    Author     : kaba
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>
<%@include file="entete.jsp" %>
<div>
    <h1>${titre}</h1>
    <div class="succes">${message}</div>
    <div class="enregistrer">
        <!-- On ajoute l'id de modification dans le cas d'une modification -->
        <form method="post" action="personnes?action=creerPersonne&modifId=${modifId}">
            <table>
                <tr>
                    <td align="right">Nom:</td><td><input  type="text" size="60" name="nom" required="true" id="nom" value="${personne.nom}"></td>
                </tr>
                <tr>
                    <td align="right">Prénom:</td><td><input type="text" name="prenom" required="true" id="prenom"  value="${personne.prenom}"></td>
                </tr>
                <tr>
                    <td align="right">
                        Année d'inscription:</td><td><select name="annee_inscription" id="annee_inscription" >
                        <c:forEach var="annee" items="${anneeInscription}">
                                <option value="${annee}" <c:if test="${personne.anneeInscription == annee}"> selected </c:if> > ${annee}</option>                            
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">Membre:</td><td><select name="membre" id="membre">
                            <option <c:if test="${personne.membre == 'NON'}"> selected </c:if> value="NON">NON</option>
                            <option <c:if test="${personne.membre == 'OUI'}"> selected </c:if> value="OUI">OUI</option>
                            </select></td>
                    </tr>
                    <!--<tr>
                <c:if test="${personne != null}">
                    <c:set var="naissance" value="${personne.dateDeNaissance}" scope="request" />
                    <%
                        Date d = (Date) request.getAttribute("naissance");
                        request.setAttribute("mois", d.getMonth() + 1);
                        request.setAttribute("jour", d.getDate());
                        request.setAttribute("annee", d.getYear() + 1900);
                    %>
                </c:if>
                <td align="right">Date de naissance:</td>
                <td>
                    <select name="jour"  id="jour">
                <c:forEach var="j" items="${jourNaissance}">
                    <option value="${j}" <c:if test="${jour == j}"> selected </c:if> > ${j}</option>                            
                </c:forEach>
            </select>
            <select name="mois"  id="mois">
                <c:forEach var="m" items="${moisNaissance}">
                    <option value="${m}" <c:if test="${mois == m}"> selected </c:if> > ${m}</option>                            
                </c:forEach>
            </select>
            <select name="annee"  id="annee">
                <c:forEach var="a" items="${anneeNaissance}">
                    <option value="${a}" <c:if test="${annee == a}"> selected </c:if> > ${a}</option>                            
                </c:forEach>
            </select>
        </td>
    </tr>-->
                <tr>
                    <td align="right">Date de naissance:</td>
                    <td>
                        <input type="text" value="<fmt:formatDate value='${personne.dateDeNaissance}' pattern='dd/MM/yyyy' />" name="dateDeNaissance" id="dateDeNaissance" onclick="displayCalendar(document.forms[0].dateDeNaissance, 'dd/mm/yyyy', this);">
                    </td>

                </tr>
                <tr>
                    <td align="right">Email:</td><td><input type="text" name="email" required="true" id="email" value="${personne.email}"></td>
                </tr>
                <tr>
                    <td align="right">Login:</td><td><input type="text" name="login" required="true" id="login"  value="${personne.login}"></td>
                </tr>
                <tr>
                    <td align="right">Mot de passe:</td><td><input type="password" name="motDePasse" required="true" id="motDePasse" value="${personne.motDePasse}"></td>
                </tr>
                <tr>
                    <td align="right">Confirmer le mot de passe:</td><td><input type="password" name="reMotDePasse" required="true" id="reMotDePasse" value="${personne.motDePasse}"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="Submit" value="Valider"/></td>
                </tr>
            </table>
            <div></div>
        </form>
    </div>
    <div id="carrieree">
        <c:forEach var="c" items="${personne.carriereCollection}">

        </c:forEach>

    </div>
</div>
<%@include file="pied.jsp" %>
