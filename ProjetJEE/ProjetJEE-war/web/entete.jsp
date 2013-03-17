
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>CCI - Ma nouvelle filiaire</title>
        <meta name="keywords" content="CCI, Tours" />
        <meta name="description" content="CCI, Tours" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/style2.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.js" ></script>
        <script type="text/javascript" src="js/script.js"></script>

    </head>

    <body>
        <div id="templatemo_container">

            <div id="templatemo_header">
                <div id="logosection" >
                    <div class="sitelogo"></div>
                    <div class="sitename">
                        CCI
                    </div>                    
                </div>
                <div id="header">
                    <div class="title">
                        CCI<br />
                        <span class="bigtext">Ma nouvelle filiaire</span><br />
                        Pour réussir ma vie professionelle.           
                    </div>
                    <span style="color: white;"><c:if test="${connexion}">${personne.nom} ${personne.prenom}</c:if></span>           
                </div>
            </div>

            <div id="templatemo_menu">
                <div id="search">
                    <input class="textfield" type="text" value="Search..."/> <input class="send_btn" type="submit" value="Go" />
                </div>
                <div id="menu">
                    <ul>
                        <li><a href="index.jsp">Accueil</a></li>
                            <c:if test="${connexion}">
                            <li><a href="profil.jsp">Mon profil</a></li>
                            <li><a href="connexion?action=logout">Déconnexion</a></li>
                            </c:if>
                    </ul>
                </div>

            </div>

            <!-- start of content -->

            <div id="templatemo_content">

                <!-- start of left column -->

                <div id="templatemo_left_column">

                    <c:if test="${!connexion}">
                        <div id="leftcolumn_box01">
                            <div class="leftcolumn_box01_top">
                                <h2>Se connecter</h2>
                            </div>
                            <div class="leftcolumn_box01_bottom">

                                <form method="post" action="connexion?action=login" onsubmit="return verifierChamp();">
                                    <div>${message}</div>
                                    <div class="form_row"><label>Login</label><input class="inputfield" name="login" type="text" id="login"/></div>
                                    <div class="form_row"><label>Password</label><input class="inputfield" name="mdp" type="password" id="mdp"/></div>
                                    <input class="button" type="submit" name="Submit" value="Login" />
                                    <div><a href="personnes?action=inscription"><label>S'inscrire</label></a></div>
                                </form>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${connexion}">
                        <div id="leftcolumn_box02">

                            <h2>Personnes</h2>
                            <ul>
                                <c:if test="${personne.login == 'admin'}" >
                                    <li><a href="personnes?action=test">Créer des personnes tests</a></li>
                                    </c:if>
                                <li><a href="personnes?action=tout">Afficher toutes les personnes</a></li>
                            </ul>   
                        </div>
                    </c:if>
                </div>

                <!-- end of left column -->

