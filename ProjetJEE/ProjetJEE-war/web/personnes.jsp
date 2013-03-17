<%-- 
    Document   : clients
    Created on : 16 mars 2013, 00:10:18
    Author     : kaba
--%>
<%@include file="entete.jsp" %>
    <h1>Listes des personnes</h1>
    <br>
    <table cellspacing="1" border="0">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Email</th>
            <th>Année d'inscription</th>
            <th>Membre CCI</th>
            <th>Supprimer</th>
            <th>Modifier</th>
        </tr>
        <% int i=0; %>
        <c:forEach var="p" items="${requestScope['personnes']}">
            <% i%=2 ;%>
            <tr id="line<%=i%>">
                <td align="center">${p.idpersonne}</td>
                <td align="center">${p.nom}</td>
                <td align="center">${p.prenom}</td>
                <td align="center">${p.email}</td>
                <td align="center">${p.anneeInscription}</td>
                <td align="center">${p.membre}</td>
                <td align="center"><a href="personnes?action=supprimerPersonne&supprId=${p.idpersonne}">Suppr</a></td>
                <td align="center"><a href="personnes?action=modifierPersonne&modifId=${p.idpersonne}">Modifier</a></td>
            </tr>
            <% i++ ;%>
        </c:forEach> 

    </table>
    <br>
    <a href="index.jsp">Retour au menu principal</a>


<%@include file="pied.jsp" %>
