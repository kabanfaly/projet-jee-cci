
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

    </head>

    <body>
        <div id="templatemo_container">

            <div id="templatemo_header">
                <div id="logosection" >
                    <div class="sitelogo"></div>
                    <div class="sitename">
            	CCI<span></span>            </div>
                </div>
                <div id="header">
                    <div class="title">
                        CCI<br />
                        <span class="bigtext">Ma nouvelle filiaire</span><br />
    	    	Pour réussir ma vie professionelle.           
                    </div>
                </div>
            </div>

            <div id="templatemo_menu">
                <div id="search">
                    <input class="textfield" type="text" value="Search..."/> <input class="send_btn" type="submit" value="Go" />
                </div>
                <div id="menu">
                    <ul>
                        <li><a href="index.jsp">Accueil</a></li>
                        <li><a href="#">Déconnexion</a></li>
                    </ul>
                </div>

            </div>

            <!-- start of content -->

            <div id="templatemo_content">

                <!-- start of left column -->

                <div id="templatemo_left_column">

                    <div id="leftcolumn_box01">
                        <div class="leftcolumn_box01_top">
                            <h2>Se connecter</h2>
                        </div>
                        <div class="leftcolumn_box01_bottom">
                            <form method="get" action="Login">
                                <div class="form_row"><label>Login</label><input class="inputfield" name="login" type="text" id="login"/></div>
                                <div class="form_row"><label>Password</label><input class="inputfield" name="password" type="password" id="password"/></div>
                                <input class="button" type="submit" name="Submit" value="Login" />
                            </form>
                        </div>
                    </div>

                    <div id="leftcolumn_box02">


                        <h2>Clients</h2>
                        <ul>
                            <li><a href="clients?action=test">Créer des clients tests</a></li>
                            <li><a href="clients?action=creerClient">Créer un client</a></li>
                            <li><a href="clients?action=creerCompteClient">Ajouter un compte à un client</a></li>
                            <li><a href="clients?action=afficherClients">Afficher les clients</a></li>

                        </ul>                       
                    </div>
                </div>

                <!-- end of left column -->
