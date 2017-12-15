<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="nome" required="true"%>
<%@ attribute name="imagem" required="true"%>
<%@ attribute name="descricao" required="true"%>
<%@ attribute name="link" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="col-lg-4">
	<a href="${link }">
		<img class="img_produto_home"
				src="data:image/gif;base64,<c:if test="${imagem.isEmpty() }">R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==</c:if>
											<c:if test="${imagem != null }">${imagem }</c:if>"
				alt="Produto" width="140" height="140">
		<h2>${nome }</h2>
		<p>${descricao }</p>
	</a>
</div>