<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edition utilisateur</title>



<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/plugins/morris.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" >




                
<%--     <script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>  --%>

   

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="accueil">SB Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                          
                    <li class="active">
                        <a href="aeroport/list"><i class="fa fa-fw fa-dashboard"></i> Aeroport</a>
                    </li>
                    <li>
                        <a href="vol/list"><i class="fa fa-fw fa-bar-chart-o"></i> Vol</a>
                    </li>
                    <li>
                        <a href="calendar"><i class="fa fa-fw fa-table"></i> Emplois du temps</a>
                    </li>
                    <li>
                        <a href="reservation/list"><i class="fa fa-fw fa-edit"></i> Reservation</a>
                    </li>
                    <li>
                        <a href="passager/list"><i class="fa fa-fw fa-desktop"></i>Passager</a>
                    </li>
                    <li>
                        <a href="escale/list"><i class="fa fa-fw fa-wrench"></i>Escale</a>
                    </li>
                      <li>
                        <a href="client/list"><i class="fa fa-fw fa-wrench"></i>Client</a>
                    </li>
                    
                      <li>
                        <a href="ville/list"><i class="fa fa-fw fa-wrench"></i> Ville</a>
                    </li>
            
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                    </li>
                    <li>
                        <a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                	<div style="height: 100px;"></div>
					<div class="container">
						<fieldset>
							<legend>Edition de la liste des utilisateurs</legend>
							<form:form modelAttribute="utilisateur" action="save" method="post">
								<form:hidden path="id" />
								<form:hidden path="version" />
								<div class="form-group">
									<form:label path="login">Login</form:label>
									<form:input path="login" type="text" cssClass="form-control" cssStyle="width: 400px"/>
								</div>
								
								<div class="form-group">
									<form:label path="nom">Nom</form:label>
									<form:input path="nom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
								</div>
								
								<div class="form-group">
									<form:label path="prenom">Prenom</form:label>
									<form:input path="prenom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
								</div>
								
								<div class="form-group">
									<form:label path="motDePasseTemporaire">Mot de passe</form:label>
									<form:input path="motDePasseTemporaire" type="text" cssClass="form-control" cssStyle="width: 400px"/>
								</div>
								
								<div class="form-group">
									<form:label path="adresse.rue">Rue</form:label>
									<form:input path="adresse.rue" type="text" cssClass="form-control" cssStyle="width: 400px"/>
								</div>
								
								<div class="form-group">
									<form:label path="adresse.ville">Ville</form:label>
									<form:input path="adresse.ville" type="text" cssClass="form-control" cssStyle="width: 400px"/>
								</div>
								
								<div class="form-group">
									<form:label path="adresse.codePostal">Code postal</form:label>
									<form:input path="adresse.codePostal" type="text" cssClass="form-control" cssStyle="width: 400px"/>
								</div>
								
								<div class="form-group">
									<form:label path="adresse.pays">Pays</form:label>
									<form:input path="adresse.pays" type="text" cssClass="form-control" cssStyle="width: 400px"/>
								</div>
								
								<div class="form-group">
									<form:label path="etablissement.id">Etablissement</form:label>
									<form:select path="etablissement.id" id="etablissement.id" cssClass="form-control" cssStyle="width: 400px">
										<form:option value="${null}">Veuillez choisir un etablissement</form:option>
										<c:forEach items="${etablissements}" var="etablissement">
											<form:option value="${etablissement.id}">${etablissement.nom}</form:option>
										</c:forEach>
										
									</form:select>
									<form:errors path="etablissement" cssStyle="color:red"/>					
								</div>
									
								<button class="btn btn-success" type="submit">
									<span class="glyphicon glyphicon-ok"></span>
								</button>
								<button class="btn btn-warning" type="button" onclick="window.location='../utilisateur/list';return false;">
									<span class="glyphicon glyphicon-arrow-left"></span>
								</button>
							</form:form>
						</fieldset>
					</div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/raphael.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris-data.js"></script>
             

</body>

</html>
