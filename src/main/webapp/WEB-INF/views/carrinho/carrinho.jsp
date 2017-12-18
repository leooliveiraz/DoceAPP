<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Doce App - Carrinho de Compras">
	<br>
	<br>
	<div class="container">
		<h1>Carrinho de Compras</h1>
		<hr>
		<c:if test="${carrinhoCompras.itens.isEmpty() }">
			<h2>Não há nenhum produto no momento</h2>
		</c:if>
		
		<c:if test="${!carrinhoCompras.itens.isEmpty() }">
			<a href="/carrinho/finalizar/" class="btn btn-success btn-lg btn-block" >Finalizar Compra</a>
			<br>
		</c:if>
		
		<c:forEach items="${carrinhoCompras.itens }" var="item">
		<tags:itemCarrinho item="${item }" 
			descricao="${item.produto.descricao }"
			id="${item.produto.id}"
			imagem="${item.produto.imagem}"
			nome="${item.produto.nome}"
			valor="${item.produto.valor}"
			valor_desconto="${item.produto.valor_desconto}" />
		</c:forEach>
		<div class="row">
			<div class="col-sm-2">	
			</div>
	
			<div class="col-sm-4">
			</div>
			<div class="col-sm-2">
			</div>
	
	
			<div class="col-sm-2">
				<h4>Quantidade: ${carrinhoCompras.quantidade }</h4>
			</div>
			<div class="col-sm-2">
				<h4>Total: RS ${carrinhoCompras.total }</h4>
			</div>
		</div>
	</div>
</tags:pageTemplate>
