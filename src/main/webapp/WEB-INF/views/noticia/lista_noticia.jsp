<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<tags:pageTemplate titulo="Gerenciamento de Notícias">
	<br><br>
	<div class="container">
		<h1>Notícias</h1>		
		<hr>
		
		<tags:msgSucesso sucesso="${sucesso }" />
		<tags:msgSucesso sucesso="${erro }" />

		
		<c:if test="${noticias.isEmpty() }">
			<h2>Não há nenhuma notícia no momento</h2>
		</c:if>
		<br>
		<a href="/noticias/nova" class="btn btn-lg btn-block btn-success">Nova Noticia</a>
		<br>
		
		<c:if test="${!noticias.isEmpty() }">
			<div class="printaPC">
				<div class="row table-primary ">
					<div class="col-sm-1" >
						<h4>Código</h4>
					</div>
					<div class="col-sm-3" >
						<h4>Título:</h4>
					</div>
					<div class="col-sm-3" >
						<h4>Descrição</h4>
					</div>
					<div class="col-sm-2" >
						<h4>Link</h4>
					</div>
				</div>
			</div>
		</c:if>		
		
		<br>
		<c:forEach items="${noticias }" var="noticia">
			<a href="/noticias/${noticia.id} ">
				<div class="row">
					<div class="col-sm-1" >
						<span class="printaCEL">Código:</span> <strong>${noticia.id }</strong>
					</div>
					<div class="col-sm-3" >
						<span class="printaCEL">Título:</span> <strong>${noticia.titulo }</strong>
					</div>
					<div class="col-sm-3" >
						<span class="printaCEL">Descrição:</span> <strong>${noticia.descricao }</strong>
					</div>
					<div class="col-sm-2" >
						<span class="printaCEL">Link:</span> <strong>${compra.link }</strong>
					</div>
				</div>
				<hr>
			</a>
		</c:forEach>
	</div>
</tags:pageTemplate>