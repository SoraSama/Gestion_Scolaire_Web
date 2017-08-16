<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="ville.edit.title" /></title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" ><spring:message code="accueil.title2" /></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="../accueil"><spring:message code="MenuNav.accueil" /></a></li>
      <li><a href="../aeroport/list"><spring:message code="MenuNav.aeroport" /></a></li>
      <li><a href="../vol/list"><spring:message code="MenuNav.vol" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.reservation" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.passager" /></a></li>
      <li><a href="../escale/list"><spring:message code="MenuNav.escale" /></a></li>
      <li><a href="../client/list"><spring:message code="MenuNav.client" /></a></li>
      <li class="active"><a href="../classe/list"><b><spring:message code="MenuNav.ville" /></b></a></li>
      <li><a href="#"><spring:message code="MenuNav.compagnie" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.login" /></a></li>
    </ul>
  </div>
</nav>
<div style="height: 100px;"></div>
	<div class="container">
		<fieldset>
			<legend>Edition de la liste des classes</legend>
			<form:form modelAttribute="classe" action="save" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />
				<div class="form-group">
					<form:label path="nom">Nom</form:label>
					<form:input path="nom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
				
				<div class="form-group">
					<form:label path="nbEleve">Nombre d'eleves</form:label>
					<form:input path="nbEleve" type="number" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
				
				<div class="form-group">
					<form:label path="professeurPrincipal">Professeur principal</form:label>
					<form:input path="professeurPrincipal" type="text" cssClass="form-control" cssStyle="width: 400px"/>
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
				<button class="btn btn-warning" type="button" onclick="window.location='../classe/list';return false;">
					<span class="glyphicon glyphicon-arrow-left"></span>
				</button>
			</form:form>
		</fieldset>
	</div>
</body>
</html>