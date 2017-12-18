<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Doce App">
	<c:if test="${!noticias.isEmpty() }">
		<div class="album">
			<div id="demo" class="container carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<c:forEach items="#{noticias }" var="noticias" varStatus="s">
						<c:if test="${s.count ==1 }">
							<li data-target="#demo" data-slide-to="${s.count-1 }"
								class="active"></li>
						</c:if>
						<c:if test="${s.count >1 }">
							<li data-target="#demo" data-slide-to="${s.count }"></li>
						</c:if>
					</c:forEach>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<c:forEach items="#{noticias }" var="noticia" varStatus="s">
						<c:if test="${s.count ==1 }">
							<div class="carousel-item active">
						</c:if>
						<c:if test="${s.count >1 }">
							<div class="carousel-item ">
						</c:if>
						<a href="${noticia.link }">
							<img class="d-block w-100 img_carousel" src="<c:if test="${noticia.imagem.isEmpty() }">data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==</c:if>
								<c:if test="${noticia.imagem != null }">${noticia.imagem }</c:if>"
								alt="Second slide">
						</a>
						<a href="${noticia.link }">
							<div class="carousel-caption d-none d-md-block">
								<h1>${noticia.titulo }</h1>
								<h4>${noticia.descricao }</h4>
							</div>
						</a>
						
				</div>
				</c:forEach>

			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>

		</div>
		</div>
	</c:if>

	<br>
	<br>

	<div class="container">
		<div class="row">

			<c:forEach items="${produtos }" var="produto">
				<tags:produtoCard descricao="${produto.descricao }"
					nome="${produto.nome }" link="/cardapio/detalhes/${produto.id }"
					imagem="${produto.imagem }"></tags:produtoCard>
			</c:forEach>

		</div>
	</div>
</tags:pageTemplate>