<%-- 
    Document   : personnes
    Created on : 16 mars 2013, 00:10:18
    Author     : kaba
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="entete.jsp" %>
<h1>Listes des personnes</h1>
<br>
<table cellspacing="1" border="0">
    <tr>
        <th>N&deg;</th>
        <th>Nom</th>
        <th>Prenom</th>
        <th>Email</th>
        <th>Login</th>
        <th>Date de naissance</th>
        <th>Année d'inscription</th>
        <th>Membre CCI</th>
            <c:if test="${personne.login == 'admin'}" >
            <th>Supprimer</th>
            <th>Modifier</th>
            </c:if>
    </tr>
    <% int i = 0;%>

    <c:forEach var="p" items="${personnes}">
        <c:if test="${p.login != 'admin'}">
            <c:set var="naissance" value="${p.dateDeNaissance}" scope="request" />
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                request.setAttribute("naissance", sdf.format(request.getAttribute("naissance")));
            %>
            <tr id="line<%=i % 2%>">
                <td align="center"><%=i + 1%></td>
                <td align="center">${p.nom}</td>
                <td align="center">${p.prenom}</td>
                <td align="center">${p.email}</td>
                <td align="center">${p.login}</td>
                <td align="center">${naissance}</td>
                <td align="center">${p.anneeInscription}</td>
                <td align="center">${p.membre}</td>
                <c:if test="${personne.login == 'admin'}" >
                    <td align="center"><a href="personnes?action=modifierPersonne&modifId=${p.idpersonne}"><img src="images/edit.png"/></a></td>
                    <td align="center"><a href="personnes?action=supprimerPersonne&supprId=${p.idpersonne}"><img src="images/delete.png"/></a></td>
                        </c:if>
            </tr>
            <% i++;%>
        </c:if>
    </c:forEach> 

</table>
<br>
<a href="index.jsp">Retour au menu principal</a>


<%@include file="pied.jsp" %>