<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<tags:pageTemplate titulo="Cardápio - Ovos de Páscoa Recheados, Panetones Recheados, Buquês de Chocolate, Buquês de Coxinha ">
	<br>
	<div class="container">
		<br>
		
		<tags:msgSucesso sucesso="${sucesso }" />
		<tags:msgSucesso sucesso="${erro }" />
		<div class="row">
			
			<c:forEach items="${produtos }" var="produto">
				<tags:produtoCard descricao="${produto.descricao }" 
					nome="${produto.nome }"  nomeUrl="${produto.nomeUrl }"
					link="/cardapio/detalhes/${produto.id }" 
					imagem="${produto.buscaFoto()}">
				</tags:produtoCard>
			</c:forEach>
		</div>
	</div>
</tags:pageTemplate>