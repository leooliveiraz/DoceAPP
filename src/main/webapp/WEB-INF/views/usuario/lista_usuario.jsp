<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<tags:pageTemplate titulo="Cadastro de Notícias">
	<br><br>
	<div class="container">
		<h1>Usuários</h1>		
		<hr>
		
		<tags:msgSucesso sucesso="${sucesso }" />
		<tags:msgErro erro="${erro }" />

		
		<c:if test="${noticias.isEmpty() }">
			<h2>Não há nenhum usuário momento</h2>
		</c:if>
		<br>
		<a href="/usuarios/novo" class="btn btn-lg btn-block btn-success">Novo Usuário</a>
		<br>
		
		<c:if test="${!usuarios.isEmpty() }">
			<div class="printaPC">
				<div class="row table-primary ">
					<div class="col-sm-3" >
						<h4>Email</h4>
					</div>
					<div class="col-sm-6" >
						<h4>Nome:</h4>
					</div>
					<div class="col-sm-3" >
						<h4>CPF:</h4>
					</div>
				</div>
			</div>
		</c:if>		
		
		<br>
		<c:forEach items="${usuarios }" var="usuario">
			<a href="/usuarios/alterar/${usuario.cpf } ">
				<div class="row">
					<div class="col-sm-3" >
						<span class="printaCEL">Email:</span> <strong>${usuario.email }</strong>
					</div>
					<div class="col-sm-6" >
						<span class="printaCEL">Nome:</span> <strong>${usuario.nome }</strong>
					</div>
					<div class="col-sm-3" >
						<span class="printaCEL">CPF:</span> <strong>${usuario.cpf }</strong>
					</div>
				</div>
				<hr>
			</a>
		</c:forEach>
	</div>
</tags:pageTemplate>