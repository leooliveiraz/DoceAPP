<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Pedidos">
	<br><br>
	<div class="container">
		<h1>Pedidos Solicitados</h1>		
		<hr>
		<h2>Filtros:</h2>
		
		<form action="/compras/pedidos/pesquisa/" method="get" >	
			<div class="form-group row">
				<label for="data_inicial_filtro" class="col-sm-2 col-form-label">
					Data Inicial:
				</label>
				<div class="col-sm-2">
					<input type="date" class="form-control"
						id="data_inicial_filtro"  
						name="dataInicial"
						required value="" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}"
						placeholder="Data Inicial">
				</div>
				
				<label for="data_final_filtro" class="col-sm-2 col-form-label">
					Data Final:
				</label>
				<div class="col-sm-2">
					<input type="date" class="form-control" id="data_final_filtro" name="dataFinal" 
						required value=""
						placeholder="Data Final">
				</div>
				
				<label for="status_filtro" class="col-sm-1 col-form-label">
					Status:
				</label>
				<div class="col-sm-2">
					
					<select class="form-control" id="status_filtro" name="status">
						<option>TODOS</option>
						<c:forEach items="${status }" var="s" >
					        <option>${s }</option>
						</c:forEach>
			      	</select>
				</div>
				
				<div class="col-sm-1">
					<button type="submit" class="btn btn-success btn-lg" >
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
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