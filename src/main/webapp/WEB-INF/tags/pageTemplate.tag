<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="titulo" required="true"%>
<%@ attribute name="bodyClass" required="false"%>
<%@ attribute name="extraScripts" fragment="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!doctype html>
<html lang="pt_BR">
<head>
<spring:url value="/resources/css/bootstrap.min.css" var="bootstrap" />
<spring:url value="/resources/css/loading-spin.svg" var="loading-spin" />
<spring:url value="/resources/css/doce.css" var="docecss" />
<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapjs" />
<spring:url value="/resources/js/jquery-3.2.1.slim.min.js" var="jquery" />
<spring:url value="/resources/js/popper.min.js" var="popper" />
<spring:url value="/resources/js/doce.js" var="docejs" />
<spring:url value="/resources/js/fontawesome-all.min.js" var="fonteawesome" />
<spring:url value="/resources/js/imgur/imgur.js" var="imgur" />
<spring:url value="/resources/js/imgur/upload.js" var="imgur_upload" />


<title>S.O.S Mão na Massa - ${titulo }</title>
<link rel="icon" type="image/svg+xml" href="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjUxMnB4IiBoZWlnaHQ9IjUxMnB4IiB2aWV3Qm94PSIwIDAgNDYuMDAxIDQ2LjAwMSIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNDYuMDAxIDQ2LjAwMTsiIHhtbDpzcGFjZT0icHJlc2VydmUiPgo8Zz4KCTxnPgoJCTxwYXRoIGQ9Ik0zOS40NzksMjEuMTc2YzAtMS4zMzEtMC4zMzEtMi41ODgtMC45MTUtMy43MDFjLTAuMTgyLDAuMTA0LTAuMzY2LDAuMjA5LTAuNTU3LDAuMzE5bC0yLjA1MSwxLjE3NiAgICBjMC4zMzIsMC42NzEsMC41MjIsMS40MTcsMC41MjIsMi4yMDZjMCwxLjE4OC0wLjQyNCwyLjI3OS0xLjEzLDMuMTU2YzEuNjA3LDAuNzY4LDIuNiwxLjgwMywyLjYsMi45NDcgICAgYzAsMi4zNTQtNC4xODQsNC4yNjQtOS4zNDUsNC4yNjRjLTQuNTczLDAtOC4zNzEtMS40OTktOS4xOC0zLjQ3OWMtMC41MTgsMC4yNDQtMS4wODcsMC4zOTEtMS42OTQsMC4zOTEgICAgYy0wLjk0NCwwLTEuODAyLTAuMzQ0LTIuNDkxLTAuODk2Yy0wLjkyNCwxLjAwMi0yLjIzNCwxLjYzMy0zLjY5MywxLjYzM2MtMi43OTcsMC01LjA2NS0yLjMwNi01LjA2NS01LjE0NyAgICBjMC0yLjU5MiwxLjg4OC00LjcyOSw0LjM0MS01LjA4N2MtMC4xNDItMC40NjUtMC4yMjQtMC45NTEtMC4yMjQtMS40NTZjMC0zLjA0NiwyLjc2NS01LjUxNSw2LjE3Ni01LjUxNSAgICBjMC4xNDEsMCwwLjI3OCwwLjAxMSwwLjQxNywwLjAyYy0wLjM1OC0wLjU5My0wLjU4LTEuMjcxLTAuNTgtMi4wMDRjMC0xLjY4LDEuMDc3LTMuMTE5LDIuNjA4LTMuNzI5ICAgIGMtMC4wMjYtMS4xLDAuMTU1LTIuMTkxLDAuNTE2LTMuMjIyYy0zLjI5NywwLjUwMy01Ljg2NywzLjE2NS02LjEwNiw2LjQ1Yy0zLjMzNSwxLjEzMy01Ljc3MSw0LjAxNC02LjAxMiw3LjQ0ICAgIEM1LjEzOCwxOC4zNSwzLjQ4LDIxLjA0MiwzLjQ4LDI0LjA0NGMwLDMuNzAyLDIuNDU5LDYuODMsNS44MTMsNy44MTdsMS41MTMsOS41NzhjMC4zODcsMi40NTUsMi4zNTcsNC4yNjQsNC43NzgsNC41MTIgICAgYzAuMTg2LDAuMDIsMC4zNjcsMC4wNSwwLjU1OCwwLjA1aDEzLjAyMWMwLjE4OSwwLDAuMzcxLTAuMDMsMC41NTgtMC4wNWMyLjQyMS0wLjI0OCw0LjM5Mi0yLjA1Nyw0Ljc3OC00LjUxbDEuMjczLTguMTQgICAgYzAuMDA0LTAuMDAxLDAuMDA4LTAuMDAzLDAuMDEyLTAuMDA0YzMuMTg4LTEuMjcyLDUuMTY0LTMuNDI1LDUuMTY0LTYuMDE5YzAtMC45NS0wLjI3OS0yLjQ4OS0xLjc2OC0zLjk0MSAgICBDMzkuMzc4LDIyLjY0MSwzOS40NzksMjEuOTE2LDM5LjQ3OSwyMS4xNzZ6IE0xNC45NjMsNDEuODM1bC0xLjQ3Ny05Ljg5NmMwLjcyNS0wLjE4NCwxLjQyNC0wLjQ1OSwyLjA3Mi0wLjgzNCAgICBjMC4xMDgsMC4wMzUsMC4yMjMsMC4wNTEsMC4zMzMsMC4wODJjMC4wMSwwLjAwMiwwLjAyMSwwLjAwNCwwLjAzMSwwLjAwNkwxNy44MTYsNDRsLTAuMzIzLDAuMDAyICAgIEMxNi4yMjksNDQuMDEsMTUuMTUsNDMuMDg2LDE0Ljk2Myw0MS44MzV6IE0yMS40MDMsNDRoLTAuMDA1VjMzLjI4MmMwLjAwMSwwLjAwMSwwLjAwMywwLjAwMSwwLjAwNSwwLjAwMiAgICBjMC43OTYsMC4zMTIsMS42MzgsMC41NTgsMi41LDAuNzQ3YzAuMDgzLDAuMDE4LDAuMTY2LDAuMDM5LDAuMjUsMC4wNTdjMC4wODIsMC4wMTgsMC4xNjQsMC4wMjgsMC4yNDUsMC4wNDRWNDRIMjEuNDAzeiAgICAgTTI3LjQ4Niw0NGwxLjQzNi05LjY0OEwzMS40NjQsMzRsMCwwbC0xLjEzNyw3LjgyN2MtMC4xODQsMS4yNjItMS4yNzIsMi4xOTItMi41NDgsMi4xNzdMMjcuNDg2LDQ0eiIgZmlsbD0iI0ZGREE0NCIvPgoJCTxwYXRoIGQ9Ik0yNS44NjQsMTMuOTU0YzEuNzA4LDAuMjYxLDMuNDEsMC43MDMsNC45NTYsMS4zNzVjMC45NzMsMC40MjQsMS43NjgsMS4wMTgsMi40OCwxLjcwNyAgICBjMi44NS0xLjYzNiw2LjEwMy0zLjUwMiw2LjE5Ny0zLjU1OGMyLjg5MS0xLjY2OSwzLjg4MS01LjM2NSwyLjIxMy04LjI1NGMtMS4xMTktMS45MzgtMy4xNDktMy4wMjEtNS4yMzctMy4wMjEgICAgYy0xLjAxOSwwLTIuMDUsMC4yNTgtMi45OTYsMC43OTlDMzIuMzU2LDEuMDc2LDMwLjMzMiwwLDI4LjI1LDBjLTEuMDIzLDAtMi4wNjIsMC4yNi0zLjAxNCwwLjgwOSAgICBjLTIuODg4LDEuNjY3LTMuODc5LDUuMzYzLTIuMjExLDguMjUzQzIzLjA3Miw5LjE0NSwyNC40NDEsMTEuNTA0LDI1Ljg2NCwxMy45NTR6IiBmaWxsPSIjRkZEQTQ0Ii8+Cgk8L2c+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" />
<link rel="manifest" href="/manifest">
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
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="/">
				<h2><img  width="30" height="30" class="d-inline-block align-top" src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjUxMnB4IiBoZWlnaHQ9IjUxMnB4IiB2aWV3Qm94PSIwIDAgNDYuMDAxIDQ2LjAwMSIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNDYuMDAxIDQ2LjAwMTsiIHhtbDpzcGFjZT0icHJlc2VydmUiPgo8Zz4KCTxnPgoJCTxwYXRoIGQ9Ik0zOS40NzksMjEuMTc2YzAtMS4zMzEtMC4zMzEtMi41ODgtMC45MTUtMy43MDFjLTAuMTgyLDAuMTA0LTAuMzY2LDAuMjA5LTAuNTU3LDAuMzE5bC0yLjA1MSwxLjE3NiAgICBjMC4zMzIsMC42NzEsMC41MjIsMS40MTcsMC41MjIsMi4yMDZjMCwxLjE4OC0wLjQyNCwyLjI3OS0xLjEzLDMuMTU2YzEuNjA3LDAuNzY4LDIuNiwxLjgwMywyLjYsMi45NDcgICAgYzAsMi4zNTQtNC4xODQsNC4yNjQtOS4zNDUsNC4yNjRjLTQuNTczLDAtOC4zNzEtMS40OTktOS4xOC0zLjQ3OWMtMC41MTgsMC4yNDQtMS4wODcsMC4zOTEtMS42OTQsMC4zOTEgICAgYy0wLjk0NCwwLTEuODAyLTAuMzQ0LTIuNDkxLTAuODk2Yy0wLjkyNCwxLjAwMi0yLjIzNCwxLjYzMy0zLjY5MywxLjYzM2MtMi43OTcsMC01LjA2NS0yLjMwNi01LjA2NS01LjE0NyAgICBjMC0yLjU5MiwxLjg4OC00LjcyOSw0LjM0MS01LjA4N2MtMC4xNDItMC40NjUtMC4yMjQtMC45NTEtMC4yMjQtMS40NTZjMC0zLjA0NiwyLjc2NS01LjUxNSw2LjE3Ni01LjUxNSAgICBjMC4xNDEsMCwwLjI3OCwwLjAxMSwwLjQxNywwLjAyYy0wLjM1OC0wLjU5My0wLjU4LTEuMjcxLTAuNTgtMi4wMDRjMC0xLjY4LDEuMDc3LTMuMTE5LDIuNjA4LTMuNzI5ICAgIGMtMC4wMjYtMS4xLDAuMTU1LTIuMTkxLDAuNTE2LTMuMjIyYy0zLjI5NywwLjUwMy01Ljg2NywzLjE2NS02LjEwNiw2LjQ1Yy0zLjMzNSwxLjEzMy01Ljc3MSw0LjAxNC02LjAxMiw3LjQ0ICAgIEM1LjEzOCwxOC4zNSwzLjQ4LDIxLjA0MiwzLjQ4LDI0LjA0NGMwLDMuNzAyLDIuNDU5LDYuODMsNS44MTMsNy44MTdsMS41MTMsOS41NzhjMC4zODcsMi40NTUsMi4zNTcsNC4yNjQsNC43NzgsNC41MTIgICAgYzAuMTg2LDAuMDIsMC4zNjcsMC4wNSwwLjU1OCwwLjA1aDEzLjAyMWMwLjE4OSwwLDAuMzcxLTAuMDMsMC41NTgtMC4wNWMyLjQyMS0wLjI0OCw0LjM5Mi0yLjA1Nyw0Ljc3OC00LjUxbDEuMjczLTguMTQgICAgYzAuMDA0LTAuMDAxLDAuMDA4LTAuMDAzLDAuMDEyLTAuMDA0YzMuMTg4LTEuMjcyLDUuMTY0LTMuNDI1LDUuMTY0LTYuMDE5YzAtMC45NS0wLjI3OS0yLjQ4OS0xLjc2OC0zLjk0MSAgICBDMzkuMzc4LDIyLjY0MSwzOS40NzksMjEuOTE2LDM5LjQ3OSwyMS4xNzZ6IE0xNC45NjMsNDEuODM1bC0xLjQ3Ny05Ljg5NmMwLjcyNS0wLjE4NCwxLjQyNC0wLjQ1OSwyLjA3Mi0wLjgzNCAgICBjMC4xMDgsMC4wMzUsMC4yMjMsMC4wNTEsMC4zMzMsMC4wODJjMC4wMSwwLjAwMiwwLjAyMSwwLjAwNCwwLjAzMSwwLjAwNkwxNy44MTYsNDRsLTAuMzIzLDAuMDAyICAgIEMxNi4yMjksNDQuMDEsMTUuMTUsNDMuMDg2LDE0Ljk2Myw0MS44MzV6IE0yMS40MDMsNDRoLTAuMDA1VjMzLjI4MmMwLjAwMSwwLjAwMSwwLjAwMywwLjAwMSwwLjAwNSwwLjAwMiAgICBjMC43OTYsMC4zMTIsMS42MzgsMC41NTgsMi41LDAuNzQ3YzAuMDgzLDAuMDE4LDAuMTY2LDAuMDM5LDAuMjUsMC4wNTdjMC4wODIsMC4wMTgsMC4xNjQsMC4wMjgsMC4yNDUsMC4wNDRWNDRIMjEuNDAzeiAgICAgTTI3LjQ4Niw0NGwxLjQzNi05LjY0OEwzMS40NjQsMzRsMCwwbC0xLjEzNyw3LjgyN2MtMC4xODQsMS4yNjItMS4yNzIsMi4xOTItMi41NDgsMi4xNzdMMjcuNDg2LDQ0eiIgZmlsbD0iI0ZGREE0NCIvPgoJCTxwYXRoIGQ9Ik0yNS44NjQsMTMuOTU0YzEuNzA4LDAuMjYxLDMuNDEsMC43MDMsNC45NTYsMS4zNzVjMC45NzMsMC40MjQsMS43NjgsMS4wMTgsMi40OCwxLjcwNyAgICBjMi44NS0xLjYzNiw2LjEwMy0zLjUwMiw2LjE5Ny0zLjU1OGMyLjg5MS0xLjY2OSwzLjg4MS01LjM2NSwyLjIxMy04LjI1NGMtMS4xMTktMS45MzgtMy4xNDktMy4wMjEtNS4yMzctMy4wMjEgICAgYy0xLjAxOSwwLTIuMDUsMC4yNTgtMi45OTYsMC43OTlDMzIuMzU2LDEuMDc2LDMwLjMzMiwwLDI4LjI1LDBjLTEuMDIzLDAtMi4wNjIsMC4yNi0zLjAxNCwwLjgwOSAgICBjLTIuODg4LDEuNjY3LTMuODc5LDUuMzYzLTIuMjExLDguMjUzQzIzLjA3Miw5LjE0NSwyNC40NDEsMTEuNTA0LDI1Ljg2NCwxMy45NTR6IiBmaWxsPSIjRkZEQTQ0Ii8+Cgk8L2c+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" />
					<strong>S.O.S MÃO NA MASSA</strong></h2></a>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item "><a class="nav-link" href="/cardapio/">Cardápio
							<span class="sr-only">(current)</span>
					</a></li>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><a class="nav-link"
							href="/produtos/lista">Meus Produtos <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/compras/pedidos">Pedidos <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/noticias/">Notícias <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/usuarios/lista">Usuários <span class="sr-only">(current)</span>
						</a></li>
					</sec:authorize>
					
					<sec:authorize access="!isAuthenticated()">
						<li class="nav-item"><a class="nav-link"
							href="/produtos/lista">Administração <span class="sr-only">(current)</span>
						</a></li>
					</sec:authorize>
					
					<li class="nav-item printaCEL">
						<a class="nav-link"
								href="/carrinho/">
								<strong>Meu Carrinho (${carrinhoCompras.quantidade})</strong>
								<span class="sr-only">(current)</span>
							</a></li>
					<li class="nav-item printaCEL">
						<sec:authorize access="isAuthenticated()">
							<a class="nav-link"
									href="/logout">
									<strong>Sair</strong>
									<span class="sr-only">(current)</span>
								</a>
						</sec:authorize>
					</li>

				</ul>
				<span class="printaPC float-right">
					<div class="collapse navbar-collapse" id="navbarColor01">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item"><a class="nav-link"
								href="/carrinho/">
								<strong>Meu Carrinho (${carrinhoCompras.quantidade})</strong>
								<span class="sr-only">(current)</span>
							</a></li>
							<sec:authorize access="isAuthenticated()">
								<li class="nav-item"><a class="nav-link"
									href="/logout">
									<strong>Sair </strong>
									<span class="sr-only">(current)</span>
								</a></li>
							</sec:authorize>
						</ul>
					</div>
				</span>
			</div>
		</nav>

	</header>
		<div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-bottom: 0px">
		  <strong>Atenção Cliente!</strong> Estamos atendendo apenas pedidos de Jacareí e alguns bairros de São José dos Campos.
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
	<jsp:doBody />  

	<!-- FOOTER -->
	<br>
	<br>
	<footer class="footer bg-light">

		<div class=" navbar-dark bg-dark">

			<div class="container bg-dark">
				<p>
					© 2017 S.O.S Mão na Massa <br>
					<span class=""> <a href="https://www.facebook.com/leorochaz">Desenvolvido por Leonardo Rocha</a></span>
					<div>Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
				</p>
			</div>

		</div>

	</footer>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="${jquery}"></script>
	<script src="${popper}"></script>
	<script src="${bootstrapjs}"></script>
	<script src="${fonteawesome}"></script>
	<script src="${imgur}"></script>
	<script src="${imgur_upload}"></script>
	<script src="${docejs}"></script>
</body>
</html>

