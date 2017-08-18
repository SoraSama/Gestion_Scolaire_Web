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

    <title>Edition salle</title>



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
                 <a class="navbar-brand" href="accueil"> <i class="fa fa-home"></i> Accueil </a>
            </div>
            
            
                        
              <ul class="nav navbar-center top-nav">
              <h3 style="color:white" align="center"> Gestion Scolaire en ligne  </h3>
                    </ul>                     
               
            
            
              <ul class="nav navbar-right top-nav">
            
              <h3 style="color:white"> Bienvenue  </h3>
			   <a href="<c:url value="/logout"/>">logout</a>     
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
			<legend>Edition de la liste des salles</legend>
			<form:form modelAttribute="salle" action="save" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />
				<div class="form-group">
					<form:label path="nom">Nom</form:label>
					<form:input path="nom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
				
				<div class="form-group">
					<form:label path="capacite">Capacite de la classe</form:label>
					<form:input path="capacite" type="number" cssClass="form-control" cssStyle="width: 400px"/>
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
					
				<div class="form-group">
					<form:label path="matieresExclues">Matieres Impraticables</form:label>
					<form:select path="matieresExclues" id="matieresExclues" multiple="multiple" cssClass="form-control" cssStyle="width: 400px">
						<c:forEach items="${matieres}" var="matiere">
							<form:option value="${matiere.nom}">${matiere.nom}</form:option>
						</c:forEach>
						
					</form:select>
					<form:errors path="matieresExclues" cssStyle="color:red"/>					
				</div>	
				
				<button class="btn btn-success" type="submit">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<button class="btn btn-warning" type="button" onclick="window.location='../salle/list';return false;">
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
