<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Validação da Compra">
	<br>
	<br>
	<div class="container">
		<h1>Finalizar Compra</h1>
		<hr>
		<h2>Dados Pessoais</h2>
		<form:form action="/carrinho/confirmarcompra" method="POST"  >
			<div class="form-group row">
				<label for="nome" class="col-sm-2 col-form-label">
					Nome:
				</label>
				<div class="col-sm-10">
					<input type="hidden"  id="nome" name="nome" value="${compra.nome }" />
					<h4>${compra.nome }</h4>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="endereco" class="col-sm-2 col-form-label">
					Endereço:
				</label>
				<div class="col-sm-10">
					<input type="hidden" id="endereco" name="endereco" value="${compra.endereco }" />
					<h4>${compra.endereco }</h4>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="telefone" class="col-sm-2 col-form-label">
					Telefone para contato:
				</label>
				<div class="col-sm-10">
					<input type="hidden" id="telefone" name="telefone" value="${compra.telefone }" />
					<h4>${compra.telefone }</h4>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="email" class="col-sm-2 col-form-label">
					Email(Opcional):
				</label>
				<div class="col-sm-10">
					<input type="hidden" id="email" name="email" value="${compra.email }"  />
					<h4>${compra.email }</h4>
				</div>
			</div>
			
			<hr>
			<h2>Carrinho de Compras</h2>
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
					<h4>${carrinhoCompras.quantidade }</h4>
				</div>
				<div class="col-sm-2">
					<h4>R$ ${carrinhoCompras.total }</h4>
				</div>
			</div>
			
			<br>
			<br>
			<button type="submit" class="btn btn-success btn-lg btn-block" >Finalizar!</button>
		</form:form>
	</div>
</tags:pageTemplate>
