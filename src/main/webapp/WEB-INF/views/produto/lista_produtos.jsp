<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<tags:pageTemplate titulo="Gerênciamento de Produtos">
	<br>
	<div class="container">
	
		
		<tags:msgSucesso sucesso="${sucesso }" />
		<tags:msgSucesso sucesso="${erro }" />
		
		<a class="btn btn-success btn-lg btn-block" href="/produtos/novo">Cadastrar um novo produto</a>
		<br>
		<div class="row">
			
			<c:forEach items="${produtos }" var="produto">
				<tags:produtoCard descricao="${produto.descricao }" 
					nome="${produto.nome }" 
					link="/produtos/alterar/${produto.id }" 
					imagem="${produto.imagem }">
				</tags:produtoCard>
			</c:forEach>
		</div>
	</div>
</tags:pageTemplate>