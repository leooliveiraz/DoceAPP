<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="item" required="true" type="doce.models.CarrinhoItem" %>
<%@ attribute name="id" required="true"%>
<%@ attribute name="imagem" required="true"%>
<%@ attribute name="nome" required="true"%>
<%@ attribute name="descricao" required="true"%>
<%@ attribute name="valor" required="true"%>
<%@ attribute name="valor_desconto" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<a href="/carrinho/alterar/${id}">
	<div class="row">
		<div class="col-sm-2">
			<img class="img_produto_tabela"
				src="<c:if test="${imagem.isEmpty() }">data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==</c:if>
											<c:if test="${imagem != null }">${imagem }</c:if>"
				alt="Produto"  />

		</div>

		<div class="col-sm-4">
			<h4>${nome }</h4>
			<p>${descricao }</p>
		</div>
		<div class="col-sm-2">
			<c:if test="${valor_desconto == null || valor_desconto.isEmpty() }">
				<h4>Valor Unitário: R$ ${valor}</h4>
			</c:if>
			<c:if test="${valor_desconto != null && !valor_desconto.isEmpty()}">
				<h4>Valor Unitário: R$  ${valor_desconto}</h4>
			</c:if>
		</div>


		<div class="col-sm-2">
			<h4>Quantidade: ${carrinhoCompras.getQuantidade(item) }</h4>
		</div>
		<div class="col-sm-2">
			<h4>Total: R$ ${carrinhoCompras.getTotal(item) }</h4>
		</div>
	</div>
	<hr>
</a>