<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Alteração de Pedidos">
	<br>
	<br>
	<div class="container ">
		<div class="container-fluid ">
			<h1>Alteração de Pedido</h1>
			<hr>
			<form:form action="/compras/alterar" method="post">			
				<div class="form-group row">
					<label for="id" class="col-sm-2 col-form-label">
						Código:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="codigo" name="codigo" value="${compra.id }" disabled
							placeholder="ID da compra">
						<input type="hidden" id="id" name="id" value="${compra.id }" />
					</div>
				</div>	
				<div class="form-group row">
					<label for="nome" class="col-sm-2 col-form-label">
						Nome:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nome" name="nome" value="${compra.nome }"
							placeholder="Nome do responsável">
					</div>
				</div>	
				<div class="form-group row">
					<label for="endereco" class="col-sm-2 col-form-label">
						Endereço:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="endereco" name="endereco" value="${compra.endereco }"
							placeholder="Endereço do responsável">
					</div>
				</div>
				<div class="form-group row">
					<label for="telefone" class="col-sm-2 col-form-label">
						Telefone:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="telefone" name="telefone" value="${compra.telefone }"
							placeholder="Telefone do responsável">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">
						Email:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="email" name="email" value="${compra.email }"
							placeholder="Email do responsável">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="valor_total" class="col-sm-2 col-form-label">
						Valor Total:
					</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="valor_total" name="valor_total" value="${compra.valor_total }"
							placeholder="Valor total da compra">
					</div>
				</div>
					
				<div class="form-group row">
					<label for="status" class="col-sm-2 col-form-label">
						Status:
					</label>
					<div class="col-sm-10">
						<select class="form-control" id="status" name="status">
							<c:forEach items="${status }" var="s" >
						        <option>${s }</option>
							</c:forEach>
				      	</select>
					</div>
				</div>
					
				<button type="submit" class="btn btn-success btn-lg btn-block" >Salvar</button>
				<hr>
				
			</form:form>
			</div>
			<h2>Produtos solicitados</h2>
			<hr>
			<br>	
			
			<c:forEach items="${compra.itens }" var="item">
				<div class="row">
					<div class="col-sm-2">
						<img class="img_produto_tabela"
							src="<c:if test="${item.produto.imagem.isEmpty() }">data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==</c:if>
										<c:if test="${item.produto.imagem != null }">${item.produto.imagem }</c:if>"
							alt="Produto"  />
			
					</div>
			
					<div class="col-sm-4">
						<h4>${item.produto.nome }</h4>
						<p>${item.produto.descricao }</p>
					</div>
					<div class="col-sm-2">						
							<h4>Valor Unitário: R$ ${item.valor_unitario}</h4>						
					</div>
			
			
					<div class="col-sm-2">
						<h4>Quantidade: ${item.quantidade }</h4>
					</div>
					<div class="col-sm-2">
						<h4>Total: R$ ${item.valor_total }</h4>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
</tags:pageTemplate>