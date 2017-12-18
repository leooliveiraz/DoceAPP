<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Doce App - Pedidos">
	<br><br>
	<div class="container">
		<h1>Pedidos Solicitados</h1>		
		<hr>
		
		<tags:msgSucesso sucesso="${sucesso }" />
		<tags:msgErro erro="${erro }" />

		
		<c:if test="${compras.isEmpty() }">
			<h2>Não há nenhum pedido no momento</h2>
		</c:if>
		
		<div class="printaPC">
			<div class="row table-primary ">
				<div class="col-sm-1" >
					<h4>Código</h4>
				</div>
				<div class="col-sm-3" >
					<h4>Nome:</h4>
				</div>
				<div class="col-sm-3" >
					<h4>Endereço</h4>
				</div>
				<div class="col-sm-2" >
					<h4>Telefone</h4>
				</div>
				<div class="col-sm-1" >
					<h4>Valor</h4>
				</div>
				<div class="col-sm-1" >
					<h4>Status</h4>
				</div>
			</div>
		</div>
		<br>
		<c:forEach items="${compras }" var="compra">
			<a href="/compras/pedidos/${compra.id} ">
				<div class="row">
					<div class="col-sm-1" >
						<span class="printaCEL">Código:</span> <strong>${compra.id }</strong>
					</div>
					<div class="col-sm-3" >
						<span class="printaCEL">Nome:</span> <strong>${compra.nome }</strong>
					</div>
					<div class="col-sm-3" >
						<span class="printaCEL">Endereço:</span> <strong>${compra.endereco }</strong>
					</div>
					<div class="col-sm-2" >
						<span class="printaCEL">Telefone:</span> <strong>${compra.telefone }</strong>
					</div>
					<div class="col-sm-1" >
						<span class="printaCEL">Valor:</span> <strong>${compra.valor_total }</strong>
					</div>
					<div class="col-sm-1" >
						<span class="printaCEL">Status:</span> <strong>${compra.status }</strong>
					</div>
				</div>
				<hr>
			</a>
		</c:forEach>
	</div>
</tags:pageTemplate>