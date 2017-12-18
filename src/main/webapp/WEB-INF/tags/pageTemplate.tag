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
<spring:url value="/resources/js/doce.js" var="docejs" />
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
					<li class="nav-item "><a class="nav-link" href="/cardapio/">Cardápio
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/produtos/lista">Meus Produtos <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/compras/pedidos">Pedidos <span class="sr-only">(current)</span>
					</a></li>
					
					<li class="nav-item printaCEL">
						<a class="nav-link"
								href="/carrinho/">
								<strong>Meu Carrinho (${carrinhoCompras.quantidade})</strong>
								<span class="sr-only">(current)</span>
							</a></li>

				</ul>
				<span class="printaPC float-right">
					<div class="collapse navbar-collapse" id="navbarColor01">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item"><a class="nav-link"
								href="/carrinho/">
								<strong>Meu Carrinho (${carrinhoCompras.quantidade})</strong>
								<span class="sr-only">(current)</span>
							</a></li>
						</ul>
					</div>
				</span>
			</div>
		</nav>

	</header>
	<jsp:doBody />

	<!-- FOOTER -->
	<br>
	<br>
	<footer class="footer bg-light">

		<div class=" navbar-dark bg-dark">

			<div class="container bg-dark">
				<p>
					© 2017 Buquê de Coxinha <span class="float-right"> <a
						href="https://www.facebook.com/leorochaz">Desenvolvido por
							Leonardo Rocha</a>
					</span>
				</p>
			</div>

		</div>

	</footer>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="${jquery}"></script>
	<script src="${popper}"></script>
	<script src="${bootstrapjs}"></script>
	<script src="${docejs}"></script>
</body>
</html>

