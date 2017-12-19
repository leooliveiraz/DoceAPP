<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Finalizar Compra">
	<br>
	<br>
	<div class="container">
		<h1>Finalizar Compra</h1>
		<hr>
		<h2>Informe seus dados</h2>
		<form:form action="/carrinho/validardados" method="get"  >
				<div class="form-group row">
					<label for="nome" class="col-sm-2 col-form-label">
						Nome:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nome" name="nome" required
							placeholder="Informe seu nome">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="endereco" class="col-sm-2 col-form-label">
						Endereço:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="endereco" name="endereco" required
							placeholder="Informe seu endereço">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="telefone" class="col-sm-2 col-form-label">
						Telefone para contato:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="telefone" name="telefone" required
							placeholder="Informe um telefone para contato">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">
						Email(Opcional):
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="email" name="email" 
							placeholder="Email para contato">
					</div>
				</div>
				
				<br>
				<br>
				<button type="submit" class="btn btn-primary btn-lg btn-block" >Cadastrar</button>
				<button type="reset" class="btn btn-warning btn-lg btn-block">Limpar</button>
			</form:form>
	</div>
</tags:pageTemplate>
