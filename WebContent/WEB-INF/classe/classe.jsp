<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <title><spring:message code="ville.list.title" /></title>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<title>Liste des classes</title>


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
                <a class="navbar-brand" href="http://localhost:8080//GestionScolaireWeb/accueil"><i class="fa fa-home"></i> Accueil </a>
            </div>

              <ul class="nav navbar-center top-nav">
	              <h3 style="color:white" align="center"> Gestion Scolaire en ligne  </h3>
	                    </ul>                     
	               
	            
	            
	              <ul class="nav navbar-right top-nav">
	            
	              <h3 style="color:white"> Bienvenue  </h3>
				   <a href="<c:url value="/login/list"/>">logout</a>     
               </ul>

            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                          
				                 <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/classe/list"> <i class="fa fa-group"></i> Classes</a>
                    </li>
                    
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/matiere/list"><i class="fa fa-book"></i> Matieres</a>
                    </li>

                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/professeur/list"> <i class="fa fa-mortar-board"></i> Professeurs </a>
                    </li>
                    
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/salle/list"> <i class="glyphicon glyphicon-blackboard"></i> Salles</a>
                    </li>
                    
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/utilisateur/list"> <i class="fa fa-user"></i> Utilisateurs</a>
                    </li>
                    
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/etablissement/list"> <i class="fa fa-institution"></i> Etablissement</a>
                    </li>
                    
<!--                     <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/classeMatiere/list"> Classe Matiere </a>
                    </li>

                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/classeProfesseur/list"> Classe Professeur </a>
                    </li>
                    
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/classeSalle/list"> Classe Salle </a>
                    </li>
                     -->
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/calendar"> <i class="fa fa-clock-o"> </i> Emplois du temps</a>
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
							<legend>Liste des classes</legend>
							<table class="table table-striped">
								<tr>
									<th>Id</th>
									<th>Version</th>
									<th>Nom</th>
									<th>Nombre d'eleves</th>
									<th>Professeur principal</th>
									<th>Nom etablissement</th>
									<th></th>
									<th></th>
								</tr>
				
								<c:forEach items="${classes}" var="classe">
									<tr>
										<td>${classe.id}</td>
										<td>${classe.version}</td>
										<td>${classe.nom}</td>
										<td>${classe.nbEleve}</td>
										<td>${classe.professeurPrincipal}</td>
										<td>${classe.etablissement.nom}</td>
				
										
										<td><a href="edit?id=${classe.id}" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-pencil"></span></a></td>
										<td><a href="delete?id=${classe.id}" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a></td>
										<td><a href="http://localhost:8080//GestionScolaireWeb/calendar" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-calendar"></span></a></td>
									</tr>
								</c:forEach>
				
								<tr>
									<td colspan="8"><a href="add" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
								</tr>
							</table>
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
