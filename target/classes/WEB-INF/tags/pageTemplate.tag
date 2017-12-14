<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="titulo" required="true"%>
<%@ attribute name="bodyClass" required="false"%>
<%@ attribute name="extraScripts" fragment="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="pt_BR">
<head>
<spring:url value="/resources/css/bootstrap.min.css" var="bootstrap" />
<spring:url value="/resources/css/doce.css" var="docecss" />
<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapjs" />
<spring:url value="/resources/js/jquery-3.2.1.slim.min.js" var="jquery" />
<spring:url value="/resources/js/popper.min.js" var="popper" />
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
					<li class="nav-item active"><a class="nav-link" href="#">Cardápio
							<span class="sr-only">(current)</span>
					</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" placeholder="Pesquisar..."
						type="text">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Pesquisar</button>
				</form>
			</div>
		</nav>

	</header>
	<jsp:doBody />

	<!-- FOOTER -->
	<br>
	<br>
	<footer class="footer bg-light">

		<div class=" navbar-dark bg-dark">

			<div class="container">
				<p>© 2017 Buquê de Coxinha</p>
			</div>
		</div>

	</footer>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="${jquery}"></script>
	<script
		src="${popper}" ></script>
	<script
		src="${bootstrapjs}"></script>
</body>
</html>

