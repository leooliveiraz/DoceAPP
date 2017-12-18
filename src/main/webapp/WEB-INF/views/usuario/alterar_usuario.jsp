<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Doce App - Novo Usuário">
	<br>
	<br>
	<div class="container ">
		<div class="container-fluid ">
			<h1>Alteração de Usuário</h1>
			<hr>
		
		<tags:msgSucesso sucesso="${sucesso }" />
		<tags:msgErro erro="${erro }" />
			<form:form action="/usuarios/alterar" method="post"  >
				<div class="form-group row">
					<label for="nome" class="col-sm-2 col-form-label">
						Nome:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nome" name="nome" value="${usuario.nome }"
							placeholder="Nome do usuário">
					</div>
				</div>
				<div class="form-group row">
					<label for="nome" class="col-sm-2 col-form-label">
						CPF:
					</label>
					<div class="col-sm-10">
						<input type="hidden" value="${usuario.cpf }" id="cpf" name="cpf" />
						<input type="text" disabled class="form-control"  value="${usuario.cpf }"
							placeholder="CPF do usuário">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">
						Email:
					</label>
					<div class="col-sm-10">
						<input  type="email" value="${usuario.email }" class="form-control" id="emailusuario"  name="emailusuario" disabled placeholder="Informe o email do usuário">
						<input  type="hidden" value="${usuario.email }"  class="form-control" id="email" name="email"    >
					</div>
				</div>
				
				<div class="form-group row">
					<label for="senha" class="col-sm-2 col-form-label">
						Senha:
					</label>
					<div class="col-sm-10">
						<input  type="password" class="form-control" id="senha" rows="3" name="senha"
							value="${usuario.senha }"
							placeholder="Informe a senha">
						<small>Se informar este campo, a senha será atualizada</small>
					</div>
				</div>
				
				
				
				<br>
				<br>
				<button type="submit" class="btn btn-primary btn-lg btn-block" >Cadastrar</button>
				<button type="reset" class="btn btn-warning btn-lg btn-block">Limpar</button>
			</form:form>
		</div>
	</div>
</tags:pageTemplate>