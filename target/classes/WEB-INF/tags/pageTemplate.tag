<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="titulo" required="true" %>
<%@ attribute name="bodyClass" required="false" %>
<%@ attribute name="extraScripts" fragment="true" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="pt_BR">
<head>
	<spring:url value="/resources/css/bootstrap.min.css" var="bootstrap" />
	<spring:url value="/resources/css/doce.css" var="docecss" />
<title>${titulo }</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
	<link href="${bootstrap}" rel="stylesheet" />
	<link href="${docecss}" rel="stylesheet" />	
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<a class="navbar-brand" href="/">DOCE APP</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>
	
			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#">Cardápio
								<span class="sr-only">(current)</span>
						</a>
					</li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" placeholder="Pesquisar..." type="text">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Pesquisar</button>
				</form>
			</div>
		</nav>
		
	</header>
		<jsp:doBody />
		
	<!-- FOOTER -->
	<footer class="container">
		<p class="float-right">
			<a href="#">Back to top</a>
		</p>
		<p>© 2017 Buquê de Coxinha</p>
	</footer>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</body>
</html>

