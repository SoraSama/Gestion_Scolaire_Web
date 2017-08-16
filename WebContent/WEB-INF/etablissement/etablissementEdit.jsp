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
      <li class="active"><a href="../etablissement/list"><b><spring:message code="MenuNav.ville" /></b></a></li>
      <li><a href="#"><spring:message code="MenuNav.compagnie" /></a></li>
      <li><a href="#"><spring:message code="MenuNav.login" /></a></li>
    </ul>
  </div>
</nav>
<div style="height: 100px;"></div>
	<div class="container">
		<fieldset>
			<legend>Edition de la liste des etablissements</legend>
			<form:form modelAttribute="etablissement" action="save" method="post">
				<form:hidden path="id" />
				<form:hidden path="version" />
				<div class="form-group">
					<form:label path="nom">Nom</form:label>
					<form:input path="nom" type="text" cssClass="form-control" cssStyle="width: 400px"/>
				</div>
				
				<div class="form-group">
					<form:label path="type">Type d'etablissement</form:label>
					<form:select path="type" id="type" cssClass="form-control" cssStyle="width: 400px">
						<form:option value="">Veuillez choisir le type d'etablissement</form:option>
						<c:forEach items="${typeEta}" var="type">
							<form:option value="${type}">${type}</form:option>
						</c:forEach>
						
					</form:select>
				</div>
				
				<div class="form-group">
					<form:label path="logo">Logo</form:label>
					<form:input path="logo" type="file" cssClass="form-control" cssStyle="width: 400px"/>
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
					
				<button class="btn btn-success" type="submit">
					<span class="glyphicon glyphicon-ok"></span>
				</button>
				<button class="btn btn-warning" type="button" onclick="window.location='../etablissement/list';return false;">
					<span class="glyphicon glyphicon-arrow-left"></span>
				</button>
			</form:form>
		</fieldset>
	</div>
</body>
</html>