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

    <title>Edition classeProfesseur</title>



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
                  <a class="navbar-brand" href="http://localhost:8080//GestionScolaireWeb/accueil">Accueil</a>
            </div>
 
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                          
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/classe/list"> Classes</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/matiere/list"> Matieres</a>
                    </li>

                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/professeur/list"> Professeurs </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/salle/list">Salles</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/utilisateur/list">Utilisateurs</a>
                    </li>
                      <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/etablissement/list">Etablissement</a>
                    </li>
                    
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/classeMatiere/list"> Classe Matiere </a>
                    </li>

                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/classeProfesseur/list"> Classe Professeur </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/classeSalle/list"> Classe Salle </a>
                    </li>
                    
                    <li>
                        <a href="http://localhost:8080//GestionScolaireWeb/calendar"> Emplois du temps</a>
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
							<legend>Edition de la liste des classeProfesseurs</legend>
							<form:form modelAttribute="classeProfesseur" action="save" method="post">
								<form:hidden path="id" />
								<form:hidden path="version" />
								<div class="form-group">
									<form:label path="classe.id">Nom de la classe</form:label>
									<form:select path="classe.id" id="classe.id" cssClass="form-control" cssStyle="width: 400px">
										<form:option value="${null}">Veuillez choisir une classe</form:option>
										<c:forEach items="${classes}" var="classe">
											<form:option value="${classe.id}">${classe.nom}</form:option>
										</c:forEach>
										
									</form:select>
									<form:errors path="classe" cssStyle="color:red"/>					
								</div>
								
								<div class="form-group">
									<form:label path="professeur.id">Nom de la professeur</form:label>
									<form:select path="professeur.id" id="professeur.id" cssClass="form-control" cssStyle="width: 400px">
										<form:option value="${null}">Veuillez choisir une professeur</form:option>
										<c:forEach items="${professeurs}" var="professeur">
											<form:option value="${professeur.id}">${professeur.nom}</form:option>
										</c:forEach>
										
									</form:select>
									<form:errors path="professeur" cssStyle="color:red"/>					
								</div>
									
								<button class="btn btn-success" type="submit">
									<span class="glyphicon glyphicon-ok"></span>
								</button>
								<button class="btn btn-warning" type="button" onclick="window.location='../classeProfesseur/list';return false;">
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
