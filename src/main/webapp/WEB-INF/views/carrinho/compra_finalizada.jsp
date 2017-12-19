<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Compra Finalizada!">
	<br><br>
	<div class="container">
		<h1>Sua compra foi finalizada com sucesso</h1>
		<h2>O código da compra é: ${compra.id }.</h2>
		<h2>Em breve entraremos em contato com você para confirmar o seu pedido</h2>
		<h3>Caso você tenha alguma dúvida entre em contato conosco.</h3>
		<br>
	<a class="btn btn-lg btn-success btn-block" href="/" >Voltar para Página Inicial</a>
	</div>
</tags:pageTemplate>