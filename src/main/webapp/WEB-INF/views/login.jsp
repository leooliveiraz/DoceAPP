<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tags:pageTemplate titulo="Doce App - Login">
	<br>
	<br>
	<div class="container">
		<h1>Login</h1>
		<hr>

		<form:form action="/login" method="post">
			<div class="form-group">
				<label for="exampleInputEmail1">Usuário:</label> 
				<input
					type="text" class="form-control" id="username" name="username"
					aria-describedby="usernameHelp" placeholder="Informe o usuário"> 
					<small id="usernameHelp" class="form-text text-muted">Nunca informe seu usuário e senha para ninguém.</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Senha</label> <input
					type="password" class="form-control" id="password" name ="password"
					placeholder="Senha">
			</div>
			<br>
			<button type="submit" class="btn btn-success btn-block btn-lg">Entrar</button>
		</form:form>
	</div>
</tags:pageTemplate>