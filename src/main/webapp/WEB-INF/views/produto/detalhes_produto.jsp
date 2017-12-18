<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Doce App - Alterar Produtos">
	<br>
	<br>
	<div class="container ">
		<div class="container-fluid ">
			<h1>Detalhes</h1>
			<hr>
			<div class="row">
				<div class="col-sm-7">
					<h2>${produto.nome }</h2>
					<hr>
					<img class="img_produto_cadastro" 
						src	="
							<c:if test="${produto.imagem.isEmpty() }">data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==</c:if>
							<c:if test="${produto.imagem != null }">${produto.imagem }</c:if>"
							alt="Produto" width="140" height="140" />
					<br>
					<br>
				</div>
				<div class="col-sm-5">
					
					<h2>Adicionar ao carrinho?</h2>
					<hr>
					<p>
					<c:if test="${produto.valor_desconto == null}">
						<h3>Preço: R$ ${produto.valor }</h3>
					</c:if>
					<c:if test="${produto.valor_desconto != null}">
						<h4>Preço: De <s>R$ ${produto.valor }</s></h4>
						<h3>Por R$ ${produto.valor_desconto }</h3>
					</c:if>
					</p>
					<form:form action="/carrinho/adicionar" method="post">						
						<input type="hidden" name="id" value="${produto.id }"> 
						<div class="form-group">
						    <label for="exampleInputEmail1">Quantidade desejada:</label>
						    <input type="number" min="1" class="form-control form-control-lg" 
						    id="quantidade" name="quantidade"  required 
						    placeholder="Informe a quantidade desejada desse produto" >
						    <small class="form-text text-muted">Informe a quantidade desejada desse produto.</small>
					  	</div>			
							
						<button type="submit" class="btn btn-success btn-lg btn-block" >Adicionar</button>
					</form:form>
				</div>
			</div>
			
		</div>
	</div>
	
</tags:pageTemplate>