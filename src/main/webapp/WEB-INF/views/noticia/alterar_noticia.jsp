<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Doce App - Novo Produto">
	<br>
	<br>
	<div class="container ">
		<div class="container-fluid ">
			<h1>Alterar Notícia</h1>
			<hr>
			<form:form action="/noticias/alterar" method="post" enctype="multipart/form-data" >
				<input type="hidden" value="${noticia.id }" name="id" />
				<div class="form-group row">
					<label for="titulo" class="col-sm-2 col-form-label">
						Título:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="titulo" name="titulo" value="${noticia.titulo }"
							placeholder="Título da notícia">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="descricao" class="col-sm-2 col-form-label">
						Descrição:
					</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="descricao" rows="3" name="descricao" 
							placeholder="Informe a descrição da Notícia">${noticia.descricao }</textarea>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="link" class="col-sm-2 col-form-label">
						Link:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="link" name="link" value="${noticia.link }"
							placeholder="Link da notícia">
					</div>
				</div>
				
				
				<div class="form-group row">
					<label for="imagem" class="col-sm-2 col-form-label">
						Imagem:
					</label>
					<div class="col-sm-10">		
						<div id="image-holder">
							<img class="img_produto_cadastro" 
								src="
									<c:if test="${noticia.imagem.isEmpty() }">data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==</c:if>
									<c:if test="${noticia.imagem != null }">${noticia.imagem }</c:if>"
								alt="" width="140" height="140">
							<input type="hidden" id="imagem" name="imagem"	value="${noticia.imagem }" />
						</div>								
					    
						<input id="imagem_principal" name="imagem_principal" type="file" class="form-control"></input>
						
					</div>
				</div>
				
				<br>
				<br>
				<button type="submit" class="btn btn-primary btn-lg btn-block" >Cadastrar</button>
				<button type="reset" class="btn btn-warning btn-lg btn-block">Limpar</button>
			</form:form>

			<form:form action="/noticias/excluir" method="POST">
				<br>
				<input type="hidden" name="id" value="${noticia.id}" />
				<input type="submit" class="btn btn-lg
				 btn-danger btn-block" value="Excluir">
			</form:form>
		</div>
	</div>
</tags:pageTemplate>