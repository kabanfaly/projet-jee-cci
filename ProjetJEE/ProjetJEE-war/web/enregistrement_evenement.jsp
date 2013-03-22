<%-- 
    Document   : inscription
    Created on : 17 mars 2013, 10:56:01
    Author     : kaba
--%>

<%@page import="java.util.Date"%>
<%@include file="entete.jsp" %>
<h1>${titre}</h1>
<div class="succes">${message}</div>
<div class="enregistrer">
    <!-- On ajoute l'id de modification dans le cas d'une modification -->
    <form method="post" action="evenements?action=creer&modifId=${modifId}" onsubmit="return validerFormulaireInscription();">
        <table>
            <tr>
                <td align="right">Titre:</td><td><input  type="text" size="60" name="titre" id="titre" value="${evenement.titre}"></td>
            </tr>
            <tr>
                <td align="right">Description:</td><td><textarea rows="10"  type="text" size="60" name="description" id="description">${evenement.description}</textarea></td>
            </tr>
            <tr>
                <td align="right">Lieu:</td><td><input  type="text" size="60" name="lieu" id="lieu" value="${evenement.lieu}"></td>
            </tr>

            <tr>
                <c:if test="${evenement != null}">
                    <c:set var="jourEvmt" value="${evenement.jour}" scope="request" />
                    <%
                        Date d = (Date) request.getAttribute("jourEvmt");
                        request.setAttribute("mois", d.getMonth() + 1);
                        request.setAttribute("jour", d.getDate());
                        request.setAttribute("annee", d.getYear() + 1900);
                        request.setAttribute("heure", d.getHours());
                        request.setAttribute("minute", d.getMinutes());
                    %>
                </c:if>
                <td align="right">Date:</td>
                <td>
                    <select name="jour"  id="jour">
                        <c:forEach var="j" items="${jourEvenement}">
                            <option value="${j}" <c:if test="${jour == j}"> selected </c:if> > ${j}</option>                            
                        </c:forEach>
                    </select>
                    <select name="mois"  id="mois">
                        <c:forEach var="m" items="${moisEvenement}">
                            <option value="${m}" <c:if test="${mois == m}"> selected </c:if> > ${m}</option>                            
                        </c:forEach>
                    </select>
                    <select name="annee"  id="annee">
                        <c:forEach var="a" items="${anneeEvenement}">
                            <option value="${a}" <c:if test="${annee == a}"> selected </c:if> > ${a}</option>                            
                        </c:forEach>
                    </select> à 
                    <select name="heure"  id="heure">
                        <c:forEach var="h" items="${heureEvenement}">
                            <option value="${h}" <c:if test="${heure == h}"> selected </c:if> > ${h}</option>                            
                        </c:forEach>
                    </select> h
                    <select name="minute"  id="minute">
                        <c:forEach var="m" items="${minuteEvenement}">
                            <option value="${m}" <c:if test="${minute == m}"> selected </c:if> > ${m}</option>                            
                        </c:forEach>
                    </select> m
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="Submit" value="Valider"/></td>
            </tr>
        </table>
        <div></div>
    </form>
</div>

<%@include file="pied.jsp" %>
